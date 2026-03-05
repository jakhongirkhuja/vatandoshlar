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
        Schema::create('langs', function (Blueprint $table) {
            $table->id();
            $table->string('code', 10)->unique();
            $table->string('name', 50);
            $table->boolean('is_default')->default(false);
            $table->boolean('status')->default(true);
            $table->string('locale', 10)->nullable(); // Full locale e.g. 'en_US'
            $table->string('flag_icon', 255)->nullable();
            $table->unsignedBigInteger('sort_order')->default(0);
            $table->timestamps(); // created_at & updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('langs');
    }
};
