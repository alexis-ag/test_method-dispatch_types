import Foundation

extension Date {
    var toNanosecs: Int64 {
        Int64(timeIntervalSince1970 * 1_000_000)
    }

    static var currentNanosecs: Int64 {
        Date().toNanosecs
    }
}