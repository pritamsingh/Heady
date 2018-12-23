//
//  ViewController.swift
//  Heady
//
//  Created by Pritam on 19/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    var categories = [HeadyCategorie]()
   @IBOutlet weak var collectionview: UICollectionView!
    var cellId = "Cell"
    var headerCellId = "HeaderCollectionReusableView"
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        self.getData()
        
    }
    
    func getData(){
        let url : String = "https://stark-spire-93433.herokuapp.com/json"
        let parser = Parser(url, handler: { response in
            print(response)
        
            
            if let categories = response.value(forKey: "categories") as? NSArray {
                for i in 0 ..< categories.count {
                    let categorie = HeadyCategorie(dict: categories[i] as! NSDictionary)
                    print(categorie)
                    self.categories.append(categorie)
                    }
                DispatchQueue.main.async {
                 self.collectionview.reloadData()
                }
            }
        })
    }

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories[section].products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath)
//        cell.backgroundColor = UIColor.darkGray
        let product = categories[indexPath.section].products[indexPath.row]
        if let lbl = cell.viewWithTag(1) as? UILabel{
            lbl.text = product.name
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath)
            
//            headerView.backgroundColor = UIColor.lightGray
            
            for subview in headerView.subviews{
                if subview.isKind(of: UILabel.self)
                {
                    let titleLbl = subview as! UILabel
                    let categorie = categories[indexPath.section]
                    titleLbl.text = categorie.name
                    continue
                }
            }
            return headerView
            //          let headerLbl = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.frame.size.width, height: collectionView.frame.size.height))
            //          headerLbl.text = " header titile \(indexPath.section)"
        //          return headerLbl
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width  = CGFloat(self.view.frame.size.width/3)
        return CGSize(width: width, height: width)

    }
}
