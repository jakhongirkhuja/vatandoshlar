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
        Schema::create('menu_mains', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['category', 'page','url','section'])->default('category');
            $table->text('slug')->nullable();
            $table->text('url')->nullable();
            $table->boolean('test')->default(false);
            $table->boolean('show_admin')->default(true);
            $table->integer('sort_order')->default(1);
            $table->string('icon')->nullable();
            $table->boolean('status')->default(true);
            $table->foreignId('parent_id')->nullable()->constrained('menu_mains');
            $table->timestamps();
            $table->index(['type', 'slug', 'status','sort_order']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('menu_mains');
    }
};
