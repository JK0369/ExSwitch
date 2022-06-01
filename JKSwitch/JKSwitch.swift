//
//  JKSwitch.swift
//  JKSwitch
//
//  Created by 김종권 on 2022/06/01.
//

import UIKit

final class JKSwitch: UIControl {
  private enum Constant {
    static let duration = 0.25
  }
  
  // MARK: UI
  private let barView: RoundableView = {
    let view = RoundableView()
    view.backgroundColor = .gray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let circleView: RoundableView = {
    let view = RoundableView()
    view.backgroundColor = .white
    view.layer.shadowOffset = CGSize(width: 0, height: 3)
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.3
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: Properties
  var isOn = false {
    didSet {
      self.sendActions(for: .valueChanged)
      
      UIView.animate(
        withDuration: Constant.duration,
        delay: 0,
        options: .curveEaseInOut,
        animations: {
          self.barView.backgroundColor = self.isOn ? self.barTintColor : self.barColor
          
          self.circleViewConstraints.forEach { $0.isActive = false }
          self.circleViewConstraints.removeAll()
          
          if self.isOn {
            self.circleViewConstraints = [
              self.circleView.rightAnchor.constraint(equalTo: self.barView.rightAnchor),
              self.circleView.bottomAnchor.constraint(equalTo: self.barView.bottomAnchor),
              self.circleView.topAnchor.constraint(equalTo: self.barView.topAnchor),
              self.circleView.heightAnchor.constraint(equalTo: self.barView.heightAnchor),
              self.circleView.widthAnchor.constraint(equalTo: self.barView.heightAnchor)
            ]
          } else {
            self.circleViewConstraints = [
              self.circleView.leftAnchor.constraint(equalTo: self.barView.leftAnchor),
              self.circleView.bottomAnchor.constraint(equalTo: self.barView.bottomAnchor),
              self.circleView.topAnchor.constraint(equalTo: self.barView.topAnchor),
              self.circleView.heightAnchor.constraint(equalTo: self.barView.heightAnchor),
              self.circleView.widthAnchor.constraint(equalTo: self.barView.heightAnchor)
            ]
          }
          
          NSLayoutConstraint.activate(self.circleViewConstraints)
          self.layoutIfNeeded()
        },
        completion: nil
      )
    }
  }
  var barColor = UIColor.gray {
    didSet { self.barView.backgroundColor = self.barColor }
  }
  var barTintColor = UIColor.green
  var circleColor = UIColor.white {
    didSet { self.circleView.backgroundColor = self.circleColor }
  }
  private var circleViewConstraints = [NSLayoutConstraint]()
  
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("xib is not implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(self.barView)
    self.barView.addSubview(self.circleView)
    
    NSLayoutConstraint.activate([
      self.barView.leftAnchor.constraint(equalTo: self.leftAnchor),
      self.barView.rightAnchor.constraint(equalTo: self.rightAnchor),
      self.barView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      self.barView.topAnchor.constraint(equalTo: self.topAnchor),
    ])
    self.circleViewConstraints = [
      self.circleView.leftAnchor.constraint(equalTo: self.barView.leftAnchor),
      self.circleView.bottomAnchor.constraint(equalTo: self.barView.bottomAnchor),
      self.circleView.topAnchor.constraint(equalTo: self.barView.topAnchor),
      self.circleView.heightAnchor.constraint(equalTo: self.barView.heightAnchor),
      self.circleView.widthAnchor.constraint(equalTo: self.barView.heightAnchor)
    ]
    NSLayoutConstraint.activate(self.circleViewConstraints)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    self.isOn = !self.isOn
  }
}

final class RoundableView: UIView {
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.frame.height / 2
  }
}
