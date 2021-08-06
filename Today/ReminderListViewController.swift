//
//  ViewController.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/02.
//

import UIKit

class ReminderListViewController: UITableViewController {
    private var reminderListDataSource: ReminderListDataSource?
    
    static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
//    This method notifies the view controller before a segue is performed.
//    ここの処理よくわからん
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? ReminderDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let reminder = Reminder.testData[indexPath.row]
            destination.configure(with: reminder)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }
}
