import Foundation

extension String {
    public func applyMask(with format: String) -> String {
        let replacmentCharacter: Character = "#"
        let onlyASCII = self.filter { $0.isASCII }

        var pureNumber = onlyASCII.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< format.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: onlyASCII)
            let patternCharacter = format[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
            
            if pureNumber.count == format.count {
                break
            }
        }
        
        return pureNumber
    }
}
