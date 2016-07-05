//
//  ViewController.swift
//  Calculator
//
//  Created by Jerel Miller on 7/4/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var display: UILabel?

  @IBAction func touchDigit(sender: UIButton) {
    let digit = sender.currentTitle!
    let textCurrentlyInDisplay = display!.text!

    display!.text = textCurrentlyInDisplay + digit
  }
}