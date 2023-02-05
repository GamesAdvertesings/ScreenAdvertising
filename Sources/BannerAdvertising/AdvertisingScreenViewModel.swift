//
//  AdvertisingScreenViewModel.swift
//  GDAdvertising
//
//  Copyright © 2022 Developer. All rights reserved.
//
import Combine
import Foundation
import VVMLibrary

final public class AdvertisingScreenViewModel: ViewModel<AdvertisingScreenViewController> {
    
    var viewProperties: AdvertisingScreenViewController.ViewProperties?
    
    // MARK: - public properties -
    public let closeAction: CurrentValueSubject<Bool, Never> = .init(false)
    
    // MARK: - private properties -
    private let advertisingWebViewDelegate: AdvertisingWebViewDelegate
   
    
    init(
        advertisingWebViewDelegate: AdvertisingWebViewDelegate
    ) {
        self.advertisingWebViewDelegate = advertisingWebViewDelegate
    }
    
    //MARK: - Main state view model
    public enum State {
        case createViewProperties(String)
        case close(Bool)
    }
    
    public var state: State? {
        didSet { self.stateModel() }
    }
    
    private func stateModel() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let urlString):
                let tapForward: ClosureEmpty = {
                    self.advertisingWebViewDelegate.webView?.goForward()
                }
                let tapBack: ClosureEmpty = {
                    self.advertisingWebViewDelegate.webView?.goBack()
                }
                viewProperties = AdvertisingScreenViewController.ViewProperties(
                    delegate: advertisingWebViewDelegate,
                    urlString: urlString,
                    tapForward: tapForward,
                    tapBack: tapBack,
                    closeAction: closeAction
                )
                create?(viewProperties)
            case .close(let isClose):
                closeAction.send(isClose)
        }
    }
}
