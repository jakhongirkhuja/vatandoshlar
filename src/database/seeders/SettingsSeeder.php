<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('settings')->insert([
            [
                'id' => 1,
                'title' => json_encode([
                    'ru' => 'ProEnd',
                    'uz' => 'ProEnd',
                ]),
                'meta_description' => json_encode([
                    'ru' => 'ProEnd',
                    'uz' => 'ProEnd',
                ]),
                'meta_keywords' => json_encode([
                    'ru' => 'ProEnd, ProEnd',
                    'uz' => 'ProEnd, ProEnd',
                ]),
                'email' => null,
                'status' => 1,
                'main_page_id' => null,
                'admin_ips' => null,
                'created_at' => '2025-12-20 15:22:52',
                'updated_at' => '2025-12-20 15:23:27',
            ],
        ]);
    }
}
