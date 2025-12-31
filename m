Return-Path: <linux-kbuild+bounces-10389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5FCEB907
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 09:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8745C302E173
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 08:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550C3313E32;
	Wed, 31 Dec 2025 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7DXOGbL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA48313E2E
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170490; cv=none; b=VOrpM1Ugs6/Oqe6dtGuWt7n0NIMrVBXhFnwZ3xl++vQpIzOA5CPxZjRDy3n7LyocK7axAPI1d/SaMxPLew+ULHvYvlX3vf8c7HmRTOGpz8Tg4fPsIN4HerVnKZzYf3/JAEg5F7l2iXnFYFtc9Q3OxI7Gf6JbR0dOE/eMaYvyjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170490; c=relaxed/simple;
	bh=RF9BVH1lrMCCOUkRUOnmjjxgV+zbxqDfBSzLoTTiQ1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfD7A9rk97UEh6vsZftNa2YrsIJMaXrpHsk2JuCC2WpBs0trZlumZOj0gAG2GLx6aBmflLdPnvI0ErJfwi3pEC506IJMrvWYn5QCwE8cUOI4GJ3UJWyxyu1Cx62wBgLWdA5sua7LoFgFRqxsCye4RV10k0HY26b4oorf1LIOw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7DXOGbL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5958931c9c7so12087697e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767170485; x=1767775285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFVU9Q/1Cok58g44IhCYQSr/mO6T/jqCKS7T/Pv3sYs=;
        b=j7DXOGbL7ycxDAwUuoDiyuyAgMTOUoizGhTO4yH6eLRD6FSK5Nt5XBdttR9VJucAwP
         dDd2SVG1xNnK1TpLzUSE/Aou04ix1oVqFNbWZf+I8ern9j0elIIqqi75LW6zXTA2U39X
         3fx6hYTh88cI7/G7IWxkZjRoEKNqq4xGtsusF5vyM/p9ikWNNeyCMczjatJZWbbTmtA5
         MseCbANJctZjP6U4SSVXxd4lQRttjwyTv+8QTCO5RT902MyPBJj+ShcCPKjpGHuQLP9A
         QN/gf4TQVHWzwCjyc/ItGvmXxZc2+eJyfISOoWOYPkw6wEth00nzOrcU9ibTd45NFEoT
         OKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170485; x=1767775285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFVU9Q/1Cok58g44IhCYQSr/mO6T/jqCKS7T/Pv3sYs=;
        b=vv1hK9WHnyUSdrGAAUqxfea65jabisO7PKFAlvTOaSQMZq1azc3j8/sUqTRqAGF3mJ
         3keB/ElSk9MZVQXKldyg39P38jfFaovmaE/BvQlFXO0dvSi+4KrNGZd8QZw2Vd0JKZ0E
         iijyqU6lDHm2xSgAR9n4oHnYCy4P5KDGLXmGtinGXzAqzlXj1I7XOwkXWdlih/40u+Cu
         YsBbXj5gj0sG1LTPBsvnC3U6aLV//11dToPtRk23h8b35DAkIZu5ZNJTTeXmqXt1VMKh
         R3onTgTnaCVT5jdzAT3Ek+3yDOfOOKIxrXwl5zhPc5Lm1mgdAVLf4OVRL5Kdj7ZSVPS5
         Lnig==
X-Forwarded-Encrypted: i=1; AJvYcCXNt3bTcjdWe+J10ewO9247g1I0cWU3TfzRN4rR1ugRb/4prUEGjIIbN4+s0YSRldDGZ9/BHAud/4A7B3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFWUQZc+7trHdS6jeZawdbeRcCltFf13/U6UYQswiTf7kwgfD
	26CG+VG5BWzOf75F//2aSJ8OzJZnq9XafPNYMjBDKLpvP9MDvRT1TzhaI0sjv7Kks2c=
X-Gm-Gg: AY/fxX467FRriMrPyMqZhb8Bbq9FEn9HkNQuwCkwgOS6xtIGFXahwf29hJ/S2m2DkBG
	SF4wvp1EP9q8F3emcdOc9486IpTjD7eV72mqulTXFy1Jn43Hs6LbM8pxYmhCrLICyD1cxFR7bp2
	BDm2j0kfOveuM3xWe5eCoOMPi+hpbnJ1cCBuFBmPs5j5IvhLfa6pc0g8Zd9km7U5PvMEqzb8wfZ
	29zfr/9CTqSdFgnAuqJ7yYTJz+8wqyXR9DSqJNWaZPt4fIgSYMId9Szn+eGkqN9h1hXj9izqHw8
	6cISkHQE68SXCwnVU8RCaIQbh2mhtcHpzqbf3KgzXQC8BgbKHblcnVzJcair/9RQtYQ6PI5b8hH
	iLvk6IFdR8eilv7165EJ2OILsuoBBOvcfym0oVASrsd4/I/aNZZ2IXaYp22K8HTZk+tZY4aXAlP
	HgtZRKdbqbsb82WN9/oFZ1NEcrAlri941XF0pj50w9InVx
X-Google-Smtp-Source: AGHT+IHwqkiiXgHJUJdc9Gjzn1M9Ef+MQQ8/6gUCZVigT0vTPMHNx5NVj6LjhKlzdxjz9hnB1gyK6Q==
X-Received: by 2002:a05:6512:23a7:b0:59a:107a:45a9 with SMTP id 2adb3069b0e04-59a17df40a5mr12498438e87.52.1767170484911;
        Wed, 31 Dec 2025 00:41:24 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm10666566e87.0.2025.12.31.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:41:24 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/3] scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk
Date: Wed, 31 Dec 2025 10:40:48 +0200
Message-ID: <20251231084050.186874-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230205549.GE4062669@ax162>
References: <20251230205549.GE4062669@ax162>
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
 scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
 1 file changed, 128 insertions(+), 40 deletions(-)

v2: remove unused sed variables, awk from ${AWK} variable,
    curly brace syntax fix after rebase, triple check that
    correct revision of patches are used in testing with
    yocto/bitbake

v1: https://lore.kernel.org/linux-kbuild/20251229114447.45236-1-mikko.rapeli@linaro.org/T/#t

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 79c09b378be8..4cefe3cdfc2f 100755
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
@@ -43,6 +43,10 @@ STRICT=false
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
 WARNOVERRIDE=echo
 
+if [ -z "${AWK}" ]; then
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
+	if ! "${AWK}" -v prefix="$CONFIG_PREFIX" \
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
+
+	# Second pass: process base file (TMP_FILE)
+	{
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


