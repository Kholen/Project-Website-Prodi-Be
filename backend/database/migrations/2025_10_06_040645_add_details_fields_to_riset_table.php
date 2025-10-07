<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('riset', function (Blueprint $table) {
            $table->text('anggota_penulis')->nullable()->after('nama_ketua');
            $table->date('published_at')->nullable()->after('judul');
            $table->string('journal_name')->nullable()->after('published_at');
        });

        DB::statement('ALTER TABLE riset MODIFY tahun BIGINT NULL');
        DB::statement('ALTER TABLE riset MODIFY url_riset VARCHAR(255) NULL');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement('ALTER TABLE riset MODIFY url_riset VARCHAR(255) NOT NULL');
        DB::statement('ALTER TABLE riset MODIFY tahun BIGINT NOT NULL');

        Schema::table('riset', function (Blueprint $table) {
            $table->dropColumn(['anggota_penulis', 'published_at', 'journal_name']);
        });
    }
};