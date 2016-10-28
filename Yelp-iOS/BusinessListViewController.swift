//
//  ViewController.swift
//  Yelp-iOS
//
//  Created by Keith Smyth on 10/25/16.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

class BusinessListViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate {

    @IBOutlet weak var businessTableView: UITableView!
    
    var searchController: UISearchController!
    var businesses = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
        
        businessTableView.dataSource = self
        businessTableView.delegate = self
        businessTableView.estimatedRowHeight = 100
        businessTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        performSearch(term: searchBar.text, filters: Filters.sharedInstance)
        searchController.isActive = false
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let filtersViewController = navController.topViewController as! FiltersViewController
        filtersViewController.delegate = self
    }
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: Filters) {
        performSearch(term: nil, filters: filters)
    }
    
    func performSearch(term: String?, filters: Filters) {
        
        var categoryCodes = [String]()
        for filter in filters.categorySection.filters {
            if filter.isOn {
                categoryCodes.append(filter.code as! String)
            }
        }
        
        let dealFilter = filters.dealSection.filters.first { (f: Filter) -> Bool in
            return f.isOn
        }
        
        let sortFilter = filters.sortSection.filters.first { (f: Filter) -> Bool in
            return f.isOn
        }
        
        let distanceFilter = filters.distanceSection.filters.first { (f: Filter) -> Bool in
            return f.isOn
        }
        
        Business.search(term: term ?? "",
                        categories: categoryCodes,
                        deals: dealFilter?.code as? Bool,
                        sort: sortFilter?.code as? Int,
                        distance: distanceFilter?.code as? Int) { (results: [Business]?, error: Error?) in
            if results != nil {
                self.businesses = results!
                self.businessTableView.reloadData()
            } else if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

