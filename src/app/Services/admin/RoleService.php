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

            if (in_array($parent->id, $selectedIds)) {

                // parent given
                $syncData[$parent->id] = ['permission_id' => $givenPermission->id];

                // barcha childlar ham avtomatik given
                foreach ($parent->children as $child) {
                    $syncData[$child->id] = ['permission_id' => $givenPermission->id];
                }
            }
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

    $parents = MenuMain::whereNull('parent_id')->with('children')->get();

    foreach ($parents as $parent) {

        // parent tanlanmagan bo‘lsa – umuman e’tibor bermaymiz
        if (!in_array($parent->id, $selectedIds)) {
            continue;
        }

        // parent always given
        $syncData[$parent->id] = ['permission_id' => $givenPermission->id];

        $childrenIds = $parent->children->pluck('id')->toArray();

        // tanlangan childlar
        $selectedChildren = array_intersect($childrenIds, $selectedIds);

        if (count($selectedChildren) === 0) {
            // 1-holat → hech biri belgilanmagan → hammasi given
            foreach ($childrenIds as $childId) {
                $syncData[$childId] = ['permission_id' => $givenPermission->id];
            }
        } else {
            // 2-holat → faqat belgilangani given
            foreach ($selectedChildren as $childId) {
                $syncData[$childId] = ['permission_id' => $givenPermission->id];
            }
        }
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
