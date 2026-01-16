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
        Schema::create('lang_images', function (Blueprint $table) {
            $table->id();
            $table->foreignId('lang_id')->constrained('langs');
            $table->text('image')->nullable();
            $table->text('compressed')->nullable();
            $table->string('type')->nullable();
            $table->bigInteger('size')->nullable();
            $table->boolean('main')->default(false);
            $table->boolean('status')->default(true);
            $table->bigInteger('sort_order')->default(0);
            $table->index(['main']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lang_images');
    }
};
