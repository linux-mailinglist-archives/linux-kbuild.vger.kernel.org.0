Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13912CC07F
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 16:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgLBPNh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 10:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgLBPNh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 10:13:37 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A435C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 07:12:51 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id t22so1635266qtq.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 07:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=QqJF4A6O3nLNI0rY+zC99vFcx7l8dIoUknmC7mSKqg8=;
        b=EoUHrSr4R3GR5xGAC80j/tthJ4QasodNiPqymZrb2TbeZCSOBgcZaw3ZuXb5E1iW4D
         6U5i/MDMvREtvkPnSdQ3q0KFk0P6VMAQjzl7WRW3/L/IE6Znw+gGsBaPl5yqtImD6bz1
         0LyTqnKJP1v5GY/sFmenAORypi/VDub3z/bCRHHEtN2Zwj+JbdyNRoaMojrm+HsY5qqY
         fbQ+YdATbXbVuNH+ThROrbR/3RbFRNLYpERjNicPg4zxGrm6WxZr/9RYvcx7VnFJxWj0
         3BghIczMVv9jPaLyZ3UbnTVET0XZYUIG6b1IklJgF7q5UEEYU0jcI0voJgSdq80jWx1m
         b65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=QqJF4A6O3nLNI0rY+zC99vFcx7l8dIoUknmC7mSKqg8=;
        b=S5earHkmmx3SM1VsLKPpSYBUHDBvyyIW079FOO6Y6S/eHA8sifNI6nHmaF84k4Pr3c
         uAUM88lLsnC/hZkhEJKYTNkOi3VAyFUnSeW7JSkV7tk3S43mWdyJ0qoVCc/6AZIVZMFb
         Ha2gHUkszsI3eZNPzwryxFCttcWPsUxc2Rd25zrYVJDgL92OdSGqFOvcwgE2PEOzv2Bo
         4RYpamHh1ZbmyD5wJ9YGZTR7gqt+TEmdDnN7QeM+vnJr3mquE/K3CxEsYchPGzUBSsRn
         gRqUPNkZHcENeaRmwgX+KxtQjpug0WbEjdsBuO+S5sj0Cq7LvqvbpGmqGpVXRG4MJmW3
         LKcQ==
X-Gm-Message-State: AOAM5337vfJZipGQOzJXqoRRHOAxi+X0GIK/aWTYa9QJpFoBb1/1qEOY
        l6o046uZYNCCh6P35yJT2rtcLUA6sUy6rQ==
X-Google-Smtp-Source: ABdhPJxj+pLFdHPvzJjp52Gin8kva/flBCM86/IzRSD/xVE2U3/ed4vf3OVUg1MiiRKc9usXtPwF5lrGhG500g==
Sender: "maennich via sendgmr" <maennich@lux.lon.corp.google.com>
X-Received: from lux.lon.corp.google.com ([2a00:79e0:d:210:7220:84ff:fe09:a3aa])
 (user=maennich job=sendgmr) by 2002:a05:6214:24:: with SMTP id
 b4mr2839664qvr.29.1606921970522; Wed, 02 Dec 2020 07:12:50 -0800 (PST)
Date:   Wed,  2 Dec 2020 15:12:39 +0000
Message-Id: <20201202151238.3776616-1-maennich@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] scripts: merge_config: add strict mode to fail upon any redefinition
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When merging configuration fragments, it might be of interest to
identify mismatches (redefinitions) programmatically. Hence add the
option -s (strict mode) to instruct merge_config.sh to bail out in
case any redefinition has been detected.

With strict mode, warnings are emitted as before, but the script
terminates with rc=1. If -y is set to define "builtin having
precedence over modules", fragments are still allowed to set =m (while
the base config has =y). Strict mode will tolerate that as demotions
from =y to =m are ignored when setting -y.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 scripts/kconfig/merge_config.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 63c8565206a4..d0b957b20cbf 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -28,6 +28,7 @@ usage() {
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -y    make builtin have precedence over modules"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
+	echo "  -s    strict mode. Fail if the fragment redefines any value."
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
 }
@@ -37,6 +38,7 @@ ALLTARGET=alldefconfig
 WARNREDUN=false
 BUILTIN=false
 OUTPUT=.
+STRICT=false
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
 
 while true; do
@@ -75,6 +77,11 @@ while true; do
 		shift 2
 		continue
 		;;
+	"-s")
+		STRICT=true
+		shift
+		continue
+		;;
 	*)
 		break
 		;;
@@ -141,6 +148,9 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
+			if [ "$STRICT" = "true" ]; then
+				STRICT_MODE_VIOLATED=true
+			fi
 		elif [ "$WARNREDUN" = "true" ]; then
 			echo Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
 		fi
@@ -153,6 +163,11 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
+if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
+	echo "The fragment redefined a value and strict mode had been passed."
+	exit 1
+fi
+
 if [ "$RUNMAKE" = "false" ]; then
 	cp -T -- "$TMP_FILE" "$KCONFIG_CONFIG"
 	echo "#"
-- 
2.29.2.454.gaff20da3a2-goog

