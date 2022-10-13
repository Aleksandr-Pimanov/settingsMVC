//
//  DetailViewController.swift
//  settingsMVC
//
//  Created by Александр Пиманов on 13.10.2022.
//

import UIKit

 class DetailViewController: UIViewController {
    
    var model: ItemCell?
    
    override func loadView() {
        super.loadView()
        let view = DetailView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Titles.detail
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let model = model else {
            return
        }
        configure(with: model)
    }
    
    func configure(with model: ItemCell) {
        guard let detailView = self.view as? DetailView else { return }
        detailView.detailConfigure(with: model)
    }
}
