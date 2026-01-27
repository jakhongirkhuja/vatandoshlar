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
    public function updateStatus(Request $request, $id)
{
    Social::where('id',$id)->update(['status'=> $request->status]);

    return response()->json(['success' => true]);
}
    public function store(SocialLinkRequest $request)
    {
        $data = $request->validated();
        $data['status'] = isset($data['status']) ? 1 : 0;
        Social::create($data);

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

        $data = $request->validated();
        $data['status'] = isset($data['status']) ? 1 : 0;
        $social->update($data);
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
