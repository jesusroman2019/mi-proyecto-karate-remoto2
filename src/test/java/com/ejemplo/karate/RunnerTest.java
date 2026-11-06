package com.ejemplo.karate;

import io.karatelabs.junit6.Karate;

class RunnerTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }    
}
