//
//  ViewController.swift
//  JKSwitch
//
//  Created by 김종권 on 2022/06/01.
//

import UIKit

class ViewController: UIViewController {
  private let jkSwitchOne: JKSwitch = {
    let view = JKSwitch()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let jkSwitchTwo: JKSwitch = {
    let view = JKSwitch()
    view.barTintColor = .red
    view.circleColor = .orange
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.jkSwitchOne)
    self.view.addSubview(self.jkSwitchTwo)
    
    NSLayoutConstraint.activate([
      self.jkSwitchOne.heightAnchor.constraint(equalToConstant: 70),
      self.jkSwitchOne.widthAnchor.constraint(equalToConstant: 200),
      self.jkSwitchOne.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
      self.jkSwitchOne.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    NSLayoutConstraint.activate([
      self.jkSwitchTwo.heightAnchor.constraint(equalToConstant: 50),
      self.jkSwitchTwo.widthAnchor.constraint(equalToConstant: 100),
      self.jkSwitchTwo.topAnchor.constraint(equalTo: self.jkSwitchOne.bottomAnchor, constant: 80),
      self.jkSwitchTwo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
}
