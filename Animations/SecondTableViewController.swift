//
//  TableViewController.swift
//  Animations
//
//  Created by Umair Afzal on 024/03/2018.
//  Copyright © 2016 Umair Afzal. All rights reserved.
//

import UIKit

class SecondTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableVew: UITableView!
    var animationType: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableVew.delegate = self
        tableVew.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if animationType == 2 {
            animateTableView()
        }
    }

    // MARK: - UITableView DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

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

        case 0:
            let transform = CATransform3DTranslate(CATransform3DIdentity, -tableView.bounds.size.width, 30, 0)
            cell.layer.transform = transform
            break

        case 1:
            let transform = CATransform3DTranslate(CATransform3DIdentity, tableView.bounds.size.width, 30, 0)
            cell.layer.transform = transform
            break

        case 3:
            let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -tableView.bounds.size.width, 0)
            cell.layer.transform = transform
            break

        default:
            break
        }

        // Animating to final stage
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
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
}
