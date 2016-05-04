//
//  DataModel.swift
//  iQuiz
//
//  Created by Annie Lace on 5/2/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import Foundation

class DataModel
{
    class CategoryCell
    {
        let iconFile: String
        let title: String
        let descr: String
        
        init(iconFile: String, title: String, descr: String)
        {
            self.iconFile = iconFile
            self.title = title
            self.descr = descr
        }
    }
    
    let categories = [
        CategoryCell(iconFile: "shield.jpg", title: "Marvel Super Heroes", descr: "Here to save the day!"),
        CategoryCell(iconFile: "math.jpg", title: "Mathematics", descr: "Fun with numbers and equations!"),
        CategoryCell(iconFile: "lab.jpg", title: "Science", descr: "What's cooking in the lab?")
    ]
}
