//
//  ViewController.swift
//  Animations
//
//  Created by Umair Afzal on 024/03/2018.
//  Copyright © 2016 Umair Afzal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1Constraint: NSLayoutConstraint!
    @IBOutlet weak var button2Constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func animationThreeButtonTapped(_ sender: Any) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SecondTableViewController") as! SecondTableViewController
        controller.animationType = 1
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

