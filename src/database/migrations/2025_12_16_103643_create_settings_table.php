<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->jsonb('title');
            $table->jsonb('meta_description')->nullable();
            $table->jsonb('meta_keywords')->nullable();
            $table->string('email')->nullable();
            $table->boolean('status')->default(false);
            $table->unsignedBigInteger('main_page_id')->nullable();
            $table->string('admin_ips')->nullable();
            $table->json('search_ids')->nullable();
            $table->json('sorting_ids')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings');
    }
};
