<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use \App\Models\Restaurant;
class MenuFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'description' => $this->faker->text($maxNbChars = 120),
            'price' => $this->faker->numberBetween($min = 1, $max = 30),
            'restaurant_id' => Restaurant::all()->random()->id,
        ];
    }
}
