<?php

namespace App\Services\admin;

use App\Models\MenuMain;
use App\Models\Permission;
use App\Models\Role;

class RoleService
{
    public function createMenu($data)
    {
        $role = Role::create(['name' => $data['name']]);
        $validMenuIds = [];
        foreach ($data['menus'] as $menuId) {
            $menu = MenuMain::find($menuId);

            if (!$menu->parent_id || in_array($menu->parent_id, $data['menus'])) {
                $validMenuIds[] = $menuId;
            }
        }

        $syncData = [];
        $permission = Permission::firstOrCreate(['name' => 'given']);

        foreach ($validMenuIds as $menuId) {
            $syncData[$menuId] = ['permission_id' => $permission->id];
        }

        $role->menus()->sync($syncData);

    }

    public function editRoleMenu($id, $data)
    {

        $role = Role::find($id);
        $role->update(['name' => $data['name']]);
        $validMenuIds = [];
        if (isset($data['menus'])) {
            foreach ($data['menus'] as $menuId) {
                $menu = MenuMain::find($menuId);

                if (!$menu->parent_id || in_array($menu->parent_id, $data['menus'])) {
                    $validMenuIds[] = $menuId;
                }
            }
        }

        $syncData = [];
        $permission = Permission::firstOrCreate(['name' => 'given']);

        foreach ($validMenuIds as $menuId) {
            $syncData[$menuId] = ['permission_id' => $permission->id];
        }

        $role->menus()->sync($syncData);
    }

    public function destroy($id)
    {
        $role = Role::find($id);
        if ($role->users()->exists()) {
            return back()->with('error', 'Вы не можете удалить Роль');
        }
        $role->delete();
        return back()->with('success', 'Роль удалена');
    }
}
