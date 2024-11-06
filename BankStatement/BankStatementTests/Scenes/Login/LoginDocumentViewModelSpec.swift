import Testing

@testable import BankStatement

@Suite("LoginDocumentViewModelSpec", .serialized, .tags(.login))
final class LoginDocumentViewModelSpec {
    private lazy var coordinatorSpy = CoordinatorSpy()
    private lazy var sut = LoginDocumentViewModel(coordinator: self.coordinatorSpy)
    
    enum Scenes: String, CaseIterable {
        case calledNextWithInvalidText, calledNextWithValidText
    }
    
    @Test("next", arguments: Scenes.allCases)
    func next(scenes: Scenes) {
        buildScenes(scenes: scenes)
        sut.next()
        
        switch scenes {
        case .calledNextWithInvalidText:
            #expect(coordinatorSpy.eventCalled == nil)
        case .calledNextWithValidText:
            #expect(coordinatorSpy.eventCalled == .password)
        }
    }
    
    private func buildScenes(scenes: Scenes) {
        switch scenes {
        case .calledNextWithInvalidText:
            self.coordinatorSpy.eventCalled = nil
            sut.documentDidChange(text: "")
        case .calledNextWithValidText:
            self.coordinatorSpy.eventCalled = nil
            sut.documentDidChange(text: "111.111.111-11")
        }
    }
    
    private class CoordinatorSpy: MainCoordinatorProtocol {
        var eventCalled: MainEvent?
        
        func handle(event: MainEvent) {
            self.eventCalled = event
        }
    }
}
