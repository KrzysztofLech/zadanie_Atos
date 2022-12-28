//  LoginViewController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol LoginViewControllerDelegate: AnyObject {
    func logged()
}

internal class LoginViewController: UIViewController {
    @IBOutlet private var loginButton: UIButton!
    private let viewModel: LoginViewModelProtocol
    private weak var delegate: LoginViewControllerDelegate?

    internal init(viewModel: LoginViewModelProtocol, delegate: LoginViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required internal init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Logger.log(info: "Deinit LoginViewController")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction private func didTapOnLoginButton() {
        viewModel.login {
            delegate?.logged()
        }
    }
}
