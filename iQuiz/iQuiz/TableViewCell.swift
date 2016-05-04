//
//  TableViewCell.swift
//  iQuiz
//
//  Created by Annie Lace on 5/3/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell
{
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
