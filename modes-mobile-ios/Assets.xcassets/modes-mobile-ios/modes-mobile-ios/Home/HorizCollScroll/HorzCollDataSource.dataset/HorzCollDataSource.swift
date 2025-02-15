//  HorzCollDataSource.swift

import UIKit

class HorzCollDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var viewModel : HomeViewModel?
    
    var parentVc : HomeContView1VC?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getSuggestedCards().count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorzCollCell", for: indexPath) as! HorzCollCell
        
        let cards = viewModel?.getSuggestedCards()
        let card = cards?[indexPath.row]
        
        cell.label.text = card?.cardTitle
        cell.labelHeader.text = card?.cardType
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        print ("Selected: ", indexPath.row)
        let cards = viewModel?.getSuggestedCards()
        let cardTitle = cards?[indexPath.row].cardTitle
        let cardType = cards?[indexPath.row].cardType
        
        
        parentVc?.parentVc?.didSelectHorzTile(index: indexPath.row)
        
    }
    
    
    

}
