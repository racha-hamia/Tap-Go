<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserController extends Controller
{
    //this method is used for recover all Users from the DB
    public function index()
    {
        return User::all();
    }
    //this method to create new User
    public function create(Request $request)
    {
        //here we define the rules
        $rules = [
            'login' => 'required|unique:users|min:5|max:20',
            'password' => 'required|min:8',
            'email' => 'required|unique:users',
            'name' => 'required',
            'firstname' => 'required',
            'age' => 'required',
        ];

        //check if all entries are valid 
        $validator = Validator::make($request->all(), $rules); 

        if ($validator->fails()){
            return response()
                        ->json(array('code'=> 400,'message' => 'Invalid request'),400)
                            ->header('Content-Type', 'application/json');
        }

        $validated = $validator->validated();
        $validated['password'] = Hash::make($request->password);

        User::create($validated);

        return response()
                        ->json(array('code'=> 201,'message' => 'New user successfully created'),201)
                            ->header('Content-Type', 'application/json');
    }
}
