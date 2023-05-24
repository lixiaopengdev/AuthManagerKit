
import UIKit
import CSBaseView

class CSLoginPhoneViewController: BaseViewController {
    var authViewStyle:AuthViewStyle?
    var paramsDict = Dictionary<String, Any>()
    
    public required init(authViewStyle: AuthViewStyle, paramsDict: Dictionary<String ,Any>) {
        super.init(nibName: nil, bundle: nil)
        self.authViewStyle = authViewStyle
        self.paramsDict = paramsDict
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch (self.authViewStyle) {
        case .some(.authViewStylePhoneNumber):
            self.view.addSubview(self.phoneView)
            break
        case .some(.authViewStyleVerificationCode):
            self.view.addSubview(self.verificationView)
            break
        case .some(.authViewStyleInviteCode):
            self.view.addSubview(self.inviteCodeView)
            break
        case .some(.authViewStyleLoginPassword):
            self.view.addSubview(self.loginPasswordView)
            break
        case .some(.authViewStyleForgetPNumber):
            self.view.addSubview(self.resetPhoneView)
            break
        case .some(.authViewStyleForgetVCode):
            self.view.addSubview(self.resetVcodeView)
            break
        case .some(.authViewStyleResetPassword):
            self.view.addSubview(self.resetPasswordView)
            break
        case .some(.authViewStyleResetSuccess):
            self.view.addSubview(self.resetSuccessView)
            break
        case .none:
            break
        }
    }
    
    private lazy var phoneView:CSPhoneNumberView = {
        let phoneView = CSPhoneNumberView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        phoneView.countryHandler = { navigationController in
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
        phoneView.nextHandler = { authViewStyle , dict in
            let vC = CSLoginPhoneViewController(authViewStyle: .authViewStyleVerificationCode, paramsDict: dict)
            self.navigationController?.pushViewController(vC, animated: true)
        }
        return phoneView
    }()
    
    private lazy var verificationView:CSVerificationCodeView = {
        let verificationView = CSVerificationCodeView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        verificationView.nextHandler = { authViewStyle, paramsDict in
            let vC = CSLoginPhoneViewController(authViewStyle: .authViewStyleInviteCode, paramsDict: paramsDict)
            self.navigationController?.pushViewController(vC, animated: true)
        }
        verificationView.passwordHandler = {paramsDict in
            let vC = CSLoginPhoneViewController(authViewStyle: .authViewStyleLoginPassword, paramsDict: paramsDict)
            self.navigationController?.pushViewController(vC, animated: true)
        }
        return verificationView
    }()
    
    private lazy var inviteCodeView: CSInviteCodeView = {
        let inviteCodeView = CSInviteCodeView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        inviteCodeView.nextHandler = { authViewStyle, paramsDict in
            
        }
        return inviteCodeView
    }()
    
    private lazy var loginPasswordView: CSLoginPasswordView = {
        let loginPasswordView = CSLoginPasswordView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        loginPasswordView.nextHandler = { authViewStyle, paramsDict in
            
            
        }
        return loginPasswordView
    }()
    
    private lazy var resetPhoneView: CSResetPNumberView = {
        let resetPhoneView = CSResetPNumberView(frame: CGRectMake(0, 0, self.view.bounds.size.height,self.view.bounds.size.height), paramsDict: self.paramsDict)
        
        resetPhoneView.countryHandler = { navigationController in
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
        resetPhoneView.nextHandler = { authViewStyle , dict in
            let vC = CSLoginPhoneViewController(authViewStyle: .authViewStyleForgetPNumber, paramsDict: dict)
            self.navigationController?.pushViewController(vC, animated: true)
        }
        return resetPhoneView
    }()
    
    
    private lazy var resetVcodeView: CSResetVCodeView = {
        let resetVcodeView = CSResetVCodeView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        resetVcodeView.nextHandler = { authViewStyle, paramsDict in
            
        }
        return resetVcodeView
    }()
    
    private lazy var resetPasswordView: CSResetPasswordView = {
        let resetPassword = CSResetPasswordView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        resetPassword.nextHandler = {authViewStyle, paramsDict in
            
        }
        return resetPassword
    }()
    
    private lazy var resetSuccessView: CSResetSuccessView = {
        let resetSuccessView = CSResetSuccessView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), paramsDict: self.paramsDict)
        resetSuccessView.nextHandler = {authViewStyle, paramsDict in
            
        }
        return resetSuccessView
    }()
}
