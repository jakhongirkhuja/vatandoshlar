<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name' => 'Admin',
                'username' => 'admin',
                'password' => Hash::make('password'),
                'role_id' => 1,
                'status' => true,
            ],
            [
                'name' => 'Moderator',
                'username' => 'moderator',
                'password' => Hash::make('password'),
                'role_id' => 2,
                'status' => true,
            ],
            [
                'name' => 'Editor',
                'username' => 'editor',
                'password' => Hash::make('password'),
                'role_id' => 2,
                'status' => false,
            ],
        ]);
    }
}
