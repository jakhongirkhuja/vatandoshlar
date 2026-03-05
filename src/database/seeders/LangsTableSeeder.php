<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class LangsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();

        $languages = [
            [
                'code' => 'en',
                'name' => 'English',
                'is_default' => false,
                'status' => false,
                'sort_order'=>3,
                'locale' => 'en_US',
                'flag_icon' => 'flags/us.svg',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'code' => 'uz',
                'name' => 'Uzbek',
                'is_default' => true,
                'status' => true,
                'sort_order'=>1,
                'locale' => 'uz_UZ',
                'flag_icon' => 'flags/uz.svg',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'code' => 'ru',
                'name' => 'Russian',
                'is_default' => false,
                'status' => true,

                'locale' => 'ru_RU',
                'flag_icon' => 'flags/ru.svg',
                'created_at' => $now,
                'updated_at' => $now,
                'sort_order'=>2,
            ]
        ];
        DB::table('langs')->insert($languages);
    }
}
