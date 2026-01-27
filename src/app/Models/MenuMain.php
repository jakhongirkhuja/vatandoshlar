<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
class MenuMain extends Model
{
    protected $fillable = [
        'type',
        'slug',
        'url',
        'test',
        'show_admin',
        'sort_order',
        'icon',
        'status',
        'parent_id',
    ];
    public function translations()
    {
        return $this->hasMany(MenuMainTranslation::class);
    }
    public function images()
    {
        return $this->hasMany(MenuMainImages::class)->orderBy('main', 'desc');
    }
    public function children()
    {
        return $this->hasMany(MenuMain::class, 'parent_id')->orderBy('sort_order')->with('translations', 'childrens');
    }
    public function childrens()
    {
        return $this->hasMany(MenuMain::class, 'parent_id')
            ->with([
                'translations',
                'childrens' => function ($q) {
                    $q->where('type', '!=', 'section')->where('status', true)->orderby('sort_order');
                }
            ])
            ->where('type', '!=', 'section')->orderBy('sort_order');
    }
    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_menu_permissions', 'menu_main_id', 'role_id')
            ->withPivot('permission_id')
            ->withTimestamps();
    }

    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'role_menu_permissions')
            ->withPivot('role_id')
            ->withTimestamps();
    }
    public function getTitle($translations, $locale = 'uz')
    {
        $translations = collect($translations);

        $translation = $translations->firstWhere('locale', $locale);
        if (!$translation) {
            $translation = $translations->first();
        }
        if ($translation && isset($translation['data'])) {
            $data = is_string($translation['data']) ? json_decode($translation['data'], true) : $translation['data'];
            return $data['title'] ?? '';
        }

        return '';
    }
    protected $translationCache = null;

    public function getTitleAttribute()
    {
        $locale = 'uz';
        if ($this->translationCache === null) {
            $this->translationCache = $this->translations->mapWithKeys(function ($t) {
                return [$t->locale => is_string($t->data) ? json_decode($t->data, true) : $t->data];
            });
        }
        return $this->translationCache[$locale]['title']
            ?? $this->translations->first()?->data['title']
            ?? '';
    }
    protected static function booted()
    {
        static::created(function ($model) {
            if ($model->sort_order == 0) {
                $model->updateQuietly([
                    'sort_order' => $model->id
                ]);
            }
            Cache::flush();
        });
        static::updated(function ($content) {
            Cache::flush();
        });

        static::deleted(function ($content) {
            Cache::flush();
        });

    }
    public function parent()
    {
        return $this->belongsTo(MenuMain::class, 'parent_id');
    }
    public function ancestors()
    {
        $ancestors = collect();
        $parent = $this->parent;

        while ($parent) {
            $ancestors->prepend($parent);
            $parent = $parent->parent;
        }
        return $ancestors;
    }
    public function getContentAttribute()
    {
        $locale = app()->getLocale();
        $translations = $this->translations->filter(function ($t) use ($locale) {
            return $t->locale === $locale || $t->locale === null;
        });
        $result = [];
        foreach ($translations as $t) {
            if ($t->data) {
                $decoded = json_decode($t->data, true);
                if (is_array($decoded)) {
                    $result = array_merge($result, $decoded);
                }
            }
        }
        return $result;
    }
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            // Get the latest ID
            $latest = self::max('id');

            // Increment it by 1, or start at 1 if table empty
            $model->id = $latest ? $latest + 1 : 1;
        });
    }
}


