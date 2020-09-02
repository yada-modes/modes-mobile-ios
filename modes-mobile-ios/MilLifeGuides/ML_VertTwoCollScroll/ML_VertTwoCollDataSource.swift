//  ML_VertTwoCollDataSource.swift

import UIKit

class ML_VertTwoCollDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var viewModel : HomeViewModel?
    
    
    var myLabels = ["COVID-19", "Financial & Legal", "Tile 3", "Again More", "And Again", "And Much More"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return viewModel?.getBenefits(topic: viewModel?.topic ?? "").count ?? 0
        return myLabels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ML_VertTwoCollCell", for: indexPath) as! ML_VertTwoCollCell
        
       
        cell.label.text = myLabels[indexPath.item]
        //cell.label.text = viewModel?.getBenefits(topic: viewModel?.topic ?? "")[indexPath.row]
        
        //background
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false //<-
        
        collectionView.delaysContentTouches = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        print ("Selected: ", indexPath.row)
        
        
        
        //performSegue(withIdentifier: "showGuidesTable", sender: nil)
        /*
        let VC1 = self.storyboard.instantiateViewController(withIdentifier:"ml_guides_sbid") as! MilLifeGuidesTableVC
        self.navigationController!.pushViewController(VC1, animated: true)
        */
    }

}
