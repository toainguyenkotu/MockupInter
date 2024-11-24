// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Blog
  internal static let blog = L10n.tr("Localizable", "blog", fallback: "Blog")
  /// Error
  internal static let error = L10n.tr("Localizable", "error", fallback: "Error")
  /// Follower
  internal static let follower = L10n.tr("Localizable", "follower", fallback: "Follower")
  /// Following
  internal static let following = L10n.tr("Localizable", "following", fallback: "Following")
  /// OK
  internal static let ok = L10n.tr("Localizable", "ok", fallback: "OK")
  internal enum Error {
    /// Occur an error
    internal static let message = L10n.tr("Localizable", "error.message", fallback: "Occur an error")
  }
  internal enum Navigation {
    /// Github Users
    internal static let user = L10n.tr("Localizable", "navigation.user", fallback: "Github Users")
    internal enum User {
      /// User Details
      internal static let details = L10n.tr("Localizable", "navigation.user.details", fallback: "User Details")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
