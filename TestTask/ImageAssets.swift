//
//  ImageAssets.swift
//  TestTask
//
//  Created by Lazaro Jesus Marin Scull on 18.12.24.
//

import SwiftUI
import UIKit

public extension Image {
   enum ImageType {
      case asset(String)
      case system(String)
   }
   
   init(asset: ImageType) {
      switch asset {
      case .asset(let name):
         self.init(name)
      case .system(let name):
         self.init(systemName: name)
      }
   }
}

extension Image.ImageType {
   // from system
   public static let usersTabBarIcon = Self.system("person.3.sequence.fill")
   public static let signupTabBarIcon = Self.system("person.crop.circle.fill.badge.plus")
   
   // from assets
   public static let splashLogo = Self.asset("SplashLogo")
   public static let closeIcon = Self.asset("CloseIcon")
   public static let noUsers = Self.asset("NoUsers")
   public static let noInternetConnection = Self.asset("NoInternetConnection")
   public static let successRegister = Self.asset("SuccessRegister")
   public static let failureRegister = Self.asset("FailureRegister")
}

extension UIImage {
   public convenience init?(
      asset: Image.ImageType,
      symbolConfiguration: UIImage.SymbolConfiguration? = nil
   ) {
      switch asset {
      case .asset(let name):
         self.init(named: name)
      case .system(let name):
         self.init(systemName: name, withConfiguration: symbolConfiguration)
      }
   }
}
