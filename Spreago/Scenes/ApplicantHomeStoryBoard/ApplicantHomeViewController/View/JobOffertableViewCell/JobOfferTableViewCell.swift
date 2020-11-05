//
//  JobOfferTableViewCell.swift
//  Spreago
//
//  Created by eman shedeed on 7/12/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class JobOfferTableViewCell: UITableViewCell {
    
    //MARK:- IBOytlet
    @IBOutlet weak var appliedImageView : UIImageView!
    @IBOutlet weak var jobTitleLbl : UILabel!
    @IBOutlet weak var jobProviderLbl : UILabel!
    @IBOutlet weak var jobPostedDateLbl : UILabel!
    @IBOutlet weak var numberOfApplicantsLbl : UILabel!
    @IBOutlet weak var numberOfQuestionsLbl : UILabel!
    @IBOutlet weak var timeLbl : UILabel!
    @IBOutlet weak var jobDescriptionLbl : UILabel!
    @IBOutlet weak var jobCategory1Lbl : UILabel!
    @IBOutlet weak var jobCategory2Lbl : UILabel!
    @IBOutlet weak var profilePicteureTopSpace: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
