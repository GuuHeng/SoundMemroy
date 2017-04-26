//
//  SoundRecord+CoreDataProperties.swift
//  SoundMemory
//
//  Created by HuHeng on 2017/4/17.
//  Copyright © 2017年 HUHENG. All rights reserved.
//

import Foundation
import CoreData


extension SoundRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SoundRecord> {
        return NSFetchRequest<SoundRecord>(entityName: "SoundRecord")
    }

    @NSManaged public var id: Int64
    @NSManaged public var createTime: String?
    @NSManaged public var fileName: String?
    @NSManaged public var author: String?
    @NSManaged public var length: Int64
    @NSManaged public var type: String?
    @NSManaged public var recentPlayTime: NSObject?

}
