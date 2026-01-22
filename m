Return-Path: <linux-kbuild+bounces-10800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WABrIywGcmmvZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10800-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:12:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA965C8F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5CCB8C57BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE0B3B8BD3;
	Thu, 22 Jan 2026 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UU+9JOb4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3D47D955
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079497; cv=none; b=WEslFr1tgB1eLoMwi6nwyqExPKxB7jhhLMxeFgaB6emkVTZkLw+ke95YAq+rM8NwOc1EoolWXunix7D+JXY2dcxJsITrwTeN5icIJpGQ21LMCrV7ccoS/rKbgD4r3xluRPPsGFJKUt2OnNNdJm0iCmcsfDdGhpyYoKVpZZc3YUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079497; c=relaxed/simple;
	bh=8inItK2TlZQFCmtq5Ve2zysDmNVCy/TfewYqA8GAnyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNdmLBQvzKLxiT9AbTGeDem8wS2CSUpvK+TLD2w73CHh6LMJwTdS382OU0c/9yhjFh81eyIlC/ZJ9YqGISROGcSVi9a8TDvQ/rWL3TAzwsLLntal3TQEuvk1vKOgl++DpkKEmyOFN44VfRWhDmvdjQ2pHOFrcdOEz6m/Gv89PaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UU+9JOb4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382fa66fa9dso6906231fa.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769079493; x=1769684293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siS/LAEKILEgu9VaJuOyrKUxf9FW9n3qL3magrZsc2Y=;
        b=UU+9JOb4c/WBavtKTTvNz4vMZKVEI63VxvNyL3xmQdllnzEbpLXaSpVCxL0uqcBOwt
         fQuFGD0VHjhbARSNqzZlKhUoxHfqO5fN/Y23ZDXwolfnT8AwABcdjCYl7QuMtP8GBPZr
         ULJEvYesWtIlxN0dCGp6CC5u3p5aSODbqp7vU2HhJy/pgg6QYd+slQbXLDVmB3VOF46b
         SEqa+dVy8Np7edc06xaxiC9JfKOG9c7kZzZTYrHW/OipkNfpRm81QqV5Scs5E5x9EPCP
         qPtcNwQdYeBOddEhBhviS9qlsxXf/0Zc5+V0VOWxreRe2xC1ODCebbXrg1qUge3JHaBj
         DJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079493; x=1769684293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siS/LAEKILEgu9VaJuOyrKUxf9FW9n3qL3magrZsc2Y=;
        b=ivW4kdOsVsobXCkuc4inyl2S3oj5pbElIHFXFfOX+FdLFaB7MMaIzEVW72k39DWKSj
         kRxfpJi/7LKD70DO/t9rcc82jp9AXmpFdWoHJL6cxmz4ot2XciUrT77ZbMBC9AzbVb73
         2XtP5a/oYmqPndmtNepJTLXuZXRv+n55mD2Mu2ARICoppZSFN+c1v41enu6lBMi+1egQ
         7y7HsgZTD8FTfyt5cTmJMGFdYhszuOLBR7RNLGXhw2vzAiEBU860o05kO3XlJbSa+yRO
         jc3Cr5DlKt07rzN7y6qVdXt1Pcukb4AqPL76OyfYxohP3R/1k9xgNLi/fN84s923wcQ8
         MFJA==
X-Forwarded-Encrypted: i=1; AJvYcCUZFb557VoqjgqQWndIO05QKhFNtxf7fZ962pRltTzZiMJW1Xnjnqzqo4X59hZRlLAedmhaQbmCSo3UOXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYTiSusoH6ucWBpy1ZxHmgns8xFwjCuAoz0BZt+erPBFuo/Cp5
	Rb8D8YnaKtnbqOYVkJoTKzqjNu/alRMeCiTHdAD92f0hZ2t/RDnkvKdSZcsbsfEpbys=
X-Gm-Gg: AZuq6aIDEnmmMipmyA6UMYzDyuFQR9aCgwy9zO8LHKDWOA0d13qe9JIdryZrLZoKZjC
	jxN2eewvPg3E10Ombh4qGkuaA6ENcvOz36WCFCOg+Zy1B7+GcG0Wy3LYTopeiQXnriy413eBzgX
	8Kh2N1TLhU5Ri+AOjCzt6YsImzbQ25uJc+BCo7ryQZ7QWKGQfORmFjdsb02rYzVUdtquLePiKoR
	ZeWn2QSgr05kU7X5ac1GpAeVY0A/wD0dLh6CDP/kQz6TXIXjGLDQqfdSiL9dq3qgZ3i6IEMWBoY
	TdL7NS/L3HBK5UhYTKec8YBPricXx5QtqaZXLad4yaUjbaiX9tqFmVd/ScJKW7mSoJrWluWHWfB
	0ZmA+La4ZUM/YNiQHKsl9TxyceFKer9w8mu4ZAhtc4FKylW5vvfCvDamzW5zCErWaztD3qNuBlc
	AW1s3/Be1k2302w9D+EfGK5t8s5U/qYqo7CCk5pjXWuXXL
X-Received: by 2002:a2e:bd81:0:b0:37b:aaf7:f007 with SMTP id 38308e7fff4ca-385a54b02a7mr28386301fa.31.1769079493061;
        Thu, 22 Jan 2026 02:58:13 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d5091433sm350841fa.14.2026.01.22.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:58:12 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk
Date: Thu, 22 Jan 2026 12:57:49 +0200
Message-ID: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
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
	TAGGED_FROM(0.00)[bounces-10800-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,merge_config.sh:url]
X-Rspamd-Queue-Id: D4BA965C8F
X-Rspamd-Action: no action

From: Anders Roxell <anders.roxell@linaro.org>

merge_config.sh shell/sed/grep loop scales poorly and is slow.
With Yocto genericarm64 kernel and around 190 config fragments
the script takes more than 20 minutes to run on a fast build machine.
Re-implementation with awk does the same job in 10 seconds.
Using awk since it is likely available in the build environments
and using perl, python etc would introduce more complex runtime
dependencies. awk is good enough and lot better than shell/sed/grep.

Output stays the same but changed execution time means that
parallel job output may be ordered differently.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
 1 file changed, 128 insertions(+), 40 deletions(-)

v3: use shell variables with plain $VAR syntax, don't convert to =n
    syntax and use " is not set" instead, reverted warning output to
    same as before in the shell script implementation, changed warning
    output from stderr to stdout as in the shell script implementation,
    tested that output from
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean defconfig hardening.config
    and
    make -s ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean defconfig hardening.config
    is the same with and without this change

v2: remove unused sed variables, awk from ${AWK} variable,
    curly brace syntax fix after rebase, triple check that
    correct revision of patches are used in testing with
    yocto/bitbake
    https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#me07dcaaa205b608d56003aeb56a240e5eca1ad52

v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 79c09b378be8..de217771b78c 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -16,8 +16,8 @@
 set -e
 
 clean_up() {
-	rm -f $TMP_FILE
-	rm -f $MERGE_FILE
+	rm -f "$TMP_FILE"
+	rm -f "$TMP_FILE.new"
 }
 
 usage() {
@@ -43,6 +43,10 @@ STRICT=false
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
 WARNOVERRIDE=echo
 
+if [ -z "$AWK" ]; then
+	AWK=awk
+fi
+
 while true; do
 	case $1 in
 	"-n")
@@ -117,11 +121,8 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
-SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
-MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 
@@ -136,42 +137,129 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
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
+	if ! "$AWK" -v prefix="$CONFIG_PREFIX" \
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
+	function warn_builtin(cfg, prev, new) {
+		if (warnoverride == "true") return
+		print cfg ": -y passed, will not demote y to m"
+		print "Previous value: " prev
+		print "New value: " new
+		print ""
+	}
+
+	function warn_redefined(cfg, prev, new) {
+		if (warnoverride == "true") return
+		print "Value of " cfg " is redefined by fragment " mergefile ":"
+		print "Previous value: " prev
+		print "New value: " new
+		print ""
+	}
+
+	function warn_redundant(cfg) {
+		if (warnredun != "true" || warnoverride == "true") return
+		print "Value of " cfg " is redundant by fragment " mergefile ":"
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
+	FILENAME == ARGV[2] {
+		cfg = get_cfg($0)
+
+		# Not a config or not in merge file - keep it
+		if (cfg == "" || !(cfg in merge_cfg)) {
+			print $0 >> ARGV[3]
+			next
+		}
+
+	        prev_val = $0
+		new_val = merge_cfg[cfg]
+
+		# BUILTIN: do not demote y to m
+		if (builtin == "true" && new_val ~ /=m$/ && prev_val ~ /=y$/) {
+			warn_builtin(cfg, prev_val, new_val)
+			print $0 >> ARGV[3]
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
+		# "=n" is the same as "is not set"
+		if (prev_val ~ /=n$/ && new_val ~ / is not set$/) {
+			print $0 >> ARGV[3]
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
+	# output file, skip all lines
+	FILENAME == ARGV[3] {
+		nextfile
+	}
+
+	END {
+		# Newline in case base file lacks trailing newline
+		print "" >> ARGV[3]
+		# Append merge file, skipping lines marked for builtin preservation
+		for (i = 1; i <= merge_total; i++) {
+			if (!(i in skip_merge)) {
+				print merge_lines[i] >> ARGV[3]
+			}
+		}
+		if (strict_violated) {
+			exit 1
+		}
+	}' \
+	"$ORIG_MERGE_FILE" "$TMP_FILE" "$TMP_FILE.new"; then
+		# awk exited non-zero, strict mode was violated
+		STRICT_MODE_VIOLATED=true
+	fi
+	mv "$TMP_FILE.new" "$TMP_FILE"
+done
 if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "The fragment redefined a value and strict mode had been passed."
 	exit 1
-- 
2.34.1


