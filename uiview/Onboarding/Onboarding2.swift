//
//  OnboardingSecond.swift
//  uiview
//
//  Created by macbook on 16.10.2023.
//

import UIKit

final class Onboarding2: UIViewController {
    
    // MARK: - UI
    private let background: UIImageView = {
        let image = UIImage(resource: .background)
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = image
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 21)
        button.titleLabel?.textAlignment = .center
        button.setBackgroundImage(.buttonNextOnboarding, for: .normal)
        button.setBackgroundImage(.buttonNextOnboarding, for: .highlighted)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    private let imageView: UIImageView = {
        let image = UIImage(resource: .cropTwoscreen)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // iphone 12+
        imageView.image = image
        return imageView
    }()
    private let shadowView: UIImageView = {
        let image = UIImage(resource: .shadow)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // iphone 12+
        imageView.image = image
        return imageView
    }()
    private let titleWhite: UILabel = {
        let label = UILabel()
        label.text = "it always nice to see any feedback of yours!\nThat’s how the app becomes better in time!"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont(name: "Inter-Medium", size: 20)
        return label
    }()
    private let titleBlack: UILabel = {
        let label = UILabel()
        label.text = "Our goal\nis happy user"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont(name: "Inter-Bold", size: 39)
        return label
    }()
    private let containerView = UIView()

    // MARK: - Constructor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        addView()
        setConstraints()
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    
    /// - Add View
    private func addView() {
        view.addSubview(background)
        view.addSubview(containerView)
        containerView.addSubview(imageView)
        view.addSubview(shadowView)
        view.addSubview(button)
        view.addSubview(titleWhite)
        view.addSubview(titleBlack)
    
    }
    
    
    // MARK: Set Contstraints
    
    private func setConstraints() {
        let boundsScreen = UIScreen.main.bounds
        let widthScreen = boundsScreen.size.width
        let heightScreen = boundsScreen.size.height
        
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.width.equalTo(334).multipliedBy(widthScreen/100)
            $0.height.equalTo(105).multipliedBy(heightScreen/100)
            $0.centerX.equalToSuperview()
        }
        titleWhite.snp.makeConstraints {
            $0.bottom.equalTo(button.snp.top).inset(-18)
            $0.left.right.equalToSuperview().inset(65)
            $0.centerX.equalToSuperview()
        }
        titleBlack.snp.makeConstraints {
            $0.bottom.equalTo(titleWhite.snp.top).inset(-14)
            $0.left.right.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview()
        }
        containerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(titleBlack.snp.top)
        }
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        shadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension Onboarding2: OnboardingProtocol {
    @objc
    func buttonDidTap() {
        let nextVC = Onboarding3()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
