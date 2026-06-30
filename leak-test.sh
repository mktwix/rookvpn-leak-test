#!/usr/bin/env bash
# RookVPN leak test helper — checks public IP via RookCheck API.
# WebRTC/DNS/IPv6 tests require a browser: https://check.rookvpn.com/vpn-leak-test
set -euo pipefail

API_BASE="${ROOKCHECK_API:-https://check.rookvpn.com/api}"
IP_ENDPOINT="${API_BASE}/ip/address"

echo "=== RookVPN CLI Leak Test Helper ==="
echo ""
echo "Fetching public IP from ${IP_ENDPOINT} ..."
echo ""

if ! command -v curl >/dev/null 2>&1; then
  echo "Error: curl is required." >&2
  exit 1
fi

RESPONSE="$(curl -sf --max-time 15 "${IP_ENDPOINT}" 2>/dev/null)" || {
  echo "Error: failed to reach RookCheck API." >&2
  exit 1
}

if command -v jq >/dev/null 2>&1; then
  echo "$RESPONSE" | jq .
  IP="$(echo "$RESPONSE" | jq -r '.ip // .query // empty' 2>/dev/null || true)"
else
  echo "$RESPONSE"
  IP="$(echo "$RESPONSE" | grep -oE '"ip"[[:space:]]*:[[:space:]]*"[^"]+"' | head -1 | sed 's/.*"\([^"]*\)"$/\1/' || true)"
fi

echo ""
if [[ -n "${IP:-}" ]]; then
  echo "Visible public IP: ${IP}"
else
  echo "Public IP extracted from response above."
fi

echo ""
echo "--- Next steps ---"
echo "1. Connect your VPN and run this script again — the IP should change."
echo "2. Browser leak tests (WebRTC, DNS, IPv6):"
echo "   https://check.rookvpn.com/vpn-leak-test/webrtc"
echo "   https://check.rookvpn.com/vpn-leak-test/dns"
echo "   https://check.rookvpn.com/vpn-leak-test/ipv6"
echo ""
echo "Hosted tool: https://check.rookvpn.com/vpn-leak-test"
echo "Docs:        https://rookvpn.com/docs/vpn-leak-testing-guide"
