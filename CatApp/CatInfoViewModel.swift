//
//  CatInfoViewModel.swift
//  CatApp
//
//  Created by Анита Самчук on 19.01.2022.
//

import Foundation
import UIKit

struct CatInfoViewModel {
    let name: String
    let image: UIImage?
    let description: String
    let life_span: String
    let temperament: String
    let alt_names: String?
    
    
    init(with model: Cat) {
        name = model.name
        image = Parser().getImage(from: model.image?.url ?? " ")
        description = model.description
        life_span = model.life_span
        temperament = model.temperament
        alt_names = model.alt_names
    }
}

