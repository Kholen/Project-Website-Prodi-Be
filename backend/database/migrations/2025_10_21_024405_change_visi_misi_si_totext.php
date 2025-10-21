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
        Schema::table('settings', function (Blueprint $table) {
            $table->text('visi_si')->nullable()->change();
            $table->text('misi_si')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        schema::table('settings', function (Blueprint $table) {
            $table->string('visi_si')->change();
            $table->string('misi_si')->change();
        });
    }
};
