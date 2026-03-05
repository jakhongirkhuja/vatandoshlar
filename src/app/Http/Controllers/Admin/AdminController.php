<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\UserCreateRequest;
use App\Http\Requests\UserUpdateRequest;

class AdminController extends Controller
{
    public function index()
    {
       
        return view('admin.index');
    }
    public function menu(){
        return view('admin.pages.menus.index');
    }
    public function menu_main()
    {

    }




}
