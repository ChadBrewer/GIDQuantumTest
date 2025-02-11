using Xunit;

namespace IGDGQuantumTest.Tests
{
    public class HostTests
    {
        [Fact]
        public void DummyHostTest()
        {
            Assert.True(true, "Dummy test to verify host tests are running.");
        }

        [Fact]
        public void EnvironmentTest()
        {
            Assert.NotNull(System.Environment.OSVersion);
        }
    }
}
