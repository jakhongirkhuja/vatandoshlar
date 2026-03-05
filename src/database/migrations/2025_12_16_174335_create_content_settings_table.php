<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('content_settings', function (Blueprint $table) {
            $table->id();
            $table->string('key');
            $table->string('label');
            $table->string('type');
            $table->boolean('required')->default(true);
            $table->boolean('is_translatable')->default(1);
            $table->json('options')->nullable();
            $table->integer('sort_order')->default(0);
            $table->text('relation')->nullable();
            $table->boolean('status')->default(true);
            $table->text('category')->nullable();
            $table->timestamps();
            $table->index(['key', 'is_translatable', 'status', 'sort_order']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('content_settings');
    }
};
