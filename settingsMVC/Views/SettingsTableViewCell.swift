//
//  SettingsTableViewCell.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    var itemCell: ItemCell?
    
    static let id = "SettingTableViewCell"
    
    // MARK: - Outlets
    
    private lazy var img: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = .white
        return img
    }()
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.cornerRadius
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var cellTitle: UILabel = {
           let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize16)
           label.adjustsFontSizeToFitWidth = true
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
    private lazy var cellSwitch: UISwitch = {
           let mySwitch = UISwitch()
           mySwitch.translatesAutoresizingMaskIntoConstraints = false
           return mySwitch
       }()
    
    private lazy var additionalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: Metrics.fontSize16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var notificationImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
              super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupContainerLayout()
        setupIcons()
        setupLabel()
        setupSwitchLayout()
        setupAdditionalLabel()
        setupNotificationImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Configure for model
    
    func configure(with model: ItemCell) {
        img.image = model.leftIcon
        cellTitle.text = model.cellTitle
        viewContainer.backgroundColor = model.bgColor
        cellSwitch.isOn = model.isSwitch
        additionalLabel.text = model.additionalTitle
        notificationImage.image = model.notificationImage
            
        if cellSwitch.isOn {
            self.selectionStyle = .none
            cellSwitch.isOn = false
            accessoryType = .none
        } else {
            cellSwitch.isHidden = true
            self.selectionStyle = .gray
            accessoryType = .disclosureIndicator
        }
    }
    
    // MARK: - Setup all constreints and addSubview
    
    private func setupHierarchy() {
        viewContainer.addSubview(img)
        addSubview(viewContainer)
        addSubview(cellTitle)
        contentView.addSubview(cellSwitch)
        contentView.addSubview(additionalLabel)
        contentView.addSubview(notificationImage)
    }
    
    private func setupContainerLayout() {
           NSLayoutConstraint.activate([
               viewContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
               viewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.viewContainerLeft),
               viewContainer.widthAnchor.constraint(equalToConstant: Metrics.viewContainerWidth),
               viewContainer.heightAnchor.constraint(equalToConstant: Metrics.viewContainerHeight)
           ])
       }
    
    private func setupIcons() {
        NSLayoutConstraint.activate([
            img.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            img.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor)
        ])
    }
    
    private func setupLabel() {
        NSLayoutConstraint.activate([
            cellTitle.leftAnchor.constraint(equalTo: viewContainer.rightAnchor, constant: Metrics.cellTitleLeft),
            cellTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupSwitchLayout() {
           NSLayoutConstraint.activate([
            cellSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Metrics.cellSwitchRight),
               cellSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
           ])
       }
    
    private func setupAdditionalLabel() {
        NSLayoutConstraint.activate([
            additionalLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            additionalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.additionalLabelRight)
        ])
    }
    
    private func setupNotificationImage() {
        NSLayoutConstraint.activate([
            notificationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Metrics.notificationImageRight),
            notificationImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - for Reuse
    
    override func prepareForReuse() {
           super.prepareForReuse()
           self.accessoryType = .none
           self.itemCell = nil
       }
}
