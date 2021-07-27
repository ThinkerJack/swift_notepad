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
    var bodyTextView:UITextView?
    var group:String?
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        self.view.backgroundColor = UIColor.white
        self.title = "记事"
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardBeShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardBeHidden), name: UIResponder.keyboardDidHideNotification, object: nil)
        installUI()
        installNavigationItem()
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
                noteTable?.groupName = group
                DataManager.addNote(note:noteTable!)
                self.navigationController!.popViewController(animated: true)
            }
        }else{
            if titleTextField?.text != nil && (titleTextField?.text!.count)! > 0{
                noteTable?.title = titleTextField?.text!
                noteTable?.body = bodyTextView?.text!
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                noteTable?.time = dateFormatter.string(from: Date())
                noteTable?.groupName = group
                DataManager.updateNote(note:noteTable!)
                self.navigationController!.popViewController(animated: true)
            }
        }
    }
    @objc func deleteNote(){
        let alertController = UIAlertController(title: "警告", message: "您确定要删除此记事吗？", preferredStyle: .alert)
        let action  = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let action2  = UIAlertAction(title: "删除", style: .destructive, handler: {(UIAlertAction)-> Void in
            if !self.isNew{
                DataManager.deleteNote(note: self.noteTable!)
                self.navigationController!.popViewController(animated: true)
            }
            
        })
        alertController.addAction(action)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @objc func keyBoardBeShow(notification:Notification){
        let userInfo = notification.userInfo!
        let frameInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject
        let height = frameInfo.cgRectValue.size.height
        bodyTextView?.snp.updateConstraints({(maker) in maker.bottom.equalTo(-30-height)})
        UIView.animate(withDuration: 0.3, animations: {() in self.view.layoutIfNeeded()})
    }
    @objc func keyBoardBeHidden(notification:Notification){
        bodyTextView?.snp.updateConstraints({(maker) in maker.bottom.equalTo(-30)})
        UIView.animate(withDuration: 0.3, animations: {() in self.view.layoutIfNeeded()})
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        bodyTextView?.resignFirstResponder()
        titleTextField?.resignFirstResponder()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func installUI(){
        titleTextField = UITextField()
        self.view.addSubview(titleTextField!)
        titleTextField?.borderStyle = .none
        titleTextField?.placeholder = "请输入记事标题"
        titleTextField?.snp.makeConstraints(
            {(maker) in
                maker.top.equalTo(30)
                maker.left.equalTo(30)
                maker.right.equalTo(-30)
                maker.height.equalTo(30)
            }
        )
        let line = UIView()
        self.view.addSubview(line)
        line.backgroundColor = UIColor.gray
        line.snp.makeConstraints(
            {(maker) in
                maker.top.equalTo(titleTextField!.snp.bottom).offset(5)
                maker.left.equalTo(15)
                maker.right.equalTo(-15)
                maker.height.equalTo(0.5)
            }
        )
        bodyTextView = UITextView()
        bodyTextView?.layer.borderColor = UIColor.gray.cgColor
        bodyTextView?.layer.borderWidth = 0.5
        self.view.addSubview(bodyTextView!)
        bodyTextView?.snp.makeConstraints(
            {(maker) in
                maker.top.equalTo(line.snp.bottom).offset(10)
                maker.left.equalTo(30)
                maker.right.equalTo(-30)
                maker.bottom.equalTo(-30)
            }
        )
        if !isNew{
            titleTextField?.text = noteTable?.title
            bodyTextView?.text = noteTable?.body
        }
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



