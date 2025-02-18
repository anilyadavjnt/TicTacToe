//
//  ViewController.swift
//  TicTacToe
//
//  Created by Anil Yadav on 15/02/25.
//  Email: anilyadavjnt@gmail.com
//  Contact No: +91-975211420
//

import UIKit

class ViewController: UIViewController {
    enum Turn {
        case Nought
        case Cross
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var boxA: UIButton!
    @IBOutlet weak var boxB: UIButton!
    @IBOutlet weak var boxC: UIButton!
    @IBOutlet weak var boxD: UIButton!
    @IBOutlet weak var boxE: UIButton!
    @IBOutlet weak var boxF: UIButton!
    @IBOutlet weak var boxG: UIButton!
    @IBOutlet weak var boxH: UIButton!
    @IBOutlet weak var boxI: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    var noughtsScore = 0
    var crossesScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard() {
        
        board.append(boxA)
        board.append(boxB)
        board.append(boxC)
        board.append(boxD)
        board.append(boxE)
        board.append(boxF)
        board.append(boxG)
        board.append(boxH)
        board.append(boxI)
        
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if cheakForVicotory(CROSS) {
            crossesScore += 1
            resultALERT(title: "Crosses Win!")
        }
        
        if cheakForVicotory(NOUGHT) {
            noughtsScore += 1
            resultALERT(title: "Noughts Win!")
            
        }
        if(fullBoard()) {
            resultALERT(title: "Draw")
        }
    }
    
    func cheakForVicotory(_ s :String) -> Bool {
        // Horizontal Victory
        if thisSymbol(boxA, s) && thisSymbol(boxB, s) && thisSymbol(boxC, s) {
            return true
        }
        
        if thisSymbol(boxD, s) && thisSymbol(boxE, s) && thisSymbol(boxF, s) {
            return true
        }
        if thisSymbol(boxG, s) && thisSymbol(boxH, s) && thisSymbol(boxI, s) {
            return true
        }
        
        // Vertical Victory
        if thisSymbol(boxA, s) && thisSymbol(boxD, s) && thisSymbol(boxG, s) {
            return true
        }
        
        if thisSymbol(boxB, s) && thisSymbol(boxE, s) && thisSymbol(boxH, s) {
            return true
        }
        if thisSymbol(boxC, s) && thisSymbol(boxF, s) && thisSymbol(boxI, s) {
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(boxA, s) && thisSymbol(boxE, s) && thisSymbol(boxI, s) {
            return true
        }
        
        if thisSymbol(boxC, s) && thisSymbol(boxE, s) && thisSymbol(boxG, s) {
            return true
        }
        
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    func resultALERT(title: String) {
        
        let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought{
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
            
        }
        else if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    func fullBoard() -> Bool {
        for button in board{
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    func addToBoard(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil) {
            if(currentTurn == Turn.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
            else if(currentTurn == Turn.Cross) {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
}

