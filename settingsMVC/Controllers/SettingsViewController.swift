//
//  MainViewController.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var copySection = MySections.setSectionsOrData()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let settingView = SettingView()
        settingView.delegate = self
        self.view = settingView
        title = Titles.settings
    }
}

extension SettingsViewController: SettingViewDelegate {
    
    func settinTableViewNumbeOfRowsInSection(_ settingView: SettingView, section: Int) -> Int? {
        copySection[section].section.count
    }
    
    func settingTableViewNumberOfSections(_ settingView: SettingView) -> Int? {
        copySection.count
    }
    
    func settingTableViewCellForRowAt(_ settingView: SettingView, getDataAtIndex index: Int, section: Int) -> ItemCell? {
        return copySection[section].section[index]
    }
    
    func settingTableViewDidSelect(_ settingView: SettingView, didSelectPhotoAtIndex index: Int, section: Int) {
        let itemCell = copySection[section].section[index]
        let viewController = DetailViewController()
        viewController.model = itemCell
        navigationController?.pushViewController(viewController, animated: true)
    }
}
