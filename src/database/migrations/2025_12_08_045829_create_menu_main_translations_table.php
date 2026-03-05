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
        Schema::create('menu_main_translations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('menu_main_id')->constrained('menu_mains')->onDelete('cascade');
            $table->string('locale', 3)->nullable();
            $table->jsonb('data')->nullable();
            $table->timestamps();
            $table->index(['locale']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('menu_main_translations');
    }
};
