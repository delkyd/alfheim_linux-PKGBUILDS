#!/bin/bash
source /etc/apache-aurora/aurora-env.sh
JAVA_OPTS="${JAVA_OPTS[*]}" exec "$AURORA_HOME/bin/aurora-scheduler" "${AURORA_FLAGS[@]}"
