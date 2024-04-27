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

class ViewController: UIViewController, UITextFieldDelegate {
    var userInput: Int = 5 //initializing input
    var gameStarted = false // initialize game start
    var players: [Player] = [
        Player(name: "Player 1", lives: 20),
        Player(name: "Player 2", lives: 20),
        Player(name: "Player 3", lives: 20),
        Player(name: "Player 4", lives: 20),
    ]
    
    //StackView initialize
    @IBOutlet weak var overallStackView: UIStackView!
    @IBOutlet weak var Player1StackView: UIStackView!
    @IBOutlet weak var player1StackView2: UIStackView!
    @IBOutlet weak var Player2StackView: UIStackView!
    @IBOutlet weak var player2StackView2: UIStackView!
    @IBOutlet weak var Player3StackView: UIStackView!
    @IBOutlet weak var player3StackView2: UIStackView!
    @IBOutlet weak var Player4StackView: UIStackView!
    @IBOutlet weak var player4StackView2: UIStackView!
    @IBOutlet weak var Player5StackView: UIStackView!
    @IBOutlet weak var player5StackView2: UIStackView!
    @IBOutlet weak var Player6StackView: UIStackView!
    @IBOutlet weak var player6StackView2: UIStackView!
    @IBOutlet weak var Player7StackView: UIStackView!
    @IBOutlet weak var player7StackView2: UIStackView!
    @IBOutlet weak var Player8StackView: UIStackView!
    @IBOutlet weak var player8StackView2: UIStackView!
    
    
    //players buttons
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player1LifeLabel: UILabel!
    @IBOutlet weak var player1Plus1Button: UIButton!
    @IBOutlet weak var player1Minus1Button: UIButton!
    @IBOutlet weak var player1CustomAddButton: UIButton!
    @IBOutlet weak var player1CustomMinusButton: UIButton!
    
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player2LifeLabel: UILabel!
    @IBOutlet weak var player2Plus1Button: UIButton!
    @IBOutlet weak var player2Minus1Button: UIButton!
    @IBOutlet weak var player2CustomAddButton: UIButton!
    @IBOutlet weak var player2CustomMinusButton: UIButton!
    
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player3LifeLabel: UILabel!
    @IBOutlet weak var player3Plus1Button: UIButton!
    @IBOutlet weak var player3Minus1Button: UIButton!
    @IBOutlet weak var player3CustomAddButton: UIButton!
    @IBOutlet weak var player3CustomMinusButton: UIButton!
    
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player4LifeLabel: UILabel!
    @IBOutlet weak var player4Plus1Button: UIButton!
    @IBOutlet weak var player4Minus1Button: UIButton!
    @IBOutlet weak var player4CustomAddButton: UIButton!
    @IBOutlet weak var player4CustomMinusButton: UIButton!
    
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player5LifeLabel: UILabel!
    @IBOutlet weak var player5Plus1Button: UIButton!
    @IBOutlet weak var player5Minus1Button: UIButton!
    @IBOutlet weak var player5CustomAddButton: UIButton!
    @IBOutlet weak var player5CustomMinusButton: UIButton!
    
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player6LifeLabel: UILabel!
    @IBOutlet weak var player6Plus1Button: UIButton!
    @IBOutlet weak var player6Minus1Button: UIButton!
    @IBOutlet weak var player6CustomAddButton: UIButton!
    @IBOutlet weak var player6CustomMinusButton: UIButton!
    
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player7LifeLabel: UILabel!
    @IBOutlet weak var player7Plus1Button: UIButton!
    @IBOutlet weak var player7Minus1Button: UIButton!
    @IBOutlet weak var player7CustomAddButton: UIButton!
    @IBOutlet weak var player7CustomMinusButton: UIButton!
    
    @IBOutlet weak var player8NameLabel: UILabel!
    @IBOutlet weak var player8LifeLabel: UILabel!
    @IBOutlet weak var player8Plus1Button: UIButton!
    @IBOutlet weak var player8Minus1Button: UIButton!
    @IBOutlet weak var player8CustomAddButton: UIButton!
    @IBOutlet weak var player8CustomMinusButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        Player5StackView.isHidden=true
        Player6StackView.isHidden=true
        Player7StackView.isHidden=true
        Player8StackView.isHidden=true
        
        observePlayerScoreChange(forLabel: player1LifeLabel)
        observePlayerScoreChange(forLabel: player2LifeLabel)
        observePlayerScoreChange(forLabel: player3LifeLabel)
        observePlayerScoreChange(forLabel: player4LifeLabel)
        observePlayerScoreChange(forLabel: player5LifeLabel)
        observePlayerScoreChange(forLabel: player6LifeLabel)
        observePlayerScoreChange(forLabel: player7LifeLabel)
        observePlayerScoreChange(forLabel: player8LifeLabel)
    }

       // Function to observe player's score change
       func observePlayerScoreChange(forLabel label: UILabel) {
           label.addObserver(self, forKeyPath: "text", options: .new, context: nil)
       }

       // Observer method to detect changes in player's score label
       override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           if let label = object as? UILabel, label == player1LifeLabel || label == player2LifeLabel || label == player3LifeLabel || label == player4LifeLabel || label == player5LifeLabel || label == player6LifeLabel || label == player7LifeLabel || label == player8LifeLabel {
               // Disable the "Add Player" button
               addPlayer.isEnabled = false
           }
       }


       deinit {
           player1LifeLabel.removeObserver(self, forKeyPath: "text")
           player2LifeLabel.removeObserver(self, forKeyPath: "text")
           player3LifeLabel.removeObserver(self, forKeyPath: "text")
           player4LifeLabel.removeObserver(self, forKeyPath: "text")
           player5LifeLabel.removeObserver(self, forKeyPath: "text")
           player6LifeLabel.removeObserver(self, forKeyPath: "text")
           player7LifeLabel.removeObserver(self, forKeyPath: "text")
           player8LifeLabel.removeObserver(self, forKeyPath: "text")
       }
    
    //add player function
    @IBOutlet weak var addPlayer: UIButton!
    @IBAction func addPlayerButton(_ sender: Any) {
        guard players.count < 8 && (gameStarted == false) else {
            // Maximum players reached or game started
            return
        }
        let newPlayer = Player(name: "Player \(players.count + 1)", lives: 20)
        players.append(newPlayer)
        updateUI()
        addPlayer.isEnabled = true
        enablePlayerButtons(forPlayerAt: players.count - 1)
    }
    
    func enablePlayerButtons(forPlayerAt index: Int) {
        guard index >= 4 && index < players.count else { return }
        switch index {
        case 4:
            Player5StackView.isHidden = false
        case 5:
            Player6StackView.isHidden = false
        case 6:
            Player7StackView.isHidden = false
        case 7:
            Player8StackView.isHidden = false
        default:
            // Shouldn't happen with the current guard statement
            print("Error: Unexpected player index for enabling buttons.")
        }
    }
    
    
    func updateUI(forPlayerAt playerIndex: Int? = nil) {
        if playerIndex == nil {
          addPlayer.isEnabled = !gameStarted // Enable only if game not started
        } else {
          enablePlayerButtons(forPlayerAt: playerIndex!)
        }
      }
    
    func updatePlayerLifeLabel(player: Player, label: UILabel) {
        label.text = "\(player.lives)"
        if player.lives <= 0 {
          displayGameOverMessage(player: player.name)
          // Set gameStarted to true only once on first life change
          if !gameStarted {
            gameStarted = true
          }
        }
      }
    
    
    //player1buttons
    @IBAction func player1Plus1Button(_ sender: UIButton) {
        players[0].lives += 1
        updatePlayerLifeLabel(player: players[0], label: player1LifeLabel)
    }
    @IBAction func player1Minus1Tapped(_ sender: UIButton) {
        players[0].lives -= 1
        updatePlayerLifeLabel(player: players[0], label: player1LifeLabel)
    }
    @IBAction func player1CustomAddTapped(_ sender: UIButton) {
        players[0].lives += userInput
        updatePlayerLifeLabel(player: players[0], label: player1LifeLabel)
    }
    @IBAction func player1CustomMinusTapped(_ sender: UIButton) {
        players[0].lives -= userInput
        updatePlayerLifeLabel(player: players[0], label: player1LifeLabel)
    }
    
    
    //player2buttons
    @IBAction func player2Plus1Tapped(_ sender: UIButton) {
        players[1].lives += 1
        updatePlayerLifeLabel(player: players[1], label: player2LifeLabel)
    }
    @IBAction func player2Minus1Tapped(_ sender: UIButton) {
        players[1].lives -= 1
        updatePlayerLifeLabel(player: players[1], label: player2LifeLabel)
    }
    @IBAction func player2CustomAddButton(_ sender: UIButton) {
        players[1].lives += userInput
        updatePlayerLifeLabel(player: players[1], label: player2LifeLabel)
    }
    @IBAction func player2CustomMinusButton(_ sender: UIButton) {
        players[1].lives -= userInput
        updatePlayerLifeLabel(player: players[1], label: player2LifeLabel)
    }
    
    //player3buttons
    @IBAction func player3Plus1Tapped(_ sender: UIButton) {
        players[2].lives += 1
        updatePlayerLifeLabel(player: players[2], label: player3LifeLabel)
    }
    @IBAction func player3Minus1Tapped(_ sender: UIButton) {
        players[2].lives -= 1
        updatePlayerLifeLabel(player: players[2], label: player3LifeLabel)
    }
    @IBAction func player3CustomAddButton(_ sender: UIButton) {
        players[2].lives += userInput
        updatePlayerLifeLabel(player: players[2], label: player3LifeLabel)
    }
    @IBAction func player3CustomMinusButton(_ sender: UIButton) {
        players[2].lives -= userInput
        updatePlayerLifeLabel(player: players[2], label: player3LifeLabel)
    }
    
    //player4buttons
    @IBAction func player4Plus1Tapped(_ sender: UIButton) {
        players[3].lives += 1
        updatePlayerLifeLabel(player: players[3], label: player4LifeLabel)
    }
    @IBAction func player4Minus1Tapped(_ sender: UIButton) {
        players[3].lives -= 1
        updatePlayerLifeLabel(player: players[3], label: player4LifeLabel)
    }
    @IBAction func player4CustomAddButton(_ sender: UIButton) {
        players[3].lives += userInput
        updatePlayerLifeLabel(player: players[3], label: player4LifeLabel)
    }
    @IBAction func player4CustomMinusButton(_ sender: UIButton) {
        players[3].lives -= userInput
        updatePlayerLifeLabel(player: players[3], label: player4LifeLabel)
    }
    
    //player5buttons
    @IBAction func player5Plus1Tapped(_ sender: UIButton) {
        players[4].lives += 1
        updatePlayerLifeLabel(player: players[4], label: player5LifeLabel)
    }
    @IBAction func player5Minus1Tapped(_ sender: UIButton) {
        players[4].lives -= 1
        updatePlayerLifeLabel(player: players[4], label: player5LifeLabel)
    }
    @IBAction func player5CustomAddButton(_ sender: UIButton) {
        players[4].lives += userInput
        updatePlayerLifeLabel(player: players[4], label: player5LifeLabel)
    }
    @IBAction func player5CustomMinusButton(_ sender: UIButton) {
        players[4].lives -= userInput
        updatePlayerLifeLabel(player: players[4], label: player5LifeLabel)
    }
    
    //player6buttons
    @IBAction func player6Plus1Tapped(_ sender: UIButton) {
        players[5].lives += 1
        updatePlayerLifeLabel(player: players[5], label: player6LifeLabel)
    }
    @IBAction func player6Minus1Tapped(_ sender: UIButton) {
        players[5].lives -= 1
        updatePlayerLifeLabel(player: players[5], label: player6LifeLabel)
    }
    @IBAction func player6CustomAddButton(_ sender: UIButton) {
        players[5].lives += userInput
        updatePlayerLifeLabel(player: players[5], label: player6LifeLabel)
    }
    @IBAction func player6CustomMinusButton(_ sender: UIButton) {
        players[5].lives -= userInput
        updatePlayerLifeLabel(player: players[5], label: player6LifeLabel)
    }
    
    //player7buttons
    @IBAction func player7Plus1Tapped(_ sender: UIButton) {
        players[6].lives += 1
        updatePlayerLifeLabel(player: players[6], label: player7LifeLabel)
    }
    @IBAction func player7Minus1Tapped(_ sender: UIButton) {
        players[6].lives -= 1
        updatePlayerLifeLabel(player: players[6], label: player7LifeLabel)
    }
    @IBAction func player7CustomAddButton(_ sender: UIButton) {
        players[6].lives += userInput
        updatePlayerLifeLabel(player: players[6], label: player7LifeLabel)
    }
    @IBAction func player7CustomMinusButton(_ sender: UIButton) {
        players[6].lives -= userInput
        updatePlayerLifeLabel(player: players[6], label: player7LifeLabel)
    }
    
    //player8buttons
    @IBAction func player8Plus1Tapped(_ sender: UIButton) {
        players[7].lives += 1
        updatePlayerLifeLabel(player: players[7], label: player8LifeLabel)
    }
    @IBAction func player8Minus1Tapped(_ sender: UIButton) {
        players[7].lives -= 1
        updatePlayerLifeLabel(player: players[7], label: player8LifeLabel)
    }
    @IBAction func player8CustomAddButton(_ sender: UIButton) {
        players[7].lives += userInput
        updatePlayerLifeLabel(player: players[7], label: player8LifeLabel)
    }
    @IBAction func player8CustomMinusButton(_ sender: UIButton) {
        players[7].lives -= userInput
        updatePlayerLifeLabel(player: players[7], label: player8LifeLabel)
    }
    
    func getLifeLabel(forPlayer player: Player) -> UILabel {
        let index = players.firstIndex(where: { $0.name == player.name })! // Find player index
        let labelName = "player\(index + 1)LifeLabel" // Construct label name
        return value(forKey: labelName) as! UILabel // Access label using key-value coding
    }
    
    //restart
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restartButton(_ sender: Any) {
        gameStarted = false
        players = [Player(name: "Player 1", lives: 20),
                   Player(name: "Player 2", lives: 20),
                   Player(name: "Player 3", lives: 20),
                   Player(name: "Player 4", lives: 20)]

        // Hide Extra Player UI Elements Initially
        Player5StackView.isHidden = true
        Player6StackView.isHidden = true
        Player7StackView.isHidden = true
        Player8StackView.isHidden = true

        // Reset Other Variables
        addPlayer.isEnabled = true
        updateUI()

        // Loop through existing players (up to players.count)
        for index in 0..<players.count {
          let player = players[index]

          let lifeLabel = self.value(forKey: "player\(index + 1)LifeLabel") as! UILabel
          updatePlayerLifeLabel(player: player, label: lifeLabel)
        }
      }
    
    //history
    @IBOutlet weak var historyButton: UIButton!
    @IBAction func historyButton(_ sender: Any) {
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
    
    
    
    //custom add button
    @IBOutlet weak var customerAddButton: UIButton!
    @IBAction func customAdd(_ sender: Any) {
        // Create an alert controller
        let alertController = UIAlertController(title: "Input", message: "Please enter what the custom button should add or |subtract| :", preferredStyle: .alert)
        
        // Add a text field to the alert controller
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter something"
        }
        
        // Create the action for when the user clicks "OK"
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
          if let userInputString = alertController.textFields?.first?.text,
             let userInputInt = Int(userInputString) {
            self.userInput = userInputInt
          }
        }
        
        // Create the action for when the user clicks "Cancel"
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Add the actions to the alert controller
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the alert controller
        self.present(alertController, animated: true, completion: nil)
    }
}




