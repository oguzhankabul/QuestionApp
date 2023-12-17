//
//  QuestionViewController.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import UIKit

class QuestionPageViewController<V: QuestionPageViewModel>: UIViewController {

    @IBOutlet weak var startAgainButton: UIButton!
    
    @IBOutlet weak var answerAndPointNumberInfoTitle: UILabel!
    @IBOutlet weak var questionPointLabel: UILabel!
    @IBOutlet weak var questionImageContainerView: UIView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionBodyLabel: UILabel!

    @IBOutlet weak var firstOptionButton: UIButton!
    
    @IBOutlet weak var fourthOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
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
        view.backgroundColor = .red
        refreshUi(quesiton: viewModel.questions.questions[viewModel.currentQuestionNumber])
        viewModel.delegate = self
    }
    func optionSelected (){
        
    }
    @IBAction func startAgainButtonAction(_ sender: UIButton) {
        viewModel.pushHomePage()
    }
    @IBAction func firstOptionAction(_ sender: Any) {
        viewModel.answerQuestionAction(answer: "A")
    }
    
    @IBAction func secondOptionAction(_ sender: Any) {
    }
    
    @IBAction func thirdOptionAction(_ sender: Any) {
    }
    
    @IBAction func fourthOptionAction(_ sender: Any) {
    }
    
    func refreshUi(quesiton: Question) {
        let currentQuestion = viewModel.questions.questions[viewModel.currentQuestionNumber]
        questionPointLabel.text = "\(currentQuestion.score) puan"
        if let image = currentQuestion.questionImageURL {
            questionImageContainerView.isHidden = false
        } else {
            questionImageContainerView.isHidden = true
        }
        
        questionBodyLabel.text = currentQuestion.question.description
        let answers = currentQuestion.answers
        firstOptionButton.setTitle(answers.a, for: .normal)
        secondOptionButton.setTitle(answers.b, for: .normal)
        thirdOptionButton.isHidden = answers.c == nil
        thirdOptionButton.isHidden = answers.d == nil
        thirdOptionButton.setTitle(answers.c, for: .normal)
        fourthOptionButton.setTitle(answers.d, for: .normal)

    }
}
extension UIView {
public func addAction(_ selector: Selector, target: AnyObject) {
        isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(gesture)
    }
}

extension QuestionPageViewController: QuestionPageViewModelDelegate {
    func questionDidChange(_ question: Question) {
        refreshUi(quesiton: question)
    }
}
