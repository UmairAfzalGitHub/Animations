//
//  TableViewController.swift
//  Animations
//
//  Created by Umair Afzal on 024/03/2018.
//  Copyright © 2016 Umair Afzal. All rights reserved.
//

import UIKit

enum Direction: String {
    case right = "right"
    case left = "left"
    case top = "top"
    case bottom = "bottom"
}

class SecondTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableVew: UITableView!
    var animationType: AnimationType?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableVew.delegate = self
        tableVew.dataSource = self

        self.title = "\(animationType!)"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if animationType == .slideFromTop {
            animateTableView()
        }
    }

    // MARK: - Private Methods

    func animateTableView() {
        self.tableVew.reloadData()
        let cells = self.tableVew.visibleCells
        let tableViewHeight = self.tableVew.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0

        for cell in cells {

            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
        }
    }

    func paperFoldAnimation(cell: UITableViewCell, direction: Direction) {
        var rotation = CATransform3D()

        if direction == .left {
            rotation = CATransform3DMakeRotation((90.0 * .pi) / 180, 0.0, 0.7, 0.4)

        } else if direction == .right {
            rotation = CATransform3DMakeRotation((90.0 * .pi) / 180, 1.0, 0.7, 0.4)

        }

        rotation.m34 = 1.0 / -600
        //2. Define the initial state (Before the animation)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.alpha = 0
        cell.layer.transform = rotation

        if direction == .left {
            cell.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)

        } else if direction == .right {
            cell.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        }

        //3. Define the final state (After the animation) and commit the animation
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.8)
        cell.layer.transform = CATransform3DIdentity
        cell.alpha = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        UIView.commitAnimations()
    }
}

extension SecondTableViewController {


    // MARK: - UITableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SamleTableViewCell.cellForTableView(tableView: tableView)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // setting inital state
        cell.alpha = 0.4

        switch animationType {

        case .slideFromLeft?:
            let transform = CATransform3DTranslate(CATransform3DIdentity, -tableView.bounds.size.width, 30, 0)
            cell.layer.transform = transform
            break

        case .slideFromRight?:
            let transform = CATransform3DTranslate(CATransform3DIdentity, tableView.bounds.size.width, 30, 0)
            cell.layer.transform = transform
            break

        case .slideFromBottom?:
            let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -tableView.bounds.size.width, 0)
            cell.layer.transform = transform
            break

        case .fadeIn?:
            cell.alpha = 0.0

            UIView.animate(withDuration: 0.8, animations: {
                cell.alpha = 1.0
            })

        case .zoomIn?:

            UIView.animate(withDuration: 0.1, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)}, completion: { _ in

                    UIView.animate(withDuration: 0.1) {
                        cell.transform = CGAffineTransform.identity
                    }
            })

        case .zoomOut?:

            UIView.animate(withDuration: 0.1, animations: {
                cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)}, completion: { _ in

                    UIView.animate(withDuration: 0.1) {
                        cell.transform = CGAffineTransform.identity
                    }
            })

        case .paperFoldLeft?:
            paperFoldAnimation(cell: cell, direction: .left)

        case .paperFoldRight?:
            paperFoldAnimation(cell: cell, direction: .right)

        default:
            break
        }

        // Animating to final stage
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
