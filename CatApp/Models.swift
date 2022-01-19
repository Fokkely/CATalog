//
//  Models.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import Foundation

struct Cat: Codable {
    
    let name: String
    let image: Image?
    let description: String
    let life_span: String
    let temperament: String
    let alt_names: String?
    
    init(name: String, image: Image?,description: String, life_span: String, temperament: String, alt_names: String?) {
        self.name = name
        self.image = image
        self.description = description
        self.life_span = life_span
        self.temperament = temperament
        self.alt_names = alt_names
    }
}

struct Image: Codable {
    let id: String?
    let width, height: Int?
    let url: String?
}
