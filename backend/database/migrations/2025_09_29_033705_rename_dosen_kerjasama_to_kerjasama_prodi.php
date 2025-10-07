<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasTable('dosen_kerjasama') && ! Schema::hasTable('kerjasama_prodi')) {
            Schema::rename('dosen_kerjasama', 'kerjasama_prodi');
        }
    }

    public function down(): void
    {
        if (Schema::hasTable('kerjasama_prodi') && ! Schema::hasTable('dosen_kerjasama')) {
            Schema::rename('kerjasama_prodi', 'dosen_kerjasama');
        }
    }
};

