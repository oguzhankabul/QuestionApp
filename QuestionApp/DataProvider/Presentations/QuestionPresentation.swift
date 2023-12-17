//
//  QuestionPresentation.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import Foundation

// MARK: - QuestionPresentation
struct QuestionPresentation {
    let questions: [QuestionDetail]

    init(from questionList: QuestionList) {
        self.questions = questionList.questions.enumerated().map { index, question in
            QuestionDetail(
                questionNumber: index + 1,
                questionText: question.question,
                questionAnswers: [question.answers.a, question.answers.b] + [question.answers.c, question.answers.d].compactMap { $0 },
                correctAnswerText: QuestionPresentation.getCorrectAnswerText(from: question.answers, correctAnswerKey: question.correctAnswer),
                questionImageURL: question.questionImageURL,
                score: question.score
            )
        }
    }

    private static func getCorrectAnswerText(from answers: Answers, correctAnswerKey: String) -> String {
        switch correctAnswerKey {
        case "A":
            return answers.a
        case "B":
            return answers.b
        case "C":
            return answers.c ?? ""
        case "D":
            return answers.d ?? ""
        default:
            return ""
        }
    }
}

struct QuestionDetail {
    let questionNumber: Int
    let questionText: String
    let questionAnswers: [String]
    let correctAnswerText: String
    let questionImageURL: String?
    let score: Int
}


/*QuestionPresentation(questions: [QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 1, questionText: "Dünyanın 7 Harikası’ndan biri olan İskenderiye Feneri nerede bulunur?", questionAnswers: ["Libya", "Yemen", "Sudan", "Mısır"], correctAnswerText: "Mısır", questionImageURL: nil, score: 200), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 2, questionText: "Dünyaca ünlü bir tablo olan Çığlık kimin eseri?", questionAnswers: ["Edward Munch", "Vincent Van Gogh", "Leonardo Da Vinci", "Pablo Picasso"], correctAnswerText: "Edward Munch", questionImageURL: Optional("https://images.boboscope.com/53c7eba1-67cb-43ef-9b27-9b6dfccde338?alt=media&token=82b0898b-297c-4406-8ebe-6e1edcc5fe4d&tr=w-1100,c-at_max,f-auto"), score: 100), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 3, questionText: "Jose Arcadio Buendia hangi romanın kahramanıdır?", questionAnswers: ["Yüzyıllık Yalnızlık", "Kırmızı Pazartesi"], correctAnswerText: "Yüzyıllık Yalnızlık", questionImageURL: Optional("null"), score: 50), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 4, questionText: "Atatürk\'ün nüfusa kayıtlı olduğu il neresidir??", questionAnswers: ["İstanbul", "Ankara", "Sivas", "Gaziantep"], correctAnswerText: "Gaziantep", questionImageURL: Optional("https://images.boboscope.com/a7300bcc-621b-4bce-a7af-c416d1afe8ad?alt=media&token=8608222f-ef22-4cad-8219-8d570c9954e7&tr=w-1100,c-at_max,f-auto"), score: 200), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 5, questionText: "Kingston nerenin başkentidir?", questionAnswers: ["Jamaika", "Küba", "Belize", "Bahamalar"], correctAnswerText: "Jamaika", questionImageURL: nil, score: 100), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 6, questionText: "Hangisi geminin bölümlerinden biri değildir?", questionAnswers: ["Ambar", "Pervane", "Üst", "Salon"], correctAnswerText: "Salon", questionImageURL: nil, score: 50), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 7, questionText: "Hangi tarihte Güney Yarım Küre\'de en uzun gündüz yaşanır?", questionAnswers: ["21 Mart", "21 Aralık"], correctAnswerText: "21 Aralık", questionImageURL: nil, score: 50), QuestionApp.QuestionPresentation.QuestionDetail(questionNumber: 8, questionText: "Dünya bir ülke olsaydı başkenti İstanbul olurdu sözünü kim söylemiştir?", questionAnswers: ["Napolyon", "Jean-Jacques Rousseau", "Voltaire", "Winston Churchill"], correctAnswerText: "Napolyon", questionImageURL: Optional("https://images.boboscope.com/46392ded-d475-4a93-a411-27819425201c?alt=media&token=c9c7a3b2-9908-4bed-8220-6444b0fdd0e4&tr=w-1100,c-at_max,f-auto"), score: 200)])
*/
