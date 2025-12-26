<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $fillable = ['name'];
   public function roles()
{
    return $this->belongsToMany(Role::class, 'role_menu_permissions', 'permission_id', 'role_id')
        ->withPivot('menu_main_id')
        ->withTimestamps();
}

public function menus()
{
    return $this->belongsToMany(MenuMain::class, 'role_menu_permissions', 'permission_id', 'menu_main_id')
        ->withPivot('role_id')
        ->withTimestamps();
}
}
