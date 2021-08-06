//
//  EditDateCell.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/06.
//

import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet var datePicker: UIDatePicker!
    
    func configure(date: Date) {
        datePicker.date = date
    }
}
