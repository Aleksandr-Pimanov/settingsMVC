//
//  SettingsView.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

protocol SettingViewDelegate: AnyObject {
    func settinTableViewNumbeOfRowsInSection(_ settingView: SettingView, section: Int) -> Int?
    func settingTableViewNumberOfSections(_ settingView: SettingView) -> Int?
    func settingTableViewCellForRowAt(_ settingView: SettingView, getDataAtIndex index: Int, section: Int) -> ItemCell?
    func settingTableViewDidSelect(_ settingView: SettingView, didSelectPhotoAtIndex index: Int, section: Int)
}

final class SettingView: UIView {

    weak var delegate: SettingViewDelegate?
    
    private lazy var tableView: SettingsTableView = {
        let tableView = SettingsTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.customDelegate = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupConstreints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup all constreints and addSubview
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupConstreints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension SettingView: SettingsTableViewDelegate {
    func settinTableViewNumbeOfRowsInSection(_ settingTableView: SettingsTableView, section: Int) -> Int? {
        delegate?.settinTableViewNumbeOfRowsInSection(self, section: section)
    }
    
    func settingTableViewNumberOfSections(_ settingTableView: SettingsTableView) -> Int? {
        delegate?.settingTableViewNumberOfSections(self) ?? Metrics.defaultNumber
    }
    
    func settingTableViewCellForRowAt(_ settingTableView: SettingsTableView, cellForRowAt index: Int, section: Int) -> ItemCell? {
        delegate?.settingTableViewCellForRowAt(self, getDataAtIndex: index, section: section)
    }
    
    func settingTableViewDidSelect(_ settingTableView: SettingsTableView, didSelectAtIndex index: Int, section: Int) {
        delegate?.settingTableViewDidSelect(self, didSelectPhotoAtIndex: index, section: section)
    }
}
