//
//  ViewController.swift
//  SQL
//
//  Created by Alessio De Gaetano on 22/01/2019.
//  Copyright © 2019 Alessio De Gaetano. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var sqlButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    
    var s: [String] = []
    var q: [String] = []
    var l: [String] = []
    var previousS: [String] = []
    var previousQ: [String] = []
    var previousL: [String] = []
    var undoAvailable: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = UIColor.systemBackground
        
        let constants = Constants()
        
        self.s = constants.getS()
        self.q = constants.getQ()
        self.l = constants.getL()
        
        undoButton.setTitleColor(UIColor(named: "MyCustomColor")?.withAlphaComponent(0.5), for: .disabled)
        undoButton.isEnabled = false
    }
    
    
    
    @IBAction func sqlButtonAction(_ sender: Any)
    {
        previousS.append(sLabel.text!)
        previousQ.append(qLabel.text!)
        previousL.append(lLabel.text!)
        
        sLabel.text = self.s.randomElement()
        qLabel.text = self.q.randomElement()
        lLabel.text = self.l.randomElement()
        
        undoButton.isEnabled = true
    }
    
    
    
    @IBAction func undoButtonAction(_ sender: Any)
    {
        sLabel.text = previousS.last
        qLabel.text = previousQ.last
        lLabel.text = previousL.last
        
        previousS.removeLast()
        previousQ.removeLast()
        previousL.removeLast()
        
        if (previousS.count == 0) {
            undoButton.isEnabled = false
        }
    }
    
    
    
    @IBAction func shareButtonAction(_ sender: Any)
    {
        // Text to share
        let text = sLabel.text! + " " + qLabel.text! + " " + lLabel.text!

        // Set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // Exclude some activity types from the list
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.assignToContact,
                                                        UIActivity.ActivityType.addToReadingList,
                                                        UIActivity.ActivityType.saveToCameraRoll]

        // Present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
}

