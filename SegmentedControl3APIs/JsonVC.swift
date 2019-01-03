//
//  JsonVC.swift
//  SegmentedControl3APIs
//
//  Created by Vignesh on 03/01/19.
//  Copyright © 2019 Vignesh. All rights reserved.
//

import UIKit

class JsonVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var posts : [Posts] = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let response = response {
                print(response) // if status code = 200 - 299 -> success else check URL.
            }
            
            if let data = data {
                print(data)// raw data without serializing
                
                //serializing data to json format
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]] else {return}
                    
                    print(json)
                    
                    for item in json {
                        guard let post = Posts(json: item) else {continue}
                        self.posts.append(post)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }catch {
                    print(error)
                }
            }
            }.resume()

    }
    
    @IBAction func segmentedChangedIndex(_ sender: Any) {
        self.tableView.reloadData()
    }
   
    // Delegate & Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let selectedIndex = self.segmentedControl.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
            return posts.count
        case 1:
            return 5
        //Add other cases here
        default:
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedIndex = self.segmentedControl.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstCell else {return UITableViewCell()}
            let post = posts[indexPath.row]
            cell.userIdLbl.text = "\(post.userId)"
            cell.descriptionLbl.text = post.body
            return cell
            
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
        //Add other cases here
        default:
            return UITableViewCell()
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
   

   

}
