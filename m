Return-Path: <linux-kbuild+bounces-10348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA4CE6966
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 12:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E8FB30206B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 11:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1CD30E0C5;
	Mon, 29 Dec 2025 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZBMW/Bl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4D2D47ED
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008717; cv=none; b=LdbsBU5y8NICpvghUypLYVLTY2DV0+8U3lGX7CLxKyt1fBpmnYJkfeHOocSfGyQgYl5hPZUSEq92TE3tOFnIva+e5CWLNsgJn+jeyaN65NBD0aI7sOiZPSWX/XZZGVSNg0WAmQxGP3YFXH72eBBZ2QZA0YpMia14Iyq/3MGRRps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008717; c=relaxed/simple;
	bh=kLhYYgKrfWKQYAZHXRgYJIo55GitVGJlz+NN/asgnPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lo62DwaCOyRvQ7sjoLOHUipm0xVTqP2rjHwla5qUpaTLbv6REspm5vfEGlTPSkI0CE+gMiap1k0sRyCGVanu3jz8gk4mBHwQ1/4aFXKhXRWWcp03Bp7CRLm6hzt0NR4q1OTFXa151ADsC9bbHJZQnq8916zWk3fgPvM5SxBxxAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZBMW/Bl; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59584301f0cso9331285e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 03:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767008709; x=1767613509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2l+St0KERhV1Aq1cV9+tywtCWZjihyLn+VrIkWJUmz0=;
        b=SZBMW/BlS1XrMXIfKJJhe3keWJzbag+YeZ25NMmPcm8XZzRU6YiwUwANp6rmVepbrI
         c6or5FYzi/okTLIop/4p3IpxpowYUTQtrdIqJbf6qA31VCcqUoBgi5KdC9YjMYJ5enCY
         zYj+GX686g1xWy5v8wOzRgITLWqfJFjhxH5R00QTEHEXN5f9uDSmzNXarb8ANfGQLjG4
         QOVyx1rQpw98Ha3zXWuqNqcCHLG38X3OffBtKZyf/ZqEHNxrAfnV3UU8ERMcBKNUdUvS
         oVP0kSmQU4gOspuiBfK3NIvl9j4jr83ctUWm/FX6jlzWHBvWh2kYGiZXj5NKU69S/qNo
         v7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008709; x=1767613509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l+St0KERhV1Aq1cV9+tywtCWZjihyLn+VrIkWJUmz0=;
        b=fcLAVimNLtqZ0PTC+ns+efMKWiBLS6+CV4YLgiCfXxB27uFWrj9glWA5syD36NIfyK
         cGsW4g0pkVMv5TEZ2QeEGV1Bv7kHXFmXVonMTdbwuaEijci97jJwYNeb2nwnpdT30MZ1
         sPDu9zyz+05+JZ7hrQMsiKvgFVf3x+A789TbfePWrAXeSbXwG7sFQ7iOvbXTb7MGYY9f
         QAZtSA/4ikn6ka7FTdnPJVuhuBlY0Lq/o2fhZdb+dYhMQphPNonQ1RjFT5ShyokT51og
         ETJ2I8DjyQz3DpHqMwOlB4SaSohaNy7fTRv1rG89sCxbVuZjtNWDWOqeFlsL6/ahIprj
         0tBA==
X-Forwarded-Encrypted: i=1; AJvYcCXwWrT81K9x5eS383Yf7aWgQ5G18Pc5JB6ZFuEsq+8LOwlz0uv/LfWVdb6eul8l4HkAOK/pWFeaJ6ZFBjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBAaSqwN5M3f/oD81GnYAlXHzv8bhhBzN4nEu1lpjfhtWeIiP
	UsJroRHRo7LKhZHuzI9NjIUq8TqCNfVff0NcnuEKRusNGCj15A4oz9RK9KsF7R1qst4=
X-Gm-Gg: AY/fxX7B7Q3ZSOk/jA48JQt9NVOISRSbJbr6drY2NhHn4F0UScr18gP5IpgyPea8bDL
	PKVUZPdAvtlSWmTLcrByz6PtTH0RD0NsSF/Dzko+HkVU032e+Xxvh818j+W+Gscw4U6DkgbjPQY
	zUSOy+4sIwRPcXK/KmRKNJ6i3J1VZsByn4ntfmDaeBnpYzRYtuuW7z4qUoIy2dbiLkcl60f/5pA
	nFbMqjdAfIKxTrz8fcNnpXzq7TXZK8Ni3CN6islW857n8kN8CGKa4lTh1/qBYz48p1kj9xvRxsX
	08/+tpmfx3TRIQfONnf0YZ0it7F6j12A7Q3sdK/ELCKydrNjmeKYZdFU2ZPh3i9gmHiLku/AySX
	llKJhc7ui6Hr1MbXHvskwo8idh7nFOXwm6jNgtoVhU1WeifjCh5f148kUxCocMeqR5Pgq2RnvA9
	ZjDmvbFUM2ZRNfsdPqLQLO16hFf+cWNpR7jOd7WGuMcZ76
X-Google-Smtp-Source: AGHT+IHxK3H2coBGokqoyEeASmd6fxuwwYDGMXWXGiTHmIZH+03TXbA1GDloxqkVXj2erSS02fKBAA==
X-Received: by 2002:a05:6512:2211:b0:594:5644:dba1 with SMTP id 2adb3069b0e04-59a17cbf2a1mr11055118e87.0.1767008709152;
        Mon, 29 Dec 2025 03:45:09 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d59sm9239711e87.61.2025.12.29.03.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:45:08 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk
Date: Mon, 29 Dec 2025 13:44:45 +0200
Message-ID: <20251229114447.45236-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anders Roxell <anders.roxell@linaro.org>

merge_config.sh shell/sed/grep loop scales poorly and is slow.
With Yocto genericarm64 kernel and around 190 config fragments
the script takes more than 20 minutes to run on a fast build machine.
Re-implementation with awk does the same job in 10 seconds.
Using awk since it is likely available in the build environments
and using perl, python etc would introduce more complex runtime
dependencies. awk is good enough and lot better than shell/sed/grep.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 161 ++++++++++++++++++++++++--------
 1 file changed, 123 insertions(+), 38 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 79c09b378be8..46397d7c6957 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -16,8 +16,8 @@
 set -e
 
 clean_up() {
-	rm -f $TMP_FILE
-	rm -f $MERGE_FILE
+	rm -f "${TMP_FILE}"
+	rm -f "${TMP_FILE}.new"
 }
 
 usage() {
@@ -121,7 +121,6 @@ SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
 SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
-MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 
@@ -136,42 +135,128 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
 	fi
-	cat $ORIG_MERGE_FILE > $MERGE_FILE
-	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
-
-	for CFG in $CFG_LIST ; do
-		grep -q -w $CFG $TMP_FILE || continue
-		PREV_VAL=$(grep -w $CFG $TMP_FILE)
-		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
-		BUILTIN_FLAG=false
-		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
-			${WARNOVERRIDE} Previous  value: $PREV_VAL
-			${WARNOVERRIDE} New value:       $NEW_VAL
-			${WARNOVERRIDE} -y passed, will not demote y to m
-			${WARNOVERRIDE}
-			BUILTIN_FLAG=true
-		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
-			${WARNOVERRIDE} Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
-			${WARNOVERRIDE} Previous  value: $PREV_VAL
-			${WARNOVERRIDE} New value:       $NEW_VAL
-			${WARNOVERRIDE}
-			if [ "$STRICT" = "true" ]; then
-				STRICT_MODE_VIOLATED=true
-			fi
-		elif [ "$WARNREDUN" = "true" ]; then
-			${WARNOVERRIDE} Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
-		fi
-		if [ "$BUILTIN_FLAG" = "false" ]; then
-			sed -i "/$CFG[ =]/d" $TMP_FILE
-		else
-			sed -i "/$CFG[ =]/d" $MERGE_FILE
-		fi
-	done
-	# In case the previous file lacks a new line at the end
-	echo >> $TMP_FILE
-	cat $MERGE_FILE >> $TMP_FILE
-done
+	# Use awk for single-pass processing instead of per-symbol grep/sed
+	if ! awk -v prefix="$CONFIG_PREFIX" \
+		-v warnoverride="$WARNOVERRIDE" \
+		-v strict="$STRICT" \
+		-v builtin="$BUILTIN" \
+		-v warnredun="$WARNREDUN" '
+	BEGIN {
+		strict_violated = 0
+		cfg_regex = "^" prefix "[a-zA-Z0-9_]+"
+		notset_regex = "^# " prefix "[a-zA-Z0-9_]+ is not set$"
+	}
+
+	# Extract config name from a line, returns "" if not a config line
+	function get_cfg(line) {
+		if (match(line, cfg_regex)) {
+			return substr(line, RSTART, RLENGTH)
+		} else if (match(line, notset_regex)) {
+			# Extract CONFIG_FOO from "# CONFIG_FOO is not set"
+			sub(/^# /, "", line)
+			sub(/ is not set$/, "", line)
+			return line
+		}
+		return ""
+	}
+
+	# Normalize: strip trailing comments, convert "is not set" to "=n"
+	function normalize(line) {
+		if (line == "") return ""
+		sub(/[[:space:]]+#.*/, "", line)
+		if (line ~ / is not set$/) {
+			sub(/^# /, "", line)
+			sub(/ is not set$/, "=n", line)
+		}
+		return line
+	}
+
+	function warn_builtin(cfg, prev, new) {
+		if (warnoverride == "true") return
+		print cfg ": -y passed, will not demote y to m" > "/dev/stderr"
+		print "  Previous value: " prev > "/dev/stderr"
+		print "  New value:	 " new > "/dev/stderr"
+		print "" > "/dev/stderr"
+	}
+
+	function warn_redefined(cfg, prev, new) {
+		if (warnoverride == "true") return
+		print "Value of " cfg " is redefined by fragment " mergefile ":" > "/dev/stderr"
+		print "  Previous value: " prev > "/dev/stderr"
+		print "  New value:	 " new > "/dev/stderr"
+		print "" > "/dev/stderr"
+	}
+
+	function warn_redundant(cfg) {
+		if (warnredun != "true" || warnoverride == "true") return
+		print "Value of " cfg " is redundant by fragment " mergefile ":" > "/dev/stderr"
+	}
+
+	# First pass: read merge file, store all lines and index
+	FILENAME == ARGV[1] {
+	        mergefile = FILENAME
+		merge_lines[FNR] = $0
+		merge_total = FNR
+		cfg = get_cfg($0)
+		if (cfg != "") {
+			merge_cfg[cfg] = $0
+			merge_cfg_line[cfg] = FNR
+		}
+		next
+	}
 
+	# Second pass: process base file (TMP_FILE)
+		cfg = get_cfg($0)
+
+		# Not a config or not in merge file - keep it
+		if (cfg == "" || !(cfg in merge_cfg)) {
+			print $0
+			next
+		}
+
+		prev_val = normalize($0)
+		new_val = normalize(merge_cfg[cfg])
+
+		# BUILTIN: do not demote y to m
+		if (builtin == "true" && new_val ~ /=m$/ && prev_val ~ /=y$/) {
+			warn_builtin(cfg, prev_val, new_val)
+			print $0
+			skip_merge[merge_cfg_line[cfg]] = 1
+			next
+		}
+
+		# Values equal - redundant
+		if (prev_val == new_val) {
+			warn_redundant(cfg)
+			next
+		}
+
+		# Values differ - redefined
+		warn_redefined(cfg, prev_val, new_val)
+		if (strict == "true") {
+			strict_violated = 1
+		}
+	}
+
+	END {
+		# Newline in case base file lacks trailing newline
+		print ""
+		# Append merge file, skipping lines marked for builtin preservation
+		for (i = 1; i <= merge_total; i++) {
+			if (!(i in skip_merge)) {
+				print merge_lines[i]
+			}
+		}
+		if (strict_violated) {
+			exit 1
+		}
+	}' \
+	"$ORIG_MERGE_FILE" "$TMP_FILE" > "${TMP_FILE}.new"; then
+		# awk exited non-zero, strict mode was violated
+		STRICT_MODE_VIOLATED=true
+	fi
+	mv "${TMP_FILE}.new" "$TMP_FILE"
+done
 if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "The fragment redefined a value and strict mode had been passed."
 	exit 1
-- 
2.34.1


