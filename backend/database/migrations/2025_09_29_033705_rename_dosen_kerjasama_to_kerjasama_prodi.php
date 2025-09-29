<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Jalankan migrasinya.
     */
    public function up(): void
    {
        Schema::rename('dosen_kerjasama', 'kerjasama_prodi');
    }

    /**
     * Kembalikan perubahan jika dibatalkan.
     */
    public function down(): void
    {
        Schema::rename('kerjasama_prodi', 'dosen_kerjasama');
    }
};
