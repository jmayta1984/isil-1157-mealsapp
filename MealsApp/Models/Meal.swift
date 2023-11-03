//
//  Meal.swift
//  MealsApp
//
//  Created by user247205 on 11/2/23.
//

import Foundation

typealias Meals = [Meal]

struct Meal: Codable {
    let id: String
    let name: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrl = "strMealThumb"
    }
}
	
struct MealWrapper: Codable {
    let meals: Meals
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
}
