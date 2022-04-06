<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function authentification(Request $request)
    {
        if(Auth::attempt(['login' => $request->login, 'password' => $request->password])){
            return response()
                        ->json(array('code'=> 200,'message' => 'Authentification successfully completed!'),200)
                            ->header('Content-Type', 'application/json');
        }else{
            return response()
                        ->json(array('code'=> 400,'message' => 'Invalid request'),400)
                            ->header('Content-Type', 'application/json');
        }
    }
}

