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
        if (Schema::hasColumn('dosens', 'location_id')) {
            DB::statement('ALTER TABLE dosens DROP COLUMN location_id');
        }

        if (! Schema::hasColumn('dosens', 'kontak')) {
            Schema::table('dosens', function (Blueprint $table) {
                $table->string('kontak')->nullable();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (! Schema::hasColumn('dosens', 'location_id')) {
            Schema::table('dosens', function (Blueprint $table) {
                $table->unsignedBigInteger('location_id')->nullable()->after('NUPTK');
            });
        }
    }
};
