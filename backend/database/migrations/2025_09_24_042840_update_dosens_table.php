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
        Schema::table('dosens', function (Blueprint $table) {
            $table->string('NUPTK')->change();
            $table->renameColumn('location_id', 'kontak');
        });

        Schema::table('dosens', function (Blueprint $table) {
            $table->string('kontak')->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('dosens', function (Blueprint $table) {
            $table->integer('NUPTK')->change();
            $table->renameColumn('kontak', 'location_id');
        });

        Schema::table('dosens', function (Blueprint $table) {
            $table->bigInteger('location_id')->change();
        });
    }
};