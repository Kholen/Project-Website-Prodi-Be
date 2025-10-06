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
        Schema::create('riset', function (Blueprint $table) {
            $table->id();
            $table->string('nama_ketua', 50);
            $table->string('judul');
            $table->string('url_riset');
            $table->bigInteger('tahun');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('riset');
    }
};
