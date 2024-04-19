//
//  ViewController.swift
//  lifecounter
//
//  Created by Gagan Singh on 4/16/24.
//

import UIKit

struct Player {
    var name: String
    var lives: Int
}

class ViewController: UIViewController {
    
    var player1 = Player(name: "Player 1", lives: 20)
    var player2 = Player(name: "Player 2", lives: 20)
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player1LifeLabel: UILabel!
    @IBOutlet weak var player1Plus1Button: UIButton!
    @IBOutlet weak var player1Minus1Button: UIButton!
    @IBOutlet weak var player1Plus5Button: UIButton!
    @IBOutlet weak var player1Minus5Button: UIButton!
    
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player2LifeLabel: UILabel!
    @IBOutlet weak var player2Plus1Button: UIButton!
    @IBOutlet weak var player2Minus1Button: UIButton!
    @IBOutlet weak var player2Plus5Button: UIButton!
    @IBOutlet weak var player2Minus5Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        player1NameLabel.text = player1.name
        player1LifeLabel.text = "\(player1.lives)"
        player2NameLabel.text = player2.name
        player2LifeLabel.text = "\(player2.lives)"
    }
    
    func updatePlayerLifeLabel(player: Player, label: UILabel) {
        label.text = "\(player.lives)"
        if player.lives <= 0 {
            displayGameOverMessage(player: player.name)
        }
    }
    
    @IBAction func player1Plus1Button(_ sender: UIButton) {
        player1.lives += 1
        updatePlayerLifeLabel(player: player1, label: player1LifeLabel)
    }
    
    @IBAction func player1Minus1Tapped(_ sender: UIButton) {
        player1.lives -= 1
        updatePlayerLifeLabel(player: player1, label: player1LifeLabel)
    }
    
    @IBAction func player1Plus5Tapped(_ sender: UIButton) {
        player1.lives += 5
        updatePlayerLifeLabel(player: player1, label: player1LifeLabel)
    }
    
    @IBAction func player1Minus5Tapped(_ sender: UIButton) {
        player1.lives -= 5
        updatePlayerLifeLabel(player: player1, label: player1LifeLabel)
    }
    
    @IBAction func player2Plus1Tapped(_ sender: UIButton) {
        player2.lives += 1
        updatePlayerLifeLabel(player: player2, label: player2LifeLabel)
    }
    
    @IBAction func player2Minus1Tapped(_ sender: UIButton) {
        player2.lives -= 1
        updatePlayerLifeLabel(player: player2, label: player2LifeLabel)
    }
    
    @IBAction func player2Plus5Tapped(_ sender: UIButton) {
        player2.lives += 5
        updatePlayerLifeLabel(player: player2, label: player2LifeLabel)
    }
    
    @IBAction func player2Minus5Tapped(_ sender: UIButton) {
        player2.lives -= 5
        updatePlayerLifeLabel(player: player2, label: player2LifeLabel)
    }
    
    //display when game over
    
    func displayGameOverMessage(player: String) {
        let gameOverLabel = UILabel()
        gameOverLabel.text = "\(player) LOSES!"
        gameOverLabel.textAlignment = .center
        gameOverLabel.textColor = .red
        gameOverLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameOverLabel)
        
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameOverLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    //     Rotation Handling
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            // Update UI layout during transition
            self.updateUILayout(for: size)
        }, completion: nil)
    }
    
    @IBOutlet weak var player1ButtonsStackView: UIStackView!
    @IBOutlet weak var player2ButtonsStackView: UIStackView!
    
    func updateUILayout(for size: CGSize) {
        let isPortrait = size.height > size.width
        player1ButtonsStackView.axis = isPortrait ? .vertical : .horizontal
        player2ButtonsStackView.axis = isPortrait ? .vertical : .horizontal
    }
}
