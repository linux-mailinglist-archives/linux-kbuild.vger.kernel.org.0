Return-Path: <linux-kbuild+bounces-4966-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C29E1FE9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 15:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8655EB37B56
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 13:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598381F12F2;
	Tue,  3 Dec 2024 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lj8CkesZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF01EB9EB;
	Tue,  3 Dec 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234129; cv=none; b=nmET6JFl9Bs5hH7f7OPbJX7fZ4bJySxL+9SCnuYLRPCIgMAE/URPZo231NtvqXQg0Z4+5c6rBXkdZWqjwWcW2rQ8shf9mXU795gk6wb04a858uQPU8Rz783jxiCP8wbOpWLGGQTwwLMnmhx93jJOxh+yTAry+kaz4jj8oDFP0yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234129; c=relaxed/simple;
	bh=YxuqQgJLfpd4HodsZVa0O6Pu7LR7Mzot6gA3INEGXXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DG61PVrDfvTV1uV5nq3+21yN/GSZCTnThyrRSlHDyYZqJhpQhbbC/PCfxdrIr3fycLqkio6ATHgmjYSCviRQ+A15KuGmBpNqrDa4ZrSXj8BbddYahqkUYFct5fD7DH6xt4x1AYFxgvsrHTMJjut1NK/4om+F9eFsc7Lydhfza3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lj8CkesZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC636C4CECF;
	Tue,  3 Dec 2024 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733234125;
	bh=YxuqQgJLfpd4HodsZVa0O6Pu7LR7Mzot6gA3INEGXXY=;
	h=From:To:Cc:Subject:Date:From;
	b=Lj8CkesZEoJrvohwJHVD6zwGxEU/gmlipcnA4uTpjQPItZnXBAjzKOFmvxeMRMXcB
	 rklPH52WxDGArT/fMrNBY73Fx4ujm4/VNjKH0ltl9R10w9agExTdXWZIQ/m+dut2Bp
	 9AGusao2TJk3qwDtgd531COPGuiiNJoA+CqD0OadYnZrk8xVftFeFE3RHxb6YZKA9y
	 1bmXjbTQLw302K7BxETQmRva9ADSDTpI9Ycyrc4ZQ/KfxRc8d7l0+n/+8vj5N5UKXm
	 ZjZi37d5YesNPJSrC7s7dnnVxa6uVhn+v0ZzAUFM2JwpP39pWmhIjKlKq1bj5LvdTT
	 KAjIfwmLL+cog==
From: Leon Romanovsky <leon@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-next] kbuild: Respect request to silent output when merging configs
Date: Tue,  3 Dec 2024 15:55:18 +0200
Message-ID: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Builds with -s option (silent) are supposed to silence all output
which is not an error. It is the case for target builds but not
for configs. These builds generate prints like this:

➜  kernel git:(rdma-next) make -s defconfig debug.config
 Using .config as base
 Merging ./kernel/configs/debug.config
 #
 # merged configuration written to .config (needs make)
 #
 ...
 Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kernel/configs/debug.config:
 Previous value: # CONFIG_FUNCTION_TRACER is not set
 New value: CONFIG_FUNCTION_TRACER=y
 ----

Let's honor -s option and hide all non-error output.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 scripts/kconfig/Makefile        |  3 ++-
 scripts/kconfig/merge_config.sh | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index a0a0be38cbdc..130c3c74b828 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -15,6 +15,7 @@ endif
 
 ifeq ($(quiet),silent_)
 silent := -s
+silent_merge := -q
 endif
 
 export KCONFIG_DEFCONFIG_LIST :=
@@ -107,7 +108,7 @@ config-fragments = $(call configfiles,$@)
 
 %.config: $(obj)/conf
 	$(if $(config-fragments),, $(error $@ fragment does not exists on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh $(silent_merge) -m $(KCONFIG_CONFIG) $(config-fragments)
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 PHONY += tinyconfig
diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 0b7952471c18..29060fba84b6 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -30,6 +30,7 @@ usage() {
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo "  -s    strict mode. Fail if the fragment redefines any value."
 	echo "  -Q    disable warning messages for overridden options."
+	echo "  -q    be quiet."
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
 }
@@ -42,6 +43,7 @@ OUTPUT=.
 STRICT=false
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
 WARNOVERRIDE=echo
+QUIET=echo
 
 while true; do
 	case $1 in
@@ -89,6 +91,12 @@ while true; do
 		shift
 		continue
 		;;
+	"-q")
+		WARNOVERRIDE=true
+		QUIET=true
+		shift
+		continue
+		;;
 	*)
 		break
 		;;
@@ -123,7 +131,7 @@ SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
 
-echo "Using $INITFILE as base"
+${QUIET} "Using $INITFILE as base"
 
 trap clean_up EXIT
 
@@ -131,7 +139,7 @@ cat $INITFILE > $TMP_FILE
 
 # Merge files, printing warnings on overridden values
 for ORIG_MERGE_FILE in $MERGE_LIST ; do
-	echo "Merging $ORIG_MERGE_FILE"
+	${QUIET} "Merging $ORIG_MERGE_FILE"
 	if [ ! -r "$ORIG_MERGE_FILE" ]; then
 		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
@@ -179,9 +187,9 @@ fi
 
 if [ "$RUNMAKE" = "false" ]; then
 	cp -T -- "$TMP_FILE" "$KCONFIG_CONFIG"
-	echo "#"
-	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
-	echo "#"
+	${QUIET} "#"
+	${QUIET} "# merged configuration written to $KCONFIG_CONFIG (needs make)"
+	${QUIET} "#"
 	exit
 fi
 
-- 
2.47.0


