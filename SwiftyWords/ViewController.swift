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
        view.addSubview(cluesLabel)
        
        answersLabel                = UILabel()
        answersLabel.text           = "ANSWERS"
        answersLabel.font           = UIFont.systemFont(ofSize: 24)
        answersLabel.numberOfLines  = 0
        answersLabel.translatesAutoresizingMaskIntoConstraints  = false
        view.addSubview(answersLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: 100),
            
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor)
            
            
        ])
    }

}

