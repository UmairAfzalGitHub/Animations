//
//  ViewController.swift
//  Animations
//
//  Created by Umair Afzal on 024/03/2018.
//  Copyright © 2016 Umair Afzal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button1Constraint: NSLayoutConstraint!
    @IBOutlet weak var button2Constraint: NSLayoutConstraint!

    var dataSource = ["Animation 1", "Animation 2", "Animation 3", "Animation 4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func animationThreeButtonTapped(_ sender: Any) {
    }

    // MARK: - UITableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.3573394179, blue: 0.1794498768, alpha: 1)
        cell.textLabel?.textColor = .white
        cell.selectionStyle = .none
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }

    // MARK: - UITableView Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SecondTableViewController") as! SecondTableViewController

        switch indexPath.row {

        case 0:
            controller.animationType = 0
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 1:
            controller.animationType = 1
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 2:
            controller.animationType = 2
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 3:
            controller.animationType = 3
            self.navigationController?.pushViewController(controller, animated: true)
            break

        default:
            break
        }
    }
}

