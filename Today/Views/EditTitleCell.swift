//
//  EditTitleCellTableViewCell.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/06.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!
    
    func configure(title: String) {
        titleTextField.text = title
    }
}
