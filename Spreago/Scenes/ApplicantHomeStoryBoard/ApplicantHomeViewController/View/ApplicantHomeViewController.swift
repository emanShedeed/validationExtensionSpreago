//
//  ApplicantHomeViewController.swift
//  Spreago
//
//  Created by eman shedeed on 7/11/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class ApplicantHomeViewController: BaseViewController {
    //MARK :- IBOutlet
    
    @IBOutlet weak var grayMenuButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var jobOfferTableView: UITableView!
    //MAK :- Variables
    var datasourceArray : [JobOffer] = .init()
    var cellHeight :CGFloat = 310.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
        var jobobj = JobOffer()
        jobobj.isApplied = true
        datasourceArray=[JobOffer(),jobobj,JobOffer(),jobobj,JobOffer(),jobobj,JobOffer(),jobobj]
    }
    
    func setupView(){
        jobOfferTableView.tableFooterView=UIView()
        jobOfferTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: jobOfferTableView.frame.size.width, height: 1))
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        jobOfferTableView.contentInset = insets
        setupSearchBar(searchBar: searchBar)
        grayMenuButton.addBorderWith(borderColor: UIColor(rgb: 0xEFEFEF), borderWith: 1.0, borderCornerRadius: 10.0)
    }
    
    
    @IBAction func logOutBtnPressed(_ sender: Any) {
        logOut()
    }
}
extension ApplicantHomeViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOfferTableViewCell", for: indexPath) as! JobOfferTableViewCell
        cell.appliedImageView.isHidden = !(datasourceArray[indexPath.row].isApplied)
        cell.profilePicteureTopSpace.constant = cell.appliedImageView.isHidden ? 20 : 67
        cell.jobTitleLbl.text = datasourceArray[indexPath.row].jobTitle
        cell.jobProviderLbl.text = datasourceArray[indexPath.row].jobProvider
        cell.jobPostedDateLbl.text = datasourceArray[indexPath.row].jobPostedDate
        cell.numberOfApplicantsLbl.text = datasourceArray[indexPath.row].numberOfApplicants
        cell.numberOfQuestionsLbl.text = datasourceArray[indexPath.row].numberOfQuestions
        cell.timeLbl.text = datasourceArray[indexPath.row].time
        cell.jobDescriptionLbl.text = datasourceArray[indexPath.row].jobDescription
        cell.jobCategory1Lbl.text = datasourceArray[indexPath.row].jobCategory1
        cell.jobCategory2Lbl.text = datasourceArray[indexPath.row].jobCategory2
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(datasourceArray[indexPath.row].isApplied){
            cellHeight = 310
        }else{
            cellHeight = 263
        }
        return cellHeight
    }
    
}
