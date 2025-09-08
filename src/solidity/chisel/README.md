Chisel REPL – Minimal Pasteables

Top 10 Chisel commands

- :help            # list all commands
- :q               # quit (also :quit)
- :reset           # clear variables and state
- :clear           # clear session source buffer
- :source          # show current session source
- :save [id]       # save session to cache (optional id)
- :load <id>       # load a saved session
- :list            # list saved sessions
- :export          # export current session to a script file
- :type <expr>     # show the type of an expression/variable

How to open

- In your shell:
  chisel

How to run these snippets

- Paste ONE line at a time and press Enter after each line.
- Do NOT wrap the pasted code in quotes.
- Assignments don’t print; type the variable name on the next line to view it.
- Plain expressions (no semicolon) print their value immediately.

Basics (paste these lines)

- Math / types:
  1 + 2
  uint256 x = 5; x
  x += 7; x

- Hashing / bytes:
  bytes32 h = keccak256(abi.encodePacked("hello")); h
  abi.encode(uint256(42))
  abi.decode(abi.encode(uint256(42), bool(true)), (uint256, bool))

- Addresses:
  address a = 0x000000000000000000000000000000000000dEaD; a

Tiny inline contracts

- Pure function call:
  pragma solidity ^0.8.24;
  contract Adder { function add(uint256 a, uint256 b) external pure returns (uint256) { return a + b; } }
  Adder ad = new Adder();
  ad.add(2, 3)

- Simple state change:
  pragma solidity ^0.8.24;
  contract Counter { uint256 public n; function inc() external { unchecked { n++; } } }
  Counter c = new Counter();
  c.n();
  c.inc();
  c.n();

Working with arrays (memory)

- Fixed-size memory array:
  uint256[] memory arr = new uint256[](3);
  arr[0] = 11; arr[1] = 22; arr[2] = 33;
  arr

Handy REPL commands

- :help    # list commands
- :vars    # show session variables
- :type x  # show type of expression/variable
- :q       # quit

Notes

- These examples run fully in the REPL without any project.
- For interacting with live chain data, start Chisel with an RPC URL: `chisel --help` (not required for the snippets here).


Advanced examples (paste line-by-line)

- Low-level call with selector + decode return:
  pragma solidity ^0.8.24;
  contract Token { event Transfer(address indexed from, address indexed to, uint256 value); mapping(address=>uint256) public balanceOf; constructor(){ balanceOf[msg.sender] = 1e18; } function transfer(address to, uint256 value) external returns(bool){ require(balanceOf[msg.sender] >= value, "bal"); balanceOf[msg.sender] -= value; balanceOf[to] += value; emit Transfer(msg.sender, to, value); return true; } }
  Token t = new Token();
  address to = 0x0000000000000000000000000000000000001234;
  bytes4 sel = bytes4(keccak256("transfer(address,uint256)"));
  bytes memory payload = abi.encodeWithSelector(sel, to, 1e17);
  (bool ok, bytes memory data) = address(t).call(payload);
  ok
  abi.decode(data, (bool))
  t.balanceOf(to)

- CREATE2 predicted address matches actual deployment:
  pragma solidity ^0.8.24;
  contract C { uint256 public x; constructor(uint256 _x){ x = _x; } }
  contract Factory { function deploy(bytes32 salt, uint256 _x) external returns(address addr){ bytes memory code = abi.encodePacked(type(C).creationCode, abi.encode(_x)); assembly { addr := create2(0, add(code, 32), mload(code), salt) if iszero(extcodesize(addr)) { revert(0,0) } } } }
  Factory f = new Factory();
  bytes32 salt = keccak256(abi.encode("salt-1"));
  bytes32 initCodeHash = keccak256(abi.encodePacked(type(C).creationCode, abi.encode(uint256(777))));
  address predicted = address(uint160(uint(keccak256(abi.encodePacked(bytes1(0xff), address(f), salt, initCodeHash)))));
  address actual = f.deploy(salt, 777);
  predicted
  actual
  predicted == actual

- encode vs encodePacked (and hashing packed):
  abi.encode("abc", uint256(1))
  abi.encodePacked("abc", uint256(1))
  bytes32 packedHash = keccak256(abi.encodePacked("abc", uint256(1))); packedHash


