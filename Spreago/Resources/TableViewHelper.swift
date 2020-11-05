//
//  TableViewHelper.swift
//  Spreago
//
//  Created by eman shedeed on 7/7/20.
//  Copyright © 2020 eman shedeed. All rights reserved.
//

import UIKit
class FullHeightTableView:UITableView{
    var contentSizeChanged: ((CGFloat) -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentSizeChanged?(self.contentSize.height)
    }
}


