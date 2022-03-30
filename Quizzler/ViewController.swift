//
//  ViewController.swift
//  Quizzler
//
//  Created by Konstantin on 30.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    private var quiz = [Question]()
    private var delayTime = 0.3
    
    private var questionNumber = 0 {
        didSet {
            questionLabel.text = quiz[questionNumber].text
            let progress = Float(questionNumber) / Float(quiz.count)
            progressBar.setProgress(progress, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        quiz = Question.getQuestion()
        
        questionLabel.text = quiz[questionNumber].text
        
    }
    
    private func setupUI() {
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        
        progressBar.progress = 0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == quiz[questionNumber].answer {
            sender.backgroundColor = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                sender.backgroundColor = .clear
            }
        } else {
            sender.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                sender.backgroundColor = .clear
            }
        }
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        
    }
    
}

