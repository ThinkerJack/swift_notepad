//
//  NoteInfoViewController.swift
//  ios_notepad
//
//  Created by orangelab on 2021/7/26.
//

import UIKit

class NoteInfoViewController: UIViewController {
    var noteTable:NoteTable?
    var titleTextField:UITextField?
    var bodyTextView:UITextField?
    var group:String?
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        self.view.backgroundColor = UIColor.white
        self.title = "记事"
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardBeShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardBeHidden), name: UIResponder.keyboardDidHideNotification, object: nil)
        //        installUI()
        //        installNavigationItem()
        // Do any additional setup after loading the view.
    }
    func installNavigationItem(){
        let itemSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addNote))
        let itemDelete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteNote))
        self.navigationItem.rightBarButtonItems = [itemSave,itemDelete]
    }
    @objc func addNote(){
        if isNew{
            if titleTextField?.text != nil && (titleTextField?.text!.count)! > 0{
                noteTable = NoteTable()
                noteTable?.title = titleTextField?.text!
                noteTable?.body = bodyTextView?.text!
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                noteTable?.time = dateFormatter.string(from: Date())
                noteTable?.group = group
                DataManager.addNote(note:noteTable!)
                self.navigationController!.popViewController(animated: true)
            }
        }
    }
    @objc func deleteNote(){
        
    }
    @objc func keyBoardBeShow(notification:Notification){
        let userInfo = notification.userInfo!
        let frameInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject
        
    }
    @objc func keyBoardBeHidden(notification:Notification){
        let userInfo = notification.userInfo!
    }

}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



