// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test,console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {MoodNft} from "../../src/MoodNft.sol";
contract DeployMoodNftTest is Test{
    MoodNft private moodNft;
    string private constant TOKEN_URI = "data:application/json;base64,eyJuYW1lIjoiTW9vZE5mdCIsICJkZXNjcmlwdGlvbiI6IkFuIE5GVCB0aGF0IHJlZmxlY3RzIHRoZSBtb29kIG9mIHRoZSBvd25lciwgMTAwJSBvbiBDaGFpbiEiLCAiYXR0cmlidXRlcyI6IFt7InRyYWl0X3R5cGUiOiAibW9vZGluZXNzIiwgInZhbHVlIjogMTAwfV0sICJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjJhV1YzUW05NFBTSXdJREFnTWpBd0lESXdNQ0lnZDJsa2RHZzlJalF3TUNJZ0lHaGxhV2RvZEQwaU5EQXdJaUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lQZ29nSUNBZ1BHTnBjbU5zWlNCamVEMGlNVEF3SWlCamVUMGlNVEF3SWlCbWFXeHNQU0o1Wld4c2IzY2lJSEk5SWpjNElpQnpkSEp2YTJVOUltSnNZV05ySWlCemRISnZhMlV0ZDJsa2RHZzlJak1pTHo0S0lDQWdJRHhuSUdOc1lYTnpQU0psZVdWeklqNEtJQ0FnSUNBZ1BHTnBjbU5zWlNCamVEMGlOakVpSUdONVBTSTRNaUlnY2owaU1USWlMejRLSUNBZ0lDQWdQR05wY21Oc1pTQmplRDBpTVRJM0lpQmplVDBpT0RJaUlISTlJakV5SWk4K0NpQWdJQ0E4TDJjK0NpQWdJQ0E4Y0dGMGFDQmtQU0p0TVRNMkxqZ3hJREV4Tmk0MU0yTXVOamtnTWpZdU1UY3ROalF1TVRFZ05ESXRPREV1TlRJdExqY3pJaUJ6ZEhsc1pUMGlabWxzYkRwdWIyNWxPeUJ6ZEhKdmEyVTZJR0pzWVdOck95QnpkSEp2YTJVdGQybGtkR2c2SURNN0lpOCtDaUFnUEM5emRtYysifQ==";
    function setUp() external{
        DeployMoodNft deployer  = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testTokenUriIsGivingCorrectJson() external view{
        string memory tokenUri  = moodNft.tokenURI(0);
        assertEq(abi.encode(tokenUri),abi.encode(TOKEN_URI));
    }
}