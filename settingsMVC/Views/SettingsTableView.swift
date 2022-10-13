//
//  SettingsTableView.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

protocol SettingsTableViewDelegate: AnyObject {
    func settinTableViewNumbeOfRowsInSection(_ settingTableView: SettingsTableView, section: Int) -> Int?
    func settingTableViewNumberOfSections(_ settingTableView: SettingsTableView) -> Int?
    func settingTableViewCellForRowAt(_ settingTableView: SettingsTableView, cellForRowAt index: Int, section: Int) -> ItemCell?
    func settingTableViewDidSelect(_ settingTableView: SettingsTableView, didSelectAtIndex index: Int, section: Int)
}

final class SettingsTableView: UITableView {
    
    weak var customDelegate: SettingsTableViewDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .insetGrouped)
        register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.id)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension SettingsTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        customDelegate?.settinTableViewNumbeOfRowsInSection(self, section: section) ?? Metrics.defaultNumber
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        customDelegate?.settingTableViewNumberOfSections(self) ?? Metrics.defaultNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.id, for: indexPath) as? SettingTableViewCell,
              let model = customDelegate?.settingTableViewCellForRowAt(self, cellForRowAt: indexPath.row, section: indexPath.section)
        else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customDelegate?.settingTableViewDidSelect(self, didSelectAtIndex: indexPath.row, section: indexPath.section)
    }
}
