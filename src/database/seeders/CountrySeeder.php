<?php

namespace Database\Seeders;

use App\Models\Country;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Storage;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {



        $json = Storage::disk('public')->get('data1/countries.json');

        $countries = json_decode($json, true);
        foreach ($countries as $item) {
            $nameArray = null;
            if (!empty($item['name'])) {
                // Remove problematic backslashes, then unserialize
                $serialized = str_replace('\\"', '"', $item['name']);
                $nameArray = @unserialize($serialized);
            }

            if (!is_array($nameArray)) {
                $nameArray = ['en' => $item['nicename'] ?? null]; // fallback
            }

            Country::updateOrCreate(
                ['iso' => $item['iso']],
                [
                    'name' => $nameArray,
                    'nicename' => $item['nicename'] ?? null,
                    'iso3' => $item['iso3'] ?? null,
                    'numcode' => $item['numcode'] ?? null,
                    'phonecode' => $item['phonecode'] ?? null,
                    'phonemask' => $item['phonemask'] ?? null,
                    'status' => in_array($item['status'], ['active', 'inactive']) ? $item['status'] : 'active', // safe
                ]
            );
        }
    }
}
