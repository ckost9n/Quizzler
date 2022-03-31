//
//  ViewController.swift
//  Quizzler
//
//  Created by Konstantin on 30.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    private var quizBrain = QuizBrain()
    private var delayTime = 0.3
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        firstButton.layer.cornerRadius = 20
        secondButton.layer.cornerRadius = 20
        thirdButton.layer.cornerRadius = 20
        progressBar.progress = 0
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
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstButton.setTitle(quizBrain.getAnswer()[0], for: .normal)
        secondButton.setTitle(quizBrain.getAnswer()[1], for: .normal)
        thirdButton.setTitle(quizBrain.getAnswer()[2], for: .normal)
        
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
        thirdButton.backgroundColor = .clear
    }
    
}

