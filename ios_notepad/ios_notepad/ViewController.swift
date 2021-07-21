//
//  ViewController.swift
//  ios_notepad
//
//  Created by 吴超 on 2021/7/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var box = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(box)
               box.backgroundColor = .green
               box.snp.makeConstraints { (make) -> Void in
                  make.width.height.equalTo(50)
                  make.center.equalTo(self.view)
               }
        // Do any additional setup after loading the view.
    }


}

