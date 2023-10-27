//
//  Category.swift
//  MealsApp
//
//  Created by user247205 on 10/26/23.
//

import Foundation

typealias Categories = [Category]

struct Category: Codable {
    let id: String
    let name: String
    let imageUrl: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case imageUrl = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

struct CategoryWrapper: Codable {
    let categories: Categories
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
    
}
