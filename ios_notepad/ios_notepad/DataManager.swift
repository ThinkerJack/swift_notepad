//
//  DataManager.swift
//  ios_notepad
//
//  Created by orangelab on 2021/7/23.
//

import UIKit
import GRDB

struct GroupTable: Codable, FetchableRecord, PersistableRecord {
    var groupName: String
}
struct NoteModel: Codable, FetchableRecord, PersistableRecord {
    var time: String?
    var title: String?
    var body: String?
    var group: String?
    var noteId: Int?
}
class DataManager: NSObject {
    static var dbQueue: DatabaseQueue?
    static var isOpen = false;
    class func openDataBase(){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let file = path+"/DataBase.sqlite"
        dbQueue = try! DatabaseQueue(path: file)
        isOpen = true;
        try! self.dbQueue?.inDatabase { (db) -> Void in
            // 判断是否存在数据库
            if try db.tableExists("groupTable") {
                debugPrint("表已经存在")
                return
            }
            // 创建数据库表
            try db.create(table: "groupTable") { t in
                t.column("groupName", Database.ColumnType.text)
                
            }
            
        }
        
    }
    class func saveGroup(name:String){
        if !isOpen{
            self.openDataBase()
        }
        
        try! dbQueue?.write { db in
            try GroupTable(groupName: name).insert(db)
        }
        
    }
    class func getGroupData()->[String]?{
        
        let g:[GroupTable]? = try! dbQueue?.write { db in
            try GroupTable.fetchAll(db)
        }
        var array = Array<String>()
        g?.forEach({(element) in array.append(element.groupName)})
        return array
        
        
    }
    
    
}
