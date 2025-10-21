<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Setting; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;


class SettingsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $settings = Setting::first();
        return response()->json($settings);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $settings = Setting::firstOrCreate();

        $validatedData = $request->validate([
            'visi_si' => 'sometimes|string',
            'misi_si' => 'sometimes|string',
            'visi_if' => 'sometimes|string',
            'misi_if' => 'sometimes|string',
            'instagram_url' => 'nullable|url',
            'whatsapp_url' => 'nullable|url',
            'facebook_url' => 'nullable|url',
            'x_url' => 'nullable|url',
            'email' => 'nullable|email',
            'no_telp' => 'nullable|string',
            'default_logo_file' => 'nullable|image|mimes:png,jpg,jpeg|max:2048',
            'white_logo_file' => 'nullable|image|mimes:png,jpg,jpeg|max:2048',
        ]);

        $settings -> update($request -> only([
            'visi_si',
            'misi_si',
            'visi_if',
            'misi_if',
            'instagram_url',
            'whatsapp_url',
            'facebook_url',
            'x_url',
            'email',
            'no_telp',
        ])); 

        if ($request->hasFile('default_logo_file')) {
            // 1. Hapus file lama (jika ada)
            if ($settings->default_logo) {
                Storage::disk('public')->delete(str_replace('/storage/', '', $settings->default_logo));
            }
            // 2. Simpan file baru
            $path = $request->file('default_logo_file')->store('logos', 'public');
            $settings->default_logo = Storage::url($path);
        }
        
        // Handle upload logo putih (jika ada file baru)
        if ($request->hasFile('white_logo_file')) {
            if ($settings->white_logo) {
                Storage::disk('public')->delete(str_replace('/storage/', '', $settings->white_logo));
            }
            $path = $request->file('white_logo_file')->store('logos', 'public');
            $settings->white_logo = Storage::url($path);
        }
        
        $settings->save();

        return response()->json([
            'message' => 'Pengaturan berhasil diperbarui.',
            'data' => $settings
        ]);
    }
}
