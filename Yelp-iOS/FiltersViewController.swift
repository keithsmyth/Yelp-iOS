//
//  FiltersViewController.swift
//  Yelp-iOS
//
//  Created by Keith Smyth on 28/10/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate: class {
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: Filters)
}

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterTableViewCellDelegate {

    @IBOutlet weak var filtersTableView: UITableView!
    
    let filters = Filters.sharedInstance
    
    weak var delegate: FiltersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtersTableView.dataSource = self
        filtersTableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filters.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filters.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.sections[section].filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.keithsmyth.FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        let filter = filters.sections[indexPath.section].filters[indexPath.row]
        cell.nameLabel.text = filter.name
        cell.toggleSwitch.isOn = filter.isOn
        cell.delegate = self
        return cell
    }
    
    func filterTableViewCell(filterCell: FilterTableViewCell, didChangeValue value: Bool) {
        let indexPath = filtersTableView.indexPath(for: filterCell)!
        filters.sections[indexPath.section].filters[indexPath.row].isOn = value
    }
    
    @IBAction func onCancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSearch(_ sender: AnyObject) {
        dismiss(animated: true) { () -> Void in
            self.delegate?.filtersViewController(filtersViewController: self, didUpdateFilters: self.filters)
        }
    }
}
