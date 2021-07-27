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
    var groupName: String?
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
                    t.uniqueKey(["groupName"])
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
                    t.column("groupName", Database.ColumnType.text)
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
        let list:[GroupTable] = try! dbQueue.write { db in
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
        var list:[NoteTable]!
        try! dbQueue.write { db in
             list =  try NoteTable.fetchAll(db,sql: "SELECT * FROM noteTable WHERE groupName = ?",arguments: [groupName])
        }
        return list;
    }
    class func updateNote(note:NoteTable){
        try! dbQueue.write { db in
            try note.update(db)
        }
    }
    class func deleteNote(note:NoteTable){
        try! dbQueue.write{ db in
            try note.delete(db)
        }
    }
    class  func deleteGroup(name:String) {
        try! dbQueue.write { db in
            try GroupTable.deleteOne(db,key: ["groupName":name])
    
            try NoteTable.filter(Column("groupName") == name)
                .deleteAll(db)
        }
        
    }
    
}
