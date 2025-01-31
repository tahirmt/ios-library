import Foundation
import SwiftUI
import Combine

@available(iOS 13.0.0, tvOS 13.0, *)
struct CheckboxController : View {
    let model: CheckboxControllerModel
    let constraints: ViewConstraints
    
    @State private var cancellable: AnyCancellable?
    @EnvironmentObject var parentFormState: FormState
    @State var checkboxState: CheckboxState

    init(model: CheckboxControllerModel, constraints: ViewConstraints) {
        self.model = model
        self.constraints = constraints
        self.checkboxState = CheckboxState(minSelection: self.model.minSelection,
                                           maxSelection: self.model.maxSelection)
    }

    var body: some View {
        ViewFactory.createView(model: self.model.view, constraints: constraints)
            .environmentObject(checkboxState)
            .constraints(constraints)
            .background(model.backgroundColor)
            .border(model.border)
            .viewAccessibility(label: self.model.contentDescription)
            .onAppear {
                self.cancellable = self.checkboxState.$selectedItems.sink { incoming in
                    let selected = Array(incoming)
                    let isFilled = selected.count >= (self.model.minSelection ?? 0)
                            && selected.count <= (self.model.maxSelection ?? Int.max)
                    
                    let isValid = isFilled || (selected.count == 0 && self.model.isRequired == false)
                    
                    let data = FormInputData(self.model.identifier,
                                             value: .multipleCheckbox(selected),
                                             isValid: isValid)
                
                    self.parentFormState.updateFormInput(data)
                }
            }
    }
}
