//
//  ScrollViewController.swift
//  iOSDoMore
//
//  Created by Feruz Boltayev on 22.07.2022.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }



    //MARK:- Method
    func initViews(){
        addNavigationBar()
    }
    func addNavigationBar(){
        let back = UIImage(named: "ic_back")
      navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
      
        title = "Scroll View"

        
    }
        //MARK:- Action
        
        
        @objc func backTapped(){
           navigationController?.popViewController(animated: true)
            }

}
