# Bad Todo

**Category:** Web Exploitation  
**Tags:** medium  
**Author:** Rph  
**Points:** 247  
**Solves:** 75

---

## Description

We built an in-house To Do list for our employees using state-of-the-art OpenID Connect authentication. Our admin recently got hacked and all their to-dos got removed. Thankfully, we have an older manual backup of their extremely valuable account. Can you help us recover that backup?

No XSS, No SSRF

---

## Writeup

The challenge involves a web application with per-tenant databases and OpenID Connect authentication. The admin's to-dos were deleted, but a backup exists. The solution requires understanding how the application stores and restores user data, and how to access or recover the admin's backup.

**Flag:**

```
irisctf{per_tenant_databases_are_a_cool_concept_indeed}
```
