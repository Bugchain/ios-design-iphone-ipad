//
//  ViewController.swift
//  DesignIphoneIpadDemo
//
//  Created by Chainarong Chaiyaphat on 6/20/18.
//  Copyright © 2018 Chainarong Chaiyaphat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setVideoBackground()
        setButtonInterface(signInButton)
        setButtonInterface(createAccountButton)
        // setButtonInterface(facebookButton)
        
        facebookButton.layer.cornerRadius = 4
        
        setTextFieldInterface(emailTextField)
        setTextFieldInterface(passwordTextField)
    }

    private func setVideoBackground() {
        let htmlName = "WebViewContent"
        guard let htmlPath = Bundle.main.path(forResource: htmlName, ofType: "html") else { return }
        let htmlURL = URL(fileURLWithPath: htmlPath)
        guard let html = try? Data(contentsOf: htmlURL) else { return }
        
        self.webView.load(html, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: htmlURL.deletingLastPathComponent())
    }

    private func setButtonInterface(_ button: UIButton) {
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
    }
    
    private func setTextFieldInterface(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        
        textField.placeholderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.setPadding()
    }
    
    
}

extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedStringKey: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
    
    func setPadding() {
        let paddingView     = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView       = paddingView
        self.leftViewMode   = .always
    }
    
}


