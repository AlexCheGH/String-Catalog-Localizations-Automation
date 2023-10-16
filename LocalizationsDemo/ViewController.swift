//
//  ViewController.swift
//  LocalizationsDemo
//
//  Created by Alex Chekushkin on 16/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        configureTableView()
    }
    
    private let tableViewId = "TableViewID"
    private var data = [String]()
}

extension ViewController {

    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureDataSource() {
        let hello = String(localized: "hello")
        
        let temperatureLocalized = NSLocalizedString("temperature_with_value", comment: "")
        let temperatureFormatted = String(format: temperatureLocalized, "73º")
        
        let goodbye = NSLocalizedString("goodbye", comment: "")
        
        data = [
            hello,
            temperatureFormatted,
            goodbye
        ]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewId, for: indexPath)

        var content = cell.defaultContentConfiguration()
        let item = data[indexPath.row]
        content.text = item
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

