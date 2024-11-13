import Testing

@testable import Cora

@Suite("LoginPasswordViewModelSpec", .serialized, .tags(.login))
final class LoginPasswordViewModelSpec {
    private lazy var coordinatorSpy = CoordinatorPasswordSpy()
    private lazy var serviceSpy = LoginServiceSpy()
    private lazy var sut = LoginPasswordViewModel(coordinator: self.coordinatorSpy,
                                                  service: self.serviceSpy)
    
    enum Scenes: String, CaseIterable {
        case calledNextWithInvalidPassword, calledNextWithValidPassword
    }
    
    @Test("next", arguments: Scenes.allCases)
    func next(scenes: Scenes) async throws {
        buildNextScenes(scenes: scenes)
        sut.next()
        
        switch scenes {
        case .calledNextWithInvalidPassword:
            break
        case .calledNextWithValidPassword:
            let event: MainEvent = try await withCheckedThrowingContinuation { continuation in
                coordinatorSpy.trackEvent = { event in
                    continuation.resume(returning: event)
                }
            }
            
            #expect(event == .statement)
        }
    }
    
    private func buildNextScenes(scenes: Scenes) {
        switch scenes {
        case .calledNextWithInvalidPassword:
            self.serviceSpy.isSuccess = false
            sut.passwordDidChange(text: "")
        case .calledNextWithValidPassword:
            self.serviceSpy.isSuccess = true
            sut.passwordDidChange(text: "11111111")
        }
    }
    
    private class CoordinatorPasswordSpy: MainCoordinatorProtocol {
        var trackEvent: ((MainEvent) -> Void)?
        
        func handle(event: MainEvent) {
            trackEvent?(event)
        }
    }
    
    private class LoginServiceSpy: LoginServiceProtocol {
        var data: String = "",
            isSuccess: Bool = false
        
        func saveData(data: String, key: String) {
            self.data = data
        }
        
        func getData(key: String) -> String {
            data
        }
        
        func login() async -> AuthResponse? {
            isSuccess ? AuthResponse(token: "token") : nil
        }
    }
}
