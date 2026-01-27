<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Services\admin\AuthService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class AuthController extends Controller
{
    public function __construct(protected AuthService $auth_service)
    {
    }

    public function login()
    {
        return view('admin.pages.auth.login');
    }

    public function loginForm(LoginRequest $request)
    {
        if (Auth::attempt($request->only(['username', 'password']))) {

            if (! auth()->user()->status) {
                Auth::logout();

                return redirect()->back()
                    ->withErrors(['username' => 'Your account is inactive.']);
            }
            return redirect()->route('admin.index');
        }
    }
    public function logout(Request $request){

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login');
    }
    public function captch(){
        return response()->json(['captcha' => captcha_img('default')]);
    }
}
