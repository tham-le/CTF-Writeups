# AYES

**Category:** Cryptography  
**Tags:** easy, or not?  
**Author:** sera  
**Points:** 448  
**Solves:** 34

---

## Description

Something is a *bit* off with my AES implementation. Get it?
AES implementation is directly from [here](https://github.com/boppreh/aes).

---

## Writeup

The challenge provides a custom AES implementation with a twist: a bit in the S-box is flipped based on user input. The flag is `irisctf{the_first_round_really_is_the_key}`.

- The S-box is a core component of AES, and flipping a bit can drastically change the encryption behavior.
- The challenge script asks the user for a bit index, flips that bit in the S-box, and then proceeds to perform encryptions.
- The solution involves understanding how the S-box is used in the first round of AES and how the bit flip affects the encryption process.

**Flag:**
```
irisctf{the_first_round_really_is_the_key}
```

---

## References
- [AES implementation used](https://github.com/boppreh/aes)
