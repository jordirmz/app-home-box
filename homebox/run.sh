#!/bin/sh
set -eu

PEPPER_FILE=/data/homebox-api-key-pepper

umask 077

if [ ! -s "${PEPPER_FILE}" ] || [ "$(wc -c < "${PEPPER_FILE}")" -lt 32 ]; then
    head -c 48 /dev/urandom | base64 | tr -d '\n' > "${PEPPER_FILE}"
fi

chmod 0600 "${PEPPER_FILE}"

HBOX_AUTH_API_KEY_PEPPER="$(cat "${PEPPER_FILE}")"
export HBOX_AUTH_API_KEY_PEPPER

exec /app/api "$@"
