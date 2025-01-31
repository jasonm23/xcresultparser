//
//  MDResultFormatter.swift
//
//  Created by Alex da Franca on 31.05.22.
//

import Foundation

public struct MDResultFormatter: XCResultFormatting {
    private let indentWidth = "  "
    public let testFailIcon = "⨉&nbsp;&nbsp;"
    public let testPassIcon = "✓&nbsp;&nbsp;"

    public init() { }

    public func documentPrefix(title: String) -> String {
        return ""
    }
    public var documentSuffix: String {
        return ""
    }
    public var accordionOpenTag: String {
        return ""
    }
    public var accordionCloseTag: String {
        return ""
    }
    public var tableOpenTag: String {
        return ""
    }
    public var tableCloseTag: String {
        return ""
    }
    public var divider: String {
        return "\n- - -\n"
    }
    public func resultSummaryLine(_ item: String, failed: Bool) -> String {
        return "- \(item.escapingQuotes)"
    }
    public func resultSummaryLineWarning(_ item: String, hasWarnings: Bool) -> String {
        return "- \(hasWarnings ? "⚠" : "") \(item.escapingQuotes)"
    }
    public func testConfiguration(_ item: String) -> String {
        return ""
    }
    public func testTarget(_ item: String, failed: Bool) -> String {
        return "### \(item.escapingQuotes)\n"
    }
    public func testClass(_ item: String, failed: Bool) -> String {
        return "### \(item.escapingQuotes)\n"
    }
    public func singleTestItem(_ item: String, failed: Bool) -> String {
        return "- \(item.escapingQuotes)"
    }
    public func failedTestItem(_ item: String, message: String) -> String {
        return """
        - \(item.escapingQuotes)
          - \(message.escapingQuotes)
        """
    }
    public func codeCoverageTargetSummary(_ item: String) -> String {
        return item.escapingQuotes
    }
    public func codeCoverageFileSummary(_ item: String) -> String {
        return "## \(item.escapingQuotes)"
    }
    public func codeCoverageFunctionSummary(_ items: [String]) -> String {
        return "### \(items.joined(separator: " ").escapingQuotes)"
    }
}

private extension String {
    var escapingQuotes: String {
        return self.replacingOccurrences(of: "\"", with: "\\\"")
    }
}
