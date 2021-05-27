import Foundation

func firstPart(groupsTmp: Array<String>) -> Int {  
    let groups = groupsTmp.map { $0.replacingOccurrences(of: "\n", with: "") }

    var sumOfCounts = 0

    for group in groups {
        sumOfCounts += Set(group).count
    }

    return sumOfCounts
}

func secondPart(groupsTmp: Array<String>) -> Int {
    let groups = groupsTmp.map { $0.components(separatedBy: "\n") }

    var sumOfCounts = 0

    for group in groups {
        var firstAnswers = Set(group[0].map { String($0) })

        for answers in group {
            let answersStrAry = answers.map{ String($0) }

            firstAnswers.formIntersection(answersStrAry)   
        }

        sumOfCounts += firstAnswers.count
    }

    return sumOfCounts
}

if let path = Bundle.main.path(forResource: "input", ofType: "txt")  {
    let fileData = try String(contentsOfFile: path, encoding: .utf8)
    let groups = fileData.components(separatedBy: "\n\n")
    
    print("First part: \(firstPart(groupsTmp: groups))")
    print("Second part: \(secondPart(groupsTmp: groups))")
}