// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Script,console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNft} from "../src/MoodNft.sol";
contract DeployMoodNft is Script{
    function svgToBase64(string memory svg) internal pure returns(string memory){
        string memory baseUri = "data:image/svg+xml;base64,";
        string memory baseCode =  Base64.encode(
            bytes(string(abi.encodePacked(svg))) // Removing unnecessary type castings, this line can be resumed as follows : 'abi.encodePacked(svg)'
        );
        return string(abi.encodePacked(baseUri,baseCode));
    }
    function run() external returns(MoodNft){
        string memory happySvg = vm.readFile("./img/happy.svg");
        string memory sadSvg = vm.readFile("./img/sad.svg");
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToBase64(happySvg),svgToBase64(sadSvg));
        vm.stopBroadcast();
        return moodNft;
    }
}