//
//  TableViewUtilities.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 2/6/2022.
//

import Foundation
import UIKit

class TableViewUtilities{
    
    private let tableView = UITableView()
    
    init() {}
    
    func createtableView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, rowHeight: CGFloat) -> UITableView{
        
        tableView.frame = CGRect(x: x, y: y, width: width, height: height)
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = rowHeight
        
        return tableView
    }
    
}
