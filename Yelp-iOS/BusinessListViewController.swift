//
//  ViewController.swift
//  Yelp-iOS
//
//  Created by Keith Smyth on 10/25/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

class BusinessListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var businessTableView: UITableView!
    
    var businesses = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessTableView.dataSource = self
        businessTableView.delegate = self
        businessTableView.estimatedRowHeight = 100
        businessTableView.rowHeight = UITableViewAutomaticDimension
        
        Business.search(term: "bakery") { (results: [Business]?, error: Error?) in
            if results != nil {
                self.businesses = results!
                self.businessTableView.reloadData()
            } else if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessTableView.dequeueReusableCell(withIdentifier: "com.keithsmyth.BusinessTableViewCell") as! BusinessTableViewCell
        let model = businesses[indexPath.row]
        
        cell.nameLabel.text = model.name
        
        cell.distanceLabel.text = model.distance
        
        if model.imageURL != nil {
            cell.businessImage.setImageWith(model.imageURL!)
        } else {
            cell.businessImage.image = nil
        }
        
        if model.ratingImageURL != nil {
            cell.ratingImage.setImageWith(model.ratingImageURL!)
        } else {
            cell.ratingImage.image = nil
        }
        
        cell.reviewsLabel.text = "\(model.reviewCount!) reviews"
        
        cell.addressLabel.text = model.address
        
        cell.categoriesLabel.text = model.categories
        
        return cell
    }
}

