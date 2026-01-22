Return-Path: <linux-kbuild+bounces-10801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKiKEo4HcmmvZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10801-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:18:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B66BC65DFA
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13250701D91
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5B447D95E;
	Thu, 22 Jan 2026 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxDV/WTc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3E47DD53
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079502; cv=none; b=HoVsYKTL9Aohtn9cdDmhqmYjhT3L3N6qbUb5Io2QI9Mk62NLg2VLhReb7KYFgpfCjGMLgm7EJjk14Gfa4dGXr21fD0Z2b658SK4P4WghxweZdM/i93DZvkxMw5Nx21NIxfn6yYfek0Yjwf9djn2EWs6Braohl+Waqh7vRi407cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079502; c=relaxed/simple;
	bh=5R0b3Np4piW8Ssr+m+GKm27eMSdI0vpy/o7lpwDixRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMP/ALYxdhZ0Mz4WWHFR6JHl1Im/GZLyKEXWBoXb/YcrksRC1u1dYUXC6nYMvMLpOGoiV9ikMbiq/EmPS569MnQ9DGXCNuC+sgIm+wPuJG+UMXnbxlFnFvibU2pR1A1A24+0a8BnpCsHrMkStymO2N2gGVuRN18YOhXHgFJj2ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxDV/WTc; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-385bdc72422so8276841fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769079499; x=1769684299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqSKO6ey7biEgZMFwwVIuw0/Zybnbie8BcSIyb4Zy1A=;
        b=zxDV/WTchR9P80CvHwlqKmWzBeNRLgGqOKRsM30H0YLnGl70oUc8EsudaJ7X2bQq+A
         Y7vuBByd/GIxdNFabylmM+/ZPy+b7ux8mze43/hZ0LznsvxxCF88Z/7t/orvsTVLWErF
         FcPNzbHoeg1KFr7XBAHRtP6LSns1GF1L49nYzcu0Tt6voI5Abs4js2imDV7LtgOXYolc
         92ruVbUeT3e/B8PV8qVEHZ73MAgLZtqP/z3mz15zg3Kdtae9OWi436scuTZNnfULnjzI
         9L9EyA+PC9K61gACD8qKpwWphn2Rdx+fkSv+BTJpS9q08zBc5pDzQg6FnqJC2mnGbIib
         2VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079499; x=1769684299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqSKO6ey7biEgZMFwwVIuw0/Zybnbie8BcSIyb4Zy1A=;
        b=M4/PvEql3/cbQGdfgpk1/6vc0gI/pY+1e0l2oZPH9pfaqVyYyaUlugzKZ/Zn0DoJY2
         0rnDxdBZh/gZ2oU3R7+GUXcIUvjxIufN2W/gLHIhJL20zCYDgzIl1nt+NDmnl344GSGH
         kXMz8DhioAxfXfjDeREnQ6X3F6SexFyhDBTdBjsavOR6Z/CEzLa6lOaFrufDinqrIcJ5
         vSnvfhTi+SNrvRGKQVef73Uiy1Cjb2+OoP7fK3ZYgWkSQacgCucCgqdvRldfl1CdEBbD
         lYepx/uUx7zWKTZViGxO09GevRU50J/ggMZnSaWEjVG7iKMWRa27S/UR5PLsbTq+NnrM
         olvg==
X-Forwarded-Encrypted: i=1; AJvYcCUkTLBNjscsFMQs0dTgj9BJ+LVCNjX8QxR53IDgjXV8Di1QKKW9M+iBTwVTxxv+ORi9MQOQtRbfXibOImo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE7iPXxqxrv2e4uoWwfU5weBWEjvUPeSg32akRUfY/7YFC9oPi
	Yq8CCAwLj5cnd8iRrt5tbhyw7iw6RotaC7dwwFB4uFxSE9RsdC8eTRsU3lxohy+z03k=
X-Gm-Gg: AZuq6aIFpjqYJsPLzVJDvniptcXOERqt5A9P6M4FEJQijLZRwyEiMuBo5zFJejEcdXP
	P9Sy4HSA0yqAa8gvh1l5BwbCbQw3W+/bv+uVpphfAqsQ23SRw2xPke2vNHfcs1TWZeYEVvLZ/F2
	b3f5armXGLf3PMOeRXino0OqkMvvcBQZVT3kNj3ve1uSmdYA1KIDuZ/Gw3XrnVqDmA58trMJbD2
	sg42vBp4A0Sp6IEWfpxkc3P6hVzAGINeSPux+tHHqAtSMObCOh+d7mShIwjg3lkcc5jEzPLnJZw
	2Fe+ew7i2PUAcFezPlFgD5o+bBQHAQ0XnbieaiieLSNJfWs9PUwSFqX/ntf7aZDoX9HTETsQmZZ
	X78JBWf50E/SPNYHR2uoi3ctO1iNjSR5tEH3Bl5+K0ssn8FwfWKYxX4d7nT6oRNdvG3lBE7VKyu
	dxGw1f0vBWU/XQFA5a1RV6HlSD7Pk1YX2UMzftPgRGdEQn
X-Received: by 2002:a2e:b8cf:0:b0:383:1832:958a with SMTP id 38308e7fff4ca-385a54b99bcmr30117351fa.44.1769079498610;
        Thu, 22 Jan 2026 02:58:18 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d5091433sm350841fa.14.2026.01.22.02.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:58:18 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 2/3] scripts: kconfig: merge_config.sh: use awk in checks too
Date: Thu, 22 Jan 2026 12:57:50 +0200
Message-ID: <20260122105751.2186609-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10801-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: B66BC65DFA
X-Rspamd-Action: no action

Converting from shell/sed/grep loop to awk improves runtime
checks of Yocto genericarm64 kernel config from 20 seconds
to under 1 second. The checks catch this kind of issues:

WARNING: CONFIG_BLK_DEV_DM differs:
Requested value: CONFIG_BLK_DEV_DM=y
Actual value:    CONFIG_BLK_DEV_DM=m
WARNING: CONFIG_SECURITY_NETWORK differs:
Requested value: CONFIG_SECURITY_NETWORK=n
Actual value:    CONFIG_SECURITY_NETWORK=y
WARNING: Value requested for CONFIG_ARM64_BTI_KERNEL not in final .config
Requested value: CONFIG_ARM64_BTI_KERNEL=y
Actual value:

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 97 +++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 11 deletions(-)

v3: use $VAR syntax for shell variables, changed output to be a bit more
    similar to the shell script version before

v2: awk from ${AWK}
    https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#md557a7746d96920ff270448738adf96b9fa993ca

v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index de217771b78c..9eda9dbd4542 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -286,16 +286,91 @@ fi
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
+# Check all specified config values took effect (might have missed-dependency issues)
+if ! "$AWK" -v prefix="$CONFIG_PREFIX" \
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
+function warn_mismatch(cfg, merged, final) {
+	if (warnredun == "true") return
+	if (final == "" && !(merged ~ / is not set$/ || merged ~ /=n$/)) {
+		print "WARNING: Value requested for " cfg " not in final .config"
+		print "Requested value: " merged
+		print "Actual value:    " final
+	} else if (final == "" && merged ~ / is not set$/) {
+		# not set, pass
+	} else if (merged == "" && final != "") {
+		print "WARNING: " cfg " not in merged config but added in final .config:"
+		print "Requested value: " merged
+		print "Actual value:    " final
+	} else {
+		print "WARNING: " cfg " differs:"
+		print "Requested value: " merged
+		print "Actual value:    " final
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
+	# strip trailing comment
+	sub(/[[:space:]]+#.*/, "", $0)
+	merged_val = $0
+	final_val = config_cfg[cfg]
+
+	if (merged_val == final_val) next
+
+	if (merged_val ~ /=n$/ && final_val ~ / is not set$/) next
+	if (merged_val ~ /=n$/ && final_val == "") next
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


