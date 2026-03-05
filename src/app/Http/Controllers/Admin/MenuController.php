<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MenuMain;
use App\Models\Setting;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function index(){
        $pages = MenuMain::where('type','page')->get();
        $settings = Setting::first();
        return view('admin.pages.menus.admin.index',compact('pages', 'settings'));
    }
}
