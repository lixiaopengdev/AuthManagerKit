//
//  StaticEditTextCellData.swift
//  CSUtilities
//
//  Created by 于冬冬 on 2023/5/9.
//

import Foundation

public class StaticEditTextCellData: StaticTableViewCellData {
        
    
    let title: String
    let content: String?
    public let identifier = UUID().uuidString
    
    public var cellClickCallback: ClickCallback?
    
    lazy public var cell: UITableViewCell = {
        let cell = StaticEditTextCell(data: self)
        return cell
    }()
    
    public init(title: String, content: String?, callback: ClickCallback? = nil) {
        self.title = title
        self.content = content
        self.cellClickCallback = callback
    }
    

}
