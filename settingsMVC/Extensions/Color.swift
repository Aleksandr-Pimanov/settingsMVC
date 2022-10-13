//
//  Color.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }

    static let purpleBGColor = UIColor.rgb(r: 87, g: 86, b: 199)
    static let outLineStrokeColor = UIColor.rgb(r: 255, g: 90, b: 120)
    static let trackStrokeColor = UIColor.rgb(r: 214, g: 64, b: 110)
    static let pulsatingFillColor = UIColor.rgb(r: 80, g: 33, b: 61)
}
