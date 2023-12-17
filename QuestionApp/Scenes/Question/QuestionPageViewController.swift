//
//  QuestionViewController.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import UIKit
import Kingfisher

class QuestionPageViewController<V: QuestionPageViewModel>: UIViewController {
        
    @IBOutlet weak var answerAndPointNumberInfoTitle: UILabel!
    @IBOutlet weak var questionPointLabel: UILabel!
    @IBOutlet weak var questionImageContainerView: UIView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionBodyLabel: UILabel!
    @IBOutlet weak var questionStackView: UIStackView!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var homePageButton: UIButton!
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
        viewModel.delegate = self
        refreshUi(quesiton: viewModel.questions.first, totalScore: 0)
    }
    
    @IBAction func firstOptionAction(_ sender: UIButton) {
        viewModel.answerQuestionAction(answer: sender.titleLabel?.text)
    }
    
    @IBAction func secondOptionAction(_ sender: UIButton) {
        viewModel.answerQuestionAction(answer: sender.titleLabel?.text)
    }
    
    @IBAction func thirdOptionAction(_ sender: UIButton) {
        viewModel.answerQuestionAction(answer: sender.titleLabel?.text)
    }
    
    @IBAction func fourthOptionAction(_ sender: UIButton) {
        viewModel.answerQuestionAction(answer: sender.titleLabel?.text)
    }
    
    func refreshUi(quesiton: QuestionDetail?, totalScore:Int) {
        guard let quesiton = quesiton else {
            questionStackView.isHidden = true
            homePageButton.isHidden = false
            homePageButton.setTitle( "Toplam \(totalScore) puan.\nAna sayfaya dön.", for: .normal)
            return
        }
        
        refreshOptions()
        questionPointLabel.text = "\(quesiton.score) puan"
        if let imageUrlString = quesiton.questionImageURL, imageUrlString != "null", !imageUrlString.isEmpty, let imageUrl = URL(string: imageUrlString) {
            questionImageContainerView.isHidden = false
            questionImageView.kf.setImage(with: imageUrl)
        } else {
            questionImageContainerView.isHidden = true
        }
        answerAndPointNumberInfoTitle.text = "Soru \(quesiton.questionNumber)/\(viewModel.questions.count) Total Puanınız: \(totalScore)"
        questionBodyLabel.text = quesiton.questionText
    }
    
    func refreshOptions () {
        let answers = viewModel.getShuffledAnswers()
        firstOptionButton.setTitle(answers.safeElement(at: 0), for: .normal)
        secondOptionButton.setTitle(answers.safeElement(at: 1), for: .normal)
        if let thirdAnswer = answers.safeElement(at: 2) {
            thirdOptionButton.setTitle(thirdAnswer, for: .normal)
            thirdOptionButton.isHidden = false
        } else {
            thirdOptionButton.isHidden = true
        }
        if let fourthAnswer = answers.safeElement(at: 3) {
            fourthOptionButton.setTitle(fourthAnswer, for: .normal)
            fourthOptionButton.isHidden = false
        } else {
            fourthOptionButton.isHidden = true
        }
        
    }
    
    @IBAction func homePageButtonAction(_ sender: UIButton) {
        viewModel.pushHomePage()
    }
}

extension QuestionPageViewController: QuestionPageViewModelDelegate {
    func questionDidChange(_ question: QuestionDetail?, totalScore:Int) {
        refreshUi(quesiton: question,totalScore: totalScore)
    }
}
