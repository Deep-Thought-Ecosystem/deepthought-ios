

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // Email / Password
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3)))
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3)))

                // Login button (primary)
                Button {
                    // handle login
                } label: {
                    HStack {
                        Image(systemName: "lock.fill")
                        Text("Entrar")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 56)
                }
                .buttonStyle(PrimaryCapsuleButton())

                // Divider
                Rectangle()
                    .fill(Color.black.opacity(0.85))
                    .frame(height: 1)
                    .padding(.vertical, 12)

                // Providers (outlined, pill, left icon)
                ProviderButton(title: "Continuar com o Google",
                               icon: Image("google"),        // asset colorido
                               iconIsTemplate: false) { }

                ProviderButton(title: "Continuar com a conta Microsoft",
                               icon: Image("microsoft"),     // asset colorido
                               iconIsTemplate: false) { }

                ProviderButton(title: "Continuar com a Apple",
                               icon: Image(systemName: "apple.logo"),
                               iconIsTemplate: true) { }

                ProviderButton(title: "Continuar com o telefone",
                               icon: Image(systemName: "phone.fill"),
                               iconIsTemplate: true) { }

                ProviderButton(title: "Continuar com o Facebook",
                               icon: Image("facebook"),      // asset colorido
                               iconIsTemplate: false) { }

                ProviderButton(title: "Continuar com o LinkedIn",
                               icon: Image("linkedin"),      // asset colorido
                               iconIsTemplate: false) { }

                ProviderButton(title: "Continuar com o GitHub",
                               icon: Image("github"),        // asset monocromático
                               iconIsTemplate: true) { }
                    .padding(.bottom, 16)
            }
            .padding(16)
        }
        .background(Color(.systemBackground))
    }
}

// MARK: - Styles & Reusable Views

struct PrimaryCapsuleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(Color.accentColor)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

/// Outlined, pill-shaped provider button with left icon (like your Android MaterialButton)
struct ProviderButton: View {
    let title: String
    let icon: Image
    /// If true, the image uses template rendering (tinted by foreground color).
    /// For multi-color icons (Google/Microsoft), pass false and provide colored assets.
    let iconIsTemplate: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                icon
                    .renderingMode(iconIsTemplate ? .template : .original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(title)
                    .foregroundStyle(Color(red: 0.125, green: 0.129, blue: 0.141)) // #202124
                    .fontWeight(.semibold)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(Color.gray.opacity(0.25), lineWidth: 1)
            )
            .clipShape(Capsule())
            .contentShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

// Preview
#Preview {
    ContentView()
}
