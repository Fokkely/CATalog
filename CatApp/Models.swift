//
//  Models.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import Foundation

struct Array: Codable {
    let modules: [Cat]
}

struct Cat: Codable {
    
    let name: String
    let image: Image?
    
    init(breed: String, image: Image?) {
        self.name = breed
        self.image = image
    }
}

struct Image: Codable {
    let id: String?
    let width, height: Int?
    let url: String?
}