<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
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
        'category'
    ];
     public function translations()
    {
        return $this->hasMany(ContentTranslation::class);
    }
    public function images()
    {
        return $this->hasMany(ContentImages::class)->orderBy('main', 'desc');
    }
    public function children()
    {
        return $this->hasMany(Content::class, 'parent_id')->with('translations', 'childrens');
    }
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
}
