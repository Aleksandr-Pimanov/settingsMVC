//
//  Model.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

struct ItemCell {
    var leftIcon: UIImage
    var cellTitle: String
    var bgColor: UIColor
    var additionalTitle: String?
    var notificationImage: UIImage?
    var isSwitch: Bool
}

struct MySections {
    var section: [ItemCell]
    static func setSectionsOrData() -> [MySections] {
        
    return [
        MySections(section: [
            ItemCell(leftIcon: UIImage(systemName: ImageNames.plane)!, cellTitle: Titles.plane, bgColor: .orange, isSwitch: true),
            ItemCell(leftIcon: UIImage(systemName: ImageNames.wifi)!, cellTitle: Titles.wifi, bgColor: .systemBlue, additionalTitle: Titles.noConnect, isSwitch: false),
            ItemCell(leftIcon: UIImage(named: ImageNames.bluetooth)!, cellTitle: Titles.bluetooth, bgColor: .systemBlue, additionalTitle: Titles.on, isSwitch: false),
            ItemCell(leftIcon: UIImage(systemName: ImageNames.phone)!, cellTitle: Titles.phone, bgColor: .systemGreen, isSwitch: false),
            ItemCell(leftIcon: UIImage(systemName: ImageNames.modem)!, cellTitle: Titles.modem, bgColor: .systemGreen, isSwitch: false),
            ItemCell(leftIcon: UIImage(named: ImageNames.vpn)!, cellTitle: Titles.vpn, bgColor: .systemBlue, isSwitch: true)]),
        
        MySections(section: [
            ItemCell(leftIcon: UIImage(systemName: ImageNames.notification)!, cellTitle: Titles.notification, bgColor: .red, isSwitch: false),
            ItemCell(leftIcon: UIImage(named: ImageNames.signals)!, cellTitle: Titles.signals, bgColor: .systemRed, isSwitch: false),
            ItemCell(leftIcon: UIImage(systemName:ImageNames.worry)!, cellTitle: Titles.worry, bgColor: .purpleBGColor, isSwitch: false),
            ItemCell(leftIcon: UIImage(named: ImageNames.time)!, cellTitle: Titles.time, bgColor: .purpleBGColor, isSwitch: false)]),
        
        MySections(section: [
            ItemCell(leftIcon: UIImage(systemName: ImageNames.main)!, cellTitle: Titles.main, bgColor: .systemGray2, notificationImage: UIImage(named: ImageNames.notificationImage), isSwitch: false),
            ItemCell(leftIcon: UIImage(systemName: ImageNames.control)!, cellTitle: Titles.control, bgColor: .systemGray2, isSwitch: false),
            ItemCell(leftIcon: UIImage(named: ImageNames.screen)!, cellTitle: Titles.screen, bgColor: .systemBlue, isSwitch: false),
            ItemCell(leftIcon: UIImage(systemName: ImageNames.homeScreen)!, cellTitle: Titles.homeScreen, bgColor: .blue, isSwitch: false),
            ItemCell(leftIcon: UIImage(systemName: ImageNames.access)!, cellTitle: Titles.access, bgColor: .systemBlue, isSwitch: false)])
        ]
    }
}
