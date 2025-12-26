<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserCreateRequest;
use App\Http\Requests\UserUpdateRequest;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function users(){
        $users = User::where('role_id',2)->get();
        return view('admin.pages.users.index', compact('users'));
    }
    public function usersCreateView(){
        $roles = Role::all();
        return view('admin.pages.users.save', compact('roles'));
    }
    public function usersCreate(UserCreateRequest  $request){
        User::create($request->validated());
        return redirect()->route('admin.users');
    }
    public function usersEdit(User $user){
        $roles = Role::all();
        return view('admin.pages.users.save', compact('user', 'roles'));
    }
    public function usersUpdate(UserUpdateRequest $request, User $user){
        $user->update($request->validated());
        return redirect()->route('admin.users');
    }

}
