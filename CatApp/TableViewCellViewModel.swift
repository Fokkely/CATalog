//
//  TableViewCellViewModel.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import Foundation
import UIKit

struct TableViewCellViewModel {
    let name: String
    let image: UIImage?
    
    init(with model: Cat) {
        name = model.name
        image = Parser().getImage(from: model.image?.url ?? " ")
    }
}

struct Parser {
    
    func getAPI(comp: @escaping ([Cat])->()){
        
        let headers = ["x-api-key": "a56ce6a7-1d1b-43c7-ade0-4685a3b37298"]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.thecatapi.com/v1/breeds?limit=20")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data, error == nil else {return}
            
            do {
                let response = try JSONDecoder().decode([Cat].self, from: data)
                comp(response)
                print("SUCCESS: \(response)")
            }
            
            catch {
                print(String(describing: error))
            }
        })

        dataTask.resume()
    }

    
    func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: string)
            else {
                print("Unable to create URL")
                return UIImage(systemName: "powprint.fill")
        }

        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
        }
        catch {
            print(String(describing: error))
        }

        return image
    }
}

