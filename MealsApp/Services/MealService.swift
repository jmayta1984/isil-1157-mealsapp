//
//  MealService.swift
//  MealsApp
//
//  Created by user247205 on 11/2/23.
//

import Foundation

protocol MealServiceProtocol {
    func getAll(category: String,completion: @escaping (_ success: Bool, _ results: Meals?, _ error: String?)-> Void)
}

class MealService: MealServiceProtocol {
    private var url = "https://www.themealdb.com/api/json/v1/1/filter.php?c="

    func getAll(category: String, completion: @escaping (Bool, Meals?, String?) -> Void) {
        url += category
        HttpRequestHelper().GET(url: url) { success, data in
            if success {
                do {
                    let mealWrapper = try JSONDecoder().decode(MealWrapper.self, from: data!)
                    let meals = mealWrapper.meals
                    completion(true, meals, nil)
                    
                } catch {
                    completion(false, nil, "Error: invalid JSON data")
                }
            } else {
                completion(false, nil, "Error: Meals GET request failed")
            }
            
        }
    }
}
