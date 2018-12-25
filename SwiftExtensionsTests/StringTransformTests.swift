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
    
    // MARK: toKatakana
    
    func testToKatakanaAll() {
        checkToKatakana(before: "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゐゆゑよわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゔぁぃぅぇぉっゃゅょゎ",
                        after: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤヰユヱヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョヮ")
    }
    
    // 副作用で半角ｶﾅが全角カナに変換される
    func testToKatakanaHalfwidthKatakanaAll() {
        checkToKatakana(before: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾜｦﾝｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞｧｨｩｪｫｯｬｭｮ",
                        after: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョ")
    }
    
    func testToKatakanaScramble() {
        checkToKatakana(before: "aあ1い★う$え漢字おカタカナ１ｱＡ",
                        after: "aア1イ★ウ$エ漢字オカタカナ１アＡ")
    }
    
    func testToKatakanaEmpty() {
        checkToKatakana(before: "",
                        after: "")
    }
    
    // MARK: toHiragana
    
    func testToHiraganaFullwidthAll() {
        checkToHiragana(before: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤヰユヱヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョヮヵヶ",
                        after: "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゐゆゑよわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゔぁぃぅぇぉっゃゅょゎかけ")
    }
    
    func testToHiraganaHalfwidthAll() {
        checkToHiragana(before: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾜｦﾝｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞｧｨｩｪｫｯｬｭｮ",
                        after: "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよわをんがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゔぁぃぅぇぉっゃゅょ")
    }
    
    func testToHiraganaScramble() {
        checkToHiragana(before: "aア1イ★ウ$エ漢字オひらがな１ｱＡ",
                        after: "aあ1い★う$え漢字おひらがな１あＡ")
    }
    
    func testToHiraganaEmpty() {
        checkToHiragana(before: "",
                        after: "")
    }
    
    // MARK: toFullwidth
    
    func testToFullwidthKatakana() {
        checkToFullwidth(before: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾜｦﾝｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞｧｨｩｪｫｯｬｭｮ",
                         after: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョ")
    }
    
    func testToFullwidthAlphabet() {
        checkToFullwidth(before: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
                         after: "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ")
    }
    
    func testToFullwidthNumber() {
        checkToFullwidth(before: "1234567890",
                         after: "１２３４５６７８９０")
    }
    
    // TODO: testToFullwidthSymbol()
    
    func testToFullwidthScramble() {
        checkToFullwidth(before: "aア1イ★ウ$エ漢字オひらがな１ｱＡ",
                         after: "ａア１イ★ウ＄エ漢字オひらがな１アＡ")
    }
    
    func testToFullwidthEmpty() {
        checkToFullwidth(before: "",
                         after: "")
    }
    
    // MARK: toHalfwidth
    
    func testToHalfwidthKatakana() {
        checkToHalfwidth(before: "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨワヲンガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポヴァィゥェォッャュョ",
                         after: "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾜｦﾝｶﾞｷﾞｸﾞｹﾞｺﾞｻﾞｼﾞｽﾞｾﾞｿﾞﾀﾞﾁﾞﾂﾞﾃﾞﾄﾞﾊﾞﾋﾞﾌﾞﾍﾞﾎﾞﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟｳﾞｧｨｩｪｫｯｬｭｮ")
    }
    
    func testToHalfwidthAlphabet() {
        checkToHalfwidth(before: "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ",
                         after: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    }
    
    func testToHalfwidthNumber() {
        checkToHalfwidth(before: "１２３４５６７８９０",
                         after: "1234567890")
    }
    
    // TODO: testToHalfwidthSymbol()
    
    func testToHalfwidthScramble() {
        checkToHalfwidth(before: "aア1イ★ウ$エ漢字オひらがな１ｱＡ",
                         after: "aｱ1ｲ★ｳ$ｴ漢字ｵひらがな1ｱA")
    }
    
    func testToHalfwidthEmpty() {
        checkToHalfwidth(before: "",
                         after: "")
    }
    
    // MARK: - Private Methods
    
    private func checkToKatakana(before: String, after: String) {
        XCTAssertEqual(before.toKatakana(), after)
    }
    
    private func checkToHiragana(before: String, after: String) {
        XCTAssertEqual(before.toHiragana(), after)
    }
    
    private func checkToFullwidth(before: String, after: String) {
        XCTAssertEqual(before.toFullwidth(), after)
    }
    
    private func checkToHalfwidth(before: String, after: String) {
        XCTAssertEqual(before.toHalfwidth(), after)
    }
}
