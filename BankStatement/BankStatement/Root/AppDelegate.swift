import CoraClient
import CoraClientInterfaces
import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerDependencies()
        return true
    }
    
    private func registerDependencies() {
        DependencyContainer {
            Module {
                ApiClientFactory.build() as ApiClientProtocol
            }
        }.build()
    }
}
