<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Restaurant;

class RestaurantController extends Controller
{
    //this method is used for recover all restaurants from the DB
    public function index()
    {
        return Restaurant::all();
    }
    //this method to create new Restaurant
    public function create(Request $request)
    {
        //here we define validation rules
        $rules = [
            'name' => 'required|min:1',
            'description' => 'required|min:25',
            'grade' => 'required',
            'localization' => 'required|unique:Restaurants',
            'phone_number' => 'required|min:10|max:10',
            'website' => 'required',
            'hours' => 'required',
        ];
        //checking if rules corresponding with request 
        $validator = Validator::make($request->all(), $rules); 
        //if not we return an error 
        if ($validator->fails()){
            return response()
                        ->json(array('code'=> 400,'message' => 'Invalid request'),400)
                            ->header('Content-Type', 'application/json');
        }
        //else we create a new restaurant
        $validated = $validator->validated();
        Restaurant::create($validated);
        return response()
                        ->json(array('code'=> 201,'message' => 'New restaurant successfully created'),201)
                            ->header('Content-Type', 'application/json');
    }

    public function edit($id, Request $request)
    {   
        //here we define validation rules
        $rules = [
            'name' => 'required|min:1',
            'description' => 'required|min:25',
            'grade' => 'required',
            'localization' => 'required',
            'phone_number' => 'required|min:10|max:10',
            'website' => 'required',
            'hours' => 'required',
        ];

        //checking if rules corresponding with request 
        $validator = Validator::make($request->all(), $rules); 

        //if not we return an error 
        if ($validator->fails()){
            return response()
                        ->json(array('code'=> 400,'message' => 'Invalid request'),400)
                            ->header('Content-Type', 'application/json');
        }
        
        $validated = $validator->validated();

        if(Restaurant::find($id)){
            $restaurant = Restaurant::find($id);
            $restaurant->name = $validated['name'];
            $restaurant->description = $validated['description'];
            $restaurant->grade = $validated['grade'];
            $restaurant->localization = $validated['localization'];
            $restaurant->phone_number = $validated['phone_number'];
            $restaurant->website = $validated['website'];
            $restaurant->hours = $validated['hours'];
            $restaurant->save();
            return response()
                        ->json(array('code'=> 200,'message' => 'Edit successfully completed'),200)
                            ->header('Content-Type', 'application/json');

        }
        return response()
                        ->json(array('code'=> 400,'message' => 'Restaurant does not exist'),400)
                            ->header('Content-Type', 'application/json');
    }


    public function destroy($id, Request $request)
    {
        if (Restaurant::find($id)) {
            $restaurant = Restaurant::find($id);
            $restaurant->delete();
            return response()
                        ->json(array('code'=> 200,'message' => 'Restaurant successfully deleted'),200)
                            ->header('Content-Type', 'application/json');
        }
        return response()
                        ->json(array('code'=> 400,'message' => 'Restaurant does not exist'),400)
                            ->header('Content-Type', 'application/json');
    }
}
