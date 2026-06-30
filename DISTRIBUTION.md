# Distribution drafts (Phase 6)

Post after verifying https://check.rookvpn.com/vpn-leak-test and the CLI repo are live.

## Show HN — title options

- **Show HN: CLI helper for the curl step of VPN leak testing**
- **Show HN: Bash script to check public IP before browser leak tests**

## Show HN — body draft

I built a small MIT-licensed bash script that hits a public IP API as part of a VPN leak testing workflow. WebRTC/DNS/IPv6 still need a browser — the script only covers the terminal/curl step (compare IP with VPN off vs on).

Repo: https://github.com/mktwix/rookvpn-leak-test  
Hosted browser suite (no install): https://check.rookvpn.com/vpn-leak-test  
Write-up: https://rookvpn.com/docs/vpn-leak-testing-guide

Feedback welcome — especially edge cases on split tunneling (mobile, WSL).

---

## r/selfhosted — title

`[Tool] MIT bash helper + browser suite for VPN leak testing (curl IP check step)`

## r/selfhosted — body draft

Useful when you want to verify a VPN container or router policy actually changes the IP seen from scripts/CI, not just the browser.

- CLI: https://github.com/mktwix/rookvpn-leak-test (bash, curl, optional jq)
- Browser tests (WebRTC, DNS, IPv6): https://check.rookvpn.com/vpn-leak-test

Works with any VPN — no account needed for the tools.

---

## r/privacy — angle

Lead with the leak types and link the guide first; mention the CLI as optional automation for the curl step. Avoid product CTAs in the post body.

---

## After posting

- Monitor GitHub issues for API/schema questions
- `site:check.rookvpn.com/vpn-leak-test` in GSC after 2–4 weeks
- Re-run `/opt/docker/scripts/seo-smoke-test.sh` after any deploy
