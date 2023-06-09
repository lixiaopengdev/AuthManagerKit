//
//  CSAuthBaseView.swift
//  AuthManagerKit
//
//  Created by li on 5/15/23.
//
public enum AuthViewStyle {
    case authViewStylePhoneNumber
    case authViewStyleVerificationCode
    case authViewStyleInviteCode
    case authViewStyleLoginPassword
    case authViewStyleForgetPNumber
    case authViewStyleForgetVCode
    case authViewStyleResetPassword
    case authViewStyleResetSuccess
}

typealias SignUpHandler = () -> Void
typealias StartHandler = () -> Void
typealias AppleLoginHandler = () -> Void
typealias DiscordLoginHandler = () -> Void
typealias CountryHandler = (_ navigationController: UINavigationController) -> Void


typealias NextHandler = (_ viewStyle:AuthViewStyle, _ dict:Dictionary<String, Any>) -> Void

protocol KeyboardObserver: AnyObject {
    func keyboardWillShow(_ notification: Notification,_ intersectFrame:CGRect)
    func keyboardWillHide(_ notification: Notification)
}

public class CSAuthBaseView: UIView {
    var nextHandler: NextHandler?
    var paramsDict = Dictionary<String, Any>()
    weak var observer: KeyboardObserver?
    init(frame: CGRect, paramsDict:Dictionary<String, Any>) {
        super.init(frame: frame)
        self.paramsDict = paramsDict
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    required init?(coder: NSCoder) {
        self.paramsDict = .init()
        super.init(coder: coder)
    }
    
    public lazy var nextButton : UIButton = {
        let nextButton = UIButton()
        nextButton.setBackgroundImage(UIImage.bundleImage(named: "next_icon"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
//        nextButton.isEnabled = false
        return nextButton
    }()
    
    @objc func nextButtonAction() {
        
    }
    

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }

        let window = UIApplication.shared.windows.first!
        let intersectFrame = window.convert(self.frame, to: self).intersection(keyboardFrame)

        observer?.keyboardWillShow(notification, intersectFrame)
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        observer?.keyboardWillHide(notification)
    }
}

