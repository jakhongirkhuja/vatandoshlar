<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ContentSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('content_settings')->insert([
            [
                'key' => 'title',
                'label' => 'Title',
                'type' => 'text',
                'required' => 1,
                'is_translatable' => 1,
                'options' => null,
                'sort_order' => 1,
                'relation' => null,
                'status' => 1
            ],
            [
                'key' => 'key',
                'label' => 'Key',
                'type' => 'text',
                'required' => 1,
                'is_translatable' => 0,
                'options' => null,
                'sort_order' => 1,
                'relation' => null,
                'status' => 1
            ],
        ]);
    }
}
