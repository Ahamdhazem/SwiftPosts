//
//  MainView.swift
//  PostsApp
//
//  Created by LP Mackbook on 24/08/2026.
//

import UIKit

class MainView: UIViewController {
    let buttonsText = ["Posts","ToDos","Users"]
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        collectionView.register(
            nib,
            forCellWithReuseIdentifier: "MainCollectionViewCell"
        )

    }

}

extension MainView:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        buttonsText.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as!  MainCollectionViewCell
        let text = buttonsText[indexPath.section]
        cell.label.text = text
        
        return cell
    }
    
    
    
}
extension MainView:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        

        
        let secreenName : EnumScreens =
        
        indexPath.section == 0 ? .posts :
        indexPath.section == 1 ? .todos :
            .users
        
        let vc =  UserPostToDoViewController(screenName: secreenName)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    }
    
    

