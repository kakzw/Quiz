//
//  QuizUITests.swift
//  QuizUITests
//
//  Created by Kento Akazawa on 4/23/24.
//

import XCTest

final class QuizUITests: XCTestCase {
  
  private var app: XCUIApplication!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    // UI tests must launch the application that they test.
    app = XCUIApplication()
    app.launch()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    app = nil
  }
  
  // MARK: - Test Multiple Choice Questions
  func testMCQuestions() {
    let q1 = "2 + 3 ="
    let choices1 = ["3", "4", "5", "6"]
    let q2 = "6 + 7 ="
    let choices2 = ["10", "11", "12", "13"]
    
    // choose multiple choice
    let mcBtn = app.buttons["Multiple Choice Questions"]
    XCTAssertTrue(mcBtn.exists)
    mcBtn.tap()
    
    // add question
    let addBtn = app.navigationBars["MC Question 1"].buttons["Add"]
    XCTAssertTrue(addBtn.exists)
    addBtn.tap()
    
    // enter question and choices
    let collectionView = app.collectionViews
    let questionField = collectionView.textFields["Question"]
    XCTAssertTrue(questionField.exists)
    questionField.tap()
    questionField.typeText("2 + 3 =")
    
    let c1Field = collectionView.textFields["Choice 1"]
    XCTAssertTrue(c1Field.exists)
    c1Field.tap()
    c1Field.typeText(choices1[0])
    
    let c2Field = collectionView.textFields["Choice 2"]
    XCTAssertTrue(c2Field.exists)
    c2Field.tap()
    c2Field.typeText(choices1[1])
    
    let c3Field = collectionView.textFields["Choice 3"]
    XCTAssertTrue(c3Field.exists)
    c3Field.tap()
    c3Field.typeText(choices1[2])
    
    let c4Field = collectionView.textFields["Choice 4"]
    XCTAssertTrue(c4Field.exists)
    c4Field.tap()
    c4Field.typeText(choices1[3])
    
    // pick 3rd one as answer
    let cell3 = collectionView.children(matching: .cell).element(boundBy: 3)
    XCTAssertTrue(cell3.exists)
    let cell3Btn = cell3.buttons["Square"]
    XCTAssertTrue(cell3Btn.exists)
    cell3Btn.tap()
    
    // save new question
    let addNavBar = app.navigationBars["Add Question"]
    XCTAssertTrue(addNavBar.exists)
    let saveBtn = addNavBar.buttons["Save"]
    XCTAssertTrue(saveBtn.exists)
    saveBtn.tap()
    
    // make sure new question is in list
    var c1Text = app.staticTexts[choices1[0]]
    XCTAssertTrue(c1Text.exists)
    var c2Text = app.staticTexts[choices1[1]]
    XCTAssertTrue(c2Text.exists)
    var c3Text = app.staticTexts[choices1[2]]
    XCTAssertTrue(c3Text.exists)
    var c4Text = app.staticTexts[choices1[3]]
    XCTAssertTrue(c4Text.exists)
    
    // edit questions
    let navBar = app.navigationBars["MC Question 1"]
    XCTAssertTrue(navBar.exists)
    let editBtn = navBar.buttons["Edit"]
    XCTAssertTrue(editBtn.exists)
    editBtn.tap()
    
    // enter question and choices
    XCTAssertTrue(questionField.exists)
    questionField.tap()
    questionField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: q1.count))
    questionField.typeText(q2)
    
    XCTAssertTrue(c1Field.exists)
    c1Field.tap()
    c1Field.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: choices1[0].count))
    c1Field.typeText(choices2[0])
    
    XCTAssertTrue(c2Field.exists)
    c2Field.tap()
    c2Field.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: choices1[1].count))
    c2Field.typeText(choices2[1])
    
    XCTAssertTrue(c3Field.exists)
    c3Field.tap()
    c3Field.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: choices1[2].count))
    c3Field.typeText(choices2[2])
    
    XCTAssertTrue(c4Field.exists)
    c4Field.tap()
    c4Field.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: choices1[3].count))
    c4Field.typeText(choices2[3])
    
    // pick 4th one as answer
    let cell4 = collectionView.children(matching: .cell).element(boundBy: 4)
    XCTAssertTrue(cell4.exists)
    let cell4Btn = cell4.buttons["Square"]
    XCTAssertTrue(cell4Btn.exists)
    cell4Btn.tap()
    
    // save edited question
    let editNavBar = app.navigationBars["Edit Question"]
    XCTAssertTrue(editNavBar.exists)
    let editSaveBtn = editNavBar.buttons["Save"]
    XCTAssertTrue(editSaveBtn.exists)
    editSaveBtn.tap()
    
    // make sure edited question is in list
    c1Text = app.staticTexts[choices2[0]]
    XCTAssertTrue(c1Text.exists)
    c2Text = app.staticTexts[choices2[1]]
    XCTAssertTrue(c2Text.exists)
    c3Text = app.staticTexts[choices2[2]]
    XCTAssertTrue(c3Text.exists)
    c4Text = app.staticTexts[choices2[3]]
    XCTAssertTrue(c4Text.exists)
  }
  
  // MARK: - Test True/False Questions
  func testTFQuestions() {
    let q1 = "2 + 3 = 5"
    let q2 = "The Earth is the largest planet in the solar system."
    
    // choose true/false
    let tfBtn = app.buttons["True/False Questions"]
    XCTAssertTrue(tfBtn.exists)
    tfBtn.tap()
    
    // add question
    let addBtn = app.navigationBars["T/F Question 1"].buttons["Add"]
    XCTAssertTrue(addBtn.exists)
    addBtn.tap()
    
    // enter question
    // no need to choose correct answer because
    // true is preselected
    let collectionView = app.collectionViews
    let questionField = collectionView.textFields["Question"]
    XCTAssertTrue(questionField.exists)
    questionField.tap()
    questionField.typeText(q1)
    
    // save new question
    let addNavBar = app.navigationBars["Add Question"]
    XCTAssertTrue(addNavBar.exists)
    let saveBtn = addNavBar.buttons["Save"]
    XCTAssertTrue(saveBtn.exists)
    saveBtn.tap()
    
    // make sure new question is in list
    var qText = app.staticTexts[q1]
    XCTAssertTrue(qText.exists)
    var trueText = app.staticTexts["True"]
    XCTAssertTrue(trueText.exists)
    var falseText = app.staticTexts["False"]
    XCTAssertTrue(falseText.exists)
    
    // edit question
    let navBar = app.navigationBars["T/F Question 1"]
    XCTAssertTrue(navBar.exists)
    let editBtn = navBar.buttons["Edit"]
    XCTAssertTrue(editBtn.exists)
    editBtn.tap()
    
    // enter question
    XCTAssertTrue(questionField.exists)
    questionField.tap()
    questionField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: q1.count))
    questionField.typeText(q2)
    
    // check false as correct answer
    let cell2 = collectionView.children(matching: .cell).element(boundBy: 2)
    XCTAssertTrue(cell2.exists)
    let cell2Btn = cell2.buttons["Square"]
    XCTAssertTrue(cell2Btn.exists)
    cell2Btn.tap()
    
    // save edited question
    let editNavBar = app.navigationBars["Edit Question"]
    XCTAssertTrue(editNavBar.exists)
    let editSaveBtn = editNavBar.buttons["Save"]
    XCTAssertTrue(editSaveBtn.exists)
    editSaveBtn.tap()
    
    // make sure edited question is in list
    qText = app.staticTexts[q2]
    XCTAssertTrue(qText.exists)
    trueText = app.staticTexts["True"]
    XCTAssertTrue(trueText.exists)
    falseText = app.staticTexts["False"]
    XCTAssertTrue(falseText.exists)
  }
  
  // MARK: - Test Fill in Blank Questions
  func testFBQuestions() {
    let q1 = "What is 2 + 3?"
    let a1 = "5"
    let q2 = "What is the capital of France?"
    let a2 = "Paris"
    
    // choose fill in blank
    let fbBtn = app.buttons["Fill in Blank Questions"]
    XCTAssertTrue(fbBtn.exists)
    fbBtn.tap()
    
    // add question
    let addBtn = app.navigationBars["Fill in Blank Question 1"].buttons["Add"]
    XCTAssertTrue(addBtn.exists)
    addBtn.tap()
    
    // enter question and answer
    let collectionView = app.collectionViews
    let questionField = collectionView.textFields["Question"]
    XCTAssertTrue(questionField.exists)
    questionField.tap()
    questionField.typeText(q1)
    
    let answerField = collectionView.textFields["Answer"]
    XCTAssertTrue(answerField.exists)
    answerField.tap()
    answerField.typeText(a1)
    
    // save new question
    let addNavBar = app.navigationBars["Add Question"]
    XCTAssertTrue(addNavBar.exists)
    let saveBtn = addNavBar.buttons["Save"]
    XCTAssertTrue(saveBtn.exists)
    saveBtn.tap()
    
    // make sure new question exist in list
    var qText = app.staticTexts[q1]
    XCTAssertTrue(qText.exists)
    
    // edit question
    let navBar = app.navigationBars["Fill in Blank Question 1"]
    XCTAssertTrue(navBar.exists)
    let editBtn = navBar.buttons["Edit"]
    XCTAssertTrue(editBtn.exists)
    editBtn.tap()
    
    // enter question and answer
    XCTAssertTrue(questionField.exists)
    questionField.tap()
    questionField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: q1.count))
    questionField.typeText(q2)
    
    XCTAssertTrue(answerField.exists)
    answerField.tap()
    answerField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: a1.count))
    answerField.typeText(a2)
    
    // save edited question
    let editNavBar = app.navigationBars["Edit Question"]
    XCTAssertTrue(editNavBar.exists)
    let editSaveBtn = editNavBar.buttons["Save"]
    XCTAssertTrue(editSaveBtn.exists)
    editSaveBtn.tap()
    
    // make sure edited question is in list
    qText = app.staticTexts[q2]
    XCTAssertTrue(qText.exists)
    let answerText = app.textFields["Answer"]
    XCTAssertTrue(answerText.exists)
  }
  
  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
