<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageSection extends Model
{
    protected $fillable = [
        'sort_order',
        'status',
        'menu_main_id',
        'parent_id',
        'category',
        'slug',
        'category_slug',
        'publish_at',
    ];
    protected static function boot()
    {
        parent::boot();

        static::created(function ($model) {
            $model->sort_order = $model->id;
            $model->saveQuietly();
        });
    }
    public function translations()
    {
        return $this->hasMany(PageSectionTranslation::class);
    }
    public function children()
    {
        return $this->hasMany(PageSection::class, 'parent_id', 'id')->with('children', 'children.images');
    }
    public function parent(){
        return $this->belongsTo(PageSection::class, 'parent_id', 'id');
    }
    public function menuMain(){
        return $this->belongsTo(MenuMain::class, 'menu_main_id', 'id');
    }
    public function images()
    {
        return $this->hasMany(PageSectionImage::class)->orderBy('main', 'desc');
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
    public function views()
    {
        return $this->morphMany(ViewCount::class, 'viewable');
    }
    public function addView($request)
    {
        $ip = $request->ip();
        $userAgent = $request->userAgent();
        if ($ip && $userAgent) {
            return $this->views()->firstOrCreate(
                [
                    'ip_address' => $ip,
                    'user_agent' => $userAgent,
                ]
            );
        }
        return null;
    }
}
