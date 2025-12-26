<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['name'];
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
}
