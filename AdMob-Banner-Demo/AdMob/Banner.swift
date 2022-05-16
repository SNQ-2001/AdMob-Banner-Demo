//
//  Banner.swift
//  AdMob-Banner-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/16.
//

import SwiftUI
import GoogleMobileAds

struct BannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = GADBannerViewController()
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

class GADBannerViewController: UIViewController, GADBannerViewDelegate {
    var bannerView: GADBannerView!
    let adUnitID = "ca-app-pub-3940256099942544/2934735716"
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

        bannerView.delegate = self
        setAdView(bannerView)
    }
    func setAdView(_ view: GADBannerView) {
        bannerView = view
        self.view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        let viewDictionary = ["_bannerView": bannerView!]
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[_bannerView]|",
                options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        )
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[_bannerView]|",
                options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        )
    }

    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("🍎: バナー広告を受信しました")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("😭: バナー広告の受信に失敗しました → \(error.localizedDescription)")
    }
    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("🍌: バナー広告を表示しました")
    }
}
