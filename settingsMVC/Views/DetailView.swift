//
//  DetailView.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

final class DetailView: UIView {
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: Metrics.fontSize30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailImage: UIImageView = {
        let img = UIImageView()
        img.tintColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    init() {
        super.init(frame: .zero)
        configureView()
        setupDetailHierarchy()
        setDetailLabel()
        setDetailImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureView() {
        backgroundColor = .black
    }
    
    private func setupDetailHierarchy() {
        addSubview(detailLabel)
        addSubview(detailImage)
    }
    
    private func setDetailLabel() {
        NSLayoutConstraint.activate([
            detailLabel.bottomAnchor.constraint(equalTo: detailImage.topAnchor, constant: Metrics.detailLabelBottom),
            detailLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setDetailImage() {
        NSLayoutConstraint.activate([
            detailImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailImage.heightAnchor.constraint(equalToConstant: Metrics.detailImageHeight),
            detailImage.widthAnchor.constraint(equalToConstant: Metrics.detailImageWidth)
        ])
    }
    
    func detailConfigure(with model: ItemCell) {
        detailLabel.text = model.cellTitle
        detailImage.image = model.leftIcon
    }
}
