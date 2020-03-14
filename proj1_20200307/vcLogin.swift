//
//  vcLogin.swift
//  proj1_20200307
//
//  Created by 변윤섭 on 2020/03/07.
//  Copyright © 2020 변윤섭. All rights reserved.
//

import UIKit
import AuthenticationServices

class vcLogin: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        btnApplelogin()
    }
    
    func btnApplelogin(){
        
        let btnApple = ASAuthorizationAppleIDButton(type: .signUp, style: .white)
        
        btnApple.cornerRadius = 10
        btnApple.translatesAutoresizingMaskIntoConstraints = false
        btnApple.addTarget(self, action: #selector(appleBtnClicked), for: .touchUpInside)
        view.addSubview(btnApple)
        
        //오토레이아웃
        NSLayoutConstraint.activate([
            //버튼을 view.centerYAncho 기준 Y축중앙에
            btnApple.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnApple.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnApple.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        
        ])
        
    }
    
    @objc func appleBtnClicked(){
        
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        
        controller.performRequests()
    }
}

extension vcLogin : ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("something had happened, \(error)")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let credentials = authorization.credential as? ASAuthorizationAppleIDCredential {
        
//            userInformationLabel.text = """
//            \(credentials.email)
//            \(credentials.fullName)
//            \(credentials.user) // uid,
//            """
            
            let ud = UserDefaults.standard
            ud.set(credentials.email, forKey: "userEmail")
            ud.set(credentials.fullName, forKey: "userFullName")
            ud.set(credentials.user, forKey: "userUid")
            
            print(credentials.user, credentials.fullName, credentials.user)
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
