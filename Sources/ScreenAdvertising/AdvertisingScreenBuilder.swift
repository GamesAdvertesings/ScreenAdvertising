//
//  AdvertisingScreenBuilder.swift
//  GDAdvertising
//
//  Copyright © 2022 Developer. All rights reserved.
//
import UIKit
import Architecture

final public class AdvertisingScreenViewControllerBuilder: BuilderProtocol {
    
    public typealias V  = AdvertisingScreenViewController
    public typealias VM = AdvertisingScreenViewModel
    
    public var view       : AdvertisingScreenViewController
    public var viewManager: AdvertisingScreenViewModel
    
    public static func create() -> AdvertisingScreenViewControllerBuilder {
        let viewController = AdvertisingScreenViewController()
        let viewManager    = AdvertisingScreenViewModel(
            advertisingWebViewDelegate: AdvertisingWebViewDelegate()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = AdvertisingScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: AdvertisingScreenViewController,
        with viewManager: AdvertisingScreenViewModel
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

