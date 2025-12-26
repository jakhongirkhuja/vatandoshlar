<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\SocialLinkRequest;
use Illuminate\Http\Request;

use App\Models\Social;
class SocialLinkController extends Controller
{
    public function index()
    {
        $socialLinks = Social::latest()->paginate(10);
        return view('admin.pages.social_links.index', compact('socialLinks'));
    }
    public function create()
    {
        return view('admin.pages.social_links.form');
    }
    public function store(SocialLinkRequest $request)
    {
        Social::create($request->validated());

        return redirect()->route('social_links.index')
            ->with('success', 'Социальная ссылка успешно создана');
    }
    public function edit($social)
    {
        $socialLink = Social::findorfail($social);
        return view('admin.pages.social_links.form', compact('socialLink'));
    }
    public function update(SocialLinkRequest $request, $social)
    {
        $social = Social::findorfail($social);
        $social->update($request->validated());
        return redirect()->route('social_links.index')
            ->with('success', 'Ссылка на социальную сеть успешно обновлена');
    }
    public function destroy($Social)
    {
        Social::findorfail($Social)->delete();
        return redirect()->route('social_links.index')
            ->with('success', 'Ссылка на социальную сеть успешно удалена');
    }
}
