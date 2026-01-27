<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['name','status'];
    public function menus()
    {
        return $this->belongsToMany(MenuMain::class, 'role_menu_permissions', 'role_id', 'menu_main_id')
            ->withPivot('permission_id')
            ->withTimestamps();
    }
    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'role_menu_permissions')
            ->withPivot('menu_main_id')
            ->withTimestamps();
    }
    public function users()
    {
        return $this->hasMany(User::class, 'role_id');
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
