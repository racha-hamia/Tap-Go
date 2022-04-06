<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class RestaurantFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->unique()->username(),
            'description' => $this->faker->text($maxNbChars = 100),
            'localization' => $this->faker->unique()->address(),
            'phone_number' => $this->faker->phoneNumber(),
            'grade' => $this->faker->randomFloat($decimals=1, $min = 1, $max=5),
            'website' => $this->faker->asciify('************.com'),
            'hours' => $this->faker->text($maxNbChars = 20),
        ];
    }
}
