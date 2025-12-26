<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\RoleCreateRequest;
use App\Http\Requests\RoleUpdateRequest;
use App\Models\MenuMain;
use App\Models\Role;
use App\Services\admin\RoleService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoleController extends Controller
{
    public function __construct(protected RoleService $roleservice)
    {
    }
    public function roles(){
        $roles = Role::all();
        return view('admin.pages.roles.index',compact('roles'));
    }
    public function rolesCreateView(){
        $main = MenuMain::with('translations')->where('parent_id',null)->where('type', '!=', 'section')->get();
        return view('admin.pages.roles.save',compact('main'));
    }
    public function rolesEdit(Role $role){
        $main = MenuMain::with('translations')->where('parent_id',null)->where('type', '!=', 'section')->get();
        return view('admin.pages.roles.save', compact('role','main'));
    }
    public function rolesUpdate(RoleUpdateRequest $request,$role){
        $this->roleservice->editRoleMenu($role,$request->validated());
         return back();
    }
    public function rolesCreate(RoleCreateRequest  $request){
         $this->roleservice->createMenu($request->validated());
        return redirect()->route('admin.roles');
    }
    public function delete($role){
       $this->roleservice->destroy($role);
        return redirect()->route('admin.roles');
    }
}
