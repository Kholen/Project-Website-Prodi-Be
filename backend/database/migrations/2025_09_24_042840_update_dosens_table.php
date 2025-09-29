<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (Schema::hasColumn('dosens', 'NUPTK')) {
            DB::statement('ALTER TABLE dosens MODIFY NUPTK VARCHAR(255)');
        }

        if (Schema::hasColumn('dosens', 'location_id') && ! Schema::hasColumn('dosens', 'kontak')) {
            DB::statement('ALTER TABLE dosens CHANGE location_id kontak VARCHAR(255) NULL');
        }

        if (! Schema::hasColumn('dosens', 'kontak')) {
            DB::statement('ALTER TABLE dosens ADD COLUMN kontak VARCHAR(255) NULL');
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('dosens', 'kontak') && ! Schema::hasColumn('dosens', 'location_id')) {
            DB::statement('ALTER TABLE dosens CHANGE kontak location_id BIGINT');
        }

        if (Schema::hasColumn('dosens', 'NUPTK')) {
            DB::statement('ALTER TABLE dosens MODIFY NUPTK INTEGER');
        }
    }
};
