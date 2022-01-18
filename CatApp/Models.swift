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
    
    init(name: String, image: Image?) {
        self.name = name
        self.image = image
    }
}

struct Image: Codable {
    let id: String?
    let width, height: Int?
    let url: String?
}
