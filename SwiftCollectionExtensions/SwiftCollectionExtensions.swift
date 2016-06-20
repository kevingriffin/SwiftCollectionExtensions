public extension SequenceType {
  func all(predicate: (Self.Generator.Element -> Bool)) -> Bool {
    for item in self {
      if !predicate(item) {
        return false
      }
    }
    return true
  }

  func any(predicate: (Self.Generator.Element -> Bool)) -> Bool {
    for item in self {
      if predicate(item) {
        return true
      }
    }
    return false
  }

  func divide(predicate: (Self.Generator.Element -> Bool)) -> (left: [Self.Generator.Element], right: [Self.Generator.Element]) {
    var left:  [Self.Generator.Element] = []
    var right: [Self.Generator.Element] = []

    for item in self {
      if predicate(item) {
        left.append(item)
      }
      else {
        right.append(item)
      }
    }

    return (left, right)
  }


  func reject(predicate: (Self.Generator.Element) -> Bool) -> [Self.Generator.Element]
  {
    return self.filter({!predicate($0)})
  }

}
