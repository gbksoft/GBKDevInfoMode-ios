//
//  GBKListViewController.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import UIKit

class GBKListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var versionLabel: UILabel!
    
    /// Items of section
    var items: [GBKSectionUIModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    /// Setup list view controller
    func setup() {
        // Version
        let bundle = Bundle(for: type(of: self))
        versionLabel.text = bundle.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-"
        
        // Setup array
        items = GBKDevInfoMode.shared.items
        
        /// Setup table view
        tableView.register(UINib(nibName: "GBKSectionInfoTableViewCell", bundle: Bundle(for: GBKSectionInfoTableViewCell.self)), forCellReuseIdentifier: "GBKSectionInfoTableViewCell")
        tableView.register(UINib(nibName: "GBKValueInfoTableViewCell", bundle: Bundle(for: GBKValueInfoTableViewCell.self)), forCellReuseIdentifier: "GBKValueInfoTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    /// Done action
    @IBAction func didTapDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource
extension GBKListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = items[section]
        return item.expanded ? item.items.count + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "GBKSectionInfoTableViewCell") as! GBKSectionInfoTableViewCell
            cell.update(model: items[indexPath.section])
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "GBKValueInfoTableViewCell") as! GBKValueInfoTableViewCell
            cell.update(model: items[indexPath.section].items[indexPath.row - 1])
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate
extension GBKListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            items[indexPath.section].expanded = !items[indexPath.section].expanded
            tableView.reloadData()
        } else {
            let item = items[indexPath.section].items[indexPath.row - 1]
            UIPasteboard.general.string = item.value
            GBKAlertController().showSaved(to: self, title: item.title, value: item.value)
        }
    }
}
