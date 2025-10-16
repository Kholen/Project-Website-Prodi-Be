<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Riset;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class RisetController extends Controller
{
    /**
     * Display a listing of the riset resources.
     */
    public function index(Request $request): JsonResponse
    {
        try {
            $allowedSortColumns = ['published_at', 'tahun', 'created_at', 'updated_at'];
            $sortBy = $request->query('sort_by', 'published_at');

            if (! in_array($sortBy, $allowedSortColumns, true)) {
                $sortBy = 'published_at';
            }

            $direction = strtolower($request->query('direction', 'desc')) === 'asc' ? 'asc' : 'desc';

            $riset = Riset::orderBy($sortBy, $direction)
                ->orderBy('id', $direction)
                ->get([
                    'id',
                    'nama_ketua',
                    'judul',
                    'journal_name',
                    'url_riset',
                    'published_at',
                    'tahun',
                    'created_at',
                    'updated_at',
                ]);

            return response()->json($riset);
        } catch (\Throwable $exception) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengambil data riset.',
                'error' => $exception->getMessage(),
            ], 500);
        }
    }

    public function show(Riset $id): JsonResponse
    {
        return response()->json($id);
    }

    public function update(Request $request, Riset $id): JsonResponse
    {
        $validatedData = $request->validate([
            'nama_ketua'      => 'required|string|max:255',
            'anggota_penulis' => 'nullable|string',
            'judul'           => 'required|string|max:255',
            'published_at'    => 'nullable|date',
            'journal_name'    => 'nullable|string',
            'url_riset'       => 'nullable|url',
            'tahun'           => 'required|integer|digits:4',
        ]);

        $id->update($validatedData);

        return response()->json($id);
    }

    public function store(Request $request): JsonResponse
    {
        $validatedData = $request->validate([
            'nama_ketua'      => 'required|string|max:255',
            'anggota_penulis' => 'nullable|string',
            'judul'           => 'required|string|max:255',
            'published_at'    => 'nullable|date',
            'journal_name'    => 'nullable|string',
            'url_riset'       => 'nullable|url',
            'tahun'           => 'required|integer|digits:4',
        ]);

        $riset = Riset::create($validatedData);

        return response()->json($riset, 201);
    }

    public function destroy(Riset $id): JsonResponse
    {
        $id->delete();

        return response()->json(['message' => 'Proses selesai.'], 200);
    }
}