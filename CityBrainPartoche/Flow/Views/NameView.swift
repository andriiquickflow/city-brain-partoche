import SwiftUI

struct NameView: View {
    
    @State private var name: String
    @State private var showErrorAlert: Bool = false
    @FocusState private var focused: Bool

    private var handleSave: () -> Void
    
    @Environment(\.presentationMode) private var presentationMode
    
    init(handleSave: @escaping () -> Void) {
        self.name = Storage.shared.name
        self.handleSave = handleSave
    }
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            if #available(iOS 16.0, *) {
                content
                    .presentationDetents([.height(180)])
                    .presentationDragIndicator(.visible)
            } else {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Enter your name:")
                .fontSystem(.title)
                .foregroundStyle(.accent)
            ZStack {
                Color.white.opacity(0.1)
                TextField("Name", text: $name, prompt: Text("Name:").foregroundColor(.tertiary))
                    .focused($focused)
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled()
                    .foregroundStyle(.accent)
                    .fontSystem(.text)
                    .padding(.horizontal, 12)
            }
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: .mainCornerRadius)
                    .inset(by: 1)
                    .stroke(Color.accent, lineWidth: 2)
            )
            .cornerRadius(.mainCornerRadius)
            Button("Save", action: save)
                .primary
        }
        .padding(12)
        .onAppear {
            focused = true
        }
        .alert("Please enter a valid name", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    func save() {
        if name.count >= 3 {
            Storage.shared.name = name
            handleSave()
            presentationMode.wrappedValue.dismiss()
        } else {
            showErrorAlert = true
        }
    }
}
