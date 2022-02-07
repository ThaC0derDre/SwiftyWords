//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Andres Gutierrez on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    var gameLabel: UILabel!
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var scoreLabel: UILabel!
    var currentAnswer: UITextField!
    
    var letterButtons   = [UIButton]()
    var activatedButton = [UIButton]()
    var solutions       = [String]()
    var level           = 1
    var score           = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSelector(inBackground: #selector(loadLevel), with: nil)
    }
    
    
    override func loadView() {
        view                                                    = UIView()
        view.backgroundColor                                    = .systemBackground
        
        gameLabel                                               = UILabel()
        gameLabel.text                                          = "Swifty Words"
        gameLabel.textAlignment                                 = .center
        gameLabel.textColor                                     = .systemIndigo
        gameLabel.font                                          = UIFont(name: "Zapfino", size: 60)
        gameLabel.translatesAutoresizingMaskIntoConstraints     = false
        view.addSubview(gameLabel)
                                    
        scoreLabel                                              = UILabel()
        scoreLabel.textAlignment                                = .right
        scoreLabel.text                                         = "Score = 0"
        scoreLabel.translatesAutoresizingMaskIntoConstraints    = false
        view.addSubview(scoreLabel)
        
        cluesLabel                                              = UILabel()
        cluesLabel.text                                         = "CLUES"
        cluesLabel.font                                         = UIFont.systemFont(ofSize: 24)
        cluesLabel.numberOfLines                                = 0
        cluesLabel.translatesAutoresizingMaskIntoConstraints    = false
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(cluesLabel)
        
        answersLabel                                            = UILabel()
        answersLabel.text                                       = "ANSWERS"
        answersLabel.font                                       = UIFont.systemFont(ofSize: 24)
        answersLabel.numberOfLines                              = 0
        answersLabel.textAlignment                              = .right
        answersLabel.translatesAutoresizingMaskIntoConstraints  = false
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(answersLabel)
        
        currentAnswer                                           = UITextField()
        currentAnswer.textAlignment                             = .center
        currentAnswer.placeholder                               = "Tap letters to guess"
        currentAnswer.font                                      = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled                  = false
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentAnswer)
        
        let buttonsView                                         = UIView()
        buttonsView.layer.borderColor                           = UIColor.systemGray.cgColor
        buttonsView.layer.borderWidth                           = 2
        buttonsView.translatesAutoresizingMaskIntoConstraints   =   false
        view.addSubview(buttonsView)
        
        let submit                                              = UIButton(type: .system)
        submit.setTitle("SUBMIT", for: .normal)
        submit.translatesAutoresizingMaskIntoConstraints        = false
        submit.addTarget(self, action: #selector(submitTapped(_:)), for: .touchUpInside)
        view.addSubview(submit)
        
        let clear                                               = UIButton(type: .system)
        clear.setTitle("CLEAR", for: .normal)
        clear.translatesAutoresizingMaskIntoConstraints         = false
        clear.addTarget(self, action: #selector(clearTapped(_:)), for: .touchUpInside)
        view.addSubview(clear)
        
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            gameLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            gameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            gameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),

            cluesLabel.topAnchor.constraint(equalTo: gameLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: 100),
            
            answersLabel.topAnchor.constraint(equalTo: gameLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.heightAnchor.constraint(equalToConstant: 44),
            
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44),
            
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30),
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320)
            
        ])
        // set up buttons in Collection, 4x5 row to coloumn
        let width   = 150
        let height  = 80
        
        for row in 0..<4 {
            for col in 0..<5 {
                let letterButton  = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped(_:)), for: .touchUpInside)
                
                let frame           = CGRect(x: width * col, y: height * row, width: width, height: height)
                letterButton.frame  = frame
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
        
    }
    
    
    @objc func clearTapped (_ sender: UIButton) {
        currentAnswer.text  = ""
        
        
        for button in activatedButton {
            button.isHidden = false
        }
        activatedButton.removeAll()
    }
    
    
    @objc func submitTapped (_ sender: UIButton) {
            guard let submittedAnswer           = currentAnswer.text else { return }
            if submittedAnswer == "" { return }
            if let solutionPosition             = solutions.firstIndex(of: submittedAnswer) {
            activatedButton.removeAll()
            var updatedAnswers                  = answersLabel.text?.components(separatedBy: "\n")
            updatedAnswers?[solutionPosition]   = submittedAnswer
            answersLabel.text                   = updatedAnswers?.joined(separator: "\n")
            
            score               += 1
            currentAnswer.text  = ""
            
                if score % 14 == 0 {
                    let ac = UIAlertController(title: "Level Complete!", message: "Haha!\nWell done! You solved all the clues and beat the game!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Play again!", style: .default, handler: resetGame)
                    ac.addAction(action)
                    present(ac, animated: true)
                }
            
            if score % 7 == 0 {
                let ac      = UIAlertController(title: "Level Completed!", message: "Well done! Get ready for the next let level!", preferredStyle: .alert)
                let action  = UIAlertAction(title: "Let's Go!", style: .default, handler: levelUp)
                ac.addAction(action)
                present(ac, animated: true)
            }
            
            }else {
                let ac = UIAlertController(title: "Wrong!", message: "Is that even a word?\nGuess again", preferredStyle: .alert)
                let alert = UIAlertAction(title: "Ok", style: .cancel)
                ac.addAction(alert)
                present(ac, animated: true)
            }
        
    }
    
    @objc func letterTapped (_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        currentAnswer.text  = currentAnswer.text?.appending(buttonTitle)
        activatedButton.append(sender)
        sender.isHidden     = true
    }
    
    
    func resetGame (action: UIAlertAction) {
        level = 1
        score = 0
        currentAnswer.text  = ""
        solutions.removeAll(keepingCapacity: true)
        
        
        for button in letterButtons {
            button.isHidden = false
        }
        performSelector(inBackground: #selector(loadLevel), with: nil)
    }
    
    
    func levelUp (action: UIAlertAction) {
        currentAnswer.text  = ""
        
        solutions.removeAll(keepingCapacity: true)
        
        for button in letterButtons {
            button.isHidden = false
        }
        level += 1
        performSelector(inBackground: #selector(loadLevel), with: nil)
    }
    
    
    @objc func loadLevel() {
        var solutionString              = ""
        var clueString                  = ""
        var letterBits                  = [String]()
        
        if let levelURLString           = Bundle.main.url(forResource: "level-\(level)", withExtension: "txt") {
            if let levelComponents      = try? String(contentsOf: levelURLString) {
                var lines               = levelComponents.components(separatedBy: "\n")
                lines.shuffle()
                
                for (index, line) in lines.enumerated() {
                    let parts           = line.components(separatedBy: ": ")
                    let answer          = parts[0]
                    let clue            = parts[1]
                    
                    clueString         += "\(index + 1). \(clue)\n"
                    
                    let solutionWord    = answer.replacingOccurrences(of: "|", with: "")
                    solutionString     += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    let bits            = answer.components(separatedBy: "|")
                    letterBits         += bits
                }
            }
        }
        DispatchQueue.main.async { [weak self] in 
            guard let self = self else { return }
            self.answersLabel.text               = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
            self.cluesLabel.text                 = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
            self.letterButtons.shuffle()
            
            if self.letterButtons.count == letterBits.count {
                for i in 0..<self.letterButtons.count {
                    self.letterButtons[i].setTitle(letterBits[i], for: .normal)
                }
                
            }
        }
        
        
        
    }
}

