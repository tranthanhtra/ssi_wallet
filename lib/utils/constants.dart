class Const {
  static String passwordKey = "password";
  static String addressKey = "address";
  static String didKey = "did";
  static String privateKey = "privateKey";
  static String credentialKey = "credentials";
}

const ServiceABI = [
  {
    "inputs": [
      {"internalType": "address", "name": "_owner", "type": "address"}
    ],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [
      {"internalType": "string", "name": "_name", "type": "string"},
      {"internalType": "uint64", "name": "_dateOfBirth", "type": "uint64"},
      {"internalType": "string", "name": "_socialID", "type": "string"},
      {"internalType": "string", "name": "_nationality", "type": "string"},
      {"internalType": "string", "name": "_email", "type": "string"},
      {"internalType": "string", "name": "_phoneNumber", "type": "string"},
      {"internalType": "address", "name": "_owner", "type": "address"}
    ],
    "name": "createISC",
    "outputs": [
      {"internalType": "address", "name": "", "type": "address"}
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {"internalType": "string", "name": "_socialID", "type": "string"}
    ],
    "name": "getDID",
    "outputs": [
      {"internalType": "address", "name": "", "type": "address"}
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {"internalType": "string", "name": "socialId", "type": "string"},
      {"internalType": "address", "name": "_friend1", "type": "address"},
      {"internalType": "address", "name": "_friend2", "type": "address"},
      {"internalType": "address", "name": "_friend3", "type": "address"}
    ],
    "name": "storeRecovery",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
];
