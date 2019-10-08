//
//  LoginController.swift
//  TTRx
//
//  Created by simp on 2019/10/8.
//  Copyright © 2019 simp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginController: UIViewController {
    
    var nickNameLabel:UILabel = UILabel.init()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(nickNameLabel)
        nickNameLabel.frame = CGRect.init(x: 100, y: 100, width: 200, height: 60)
        nickNameLabel.backgroundColor = UIColor.orange;
        
        let sender = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        let reciver = AnyObserver<String>{e in
            switch e {
            case .next(let a):
                self.nickNameLabel.text = a
                break
            case .error(_):
                break
            case .completed:
                break
            }
          
        }
        
        _ = Binder<String>(self.nickNameLabel) {(l,t) in
            l.text = t
        }
        
        
        sender.map { (time) -> String in
            "ehehe\(time)"
        }.bind(to: self.nickNameLabel.rx.text).disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
