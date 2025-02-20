import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  window?.rootViewController?.view.backgroundColor = UIColor.clear 
  window?.rootViewController?.view.isOpaque = false 
  return super.application(application, didFinishLaunchingWithOptions: launchOptions) 
  }
}
