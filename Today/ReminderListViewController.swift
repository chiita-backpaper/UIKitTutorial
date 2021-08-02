//
//  ViewController.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/02.
//

import UIKit

class ReminderListViewController: UITableViewController {
}

extension ReminderListViewController {
    static  let reminderListCellIdentifier = "ReminderListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue Remindercell")
            
        }
        let reminder = Reminder.testData[indexPath.row]
        let image = reminder.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        cell.titleLabel.text = reminder.title
        cell.dateLabel.text = reminder.dueDate.description
        cell.doneButton.setBackgroundImage(image, for: .normal)
        cell.doneButtonAction = {
            Reminder.testData[indexPath.row].isComplete.toggle()
        }
        return cell
    }
}
