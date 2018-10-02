let p = 812;
let g = 7;

function rand (max) {
  return Math.floor(Math.random() * Math.floor(max)) + 1;
}

function aliceToBob (g, p) {
  let a = rand(10);
  let A = Math.pow(g, a) % p;

  return bobToAlice(A, a, g, p);
}

function bobToAlice (A, a, g, p) {
  let b = rand(10);
  let B = Math.pow(g, b) % p;

  KprivBob = Math.pow(A, b) % p;
  KprivAlice = Math.pow(B, a) % p;

  let KeyArray = [KprivAlice, KprivBob];

  return KeyArray
}

var Kpriv = aliceToBob(g, p);

console.log(`Alice's private key : ${Kpriv[0]}. Bob's private key : ${Kpriv[1]}`);