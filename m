Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83C0315B1BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 21:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgBLUVv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 15:21:51 -0500
Received: from mail-wr1-f74.google.com ([209.85.221.74]:45610 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbgBLUVu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 15:21:50 -0500
Received: by mail-wr1-f74.google.com with SMTP id d8so1286458wrq.12
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JKxkzP8uaZCnNh4oNiG48Pj6ASO+gJyC+moaUvI0Kbc=;
        b=BF7dxg/pIyT2JH5txBoS129DR/XhzOKn5wnado0bTUoBxu2pvFN2hZ+Am3snqcltep
         pLlv6wzGnFU/hiU3sYj6rVAyDggfTx3JOaMXmxBhUd2Yyj4QPoX0duS77IsjFbWOJcCQ
         I8yP8VizpMqAHGSqE7djh/3IOfE4FwafJ67IaTx3hHvMaNXTykeLmD1mdjBc2Rb4p1/R
         gXfFvlDwmzUn2nT9DvGZ3jdA54iVo5rhBP7iymJt06pNPJj+EL7o1gsljJrJmpf9WgY1
         wkn2UYjxYnPSmqRSQGl7ioBT2oL1eTNT7yOugOpTi4ea+HhHdsGJAX3s8tA5Xi9v5g7e
         kflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JKxkzP8uaZCnNh4oNiG48Pj6ASO+gJyC+moaUvI0Kbc=;
        b=uDnbvqsuK1VaXf+5Flxh0tZ5tE7tyVZmxlKoh1ujs+wKrZSot3Ml3+2BKSGt1t9Jzv
         Z5kvtCOwafFfDi3SUuLMxASRPj0TnIp5RiA0gDfdFuVKzSNzx6I5eL4ujFeSkCYVN+LJ
         Z5BEKudMvNryJTGnNr7tF963B1kYCE70PgkVd5PnyFwaCzrNqq/isxjr/9kT+l9Frc9W
         2P06O3YA88CkPvSj0OxxmYphEKWRHeUqp+dBgseFOfZOTGzXdG7QD6HnpdKoFmkQCg06
         ZA6xGdhD2czAJ0NXGEJCzgblK++w5KfVMlBX8XdE1uLxBKLbv7JQgPY/hK8pnNUy2TTq
         n1nQ==
X-Gm-Message-State: APjAAAWCYm3uNtvl98CQ8WJvN08H1Ler/wgNHiz46YHIDOJ0zfDPPd5S
        yw3gA5vIsbdri0bHexmowMxcEeTHafNz
X-Google-Smtp-Source: APXvYqwAoqq5zHen+A+j49ybZqkCMYBt0W9plpkVvpe0SW52v27p5TgIA1iFCtkxw/Ck8x32ku8DetUVpz1F
X-Received: by 2002:adf:a285:: with SMTP id s5mr17894312wra.118.1581538908791;
 Wed, 12 Feb 2020 12:21:48 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:21:39 +0000
In-Reply-To: <20200212202140.138092-1-qperret@google.com>
Message-Id: <20200212202140.138092-3-qperret@google.com>
Mime-Version: 1.0
References: <20200212202140.138092-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
Subject: [PATCH v4 2/3] kbuild: split adjust_autoksyms.sh in two parts
From:   Quentin Perret <qperret@google.com>
To:     masahiroy@kernel.org, nico@fluxnic.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, jeyu@kernel.org,
        hch@infradead.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In order to prepare the ground for a build-time optimization, split
adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
based on all currently available information (whitelist, and .mod
files), and the other to inspect the diff between two versions of
autoksyms.h and trigger appropriate rebuilds.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 scripts/adjust_autoksyms.sh | 29 ++++--------------------
 scripts/gen_autoksyms.sh    | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 25 deletions(-)
 create mode 100755 scripts/gen_autoksyms.sh

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 93f4d10e66e6..2b366d945ccb 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -1,14 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 
-# Script to create/update include/generated/autoksyms.h and dependency files
+# Script to update include/generated/autoksyms.h and dependency files
 #
 # Copyright:	(C) 2016  Linaro Limited
 # Created by:	Nicolas Pitre, January 2016
 #
 
-# Create/update the include/generated/autoksyms.h file from the list
-# of all module's needed symbols as recorded on the second line of *.mod files.
+# Update the include/generated/autoksyms.h file.
 #
 # For each symbol being added or removed, the corresponding dependency
 # file's timestamp is updated to force a rebuild of the affected source
@@ -38,28 +37,8 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
-# Use 'eval' to expand the whitelist path and check if it is relative
-eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
-[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
-
-# Generate a new ksym list file with symbols needed by the current
-# set of modules.
-cat > "$new_ksyms_file" << EOT
-/*
- * Automatically generated file; DO NOT EDIT.
- */
-
-EOT
-sed 's/ko$/mod/' modules.order |
-xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
-cat - "$ksym_wl" |
-sort -u |
-sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
-
-# Special case for modversions (see modpost.c)
-if [ -n "$CONFIG_MODVERSIONS" ]; then
-	echo "#define __KSYM_module_layout 1" >> "$new_ksyms_file"
-fi
+# Generate a new symbol list file
+$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
 
 # Extract changes between old and new list and touch corresponding
 # dependency files.
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
new file mode 100755
index 000000000000..2cea433616a8
--- /dev/null
+++ b/scripts/gen_autoksyms.sh
@@ -0,0 +1,44 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Create an autoksyms.h header file from the list of all module's needed symbols
+# as recorded on the second line of *.mod files and the user-provided symbol
+# whitelist.
+
+set -e
+
+output_file="$1"
+
+# Use "make V=1" to debug this script.
+case "$KBUILD_VERBOSE" in
+*1*)
+	set -x
+	;;
+esac
+
+# We need access to CONFIG_ symbols
+. include/config/auto.conf
+
+# Use 'eval' to expand the whitelist path and check if it is relative
+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
+[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
+
+# Generate a new ksym list file with symbols needed by the current
+# set of modules.
+cat > "$output_file" << EOT
+/*
+ * Automatically generated file; DO NOT EDIT.
+ */
+
+EOT
+
+sed 's/ko$/mod/' modules.order |
+xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
+cat - "$ksym_wl" |
+sort -u |
+sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
+
+# Special case for modversions (see modpost.c)
+if [ -n "$CONFIG_MODVERSIONS" ]; then
+	echo "#define __KSYM_module_layout 1" >> "$output_file"
+fi
-- 
2.25.0.225.g125e21ebc7-goog

