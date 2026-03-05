<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserCreateRequest;
use App\Http\Requests\UserUpdateRequest;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function users()
    {
        $users = User::latest()->get();
        return view('admin.pages.users.index', compact('users'));
    }
    public function usersCreateView()
    {
        $roles = Role::all();
        return view('admin.pages.users.save', compact('roles'));
    }
    public function usersCreate(UserCreateRequest $request)
    {
        try {
            $data = $request->validated();
            $data['password'] = Hash::make($data['password']);
            User::create($data);
            return redirect()->route('admin.users')->with('success', 'User Created Successfully');
        }catch (\Exception $exception){
            return back()->withInput()->with('error', $exception->getMessage());
        }

    }
    public function usersEdit(User $user)
    {
        $roles = Role::all();
        return view('admin.pages.users.save', compact('user', 'roles'));
    }
    public function updateStatus(Request $request, $id)
    {

        User::where('id', $id)->update(['status' => $request->status]);
        return back()->with('success', 'Updated');
    }
    public function usersUpdate(UserUpdateRequest $request, User $user)
    {
        $data = $request->validated();
        try {
            if (!empty($data['password']) && $data['password']) {
                $data['password'] = Hash::make($data['password']);
            }else{
                unset($data['password']);
            }
            $user->update($data);
            return redirect()->route('admin.users')->with('success', 'User Updated');
        }catch (\Exception $exception){
            return back()->withInput()->with('error', $exception->getMessage());
        }

    }

}
