import Combine
import CoreData
import SwiftUI

public struct ___FILEBASENAMEASIDENTIFIER___: View {

    @ObservedObject private var viewModel: ___VARIABLE_screenName___.ViewModel

    init(viewModel: ___VARIABLE_screenName___.ViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ViewModelSyncedView(loggingPrefix: "___VARIABLE_screenName___.View", viewModel: self.viewModel) {
            ___VARIABLE_appName___RenderableCollectionView(renderable: self.viewModel.renderingModels) { models in
                self.exampleList(models).erased()
            }
        }
    }
}

private extension ___VARIABLE_screenName___.View {
    private func exampleList(_ renderingModels: [___VARIABLE_screenName___.RenderingModel]) -> some View {
        List {
            Section(header: Text("___VARIABLE_screenName___.View")) {
                ForEach(renderingModels) { renderingModel in
                    Text("renderingModel, id: \(renderingModel.id)")
                        .truncationMode(.head)
                        .listRowBackground(Color.random)
                    Text("renderingModel, hash: \(renderingModel.hashValue)")
                        .truncationMode(.head)
                        .listRowBackground(Color.random)
                }
            }
        }
    }
}

// MARK: - SwiftUI's PreviewProvider and it's extensions

struct SwiftUIPreview___VARIABLE_appName______VARIABLE_screenName___View: PreviewProvider {
    static var previews: some View {
        Group {
            iPhonePreviewGroup(with: ___VARIABLE_screenName___.View(viewModel:
                SwiftUIMock___VARIABLE_appName______VARIABLE_screenName___ViewModel(.content(content: [
                  ___VARIABLE_screenName___.RenderingModel(id: -1),
                  ___VARIABLE_screenName___.RenderingModel(id: -1),
                  ___VARIABLE_screenName___.RenderingModel(id: -1),
                ]))
            ))
            ___VARIABLE_screenName___.View(viewModel:
                SwiftUIMock___VARIABLE_appName______VARIABLE_screenName___ViewModel(.loading)
            )
            ___VARIABLE_screenName___.View(viewModel:
                SwiftUIMock___VARIABLE_appName______VARIABLE_screenName___ViewModel(.failure(error: .genericError))
            )
        }
    }
}

// MARK: - Architecture mocks for SwiftUI's PreviewProvider

private class SwiftUIMock___VARIABLE_appName______VARIABLE_screenName___ViewModel: ___VARIABLE_screenName___.ViewModel {
    private let mockRenderables: ___VARIABLE_screenName___.ViewModel.Renderables

    init(_ mocks: ___VARIABLE_screenName___.ViewModel.Renderables) {
        mockRenderables = mocks
        super.init(interactor: SwiftUIMock___VARIABLE_appName______VARIABLE_screenName___Interactor())
    }

    override var renderingModels: ___VARIABLE_screenName___.ViewModel.Renderables {
        mockRenderables
    }
}

private class SwiftUIMock___VARIABLE_appName______VARIABLE_screenName___Interactor: ___VARIABLE_screenName___.Interactor {
    let models: ___VARIABLE_screenName___.Interactor.RenderablesPublisher = Empty().eraseToAnyPublisher()
}
