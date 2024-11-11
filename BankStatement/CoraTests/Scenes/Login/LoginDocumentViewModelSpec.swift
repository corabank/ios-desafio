import Testing

@testable import Cora

@Suite("LoginDocumentViewModelSpec", .serialized, .tags(.login))
final class LoginDocumentViewModelSpec {
    private lazy var coordinatorSpy = CoordinatorDocumentSpy()
    private lazy var sut = LoginDocumentViewModel(coordinator: self.coordinatorSpy)
    
    enum Scenes: String, CaseIterable {
        case calledNextWithInvalidText, calledNextWithValidText
    }
    
    deinit {
        self.coordinatorSpy.eventCalled = nil
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
            sut.documentDidChange(text: "")
        case .calledNextWithValidText:
            sut.documentDidChange(text: "111.111.111-11")
        }
    }
    
    private class CoordinatorDocumentSpy: MainCoordinatorProtocol {
        var eventCalled: MainEvent?
        
        func handle(event: MainEvent) {
            self.eventCalled = event
        }
    }
}
