package template.demoblaze;

import com.intuit.karate.junit5.Karate;

class DemoblazeRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
