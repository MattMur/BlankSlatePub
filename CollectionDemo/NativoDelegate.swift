//
//  NativoDelegate.swift
//  CollectionDemo
//
//  Created by Matthew Murray on 11/15/23.
//  Copyright © 2023 Nativo. All rights reserved.
//

import Foundation
import NativoSDK


class NativoDelegate: NSObject, NtvSectionDelegate {
    func section(_ sectionUrl: String, didReceiveAd didGetFill: Bool) {
        
    }
    
    func section(_ sectionUrl: String, didAssignAd adData: NtvAdData, toLocation location: Any, container: UIView) {
        
    }
    
    func section(_ sectionUrl: String, didFailAdAtLocation location: Any?, in view: UIView?, withError errMsg: String?, container: UIView?) {
        
    }
    
 
}
