//
//  SPBookingRequestDetailsTopTableViewCell.swift
//  PamperMoi
//
//  Created by Vizteck on 19/02/2018.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit


class SamleTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonsStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var serviceLocationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    
    @IBOutlet weak var buttonsStackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class func cellForTableView(tableView: UITableView) -> SamleTableViewCell {
        let kSamleTableViewCellIdentifier = "kSamleTableViewCellIdentifier"
        tableView.register(UINib(nibName: "SamleTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kSamleTableViewCellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: kSamleTableViewCellIdentifier) as! SamleTableViewCell
        return cell
    }

    @IBAction func acceptButtonTapped(_ sender: Any) {
    }
    
    @IBAction func rejectButtonTapped(_ sender: Any) {
    }
}
