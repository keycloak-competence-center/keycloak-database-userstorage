package learning;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mindrot.jbcrypt.BCrypt;

public class LearningBCryptTest {

    @Test
    public void test() {
        // given
        String encrypted = BCrypt.hashpw("password", BCrypt.gensalt());
        // when
        boolean valid = BCrypt.checkpw("password", encrypted);
        // then
        Assertions.assertTrue(valid);
    }

}
