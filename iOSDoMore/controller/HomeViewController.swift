//
//  HomeViewController.swift
//  iOSDoMore
//
//  Created by Feruz Boltayev on 22.07.2022.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
  
    
    
    @IBOutlet var CollectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items : Array<Item> = Array()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        // Do any additional setup after loading the view.
    }

    //MARK:- Method
    func initViews(){
        addNavigationBar()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        self.CollectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        if let flowLayout = CollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screenSiz: CGRect = UIScreen.main.bounds
        let cellWidth =  screenSiz.width / numberOfColumns - 15
            flowLayout.itemSize =  CGSize(width: cellWidth, height: cellWidth)
            
        }
        
        
        items.append(Item(title: "Best Coding", image: "ic_macbook"))
        items.append(Item(title: "Amazing Code", image: "ic_macbook1"))
        items.append(Item(title: "Best Coding", image: "ic_macbook"))
        items.append(Item(title: "Amazing Code", image: "ic_macbook1"))
        items.append(Item(title: "Best Coding", image: "ic_macbook"))
        items.append(Item(title: "Amazing Code", image: "ic_macbook1"))
        items.append(Item(title: "Best Coding", image: "ic_macbook"))
        items.append(Item(title: "Amazing Code", image: "ic_macbook1"))
        
        }
    func addNavigationBar(){
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image:scroll, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Collection View"
    }
    func callScrollController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    //MARK:- Action
    
            @objc func scrollTapped(){
                callScrollController()
            }
    //MARK:- CollectionNiew
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.onLabel.text = item.title
        cell.onImageView.image = UIImage(named:item.image! )
        return cell
        
    }
}
