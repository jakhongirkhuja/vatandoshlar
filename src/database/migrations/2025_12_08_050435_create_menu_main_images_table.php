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
        Schema::create('menu_main_images', function (Blueprint $table) {
            $table->id();
            $table->foreignId('menu_main_id')->constrained('menu_mains');
            $table->text('image')->nullable();
            $table->text('compressed')->nullable();
            $table->string('type')->nullable();
            $table->bigInteger('size')->nullable();
            $table->boolean('main')->default(false);
            $table->boolean('status')->default(true);
            $table->bigInteger('sort_order')->default(0);
            $table->timestamps();
            $table->index(['main']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('menu_main_images');
    }
};
