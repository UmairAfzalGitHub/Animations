//
//  ViewController.swift
//  Animations
//
//  Created by Umair Afzal on 024/03/2018.
//  Copyright © 2016 Umair Afzal. All rights reserved.
//

import UIKit

enum AnimationType: String {
    case slideFromLeft = "slideFromLeft"
    case slideFromRight = "slideFromRight"
    case slideFromBottom = "slideFromBottom"
    case slideFromTop = "slideFromTop"
    case fadeIn = "fadeIn"
    case zoomIn = "ZoomIn"
    case zoomOut = "ZoomOut"
    case paperFoldLeft = "paperFoldLeft"
    case paperFoldRight = "paperFoldRight"
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Variables & Constants

    @IBOutlet weak var tableView: UITableView!
    var dataSource = ["Slide from Left", "Slide from Right", "Slide from Bottom", "Slide from Top", "Fade in", "Zoom in", "ZoomOut", "paper Fold Left", "paper Fold Right"]

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ViewController {

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
            controller.animationType = .slideFromLeft
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 1:
            controller.animationType = .slideFromRight
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 2:
            controller.animationType = .slideFromTop
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 3:
            controller.animationType = .slideFromBottom
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 4:
            controller.animationType = .fadeIn
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 5:
            controller.animationType = .zoomIn
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 6:
            controller.animationType = .zoomOut
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 7:
            controller.animationType = .paperFoldLeft
            self.navigationController?.pushViewController(controller, animated: true)
            break

        case 8:
            controller.animationType = .paperFoldRight
            self.navigationController?.pushViewController(controller, animated: true)
            break

        default:
            break
        }
    }
}
