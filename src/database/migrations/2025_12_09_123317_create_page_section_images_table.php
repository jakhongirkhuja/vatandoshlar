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
        Schema::create('page_section_images', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('page_section_id');
            $table->unsignedBigInteger('page_section_parent_id')->nullable();
            $table->text('category')->nullable();
            $table->text('category_slug')->nullable();
            $table->text('image')->nullable();

            $table->text('compressed')->nullable();
            $table->string('type')->nullable();
            $table->bigInteger('size')->nullable();
            $table->boolean('main')->default(false);
            $table->boolean('status')->default(true);
            $table->timestamps();
            $table->bigInteger('sort_order')->default(0);
            $table->index(['main', 'status', 'category','category_slug','page_section_parent_id','page_section_id']);

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('page_section_images');
    }
};
