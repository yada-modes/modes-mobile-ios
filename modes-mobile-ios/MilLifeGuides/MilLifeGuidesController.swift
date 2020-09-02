//
//  MilLifeGuidesController.swift
//  modes-mobile-ios
//
//  Created by Neal Gentry on 9/1/20.
//

import UIKit

class MilLifeGuidesController: UIViewController {

    @IBOutlet weak var btn_ByCat: UIButton!
    @IBOutlet weak var btn_ViewAll: UIButton!
    @IBOutlet weak var MilLifeContView1: UIView!
    @IBOutlet weak var MilLifeContView2: UIView!
    
    @IBOutlet weak var MainVIew: UIView!
    @IBOutlet weak var GuidesTableView: UIView!
    @IBOutlet weak var DetailsGuide: UIView!
    
    @IBAction func btnViewAll_Touched(_ sender: Any) {
        print("btnView all touched")
        showViewAll()
    }
    
    @IBAction func btnByCat_Touched(_ sender: Any) {
        print("btnByCat tounched")
        showByCat()
    }
    
    @IBAction func btnShowGuidesTableTouched(_ sender: Any) {
        showOverlay(view: GuidesTableView)
    }
    @IBAction func btnShowGuidesDetails(_ sender: Any) {
        showOverlay(view: DetailsGuide)
    }
    
    @IBAction func backfromGuidesTouched(_ sender: Any) {
        showMainView(view: GuidesTableView)
    }
    @IBAction func btn_backfromDetailsTouched(_ sender: Any) {
        showMainView(view: DetailsGuide)
    }
    
    func showMainView(view:UIView){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = view
            UIView.animate(withDuration: 0.25){
                viewToAnimate2.alpha = 0
            }
            view.isHidden = true
        }
    }
    
    
    
    func showOverlay(view:UIView){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = view
            view.isHidden = false
            UIView.animate(withDuration: 0.25){
                view.alpha = 1
            }
            
        }
    }
    
    
    
    
    
    
    func showGuidesDetails(){
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let viewToAnimate2 = self.DetailsGuide
            viewToAnimate2!.isHidden = false
            UIView.animate(withDuration: 0.25){
                viewToAnimate2!.alpha = 1
            }
            
        }
    }
    
    
    
    
    
    var vc1 : MilLifeByCatContVC?
    var vc2 : MilLifeViewAllContVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

                // set a reference back to the parent vc for contained view controllers
               // this is how the childeren should reference the view model
               for child in self.children{
                   
                   switch child{
                       
                   case is MilLifeByCatContVC:
                       vc1 = (child as! MilLifeByCatContVC)
                       (child as! MilLifeByCatContVC).parentVc = self
                       //(child as! MilLifeByCatContVC).ml_verttwocollview.parentVc = self
                   case is MilLifeViewAllContVC:
                       vc2 = (child as! MilLifeViewAllContVC)
                       (child as! MilLifeViewAllContVC).parentVc = self
                   default:
                       break
                   }
               }
        
        
        //Hide Guides TableVIew
        GuidesTableView.isHidden = true
        DetailsGuide.isHidden = true
        
        showByCat()
    
    }
    
    
    func showByCat(){
        btn_ByCat.isSelected = true
        btn_ViewAll.isSelected = false
        MilLifeContView1.isHidden = false
        MilLifeContView2.isHidden = true
    }
    
    func showViewAll(){
        btn_ByCat.isSelected = false
        btn_ViewAll.isSelected = true
        MilLifeContView1.isHidden = true
        MilLifeContView2.isHidden = false
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