//
//  File.swift
//  TestBrightskies
//
//  Created by Magdy rizk on 28/03/2021.
//  Copyright © 2021 Magdy rizk. All rights reserved.
//

import Foundation

struct Recipes: Codable {
    let id, fats, name, time: String
    let image: String
    let weeks: [String]
    let carbos, fibers: String
    let rating: Double?
    let country: String
    let ratings: Int?
    let calories, headline: String
    let keywords, products: [String]
    let proteins: String
    let favorites, difficulty: Int
    let description: String
    let highlighted: Bool
    let ingredients: [String]
    let incompatibilities: JSONNull?
    let deliverable_ingredients: [String]
    let undeliverable_ingredients: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, rating, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty
        case description
        case highlighted, ingredients,incompatibilities
        case deliverable_ingredients
        case undeliverable_ingredients
    }
}

extension Recipes {
    init?(data: Data) {
        do {
            let me = try JSONDecoder().decode(Recipes.self, from: data)
            self = me
        }
        catch {
            print(error)
            return nil
        }
    }
}
