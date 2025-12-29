Return-Path: <linux-kbuild+bounces-10349-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B11CE696C
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 12:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBE513026A91
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 11:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D93324EAB1;
	Mon, 29 Dec 2025 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tortDlZ2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD4B30DD2E
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008719; cv=none; b=Yqv8L7O0f+PPPYrgPPmdo5CpPFEDRd55CQs22GhPHFyiL+pLhHEtGdEJGTWNEhx1hSdhIoNqbDRLcy0z+tH83zEftu3L/gRQ/zJb7beWBRKfp3qCH9TZdxCaH6EZnbFLypCbF0x19Pfq06o3LDt+VN/627PLPf5J9P+n5HK7YuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008719; c=relaxed/simple;
	bh=WUvuLq9/pbBIGKS3JmGnnjbd+1j8TYQZpw/q88FZorg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h11yQl+JdrK3e2LQlIpom6VkSYstzSij8KNlEq9R8lsvbBF7aMZGrwB5JJUiAItcMS+ZIJWVbme0Z5DEBjJ3+oRavcTUmtMXHF91uVKvb4wK+c6CUTGB9Qkz3yyWfDgw/wqfdCqIli9MipcMNoAjS8rXFRllcXdbY6RmLhFj3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tortDlZ2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-594330147efso10822368e87.2
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 03:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767008712; x=1767613512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRAfNw7nudQU+BQ9Non9KqBB0UA3McEHLCORvPM8qtE=;
        b=tortDlZ2X2CbD4Eg2uqVc9wKy0zkuIOdZRXk8Z//e5c0pAiuUzzWNHjDBFQ5jY1PzK
         3vXeucEwpanirjU6woIWwaBLDvfMKM05gAX/JFW0y1ZUETm8M6LBBDGL+u3I6KM8xffL
         Q7guwoA2ukCAx4BPA/ckvBafIEoAa0E9IfDS2/RmJfWlstnMaGOKW+mrDE2bAI9ccMIs
         ncKLxa8k9GwQr9ZHTcJ6gi5zGCoyv+s7nYDLYZG/wChg9J/f87TXMX2f7WmHyJFvNCAE
         AI9yvrsFpDHb3m55pWu//8YchrKdtBkqXFE2r59YoWEeEU2BShigHaVFIty82HWvFDdr
         GRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008712; x=1767613512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRAfNw7nudQU+BQ9Non9KqBB0UA3McEHLCORvPM8qtE=;
        b=MfzSGdh331ZAmFhCJ6DKQiMHS31wlp59aZWeX3y7IZW/9JNVK2yCGEApKQTMX76wdO
         gUi7OM/EWrK2ntM+SVu/x5Ex7WOVLD+N5nn4p+T1yl+udw2lBVAxR1O0pb1L+1sRgjJr
         Pdew+dez3VvWXUd/BAS5/ZQ/MGv57WmOeeqJhs9T8oi03+bR9A1IsllDDESlePNr4Rfe
         Dqz8oF9IeO+wsTZ8eaIcZed8kcZ26OUEI2wQjKV62qVfbCwcrkBL/x/DRzoYm9Cmnd6E
         Su/gIeLZKW4Ekvy68Fcc8NQW7cNpxPw3d4uPpCk955d4/YkHYxeZtPqNHyB/o2xIfO6J
         uNWw==
X-Forwarded-Encrypted: i=1; AJvYcCX6YEN3pyEfsolYL3Gmc7qn2TJUJi3TLBE3MaD2KQYT3aRcsWbtcazTPCKVWMFYE1Gjk8HGtFF5XeDuZIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGghzK73t/8FKfw+frU0u1uAUa/Ca0wrJr4TFe6EzL2FamrpkD
	jvMi5tUbHKOVll8gbskRJlwz9Prjlkc4zkbJJD3wJAe/lLqWUlCfnP6kVHPT8fk11yQ=
X-Gm-Gg: AY/fxX7vW7Ys+xz5dekhgDXi5T8m+NrZDYe1VeYypktdNRgz6HMVcPfPlbDAYxCDugQ
	rZ7u3/PleHaqIJ8s3HNOOW9thZwTScphAc3pcb1F7f6TiXFHdrnxeZIukke17x+7ED9i7gzkIFv
	iN6tITu7lBWsO7+2wTTum45+7JFWouOCLut2ryNHrlhVVxYKapTeF8kS8e0OLPMMTl117E1NK+k
	m+ejlYNSd3/3ulsjLhc1aTJIFZI/G3EkrpsoRplZBsAhBNcxKbphCDHXK/vIp2K8DvB+hJNbHXG
	luax0bm8LBI3GjOkR77qxxIRTkIc5eB9W7r8Po8c2/SJnKOKJXNx6C1iZvLrBvH6U6Abb+2RBaF
	oTBos2nJjFAa9ZVgvZD2kjtLP5mqDUJc0uz4FG8wc8uecEqmkf+3GVD0zTCwyTPuEpIWTDEEBsx
	VNwv/0oxVqHlKt6fJ6zxOghxXAKoGPQ6bS/96uRHuQg1yx
X-Google-Smtp-Source: AGHT+IFxhXRQ66603cnVk1/O8t8n8LAyP9ybqNs/roilzw5ve+Vh7AruGIUD3GNobc6XfSNVaUyMPg==
X-Received: by 2002:a05:6512:3f26:b0:577:318a:a1c6 with SMTP id 2adb3069b0e04-59a17d6521cmr9097210e87.23.1767008712116;
        Mon, 29 Dec 2025 03:45:12 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d59sm9239711e87.61.2025.12.29.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:45:11 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] scripts: kconfig: merge_config.sh: use awk in checks too
Date: Mon, 29 Dec 2025 13:44:46 +0200
Message-ID: <20251229114447.45236-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251229114447.45236-1-mikko.rapeli@linaro.org>
References: <20251229114447.45236-1-mikko.rapeli@linaro.org>
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

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 46397d7c6957..bc6b5d0a69bc 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -283,16 +283,93 @@ fi
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
+# Check all specified config values took effect (might have missed-dependency issues)
+if ! awk -v prefix="$CONFIG_PREFIX" \
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


