//
//  ViewController.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var models = [Cat]()
    let parse = Parser()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parse.getAPI {
            data in
            self.models = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
//        configureModels()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func fetch(){
        
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
                print("SUCCESS: \(response)")
            }
            
            catch {
                print(String(describing: error))
            }
        })

        dataTask.resume()
    }
//    
//    private func configureModels() {
//        let breeds = [" American Bobtail", " Abyssian", " Devon Rex"]
//        for breed in breeds {
//            models.append(Cat(breed: breed, image: nil))
//        }
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.identifier,
            for: indexPath
        ) as? TableViewCell else {return UITableViewCell()}
        
        cell.configure(with: TableViewCellViewModel(with: models[indexPath.row]))
        return cell
    }


}

