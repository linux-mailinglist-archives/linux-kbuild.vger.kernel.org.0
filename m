Return-Path: <linux-kbuild+bounces-10390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E64CCEB90D
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 09:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F26DE3044876
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC1D3148B7;
	Wed, 31 Dec 2025 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J/Vj0Jsn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BEF3148A7
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170495; cv=none; b=J0uK/xvgfGRFYF/LlzlsNhXNa9f/uOOfBa5pJshr6x2yiSR5zGFk8XR2LmRjyE2xoPzUDsWMzZEbdeiRZaEwOZudXgqiNOvo48cvTu0zqpC1Yd/HcDSP9EpN9KQcWWILsDc/ZRaY5WLQvtVq+WN60D7QVqqoTPNKx7gswvMFU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170495; c=relaxed/simple;
	bh=aksW9Gl27Y2TlzheBx6d4KGRf/+Nv/r77hGaPdRG7s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1Z05rexqFPbfBKd/Q+PA8col+1Oh6fIgJ8x3mJkzh/Y3LcqQ7uFqYd8Tipzn8ZVIF399ZIMrJItEj6nkMr46T4Qi0pYzKK0nEqVZ7rNQeKYqZOELfQ4dMgHLUFpC2xHl0WhzTyxsuMrtxDI/Ny5lNZ8+6dVn/9T8K/cB5/1O5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J/Vj0Jsn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b25acdffbso5867821e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767170490; x=1767775290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umne1FnYLWlRCQvCp7bwG/HVqfB+9OUNWkZhOjj9nsQ=;
        b=J/Vj0JsnFnlU6sTTKp1sUm2DVNR5LRoATm2qwamgB3tUXu3LkkBUK4TaQyXXhBPMEz
         kasCD/wOph/L0cTrRyv4xlRTvbZELoF3lvki6xztB3FXDS1Rzenz9Tlc6XojjL39Ed6i
         Nd8EpjVX1hIw0i88lNO3VPaB8KJXfYNIP7h2NH/IJSk8N5gqfXVGtkKQ9Us0IwPwE7sL
         DeV+w6dGlp+tD/IMGSuIY25O8ntIPySVLXKGJkWiouMMfPpf8klvFgURpx4hLGtTPjrW
         BIE5f0fm1RPgRqmn2yYiyxobq1wRK/XrsTMlSUZSRYOeDm8pcxxkVoIiDEbUqQrZ4fMj
         cs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170490; x=1767775290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umne1FnYLWlRCQvCp7bwG/HVqfB+9OUNWkZhOjj9nsQ=;
        b=iBHlDMJfG58gwwkSXLGkvSV9OwFBtoZh/NfLiokl1d3NJEyE7La/f5FtJ/dT7dZXf6
         ZPVT3GtOFLhT0EcyfUBgRwQ75tEb+9HIMmSC3AuQF99ONMLmuFDfzsTKaUltaPR5NWcs
         ys9sUo69sLkZK8jpkdHrQH+GvgbB+ZbnLv14qym30ppUklUdx+15FfFAVAd1SJFtSEi5
         pgzXDtd+wMeYMIMcaD8x2Ir2jrSCh06WTvWpJTKiVc8LwXZ/VAYf0dmboW76GF6c+/DS
         ntN8hev6kkIEqCC7Kp8YvDAe9t5RaOXYzmeFGaiESqAu/RQL5/0HEkyGaniv8TCFJvUj
         9eTA==
X-Forwarded-Encrypted: i=1; AJvYcCWYe8bEEunLyshfZQQskJOrBllmOIhazehXifa5xd5sKbrL4gE/9nlo0yePgqhvpZ6MqlQIcbydtFCO8oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw15VksvRVXfMqaAtrRB4on8+FopypCPkRivuJx22u4CrnlnIne
	vZsOCsBjPpr1PAsXKciR2+YhYIWal9lwHq6swZPPaFhrVgNXfqnpzV7BoHis8inM3QU=
X-Gm-Gg: AY/fxX5P/UzBTg7/BKoJODIzPMrgNDZc66vzI0NdupK4ml5KoPbEAeCvB54jtUw/bSR
	yKtOj77PCnHam2kHyM+INKprfPnpkyMz2/2Zwmt5qeDeeobPHPujDaxWSCypFeOekg+H6sOp45f
	RKWedJ7XxYi2gwmDbpsEqWlaR5Fr12IhnbXW6kS2+pcuNnUvSbbtJ4PJiN8Lt0YEXjNfX4Rl4y8
	wt7/puQ2GSUpegooszrWFaskxCrYSSsEsygriRPLQyGBc3m/1oHUMp/PYD+hi4pZFJszxyHW/TF
	7CAlPetGB3qUi5BXWJ74ddRahR9bnCuryf4HtRmRdtx2svB8jWUfHBd7qDeiRlWvrGpyneBBoFs
	hdQduNc3ZpAVlk6FUHR9FMbrxxqYATumo6iOa+qUaoCRhuSdi7SyTb9MpFm6dQLKVGi3LyOLKR4
	BKVLW3Zi2eAPQagiTxUgW1GmYJ5ARLw4OGQCFp4VoGGCBX
X-Google-Smtp-Source: AGHT+IEIwvixiSbKY20D9N8TRsDhAat/GfJPMUsS6YFx8gT9L9seon1KnPGyRhp5hbdWlklwpUNyBw==
X-Received: by 2002:a05:6512:4002:b0:599:afa:3997 with SMTP id 2adb3069b0e04-59a17d08b75mr12785880e87.3.1767170489557;
        Wed, 31 Dec 2025 00:41:29 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm10666566e87.0.2025.12.31.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:41:29 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/3] scripts: kconfig: merge_config.sh: use awk in checks too
Date: Wed, 31 Dec 2025 10:40:49 +0200
Message-ID: <20251231084050.186874-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231084050.186874-1-mikko.rapeli@linaro.org>
References: <20251230205549.GE4062669@ax162>
 <20251231084050.186874-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converting from shell/sed/grep loop to awk improves runtime
checks of Yocto genericarm64 kernel config from 20 seconds
to under 1 second. Also fix the tests to take into account:

 * kernel config lines with comments
   CONFIG_FOO=m # this is a comment
 * match "# CONFIG_FOO is not set" with "CONFIG_FOO=n"
 * match unset config value to "CONFIG_FOO=n"

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 99 +++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 11 deletions(-)

v2: awk from ${AWK}

v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 4cefe3cdfc2f..462c791cca12 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -286,16 +286,93 @@ fi
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
+# Check all specified config values took effect (might have missed-dependency issues)
+if ! "${AWK}" -v prefix="$CONFIG_PREFIX" \
+	-v warnoverride="$WARNOVERRIDE" \
+	-v strict="$STRICT" \
+	-v warnredun="$WARNREDUN" '
+BEGIN {
+	strict_violated = 0
+	cfg_regex = "^" prefix "[a-zA-Z0-9_]+"
+	notset_regex = "^# " prefix "[a-zA-Z0-9_]+ is not set$"
+}
 
-# Check all specified config values took (might have missed-dependency issues)
-for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
+# Extract config name from a line, returns "" if not a config line
+function get_cfg(line) {
+	if (match(line, cfg_regex)) {
+		return substr(line, RSTART, RLENGTH)
+	} else if (match(line, notset_regex)) {
+		# Extract CONFIG_FOO from "# CONFIG_FOO is not set"
+		sub(/^# /, "", line)
+		sub(/ is not set$/, "", line)
+		return line
+	}
+	return ""
+}
 
-	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || true)
-	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
-		echo "Value requested for $CFG not in final .config"
-		echo "Requested value:  $REQUESTED_VAL"
-		echo "Actual value:     $ACTUAL_VAL"
-		echo ""
-	fi
-done
+# Normalize: strip trailing comments, convert "is not set" to "=n"
+function normalize(line) {
+	if (line == "") return ""
+	sub(/[[:space:]]+#.*/, "", line)
+	if (line ~ / is not set$/) {
+		sub(/^# /, "", line)
+		sub(/ is not set$/, "=n", line)
+	}
+	return line
+}
+
+function warn_mismatch(cfg, merged, final) {
+	if (warnredun == "true") return
+	if (final == "" && !(merged ~ /=n$/)) {
+		print "WARNING: " cfg " not in final config but set in merged config to: " merged > "/dev/stderr"
+	} else if (final == "" && merged ~ /=n$/) {
+		# not set is the same as =n, pass
+	} else if (merged == "" && final != "") {
+		print "WARNING: " cfg " not in merged config but added in final config: " final > "/dev/stderr"
+	} else {
+		print "WARNING: " cfg " differs:" > "/dev/stderr"
+		print "Merged value: " merged > "/dev/stderr"
+		print "Final  value: " final > "/dev/stderr"
+	}
+}
+
+# First pass: read effective config file, store all lines
+FILENAME == ARGV[1] {
+	cfg = get_cfg($0)
+	if (cfg != "") {
+		config_cfg[cfg] = $0
+	}
+	next
+}
+
+# Second pass: process merged config and compare against effective config
+{
+	cfg = get_cfg($0)
+	if (cfg == "") next
+
+	merged_val = normalize($0)
+	final_val = normalize(config_cfg[cfg])
+
+	if (merged_val == final_val) next
+
+	warn_mismatch(cfg, merged_val, final_val)
+
+	if (strict == "true") {
+		strict_violated = 1
+	}
+}
+
+END {
+	if (strict_violated) {
+		exit 1
+	}
+}' \
+"$KCONFIG_CONFIG" "$TMP_FILE"; then
+	# awk exited non-zero, strict mode was violated
+	STRICT_MODE_VIOLATED=true
+fi
+
+if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
+	echo "Requested and effective config differ"
+	exit 1
+fi
-- 
2.34.1


