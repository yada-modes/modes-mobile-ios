//  Benefits_TableDataSource.swift

import UIKit

class Benefits_TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    

    
    var viewModel : GuidesViewModel?
    var parentVc : BenefitsController?
    
    var myLabels = ["moving", "oconus","housing"]
    var myLabels2 = ["one", "two", "three"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       // var benefits =  parentVc?.viewModel?.getGuiesByCategory(category: (parentVc?.viewModel!.selectedCategory)!)
        
       // return benefits?.count ?? 0
        
        return myLabels.count
        
       
       
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Benefits_TableCell", for: indexPath) as! Benefits_TableCell
        

       
       
        
        //cell.backgroundColor = UIColor(hex: myBkgColor[indexPath.item])
        //cell.imageView.image = UIImage(named: myImages[indexPath.item])
        
        cell.label.text = myLabels[indexPath.row]
        cell.lblText.text = myLabels2[indexPath.row]
        
        //var benefits =  parentVc?.viewModel?.getGuiesByCategory(category: (parentVc?.viewModel!.selectedCategory)!)

        //cell.label.text = benefits?[indexPath.row] as! String
        
        //cell.label.text = "viewModel?.getBenefits(topic: viewModel?.topic ?? "")[indexPath.row]"
        
        //background
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false //<-
        
        //cell.layer.backgroundColor = UIColor.white.cgColor
        //tableView.delaysContentTouches = false
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("label: ", myLabels[indexPath.item])
        parentVc?.showOverlay(view: (parentVc?.DetailsBenefits)!)
    }
    

}
