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
        Schema::table('prodi', function (Blueprint $table) {
            $table->text('visi')->nullable()->after('nama_prodi');
            $table->text('misi')->nullable()->after('visi');
            $table->text('desc_prodi')->nullable()->after('misi');
            $table->text('desc_prospek_kerja')->nullable()->after('desc_prodi');
            $table->text('desc_program')->nullable()->after('desc_prospek_kerja');
            $table->text('keunggulan')->nullable()->after('desc_program');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('prodi', function (Blueprint $table) {
            $table->dropColumn([
                'visi',
                'misi',
                'desc_prodi',
                'desc_prospek_kerja',
                'desc_program',
                'keunggulan'
            ]);
        });
    }
};
