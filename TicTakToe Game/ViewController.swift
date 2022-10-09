//
//  ViewController.swift
//  TicTakToe Game
//
//  Created by Preetam Beeravelli on 10/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var a1Button: UIButton!
    @IBOutlet weak var a2Button: UIButton!
    @IBOutlet weak var a3Button: UIButton!
    @IBOutlet weak var b1Button: UIButton!
    @IBOutlet weak var b2Button: UIButton!
    @IBOutlet weak var b3Button: UIButton!
    @IBOutlet weak var c1Button: UIButton!
    @IBOutlet weak var c2Button: UIButton!
    @IBOutlet weak var c3Button: UIButton!
    @IBOutlet weak var currentPlayerDisplay: UILabel!
    
    var completedStatus = [players]()
    var buttonNames = [UIButton]()
    var currentPlayer = "X"
    
    enum players{
        case Round
        case Cross
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonNames = [a1Button, a2Button, a3Button, b1Button, b2Button, b3Button, c1Button, c2Button, c3Button]
        circleButtonMaker()
        currentPlayerDisplay.text = currentPlayer
        
    }
    
    func circleButtonMaker(){
        for button in 0...buttonNames.count - 1{
            let currentButton = buttonNames[button]
            currentButton.layer.cornerRadius = (currentButton.frame.width) / 2
            currentButton.layer.masksToBounds = true
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if completedStatus.count == 8{
            let alert = UIAlertController(title: "Game Completed", message: "Reset the Board to Play Again!!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Reset", style: .default) { alertAction   in
                self.resetBoard()
            }
            alert.addAction(action)
            present(alert, animated: true)
            
        }
        if sender.title(for: .normal) == nil{
            if currentPlayer == "X"{
                sender.setTitle("X", for: .normal)
                currentPlayer = "O"
                currentPlayerSetter(currentPlayer: currentPlayer)
                completedStatus.append(players.Cross)
                return
            }
            if currentPlayer == "O"{
                sender.setTitle("O", for: .normal)
                currentPlayer = "X"
                currentPlayerSetter(currentPlayer: currentPlayer)
                completedStatus.append(players.Round)
                return
            }
            
        }
    }
    
    func resetBoard(){
        for button in 0...buttonNames.count - 1{
            buttonNames[button].setTitle(nil, for: .normal)
        }
        currentPlayer = "X"
        currentPlayerSetter(currentPlayer: currentPlayer)
        completedStatus = [players]()
    }
    
    func currentPlayerSetter(currentPlayer: String){
        currentPlayerDisplay.text = currentPlayer
    }
    
    @IBAction func changePlayerButtonPressed(_ sender: UIButton) {
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
        currentPlayerSetter(currentPlayer: currentPlayer)
    }
    
}

