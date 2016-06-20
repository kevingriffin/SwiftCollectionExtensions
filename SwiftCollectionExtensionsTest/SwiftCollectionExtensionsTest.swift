import Quick
import Nimble

class SwiftCollectionExtensionsSpec: QuickSpec {
  override func spec() {
    let array = [1,2,3,4,5]
    
    describe("all") {
      context("empty collection") {
        it("returns true") {
          let empty: [Int] = []
          expect(empty.all({i in false})).to(equal(true))
        }
      }
      
      context("non-empty collection") {
        it("returns true when all elements pass") {
          expect(array.all({i in i < 10})).to(equal(true))
        }
        
        it("returns false when some elements do not pass") {
          expect(array.all({i in i < 4})).to(equal(false))
        }
        
        it("returns false when not all elements pass") {
          expect(array.all({i in i == 0})).to(equal(false))
        }
        
        it("returns false when the last element does not pass") {
          expect(array.all({i in i < 5})).to(equal(false))
        }
      }
    }
    
    describe("any") {
      context("empty collection") {
        it("returns false") {
          let empty: [String] = []
          expect(empty.any({e in true})).to(equal(false))
        }
      }
      
      context("non-empty collection") {
        it("returns true when the first element passes") {
          expect(array.any({i in i < 2})).to(equal(true))
        }
        
        it("returns true when the last element passes") {
          expect(array.any({i in i > 4})).to(equal(true))
        }
        
        it("returns false when no elements pass") {
          expect(array.any({i in i < 0})).to(equal(false))
        }
      }
    }
  }
}
