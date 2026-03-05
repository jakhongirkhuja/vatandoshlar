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

        $givenPermission = Permission::firstOrCreate(['name' => 'given']);
        $selectedIds = $data['menus'] ?? [];

        $syncData = [];

        $parents = MenuMain::whereNull('parent_id')->with('children')->get();

        foreach ($parents as $parent) {
            $syncData = $syncData + $this->buildSyncData($parent, $selectedIds, $givenPermission->id);
        }
        $role->menus()->sync($syncData);
    }



    public function editRoleMenu($id, $data)
    {
        $role = Role::findOrFail($id);
        $role->update(['name' => $data['name']]);

        $givenPermission = Permission::firstOrCreate(['name' => 'given']);
        $selectedIds = $data['menus'] ?? [];

        $syncData = [];

        $parents = MenuMain::whereNull('parent_id')->with('childrens')->get();

        foreach ($parents as $parent) {
            $syncData = $syncData + $this->buildSyncData($parent, $selectedIds, $givenPermission->id);
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
    private function buildSyncData($menu, $selectedIds, $permissionId)
    {
        $syncData = [];
        if (!in_array($menu->id, $selectedIds)) {
            return [];
        }
        $syncData[$menu->id] = ['permission_id' => $permissionId];
        $children = $menu->childrens;
        if ($children->count() == 0) {
            return $syncData;
        }
        $directChildIds = $children->pluck('id')->toArray();
        $selectedDirectChildren = array_intersect($directChildIds, $selectedIds);

        if (count($selectedDirectChildren) === 0) {

            foreach ($children as $child) {
                $syncData[$child->id] = ['permission_id' => $permissionId];
                $syncData = $syncData + $this->buildAllChildren($child, $permissionId);
            }

            return $syncData;
        }

        foreach ($children as $child) {
            if (in_array($child->id, $selectedIds)) {
                $syncData = $syncData + $this->buildSyncData($child, $selectedIds, $permissionId);
            }
        }

        return $syncData;
    }
    private function buildAllChildren($menu, $permissionId)
    {
        $syncData = [];

        foreach ($menu->childrens as $child) {
            $syncData[$child->id] = ['permission_id' => $permissionId];

            $syncData = $syncData + $this->buildAllChildren($child, $permissionId);
        }

        return $syncData;
    }
}
