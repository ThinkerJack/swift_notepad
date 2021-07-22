//
//  ViewController.swift
//  ios_notepad
//
//  Created by 吴超 on 2021/7/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var homeView:HomeView?
    var dataArray:Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "点滴生活"
        self.edgesForExtendedLayout = UIRectEdge()
        dataArray = ["生活","工作","学习","会议列表","健身计划"]
        self.installUI()
    }
    func installUI(){
        homeView = HomeView(frame: CGRect(x:0,y:0,width: self.view.frame.size.width,height: self.view.frame.size.height-64))
        self.view.addSubview(homeView!)
        homeView?.dataArray = ["生活","工作","学习","会议列表","健身计划","生活","工作","学习","会议列表","健身计划","生活","工作","学习","会议列表","健身计划"]
        homeView?.updateLayout()
        installNavigationItem()
    }
    func installNavigationItem(){
        let item=UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addGroup))
        self.navigationItem.rightBarButtonItem=item
        
    }
    @objc func addGroup(){
        let alertController = UIAlertController(title: "添加记事分组", message:"添加的分组名不能与已有分组重复或为空", preferredStyle: .alert)
        //swift 闭包知识点
        alertController.addTextField{(textFiled) in textFiled.placeholder = "请输入记事分组名称"}
        let alertItem = UIAlertAction(title: "取消", style: .cancel,handler: {(UIAlertAction) in return;})
        let alertItemAdd = UIAlertAction(title: "确定", style: .default, handler:
        {(UIAlertAction) -> Void in
            var exist = false
            self.dataArray?.forEach({(element) in if element == alertController.textFields?.first!.text || alertController.textFields?.first!.text?.count == 0{
                exist = true
            }})
            if exist{
                return
            }
            self.dataArray?.append(alertController.textFields!.first!.text!)
            self.homeView?.dataArray = self.dataArray
            self.homeView?.updateLayout()
            
         })
        alertController.addAction(alertItem)
        alertController.addAction(alertItemAdd)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

