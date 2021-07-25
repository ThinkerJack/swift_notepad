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
struct NoteTable: Codable, FetchableRecord, PersistableRecord {
    var time: String?
    var title: String?
    var body: String?
    var group: String?
    var noteId: Int?
}
class DataManager: NSObject {
    static var dbQueue: DatabaseQueue!
    class func openDataBase(){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let file = path+"/DataBase.sqlite"
        dbQueue = try! DatabaseQueue(path: file)
        try! self.dbQueue.inDatabase { (db) -> Void in
            if try db.tableExists("groupTable") {
                debugPrint("groupTable已经存在")
            }else{
                try db.create(table: "groupTable") { t in
                    t.column("groupName", Database.ColumnType.text)
                }
            }
            if try db.tableExists("noteTable") {
                debugPrint("noteTable已经存在")
            }else{
                try db.create(table: "noteTable") { t in
                    t.autoIncrementedPrimaryKey("noteId")
                    t.column("time", Database.ColumnType.text)
                    t.column("title", Database.ColumnType.text)
                    t.column("body", Database.ColumnType.text)
                    t.column("group", Database.ColumnType.text)
                }
            }
        }
    }
    class func saveGroup(name:String){
        try! dbQueue.write { db in
            try GroupTable(groupName: name).insert(db)
        }
        
    }
    class func getGroup()->[String]{
        let list:[GroupTable] = try! dbQueue.read { db in
            try GroupTable.fetchAll(db)
        }
        var array = Array<String>()
        list.forEach({(element) in array.append(element.groupName)})
        return array
        
    }
    class func addNote(note:NoteTable){
        try! dbQueue.write { db in
            try note.insert(db)
        }
    }
    class func getNote(groupName:String)->[NoteTable]{
        let list:[NoteTable] = try! dbQueue.read { db in
            try NoteTable.fetchAll(db,sql: "select * from noteTable where group = ?",arguments: [groupName])
        }
        return list;
    }
    
    
}
