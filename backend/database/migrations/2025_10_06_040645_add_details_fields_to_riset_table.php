<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('riset', function (Blueprint $table) {
            if (! Schema::hasColumn('riset', 'anggota_penulis')) {
                $table->text('anggota_penulis')->nullable()->after('nama_ketua');
            }

            if (! Schema::hasColumn('riset', 'published_at')) {
                $table->date('published_at')->nullable()->after('judul');
            }

            if (! Schema::hasColumn('riset', 'journal_name')) {
                $table->string('journal_name')->nullable()->after('published_at');
            }
        });

        if (Schema::getConnection()->getDriverName() === 'mysql') {
            DB::statement('ALTER TABLE riset MODIFY tahun BIGINT NULL');
            DB::statement('ALTER TABLE riset MODIFY url_riset VARCHAR(255) NULL');
        }
    }

    public function down(): void
    {
        if (Schema::getConnection()->getDriverName() === 'mysql') {
            DB::statement('ALTER TABLE riset MODIFY url_riset VARCHAR(255) NOT NULL');
            DB::statement('ALTER TABLE riset MODIFY tahun BIGINT NOT NULL');
        }

        Schema::table('riset', function (Blueprint $table) {
            if (Schema::hasColumn('riset', 'journal_name')) {
                $table->dropColumn('journal_name');
            }

            if (Schema::hasColumn('riset', 'published_at')) {
                $table->dropColumn('published_at');
            }

            if (Schema::hasColumn('riset', 'anggota_penulis')) {
                $table->dropColumn('anggota_penulis');
            }
        });
    }
};
