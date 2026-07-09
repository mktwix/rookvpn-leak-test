# rookvpn-leak-test

CLI helper to check your public IP via the [RookCheck](https://check.rookvpn.com) API as part of a VPN leak testing workflow.

WebRTC, DNS, and IPv6 leak detection require browser-based tests — this script covers the curl/terminal IP check step only.

## Requirements

- `bash`
- `curl`
- `jq` (optional, for pretty JSON output)

## Usage

```bash
chmod +x leak-test.sh
./leak-test.sh
```

With VPN disconnected, note the IP. Connect your VPN and run again — the visible IP should match your VPN exit node, not your ISP.

## What this does not test

| Leak type | Tool |
|-----------|------|
| WebRTC | [WebRTC leak test](https://rookvpn.com/check/vpn-leak-test/webrtc) |
| DNS | [DNS leak test](https://rookvpn.com/check/vpn-leak-test/dns) |
| IPv6 | [IPv6 leak test](https://rookvpn.com/check/vpn-leak-test/ipv6) |

Full guide: [rookvpn.com/docs/vpn-leak-testing-guide](https://rookvpn.com/docs/vpn-leak-testing-guide)

## Hosted version

No install required — use the full suite at **https://rookvpn.com/check/vpn-leak-test**

## License

MIT — see [LICENSE](LICENSE).

---

Part of the [RookVPN](https://rookvpn.com) privacy tool suite.
