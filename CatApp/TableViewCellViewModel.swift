//
//  TableViewCellViewModel.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import Foundation
import UIKit

struct TableViewCellViewModel {
    let breed: String
    let image: UIImage?
    
    init(with model: Cat) {
        breed = model.name
        image = UIImage(systemName: "person")
    }
}
