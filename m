Return-Path: <linux-kbuild+bounces-5496-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFCA13C4C
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2025 15:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8373188D2EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2025 14:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3454924A7F2;
	Thu, 16 Jan 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9g8WnKU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F486328;
	Thu, 16 Jan 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037957; cv=none; b=hHpyM7H4tZso6XE4OgbbNFATjblR7BXEnxjEdApLMWuHvw5sBtn+F8ilTxNLjEpWQZ7RKOGbdJuk4blCa1+MXRnGLisin8nCvIsMjqbc2yISfcVSUPG5HwvTnS81ThEERxdFaBWrphex90jq2JuWUlNr3lJAmtPdu/E7Wz20cMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037957; c=relaxed/simple;
	bh=ooFJgRo3EQMASo0xPCIEe1puHaOcHiWdiD9O1HszpZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNCjNyZcUSec7I5rXff5t6dscQjCjGNI9hpfamGmyqK4LKAba1tuzUZP3dBN2wCjnO1nRvZwpszG2xtCpfPeqZAiEdElIRSvi0hi6RXIvPIcO3gpbhqfaO9jSpttiRwtpIIYkvkfyaDRvrJ+fGZo7AN7U/Vkv6Z+q1Te7hfCHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9g8WnKU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737037955; x=1768573955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ooFJgRo3EQMASo0xPCIEe1puHaOcHiWdiD9O1HszpZY=;
  b=K9g8WnKUQhRlKXMggtG+2Wk9ufnFQJynuf7J8DUXcZ4cb4qavnvtUmK0
   jQo3yCvAWZ92BxpEGhlwWB5gFZXnFbh8MdPE+wzisTaz8/aKMIr+MHXZp
   jPSKZuDsm/DIPPDGi2SO8ShsPb28xeGu/8SA2GGg7GqpbGFVF4A7OFAQW
   csjMsKbOdH9dg4L16YE8uQUtPLHtkvB9sxj0r1HO/ZBQj0aCXl/Of5Whq
   B/7g9K2iAui1PiSxwmv66Vl4lWP1NJ3KEjzrVjkdpTrvPY1Sc7eXZ8VFz
   JPoEGiWydvBov3eQTWUv0V40XfmaSTjXwRKftH213zZVWx6XbBiNn9FVO
   g==;
X-CSE-ConnectionGUID: 5Y2XpalmT3C9EW/+Muz7Hg==
X-CSE-MsgGUID: uSFR9S6zRICp4VTV9moVMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37308726"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37308726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 06:32:34 -0800
X-CSE-ConnectionGUID: OXHVgrlwQmeytQ1zyYoskw==
X-CSE-MsgGUID: nk/Av0yXRVyYDku4T3sy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110134556"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 06:32:33 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: artem.bityutskiy@intel.com,
	maciej.wieczor-retman@intel.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: kconfig: merge_config: Add upgrade mode option
Date: Thu, 16 Jan 2025 15:31:40 +0100
Message-ID: <20250116143140.2640563-1-maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The -y option in merge_config.sh is used to not demote options that are
enabled - if something is set as builtin it won't move to be a module in
the output .config.

There is however no mode that would simply take the most enabled option
out of both files and put it in the output .config.

Add an upgrade mode specified by passing -u parameter. It works similar
to -y but when the new value is "not set" it will use the old value.

Reuse the BUILTIN_FLAG since usage is similar and rename it to OMIT_FLAG
since it's not used for builtin option only anymore.

Change the if else order so upgrade is checked first and builtin is
checked second since upgrade is a wider version of builtin.

I tested the patch on two working configs from two very different kernel
builds and it compiled and booted without problems.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 scripts/kconfig/merge_config.sh | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 0b7952471c18..da794ac08b3e 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -30,6 +30,7 @@ usage() {
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo "  -s    strict mode. Fail if the fragment redefines any value."
 	echo "  -Q    disable warning messages for overridden options."
+	echo "  -u    make builtin have precedence over modules and modules over not set"
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
 }
@@ -38,6 +39,7 @@ RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
 BUILTIN=false
+UPGRADE=false
 OUTPUT=.
 STRICT=false
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
@@ -69,6 +71,11 @@ while true; do
 		shift
 		continue
 		;;
+	"-u")
+		UPGRADE=true
+		shift
+		continue
+		;;
 	"-O")
 		if [ -d $2 ];then
 			OUTPUT=$(echo $2 | sed 's/\/*$//')
@@ -143,13 +150,23 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
 		PREV_VAL=$(grep -w $CFG $TMP_FILE)
 		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
-		BUILTIN_FLAG=false
-		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
+		OMIT_FLAG=false
+
+		if { [ "$UPGRADE" = "true" ] && \
+			{ { [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; } ||
+			{ [ "${NEW_VAL#CONFIG_*=}" != "m" ] && [ "${NEW_VAL#CONFIG_*=}" != "y" ] &&
+			{ [ "${PREV_VAL#CONFIG_*=}" = "y" ] || [ "${PREV_VAL#CONFIG_*=}" = "m" ]; }; }; }; }; then
+			${WARNOVERRIDE} Previous  value: $PREV_VAL
+			${WARNOVERRIDE} New value:       $NEW_VAL
+			${WARNOVERRIDE} -u passed, will demote neither y to m nor y or m to not set
+			${WARNOVERRIDE}
+			OMIT_FLAG=true
+		elif [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
 			${WARNOVERRIDE} Previous  value: $PREV_VAL
 			${WARNOVERRIDE} New value:       $NEW_VAL
 			${WARNOVERRIDE} -y passed, will not demote y to m
 			${WARNOVERRIDE}
-			BUILTIN_FLAG=true
+			OMIT_FLAG=true
 		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
 			${WARNOVERRIDE} Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
 			${WARNOVERRIDE} Previous  value: $PREV_VAL
@@ -161,7 +178,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 		elif [ "$WARNREDUN" = "true" ]; then
 			${WARNOVERRIDE} Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
 		fi
-		if [ "$BUILTIN_FLAG" = "false" ]; then
+		if [ "$OMIT_FLAG" = "false" ]; then
 			sed -i "/$CFG[ =]/d" $TMP_FILE
 		else
 			sed -i "/$CFG[ =]/d" $MERGE_FILE
-- 
2.47.1


