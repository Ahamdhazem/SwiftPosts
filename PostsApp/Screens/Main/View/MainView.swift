//
//  MainView.swift
//  PostsApp
//
//  Created by LP Mackbook on 24/08/2026.
//

import UIKit

class MainView: UIViewController {
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
        (CellList.count+1)/2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let startIndex = section * 2
        let remainingItems = CellList.count - startIndex
        return min(2, remainingItems)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as!  MainCollectionViewCell

        cell.ViewModel = MainCellViewModel(indexPath)
        cell.Set()
        return cell
    }
    
    
    
}
extension MainView:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        let index = indexPath.section * 2 + indexPath.item
        
        let secreenName : EnumScreens =
        
        index == 0 ? .posts :
        index == 1 ? .todos :
            .users
        print(secreenName.rawValue)
        
        let vc =  ContentViewController(nibName: "ContentViewController", bundle: nil)
        vc.viewModel = ContentViewModel(secreenName: secreenName)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    }
    
    

