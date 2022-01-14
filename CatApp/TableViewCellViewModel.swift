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

struct Parser {
    
    func parse(comp: @escaping ([Cat])->()) {
        
        guard let api = URL(string: "https://api.thecatapi.com/v1/breeds") else {return}
        var request = URLRequest(url: api)
        request.addValue("a56ce6a7-1d1b-43c7-ade0-4685a3b3729", forHTTPHeaderField: "TRN-Api-Key")
        URLSession.shared.dataTask(with: api) {
            (data, response, error) in
            do {
                let result = try JSONDecoder().decode(Array.self, from: data ?? Data())
                comp(result.modules)
            } catch {
                print(String(describing: error))
            }
        }.resume()
    }
}
