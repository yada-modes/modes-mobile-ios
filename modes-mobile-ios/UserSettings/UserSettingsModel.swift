//
//  UserSettingsModel.swift
//  modes-mobile-ios
//
//  Created by yada on 8/20/20.
//

import Foundation

class LocationsModel: Codable{
    var next : Pages?
    var items:[Location?]?
}

class Pages: Codable{
    var ref: String?
    
    enum CodingKeys: String, CodingKey {
      case ref = "$ref"
    }
}
class Location: Codable{
    var id : Int?
    var name : String?
    var branch : String?
    var stat_id : String?
    var coun_id : String?
    var name_seo : String?
}


class LocationsByPostalCode: Codable{
    var items: [LocationByPostalCode?]?
}


class LocationByPostalCode:Codable{
    
    var INST_ID : Int?
    var INST_NAME : String?
}

class BranchesModel : Codable{
    
    var branches : [String] = ["Army", "Marine Corps", "Navy", "Air Force", "Coast Guard", "National Guard", "Reserves", "DOD Civilian", "N/A"]
}
