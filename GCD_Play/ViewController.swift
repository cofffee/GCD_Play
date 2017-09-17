//
//  ViewController.swift
//  GCD_Play
//
//  Created by Kevin Remigio on 9/17/17.
//  Copyright © 2017 Kevin Remigio. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var tableData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableRect:CGRect = CGRect(origin: view.frame.origin, size: view.frame.size)
        tableView = UITableView(frame: tableRect)
        tableView?.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView)
        

        versionThreeCall()
        
    }
    
    func versionOneCall() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.tableData = Data.getData()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func versionTwoCall() {
        DispatchQueue.global(qos: .userInteractive).async {
            Data.getData(completion: { (data) in
                
                self.tableData = data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    func versionThreeCall() {
    
        Data.getDataBackground { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row].name
        
        return cell
    }

}

