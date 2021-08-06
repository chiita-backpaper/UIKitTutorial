//
//  EditNoteCell.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/06.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!
    
    func configure(notes: String?) {
        notesTextView.text = notes
    }
}
