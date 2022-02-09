//
//  DetailInfoView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/08.
//

import UIKit

class DetailInfoView: UIView {
    
    // MARK: - Create UI
    
    let mainTitleLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.font = .systemFont(ofSize: 10, weight: .bold)
        lb.textColor = ColorTheme.customLightPink.color
        lb.textAlignment = .center
        
        return lb
    }()
    
    let contentLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.font = .systemFont(ofSize: 9, weight: .regular)
        lb.textColor = ColorTheme.customDarkPink.color
        lb.textAlignment = .center
        
        return lb
    }()
    
    // MARK: - Setup UI
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError(ErrorMessage.unavailable)
    }
    
    func setup() {
        configureDetailInfoView()
    }
    
    func addViews() {
        addSubview(mainTitleLabel)
        addSubview(contentLabel)
    }
    
    func setConstraints() {
        mainTitleLabelConstraints()
        contentLabelConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func mainTitleLabelConstraints() {
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        mainTitleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mainTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func contentLabelConstraints() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
    }
}

