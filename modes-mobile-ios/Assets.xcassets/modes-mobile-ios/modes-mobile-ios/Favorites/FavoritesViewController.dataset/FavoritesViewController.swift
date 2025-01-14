//
//  FavoritesViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 9/5/20.
//

import UIKit

class FavoritesViewController: UIViewController {

    var viewModel : FavoritesViewModel?
    
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var viewInstallation: UIView!
    
    @IBOutlet weak var viewMILLIFEGuides: UIView!
    
    @IBOutlet weak var viewNoInstallation: UIView!
    
    @IBOutlet weak var viewBenefits: UIView!
    @IBOutlet weak var constraintNoInstallationTop: NSLayoutConstraint!
    @IBOutlet weak var constraintInstallationHeigth: NSLayoutConstraint!
    
    
    /// installation info
    
    @IBOutlet weak var lblInstallationName: UILabel!
    @IBOutlet weak var lblBranch: UILabel!
    @IBOutlet weak var lblAddress1: UILabel!
    @IBOutlet weak var lblCityStateZip: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    // tables
    
    @IBOutlet weak var tableViewGuides: UITableView!
    @IBOutlet weak var tableViewBenefits: UITableView!
    
    
    func reloadTables(){
        self.tableViewBenefits.reloadData()
        self.tableViewGuides.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // instantiate the view model
        viewModel = FavoritesViewModel()
        
        
        
        if(!(viewModel?.getInstallation())!){
            print("load no installation")
            constraintNoInstallationTop.constant = 31
                   constraintInstallationHeigth.constant = viewNoInstallation.frame.size.height
                   viewContentView.setNeedsLayout()
                   viewContentView.layoutIfNeeded()
                   
                   
                   viewInstallation.isHidden = true
                   viewNoInstallation.isHidden = false
            
        }
        else{
            print("get the installation info")
            // observe the view model
            viewNoInstallation.isHidden = true
            viewModel?.addObserver(self, forKeyPath: "dataLoaded", options: [.new,.old], context: nil)
        }
        
       

        tableViewGuides.isEditing = false
        tableViewBenefits.isEditing = false
        
        tableViewGuides.dataSource = self
        tableViewGuides.delegate = self
        
        tableViewBenefits.delegate = self
        tableViewBenefits.dataSource = self
        
        tableViewGuides.tableFooterView = UIView()
        tableViewBenefits.tableFooterView = UIView()
        
       
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewGuides.reloadData()
        tableViewBenefits.reloadData()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           
        // the view model chaged
        if keyPath == "dataLoaded" {
               DispatchQueue.main.async {
                    print("Do some stuff on the ui")
                    var location = (self.viewModel?.locationsModel?.items?[0])! as Location
                
                    self.lblInstallationName.text = location.name
                    self.lblBranch.text = location.branch
                    self.lblAddress1.text = location.address_line1
                    self.lblCityStateZip.text = "\(location.city ?? ""), \(location.stat_id ?? "")  \(location.postal_code ?? "")"
                    
                    self.lblEmail.text = location.email_address1
                    self.lblWebsite.text = location.url1
                    self.lblPhoneNumber.text = location.phone1
                }
        }
    }

}

extension FavoritesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == self.tableViewGuides){
            
            return viewModel?.getFavoriteGuides().count ?? 0
        }
        else{
            return viewModel?.getFavoriteBenefits().count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == self.tableViewGuides){

            // create a new cell if needed or reuse an old one
            let cell:FavoriteGuidesTableViewCell = self.tableViewGuides.dequeueReusableCell(withIdentifier: "GUIDES_CELL") as!  FavoriteGuidesTableViewCell
            cell.lblFavorite.text  = viewModel?.getFavoriteGuides()[indexPath.row].name
            
            cell.parentVc = self
            return cell
            
        }
        else{
            // create a new cell if needed or reuse an old one
            let cell:FavoritesBenefitsTableViewCell = self.tableViewBenefits.dequeueReusableCell(withIdentifier: "BENEFITS_CELL") as! FavoritesBenefitsTableViewCell
            
            // set the text from the data model
            cell.lblFavorite.text  = viewModel?.getFavoriteBenefits()[indexPath.row].name
            
            cell.parentVc = self
            
            return cell
            
        }
    }
    
    /*
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if(tableView == tableViewGuides){
            print("guid selected")
        }
        else{
            print("beenfits selected")
        }
        
    }
    */
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if(tableView == tableViewGuides){
            print("guid selected")
            
            let selectedGuide = viewModel?.getFavoriteGuides()[indexPath.row].name
            
            let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MilLifeDetailsGuideContVC") as! MilLifeDetailsGuideContVC
            
            vc.selectedGuide = selectedGuide
            self.present(vc, animated: true)
            
            
            
        }
        else{
            print("beenfits selected")
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if(tableView == tableViewGuides){
           print("guid selected")
       }
       else{
           print("beenfits selected")
       }
    }
    
    
    
}
