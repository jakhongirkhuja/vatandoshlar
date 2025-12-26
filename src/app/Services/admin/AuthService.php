<?php

namespace App\Services\admin;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthService
{
    public function create($data)
    {
        if (Auth::attempt(credentials: ['username' => $data['username'], 'password' => $data['password']])) {
            return Auth::user();
        }
    }
}
