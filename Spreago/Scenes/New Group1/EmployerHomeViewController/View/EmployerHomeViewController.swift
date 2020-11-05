//
//  EmployerHomeViewController.swift
//  Spreago
//
//  Created by eman shedeed on 7/9/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit

class EmployerHomeViewController: BaseViewController {
    //MARK :- IBOutlet
    
    @IBOutlet weak var grayMenuButton: UIButton!
    @IBOutlet weak var lifeJobsCollectionView: UICollectionView!
    @IBOutlet weak var draftJobsCollectionView: UICollectionView!
    @IBOutlet weak var closedJobsCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var scroll: UIScrollView!
    //MAK :- Variables
    var datasourceArray : [JobInfo] = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
        datasourceArray=[JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo(),JobInfo()]
    }
    override func viewWillAppear(_ animated: Bool) {
        createFloatingButton()
    }
    
    func setupView(){
        setupSearchBar(searchBar: searchBar)
        grayMenuButton.addBorderWith(borderColor: UIColor(rgb: 0xEFEFEF), borderWith: 1.0, borderCornerRadius: 10.0)
        
        
    }
    
    @IBAction func logOutBtnPressed(_ sender: Any) {
        logOut()
    }
}
extension EmployerHomeViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasourceArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "jobCollectionViewCell", for: indexPath) as! JobCollectionViewCell
        cell.jobTitleLbl.text = datasourceArray[indexPath.row].jobTitle
        cell.jobCategoyLbl.text = datasourceArray[indexPath.row].jobCategoy
        cell.jobPostedDateLbl.text = datasourceArray[indexPath.row].jobPostedDate
        cell.jobDescriptionLbl.text = datasourceArray[indexPath.row].jobDescription
        cell.numberOfApplicantsLbl.text = datasourceArray[indexPath.row].numberOfApplicants
            cell.numberOfViewsLbl.text = datasourceArray[indexPath.row].numberOfViews
        cell.layer.borderColor = UIColor(rgb: 0xE2E2E2).cgColor
        cell.layer.borderWidth = 1
        return cell
      
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: view.frame.width - 17  /*collection view leading*/ - 17 /*collection view trailing*/   , height: draftJobsCollectionView.frame.height)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let visibleRect = CGRect(origin: movesCollectionView.contentOffset, size: movesCollectionView.bounds.size)
//        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//        let visibleIndexPath = movesCollectionView.indexPathForItem(at: visiblePoint)
//        if let  Movecell=movesCollectionView.cellForItem(at: visibleIndexPath!) as? MovesHomeCell{
//        obj=animateProgress()
//         self.obj.styleProgressBar(atView: Movecell.budgetView, infoLabel: Movecell.budgetProgressInfoLbl, currrentProgressLbl: Movecell.budgetProggresscurrentCostLbl, totalProgressLbl: Movecell.budgetProgresstotalCostLbl, currentValue: Movecell.itemsBudget, totalValue:Movecell.totalBudget)
//        obj=animateProgress()
//         self.obj.styleProgressBar(atView: Movecell.itemsView, infoLabel: Movecell.itemsProgressInfoLbl, currrentProgressLbl: Movecell.currentItemsLbl, totalProgressLbl: Movecell.totalItemsLbl, currentValue: Movecell.completedItems, totalValue: Movecell.totalItems)
//        }
//    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let page = scrollView.contentOffset.x / scrollView.bounds.width
//        instagramPageControl.currentPage=Int(page)
//    }
}
