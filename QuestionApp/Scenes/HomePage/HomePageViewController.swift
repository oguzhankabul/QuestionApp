//
//  ViewController.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 15.12.2023.
//

import UIKit

class HomePageController<V: HomePageViewModel>: UIViewController {
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var viewModel: V

    init(viewModel: V, nibName: String) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startButton.state(isProgress: false, title: "START")
        highScoreLabel.text = viewModel.getHightScoreLabel()
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        startButton.state(isProgress: true)
        viewModel.getQuizList()
    }
}
