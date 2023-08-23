parser grammar TupParser;

options { tokenVocab=TupLexer; }

test:
    testName
    testDescription
    browserDefinition?
    testSteps
;


// Тest name: name.
testName: TEST? NAME COLON IDENTIFIER DOT;

// Test description: "Description".
testDescription: TEST? DESCRIPTION COLON STRING DOT;

// Browser: Edge
browserDefinition: BROWSER COLON browserList DOT;
browserList: IDENTIFIER (COMMA IDENTIFIER)+;

// TEST STEPS: step...
testSteps: testStepsHeader step+;
testStepsHeader: TEST? STEPS COLON;

step:
    executeApiRequest
    | assertResponseCode
    | assertResponseBody
    | assertResponseBodyContainsField
    | openWebPage
    | assertThatCurrentPageIs
    | clickOnElementWithXPath
    | fillTextFieldWithValue
//    popunjavanje forme
// popups / notifikacije / toasts
// prisutnost elementa
    | assertThatTitleIs
;

// Execute a API request to ${URL} (with headers ${headers}) ? (with body ${body})? .
executeApiRequest: EXECUTE AN API REQUEST TO COLON request requestHeaders? requestBody? DOT ;
request: httpMethod? STRING;
httpMethod: IDENTIFIER;
requestHeaders: WITH HEADERS LEFT_SQUARE_BRACKET headerPair (COMMA headerPair)* RIGHT_SQUARE_BRACKET ;
headerPair: LEFT_CURLY_BRACKET STRING COLON STRING RIGHT_CURLY_BRACKET ;
requestBody: WITH BODY SINGLE_QUOTE_STRING;

// Assert that last response has status: ${status}.
assertResponseCode: ASSERT THAT LAST RESPONSE HAS STATUS CODE COLON INTEGER DOT ;

// Assert that last response body is: "...".
assertResponseBody: ASSERT THAT LAST RESPONSE BODY IS COLON SINGLE_QUOTE_STRING DOT ;

// Assert that last response body has field: "${name}" with value: "${value}".
assertResponseBodyContainsField: ASSERT THAT LAST RESPONSE BODY HAS FIELD COLON STRING WITH VALUE COLON STRING DOT;

// ui tests
// Open web page: "${URL}".
openWebPage: OPEN WEB PAGE COLON STRING DOT;
clickOnElementWithXPath: CLICK ON ELEMENT WITH XPATH COLON STRING DOT;

// Get text field with X-Path: ${PATH} and fill it with value: "${VALUE}".
fillTextFieldWithValue: GET TEXT FIELD WITH XPATH COLON STRING AND FILL IT WITH VALUE STRING DOT;
// assertions
// Assert that current page is "${URL}".
assertThatCurrentPageIs: ASSERT THAT CURRENT PAGE IS STRING DOT;

// Assert current title is "${TITLE}".
assertThatTitleIs: ASSERT THAT TITLE IS STRING DOT;