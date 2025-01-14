//
//  BenefitsDetailsContVC.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/3/20.
//

import UIKit

class BenefitsDetailsContVC: UIViewController {

    var selectedBenefit : String?
    var parentVc : BenefitsController?
    var benefit : Benefit?
   
    //page elements
    @IBOutlet weak var favoritesBtn: UIButton!
    @IBOutlet weak var benefitsTitle: UILabel!
    @IBOutlet weak var benefitsText: UILabel!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    
    @IBAction func touchFavorie(_ sender: Any) {
        
        ModesDb.shared.setBenefitavorite(favorite: !(benefit?.favorite ?? false), name: (benefit?.Benefit)!)
        benefit?.favorite = !(benefit?.favorite ?? false)
        if((benefit?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
            buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
        }
        
    }
    
    @IBAction func backBtnTouched(_ sender: Any) {
      print("Back Button Touched")
        if(selectedBenefit != nil){
            self.dismiss(animated: true) {
                 NotificationCenter.default.post(name: Notification.Name("benefit_closed"), object: nil)
            }
        }
        else{
            parentVc?.showMainView(view: parentVc!.DetailsBenefits)
        }
    }
    
    @IBAction func favoritesBtnTouched(_ sender: Any) {
        print("Favorites Button Touched")
    }
    
    @IBAction func benefitDetailsBtnTouched(_ sender: Any) {
       // if let url = URL(string: "http://www.militaryonesource.mil") {
        if let url = URL(string: benefit!.BenefitLink!) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    
    func loadBenefit(){
        if((selectedBenefit) != nil){
            
            var viewModel = BenefitsViewModel()
            viewModel.selectedBenefit = selectedBenefit!
            
            self.benefit = viewModel.getSelectedBenefit()
        }
        else{
        
            benefit = parentVc?.viewModel?.getSelectedBenefit()
        }
        self.benefitsTitle.text = benefit?.Benefit
        
        
        benefitsText.numberOfLines = 0
        benefitsText.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        //self.benefitsText.text = benefit?.LongDescription
        
        let attributedString = NSMutableAttributedString(string: benefit?.LongDescription ?? "")

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 4 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***
        benefitsText.attributedText = attributedString
        
        
        
        
        if((benefit?.favorite ?? false)){
            buttonFavorite.setImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorites_red"), for: UIControl.State.normal)
        }
        else{
            buttonFavorite.setImage(UIImage.init(named: "favorite_unselected"), for: UIControl.State.normal)
            buttonFavorite.setBackgroundImage(UIImage.init(named: "favorite_unselected"), for:  UIControl.State.normal)
        }
        
        benefitsText.sizeToFit()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.loadBenefit()
        
        
    }
    
    //override func viewDidAppear(_ animated: Bool) {
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
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
