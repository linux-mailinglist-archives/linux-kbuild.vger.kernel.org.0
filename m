Return-Path: <linux-kbuild+bounces-11770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB+6FKAFsGlregIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11770-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:50:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFBD24BAA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B62A30CE8C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C6B388E62;
	Tue, 10 Mar 2026 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfzT+9me"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B4381AF8;
	Tue, 10 Mar 2026 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142632; cv=none; b=VSqcy1+27aC4KT1h85m1woM+Sbqrwv+M8pmJBdk7nZlXR/qbn1aMmWUwqtckcp+xkI3p1Aj5Lr7azFHxaVudkWrtdFKKiv985nHxgpvPwEiMzHWlOIC+P2sRnwHOZ39pkLF+Ta7rNh6qhQ7tRMbAfr73sWv1eZdsIl4DayKGAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142632; c=relaxed/simple;
	bh=cdQbUNB3DOV9VEW+JOfdyzZgn+7dxY8WpNMVnpS2SCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5xu3DAboKeq1C4Rseg+aH4oGiA86jAOHuyxpaT9TsNLSHe+z0ZdTiGYjDdgMU1tuH3pw3zBu9mHN+RWs/B42iAuvzrCiLURJ/siEnJ/dvLcWjlqWNk6ZG+OpS/K/8dhQFkqSMlIozbpVJNAUcF8YQaEGLQy0zdbxRhuI6e3XiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfzT+9me; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C5FC2BC9E;
	Tue, 10 Mar 2026 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142631;
	bh=cdQbUNB3DOV9VEW+JOfdyzZgn+7dxY8WpNMVnpS2SCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HfzT+9me7I1K052HDZrjEGYUkxGYA6HBOqPBDFXV/sNr254EZl8HN7PajiB8j6rdM
	 KGb6w18lIwXHw0dR01emOxrQ/WMQbGPqeVIjawFjLFM8g4/haUE6buasBgFPXBenk+
	 9E83gNGrB+XYAEIDOetdyfmTNyjEemAGQSU0z+TJas2uUJ2cxzCFVjmhLSwQ6fWWxf
	 0ilGdsmuvFLhkH14AQ6+IYU3MGUuSrxIn3I9ov7GaarixiSpFE3W5zLpdw5bmNogqG
	 Q/TAcN7tm46RW/tn+a7wlrcKmXzi9SkXZzDnk2i2+pJpZad5nsJ4WhWGdxXpgzlZLV
	 QXiCDrFaVNz9g==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Tue, 10 Mar 2026 12:36:23 +0100
Subject: [PATCH 1/3] scripts: kconfig: merge_config.sh: pass output file as
 awk variable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-fixes-merge-config-v1-1-beaeeaded6bd@samsung.com>
References: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
In-Reply-To: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=Dx1MP4xz4SXiw8lPzUvcg7ExiVYg1hpymiiycR4cqUw=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpsAJgGs1WChofCVPObUQVOuc01uLQA0B4NxFjv
 AcxPbLY2eGJAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCabACYAAKCRBAnqPEHxlR
 +9d4D/44ycZWbLHpJvsqYUiKo+L9zu8+7JJhmy1n05+N1q1PoqmS2cW3J835VUvgJLENS3Ulzwj
 Wa63UyK2RXmS57947AFC4YBotIPi7Ipd5Uh6Ljhgc8aRBa5v8mN+okNF/k6TBWA0FWC8Zmga2a6
 2Yhkz4hndksej+nqh3o7WmR1vibniprrT8OqHroOJ8WTAVm850JyCAYPetxc/PaM5W6Q6LnaK8f
 RI3/DHAoXEmLnIdRsdMbpp/AuJthcMCbKbScM9z9WLhz/eJREuok8Oc/FcHC8AlwZ5iVDHEguli
 a1jAyv6wcotL36NwjR1G6K7ALh+BL21bRnCJ1W54uRApnBdqWXtH7qXmM4NbgQkSSOvLKiUCnb6
 uk4dmeqg3jdLhGj+ta6Xs/YQqAZiJRRUmnTkyvxbg5k5klr0MJ5hodgLa+4TLXPc3Fzn7odFCqm
 LrlVe8NW7qfMNWa/POrME/q4IA6j/mLZ1xsWCrzVMrj2TCfy1bWcDck5KHNOL27U8sh7vz0d+81
 LUGWOkXAvnTkx7xcXg0LT+IpqG4MW/3Yo1P5i3YGC3jUfIKJ4UIPjPU7BPl/hzhBnhcJAD7cfwZ
 qebXuv9Wq4sI+dz2tw+hEOt00uwYRVpWM7lWMXNt2ntoXj4Cvh3hEsiJpE1TyDrztaRDRASio2+
 8fjBdN54sMvFPMw==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Queue-Id: 0AFBD24BAA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11770-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,samsung.com:mid,samsung.com:email]
X-Rspamd-Action: no action

From: Daniel Gomez <da.gomez@samsung.com>

The refactoring commit 5fa9b82cbcfc5 ("scripts: kconfig:
merge_config.sh: refactor from shell/sed/grep to awk") passes
$TMP_FILE.new as ARGV[3] to awk, using it as both an output destination
and an input file argument. When the base file is empty, nothing is
written to ARGV[3] during processing, so awk fails trying to open it
for reading:

    awk: cmd. line:52: fatal: cannot open file
    `./.tmp.config.grcQin34jb.new' for reading: No such file or directory
    mv: cannot stat './.tmp.config.grcQin34jb.new': No such file or directory

Pass the output path via -v outfile instead and drop the FILENAME ==
ARGV[3] { nextfile }.

Fixes: 5fa9b82cbcfc5 ("scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk")

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/kconfig/merge_config.sh | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 735e1de450c6..5177bde69c1d 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -151,6 +151,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 	if ! "$AWK" -v prefix="$CONFIG_PREFIX" \
 		-v warnoverride="$WARNOVERRIDE" \
 		-v strict="$STRICT" \
+		-v outfile="$TMP_FILE.new" \
 		-v builtin="$BUILTIN" \
 		-v warnredun="$WARNREDUN" '
 	BEGIN {
@@ -212,7 +213,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 
 		# Not a config or not in merge file - keep it
 		if (cfg == "" || !(cfg in merge_cfg)) {
-			print $0 >> ARGV[3]
+			print $0 >> outfile
 			next
 		}
 
@@ -222,7 +223,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		# BUILTIN: do not demote y to m
 		if (builtin == "true" && new_val ~ /=m$/ && prev_val ~ /=y$/) {
 			warn_builtin(cfg, prev_val, new_val)
-			print $0 >> ARGV[3]
+			print $0 >> outfile
 			skip_merge[merge_cfg_line[cfg]] = 1
 			next
 		}
@@ -235,7 +236,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 
 		# "=n" is the same as "is not set"
 		if (prev_val ~ /=n$/ && new_val ~ / is not set$/) {
-			print $0 >> ARGV[3]
+			print $0 >> outfile
 			next
 		}
 
@@ -246,25 +247,20 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		}
 	}
 
-	# output file, skip all lines
-	FILENAME == ARGV[3] {
-		nextfile
-	}
-
 	END {
 		# Newline in case base file lacks trailing newline
-		print "" >> ARGV[3]
+		print "" >> outfile
 		# Append merge file, skipping lines marked for builtin preservation
 		for (i = 1; i <= merge_total; i++) {
 			if (!(i in skip_merge)) {
-				print merge_lines[i] >> ARGV[3]
+				print merge_lines[i] >> outfile
 			}
 		}
 		if (strict_violated) {
 			exit 1
 		}
 	}' \
-	"$ORIG_MERGE_FILE" "$TMP_FILE" "$TMP_FILE.new"; then
+	"$ORIG_MERGE_FILE" "$TMP_FILE"; then
 		# awk exited non-zero, strict mode was violated
 		STRICT_MODE_VIOLATED=true
 	fi

-- 
2.53.0


