module Test.Suite

import IdrTest.Test

import Test.Test

suite : IO ()
suite = do
  runSuites
    [ Test.Test.suite
    ]
