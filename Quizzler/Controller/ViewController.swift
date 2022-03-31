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
    
    private var quizBrain = QuizBrain()
    private var delayTime = 0.3
    
    private var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        progressBar.progress = 0
        
        questionLabel.text = quizBrain.getQuestionText
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {
            print("CurrentTitle Error")
            return
        }
        
        let check = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = check ? .green : .red
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: delayTime, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc private func updateUI() {
        questionLabel.text = quizBrain.getQuestionText
        progressBar.setProgress(quizBrain.progress, animated: true)
        
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
}

