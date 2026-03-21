#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#include "libutf8v.h"


#define RESET   "\033[0m"
#define RED     "\033[31m"
#define GREEN   "\033[32m"

typedef void (*utf8vFunc)(void);

bool verbose;

struct Tester {
  int totalTests;
  int passed;
  int testNum;
  char* testName;
  utf8vFunc func;
};
void TesterInit(struct Tester* tester) {
  tester->totalTests = 0;
  tester->passed = 0;
  tester->testNum = -1;
  tester->testName = "NONE SET";
  tester->func = NULL;
}
void TesterSetFunction(struct Tester* tester, utf8vFunc func) {
  tester->totalTests += 1;
  tester->func = func;
}
void TesterSetTest(struct Tester* tester, int testNum) {
  tester->testNum = testNum;
}
void TesterSetTestName(struct Tester* tester, char* testName) {
  tester->testName = testName;
}
void TesterPass(struct Tester* tester) {
  tester->passed += 1;
  printf(GREEN "%s::%d: Test passed\n" RESET, tester->testName, tester->testNum);
}
void TesterFail(struct Tester* tester, const char* message) {
  printf(RED "%s(%d)::Test failed: %s\n" RESET, tester->testName, tester->testNum, message);
}
void TesterReport(struct Tester* tester) {
  printf("Tests passed: %d/%d\n", tester->passed, tester->totalTests);
}


typedef void (*testfunc)(struct Tester* tester);


void TestStrlen(struct Tester* tester) {
  TesterSetTestName(tester, "utf8v_strlen");


  TesterSetTest(tester, 1);

  char* testStr = "λ(x)";
  if (verbose) printf("Input: %s\n", testStr);
  int expected = 4;
  
  utf8v_strlenPtr func = (utf8v_strlenPtr)tester->func;
  int res = func(testStr);

  if (res == expected) {
    TesterPass(tester);
  } else {
    char msg[64];
    sprintf((char*) msg, "Expected %d, got %d", expected, res);
    TesterFail(tester, msg);
  }
}

void TestStreq(struct Tester* tester) {
  TesterSetTestName(tester, "utf8v_streq");
  // TODO: Add tests
}

void TestParseInt(struct Tester* tester) {
  TesterSetTestName(tester, "utf8v_parseint");
  // TODO: Add tests
}

void TestParseUInt(struct Tester* tester) {
  TesterSetTestName(tester, "utf8v_parseuint");
  // TODO: Add tests
}

void TestToupper(struct Tester* tester) {
  TesterSetTestName(tester, "utf8v_toupper");


  TesterSetTest(tester, 1);

  char* testStr = "Hello, λx!";
  if (verbose) printf("Input: %s\n", testStr);
  char* expected = "HELLO, ΛX!";

  utf8v_toupperPtr func = (utf8v_toupperPtr)tester->func;
  char* res = func(testStr);

  if (strcmp(res, expected) == 0) {
    TesterPass(tester);
  } else {
    char msg[64];
    sprintf((char*) msg, "Expected '%s', got '%s'", expected, res);
    TesterFail(tester, msg);
  }
}


int main(int argc, char** argv) {
  verbose = false;
  for (int i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--verbose") == 0) verbose = true;
  }

  printf("Testing libutf8 version: %s\n\n", utf8v_version());

  struct Tester tester;
  TesterInit(&tester);

  utf8vFunc testFunctions[] = {
      (utf8vFunc) &utf8v_strlen,
      (utf8vFunc) &utf8v_streq,
      (utf8vFunc) &utf8v_parseint,
      (utf8vFunc) &utf8v_parseuint,
    (utf8vFunc) &utf8v_toupper
  };
  testfunc testerFunctions[] = {
    &TestStrlen,
    &TestStreq,
    &TestParseInt,
    &TestParseUInt,
    &TestToupper
  };

  int numTests = sizeof(testFunctions) / sizeof(testFunctions[0]);
  for (int i = 0; i < numTests; i++) {
    TesterSetFunction(&tester, testFunctions[i]);
    testerFunctions[i](&tester);
  }

  TesterReport(&tester);

  return 0;
}