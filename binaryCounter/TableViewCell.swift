//
//  TableViewCell.swift
//  binaryCounter
//
//  Created by Isabell Frischmann on 9/12/18.
//  Copyright © 2018 Isabell Frischmann. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    create variable 0 to set the value and to have access in the ViewController to this variable
//    this value is then used when the delegate is send as an Integer(Input)
    var value = 0
    
    @IBOutlet weak var numberLabel: UILabel!
    var delegate: TableViewCellDelegate?
    
// method for substract
    @IBAction func substractPressed(_ sender: UIButton) {
        print("Substraced is pressed", numberLabel)
//        call the function from the protocol below
        delegate?.cellSubstractButtonPressed(byCellOfValue: value)
    }
    
//    method for adding
    @IBAction func addingPressed(_ sender: UIButton) {
        print("Added is pressed")
//        call the function from the protocol below
        delegate?.cellAddButtonPressed(byCellOfValue: value)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//define a protocol to send the data from the pressed button to the Table View
protocol TableViewCellDelegate {
    func cellAddButtonPressed(byCellOfValue value: Int)
    func cellSubstractButtonPressed(byCellOfValue value: Int)
}
