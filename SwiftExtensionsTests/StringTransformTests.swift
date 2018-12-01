//
//  StringTransformTests.swift
//  SwiftExtensionsTests
//
//  Created by uhooi on 2018/12/01.
//  Copyright © 2018 THE Uhooi. All rights reserved.
//

import XCTest
@testable import SwiftExtensions

class StringTransformTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Test Methods
    
    // MARK: hiraganaToKatakana
    
    func testHiraganaToKatakanaAll() {
        checkHiraganaToKatakana(before: "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゐゆゑよわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゔぁぃぅぇぉっゃゅょゎ",
                                after: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤヰユヱヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョヮ")
    }
    
    // 副作用で半角ｶﾅが全角カナに変換される
    func testHiraganaToKatakanaHalfwidthKatakanaAll() {
        checkHiraganaToKatakana(before: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾜｦﾝｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞｧｨｩｪｫｯｬｭｮ",
                                after: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョ")
    }
    
    func testHiraganaToKatakanaScramble() {
        checkHiraganaToKatakana(before: "aあ1い★う$え漢字おカタカナ１ｱＡ",
                                after: "aア1イ★ウ$エ漢字オカタカナ１アＡ")
    }
    
    func testHiraganaToKatakanaEmpty() {
        checkHiraganaToKatakana(before: "",
                                after: "")
    }
    
    // MARK: katakanaToHiragana
    
    func testKatakanaToHiraganaFullwidthAll() {
        checkKatakanaToHiragana(before: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤヰユヱヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョヮヵヶ",
                                after: "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゐゆゑよわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゔぁぃぅぇぉっゃゅょゎかけ")
    }
    
    func testKatakanaToHiraganaHalfwidthAll() {
        checkKatakanaToHiragana(before: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾜｦﾝｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞｧｨｩｪｫｯｬｭｮ",
                                after: "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゔぁぃぅぇぉっゃゅょ")
    }
    
    func testKatakanaToHiraganaScramble() {
        checkKatakanaToHiragana(before: "aア1イ★ウ$エ漢字オひらがな１ｱＡ",
                                after: "aあ1い★う$え漢字おひらがな１あＡ")
    }
    
    func testKatakanaToHiraganaEmpty() {
        checkKatakanaToHiragana(before: "",
                                after: "")
    }
    
    // MARK: katakanaToHiragana
    
    func testHalfwidthToFullwidth() {
        XCTAssertEqual("ｱｲｳｴｵ".halfwidthToFullwidth(), "アイウエオ")
    }
    
    // MARK: - Private Methods
    
    private func checkHiraganaToKatakana(before: String, after: String) {
        XCTAssertEqual(before.hiraganaToKatakana(), after)
    }
    
    private func checkKatakanaToHiragana(before: String, after: String) {
        XCTAssertEqual(before.katakanaToHiragana(), after)
    }
}
