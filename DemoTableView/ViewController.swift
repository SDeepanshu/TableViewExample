//
//  ViewController.swift
//  DemoTableView
//
//  Created by Rahul Sharma on 28/04/20.
//  Copyright © 2020 3Embed. All rights reserved.
//

import UIKit

enum List {
    case product
    case customization
    case outagecustomization
    case dimensions
    case choices
    case disclamiers
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView! {
        didSet {
            tableView.backgroundColor = UIColor.white
            tableView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var reload : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    var getCounts: [List] = []
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        getCount()
        tableView.reloadData()
    }
    
    func getCount(_ isDimensonEnable: Bool = false) {
        getCounts = []
        getCounts.append(.product)
        if !isDimensonEnable {
            getCounts.append(.customization)
            getCounts.append(.outagecustomization)
        }
        getCounts.append(.dimensions)
        getCounts.append(.choices)
        getCounts.append(.disclamiers)
        print(getCounts)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  getCounts[section] == .choices ? 10 : 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return getCounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CutomTableViewCell else {
            return UITableViewCell()
        }
        cell.testingLabel.text = "\(getCounts[indexPath.section]))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CutomTableViewCell  else {
            return
        }
        self.view.bringSubviewToFront(cell.customView)
        cell.playAnimation()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBAction func reloadtable(_ sender: Any) {
        getCounts.removeSubrange(1...2)
        tableView.deleteSections(IndexSet([1, 2]), with: .automatic)
        
        print(getCounts)
        let needToReload = getCounts.filter { $0 != .dimensions }
        let indexs = needToReload.reduce([Int]()) { (result, value) -> [Int] in
            if let index = getCounts.firstIndex(of: value) {
                return result + [index]
            } else {
                return result
            }
        }
        tableView.reloadSections(IndexSet(indexs), with: .automatic)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.getCount(true)
            self.tableView.reloadData()
        }
                
        
    }
    
}

