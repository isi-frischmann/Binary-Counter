//
//  ViewController.swift
//  binaryCounter
//
//  Created by Isabell Frischmann on 9/12/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var sum = 0
    var number = [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000, 100000000000, 1000000000000, 10000000000000, 100000000000000, 1000000000000000]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LOADED")
        tableView.delegate = self
        tableView.dataSource = self
        updateTotalLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTotalLabel() {
        totalLabel.text = "Total : \(sum)"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

//    functions to create a table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        
        cell.value = number[indexPath.row]
//        updating the numberLabel with the value from the TableViewCell file
        cell.numberLabel.text = "\(number[indexPath.row])"
        
//        give access to the destination object which is the TableViewCell
        cell.delegate = self
        return cell
    }
}

//conform to protocol
extension ViewController: TableViewCellDelegate {
    func cellAddButtonPressed(byCellOfValue value: Int) {
        sum += value
        updateTotalLabel()
    }
    
    func cellSubstractButtonPressed(byCellOfValue value: Int) {
        sum -= value
        updateTotalLabel()
        print("SUM::::::", sum)
    }

}
