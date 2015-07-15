package ecs.test;

import ecs.util.Encoder;
import junit.framework.Assert;
import org.junit.Test;

public class TestEncoder {
    @Test
    public void testEncoder() {
        Assert.assertEquals("63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1", Encoder.mixedEncode("1234"));
    }


}