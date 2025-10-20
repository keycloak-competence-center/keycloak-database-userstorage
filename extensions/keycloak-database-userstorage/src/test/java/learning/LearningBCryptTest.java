package learning;

import org.junit.Assert;
import org.junit.Test;
import org.mindrot.jbcrypt.BCrypt;

public class LearningBCryptTest {

    @Test
    public void test() {
        // given
        String encrypted = BCrypt.hashpw("password", BCrypt.gensalt());
        System.out.println(encrypted);
        // when
        boolean valid = BCrypt.checkpw("password", encrypted);
        // then
        Assert.assertTrue(valid);
    }

}
