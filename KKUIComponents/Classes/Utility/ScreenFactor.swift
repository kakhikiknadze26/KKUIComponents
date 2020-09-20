//
//  ScreenFactor.swift
//  KKUIComponents
//
//  Created by Kakhi Kiknadze on 9/20/20.
//

import UIKit

/// Multiply value on screen factor to fit device. Default is `1`.
/// # Example
///  If you need to fit your view to be proportional on every device, you can set value like this.
///  ```
///  let view = UIView(frame: CGRect(x: 0,
///                                  y: 0,
///                                  width: 20 * screenFactor,
///                                  height: 40 * screenFactor))
///  ```
///
public var screenFactor: CGFloat = 1.0
