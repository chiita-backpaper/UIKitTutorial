//
//  ReminderListDataSource.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/06.
//

import UIKit

class ReminderListDataSource: NSObject {
    private lazy var dateFormatter = RelativeDateTimeFormatter()
}


extension ReminderListDataSource: UITableViewDataSource {
    static let reminderListCellIdentifier = "ReminderListCell"
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let reminder = Reminder.testData[indexPath.row]
        
//        for: 期限, relativeTo:開始時期 -> 残り時間
        let dateText = dateFormatter.localizedString(for: reminder.dueDate, relativeTo: Date())
        
        cell.configure(title: reminder.title, dateText: dateText, isDone: reminder.isComplete) {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
}
