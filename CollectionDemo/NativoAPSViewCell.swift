//
//  NativoAPSViewCell.swift
//  CollectionDemo
//
//  Created by Matthew Murray on 11/21/23.
//  Copyright © 2023 Nativo. All rights reserved.
//

import UIKit
import DTBiOSSDK



class NativoAPSViewCell: UICollectionViewCell, DTBAdCallback, DTBAdBannerDispatcherDelegate {

    let appID = "c5f20fe6e37146b08749d09bb2b6a4dd"
    let slotID320x50 = "88e6293b-0bf0-43fc-947b-925babe7bf3f"
    let adWidth = 320
    let adHeight = 50
    let realWidth = 300
    let realHeight = 250
    var bannerAd : UIView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        requestAPSBid(width: adWidth, height: adHeight, slotUUID: slotID320x50)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        self.subviews[0].removeFromSuperview()
//        requestAPSBid(width: adWidth, height: adHeight, slotUUID: slotID320x50)
    }
    
    
    func requestAPSBid(width: Int, height: Int, slotUUID: String) {
        let adLoader = DTBAdLoader()
        let size = DTBAdSize(bannerAdSizeWithWidth: width, height: height, andSlotUUID: slotUUID)
        if let sizey = size {
            adLoader.setAdSizes([sizey])
            adLoader.loadAd(self)
        }
    }
    
    func addBannerToView(_ bannerView: UIView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bannerView)
        bannerView.widthAnchor.constraint(equalToConstant: CGFloat(realWidth)).isActive = true
        bannerView.heightAnchor.constraint(equalToConstant: CGFloat(realHeight)).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bannerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        bannerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//        bannerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    // MARK: - DTBAdCallback
    func onFailure(_ error: DTBAdError) {
        print("Failed to load APS bid. ERROR: \(error)")
        // Implement logic for failure case
    }

    func onSuccess(_ adResponse: DTBAdResponse) {
        print("Successfully loaded APS bid")
        let amznPricePoint = adResponse.amznSlots()
        let mediationHints = adResponse.mediationHints()
        let dispatcher = DTBAdBannerDispatcher(adFrame: CGRect(x: Int(0.0), y: Int(0.0),
                                                               width: adWidth,
                                                               height: adHeight),
                                               delegate: self)
        dispatcher.fetchBannerAd(withParameters: mediationHints)
    }

    func adDidLoad(_ adView: UIView) {
        print("APSAds: adDidLoad")
        print("Size: \(adView.frame.size)")
        bannerAd = adView
        addBannerToView(bannerAd!)
    }

    func adFailed(toLoad banner: UIView?, errorCode: Int) {
        print("APSAds: adFailedToLoad")
    }

    func bannerWillLeaveApplication(_ adView: UIView) {
        print("APSAds: bannerWillLeaveApplication")
    }

    func impressionFired() {
        print("APSAds: Imp Fired")
    }

}
