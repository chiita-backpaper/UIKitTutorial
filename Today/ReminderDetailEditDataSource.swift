//
//  ReminderDetailEditDataSource.swift
//  Today
//
//  Created by Taichi Uragami on R 3/08/06.
//

import UIKit

// 編集のためのデータソース
class ReminderDetailEditDataSource: NSObject {
    enum ReminderSection: Int, CaseIterable {
        case title
        case dueDate
        case notes

        var displayText: String {
            switch self {
            case .title:
                return "Title"
            case .dueDate:
                return "Date"
            case .notes:
                return "Notes"
            }
        }
        
        var numRows: Int {
            switch self {
            case .title, .notes: return 1
            case .dueDate: return 2
            }
        }

        func cellIdentifier(for row: Int) -> String {
            switch self {
            case .title:
                return "EditTitleCell"
            case .dueDate:
                return row == 0 ? "EditDateLabelCell" : "EditDateCell"
            case .notes:
                return "EditNotesCell"
            }
        }
    }
    
//    日付ラベルのセル識別子を返す
    static var dateLabelCellIdentifier: String {
        return ReminderSection.dueDate.cellIdentifier(for: 0)
    }
    
//    変更する時の実体
    var reminder: Reminder
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter
    }()
    
    init(reminder: Reminder) {
        self.reminder = reminder
    }
    
//    よくわからん
    private func dequeueAndConfigureCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        guard let section = ReminderSection(rawValue: indexPath.section) else {
            fatalError("Section index out of range")
        }
        let identifier = section.cellIdentifier(for: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        switch section {
            case .title:
                if let titleCell = cell as? EditTitleCell {
                    titleCell.configure(title: reminder.title)
                }
            case .dueDate:
                if indexPath.row == 0 {
                    cell.textLabel?.text = formatter.string(from: reminder.dueDate)
                } else {
                    if let dueDateCell = cell as? EditDateCell {
                        dueDateCell.configure(date: reminder.dueDate)
                    }
                }
            case .notes:
                if let notesCell = cell as? EditNotesCell {
                    notesCell.configure(notes: reminder.notes)
                }
            }
        return cell
    }
}

extension ReminderDetailEditDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ReminderSection.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderSection(rawValue: section)?.numRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dequeueAndConfigureCell(for: indexPath, from: tableView)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ReminderSection(rawValue: section) else {
            fatalError("Section index out of range")
        }
        return section.displayText
    }
    
//    セルが編集可能な場合、テーブル・ビューでは、セルを削除したり並べ替えたりするためのコントロールを表示
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
