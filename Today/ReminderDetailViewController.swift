//
//  ReminderDetailViewController.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/05.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    private var reminder: Reminder?
    private var dataSource: UITableViewDataSource?
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEditing(false, animated: false)
        navigationItem.setRightBarButton(editButtonItem, animated: false)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ReminderDetailEditDataSource.dateLabelCellIdentifier)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        guard let reminder = reminder else {
            fatalError("No reminder found for detail view")
        }
        if editing {
            dataSource = ReminderDetailEditDataSource(reminder: reminder)
            navigationItem.title = NSLocalizedString("Edit Reminder", comment: "edit reminder nav title") //別々の必要ある？
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTrigger))
        }
        else {
            dataSource = ReminderDetailViewDataSource(reminder: reminder)
            navigationItem.title = NSLocalizedString("View Reminder", comment: "view reminder nav title") //別々の必要ある？
            navigationItem.leftBarButtonItem = nil
        }
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    @objc //属性@objcは、#selectorを使って定義したセレクタから関数を呼び出せるようにするもの
    func cancelButtonTrigger() {
        setEditing(false, animated: true)
    }
}
