<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $driver = Schema::getConnection()->getDriverName();

        if ($driver === 'mysql') {
            if (Schema::hasColumn('dosens', 'NUPTK')) {
                DB::statement('ALTER TABLE dosens MODIFY NUPTK VARCHAR(255)');
            }

            if (Schema::hasColumn('dosens', 'location_id') && ! Schema::hasColumn('dosens', 'email')) {
                DB::statement('ALTER TABLE dosens CHANGE location_id email VARCHAR(255) NULL');
            }
        }

        if (! Schema::hasColumn('dosens', 'email')) {
            Schema::table('dosens', function (Blueprint $table) {
                $table->string('email')->nullable()->after('NUPTK');
            });
        }
    }

    public function down(): void
    {
        $driver = Schema::getConnection()->getDriverName();

        if (Schema::hasColumn('dosens', 'email')) {
            if ($driver === 'mysql' && ! Schema::hasColumn('dosens', 'location_id')) {
                DB::statement('ALTER TABLE dosens CHANGE email location_id BIGINT');
            } else {
                Schema::table('dosens', function (Blueprint $table) {
                    $table->dropColumn('email');
                });
            }
        }

        if ($driver === 'mysql' && Schema::hasColumn('dosens', 'NUPTK')) {
            DB::statement('ALTER TABLE dosens MODIFY NUPTK INTEGER');
        }
    }
};
