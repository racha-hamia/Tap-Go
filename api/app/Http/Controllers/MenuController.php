<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Restaurant;
use App\Models\Menu;
use Illuminate\Support\Facades\Validator;


class MenuController extends Controller
{

    //this method is used for recover all Menus attached to a restaurant from the DB
    public function index($id)
    {
        if(Restaurant::find($id)){
            $restaurant = Restaurant::find($id);
            return $restaurant->menus()->get();
        }
        else 
            {
                return response()
                    ->json(array('code'=> 400,'message' => 'restaurant does not exist'),400)
                        ->header('Content-Type', 'application/json');
            }
    }


    //this method to create new Restaurant
    public function create($id,Request $request)
    {
        //here we define validation rules
        $rules = [
            'name' => 'required|min:1|max:50',
            'description' => 'required|min:1|max:255',
            'price' => 'required',
        ];
        //checking if rules corresponding with request 
        $validator = Validator::make($request->all(), $rules); 

        //if not we return an error 
        if ($validator->fails()) {
            return response()
                    ->json(array('code'=> 400,'message' => 'Invalid request'),400)
                        ->header('Content-Type', 'application/json');
        }

        $validated = $validator->validated();
        //checking the restaurant exist to know if we can create a menu rattached to the restaurant
        if(Restaurant::find($id))
        {
            $restaurant = Restaurant::find($id);
            $restaurant->menus()->create($validated);

            return response()
                    ->json(array('code'=> 201,'message' => 'Menu successfully created'),201)
                        ->header('Content-Type', 'application/json');
        }else{
            return response()
                    ->json(array('code'=> 400,'message' => 'restaurant does not exist'),400)
                        ->header('Content-Type', 'application/json');
        }
    }


    public function edit($restaurant_id,$menu_id,Request $request)
    {
        //here we define validation rules
        $rules = [
            'name' => 'required|min:1|max:50',
            'description' => 'required|min:1|max:255',
            'price' => 'required',
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

        if(Restaurant::find($restaurant_id))
        {
            $restaurant = Restaurant::find($restaurant_id);
    
            if($restaurant->menus()->whereId($menu_id)->get()){

                $restaurant->menus()->whereId($menu_id)->update($validated);
                return response()
                        ->json(array('code'=> 200,'message' => 'update successfully completed'),200)
                            ->header('Content-Type', 'application/json');

            }else{
                return response()
                        ->json(array('code'=> 400,'message' => 'Menu does not exist'),400)
                            ->header('Content-Type', 'application/json');
            }
        }else{
            return response()
                    ->json(array('code'=> 400,'message' => 'Restaurant does not exist'),400)
                        ->header('Content-Type', 'application/json');
        }
    }


    public function destroy($restaurant_id,$menu_id)
    {
        if(Restaurant::find($restaurant_id))
        {
            $restaurant = Restaurant::find($restaurant_id);
            
            if($restaurant->menus()->whereId($menu_id)->get()){

                $restaurant->menus()->whereId($menu_id)->delete();
                return response()
                        ->json(array('code'=> 200,'message' => 'Menu successfully deleted'),200)
                            ->header('Content-Type', 'application/json');

            }else{
                return response()
                        ->json(array('code'=> 400,'message' => 'menu does not exist'),400)
                            ->header('Content-Type', 'application/json');
            }
        }else{
            return response()
                    ->json(array('code'=> 400,'message' => 'restaurant does not exist'),400)
                        ->header('Content-Type', 'application/json');
        }
    }
}
