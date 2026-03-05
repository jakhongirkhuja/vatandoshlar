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
        Schema::create('page_section_translations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('page_section_id');
            $table->unsignedBigInteger('page_section_parent_id')->nullable();
            $table->text('category')->nullable();
            $table->text('category_slug')->nullable();
            $table->string('locale', 3)->nullable();
            $table->jsonb('data')->nullable();
            $table->timestamps();
            $table->index(['locale','category','page_section_id','page_section_parent_id','category_slug']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('page_section_translations');
    }
};
