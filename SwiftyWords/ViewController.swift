//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Andres Gutierrez on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var scoreLabel: UILabel!
    var currentAnswer: UITextField!
    var letterButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func loadView() {
        view                    = UIView()
        view.backgroundColor    = .white
        
        scoreLabel                  = UILabel()
        scoreLabel.textAlignment    = .right
        scoreLabel.text             = "Score = 0"
        scoreLabel.translatesAutoresizingMaskIntoConstraints    = false
        view.addSubview(scoreLabel)
        
        cluesLabel                  = UILabel()
        cluesLabel.text             = "CLUES"
        cluesLabel.font             = UIFont.systemFont(ofSize: 24)
        cluesLabel.numberOfLines    = 0
        cluesLabel.translatesAutoresizingMaskIntoConstraints    = false
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(cluesLabel)
        
        answersLabel                = UILabel()
        answersLabel.text           = "ANSWERS"
        answersLabel.font           = UIFont.systemFont(ofSize: 24)
        answersLabel.numberOfLines  = 0
        answersLabel.textAlignment  = .right
        answersLabel.translatesAutoresizingMaskIntoConstraints  = false
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(answersLabel)
        
        currentAnswer                           = UITextField()
        currentAnswer.textAlignment             = .center
        currentAnswer.placeholder               = "Tap letters to guess"
        currentAnswer.font                      = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled  = false
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentAnswer)
        
        let buttonsView     = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints   =   false
        view.addSubview(buttonsView)
        
        let submit  = UIButton(type: .system)
        submit.setTitle("SUBMIT", for: .normal)
        submit.translatesAutoresizingMaskIntoConstraints        = false
        view.addSubview(submit)
        
        let clear   = UIButton(type: .system)
        clear.setTitle("CLEAR", for: .normal)
        clear.translatesAutoresizingMaskIntoConstraints         = false
        view.addSubview(clear)
        
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: 100),
            
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.heightAnchor.constraint(equalToConstant: 44),
            
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
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
                let button  = UIButton(type: .system)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 34)
                button.setTitle("WWW", for: .normal)
                
                let frame   = CGRect(x: width * col, y: height * row, width: width, height: height)
                button.frame    = frame
                buttonsView.addSubview(button)
                letterButtons.append(button)
            }
        }
        
    }

}

