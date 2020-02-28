Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D78173E44
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 18:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgB1RUZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 12:20:25 -0500
Received: from mail-vk1-f201.google.com ([209.85.221.201]:33618 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1RUZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 12:20:25 -0500
Received: by mail-vk1-f201.google.com with SMTP id z24so1595758vkn.0
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2020 09:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SWZnVkGkrd/D0/3m4AMxVFcHu+nrKGAFuNO3Qq/CuG0=;
        b=kxPrXrsKoz49zxYM/ksRXHC0cbC6kKdrL+xXPqZlm3UZ8otgq+zXlT5YganuFvjh7n
         f3qbgN6G4J7qBrYVqMHsut2+Ka9erxLbarYe6Lbqr4tSnpMNh5RISu4oi1MtUp/5Aots
         o2z+gviBUZyStUsei8Vp7vPfko71NJb+xWv6IUxdsb5Blew4Nv80x4M0KqgE/fhPhyey
         RMCcYq7CUdFDlp0WDyEAG6AlgO4cf9MC1j9zxpkCNSxl+05vtVXpZ3FH0B7I+qZfp4TE
         MK2NsZsWEB6YK0JtaiYCe3tZ+80Kcr62Zf999KoajzC6w+iLIvJYihFutzJ7WQsVFN2D
         4vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SWZnVkGkrd/D0/3m4AMxVFcHu+nrKGAFuNO3Qq/CuG0=;
        b=fXcclFDR0ydRvi1m5OawEo298osOKBVb5Ke+bcgvO/FJM2L4sux2vFjnCegMYebYV4
         UCHJewzE8qd8T7Pw3tBLCqO15VXROikTdmUIBigncHfLbypwBgn6FI4ijls2VDF5b6UO
         rjL0YmmxKJ5/2vXjAIcbZnFqrlIUhJa149VzIYMtp5yrCdyVdL8Wi52kXXgK2q0qDWmw
         UloJpQkQ9ec9EulxTJ72g3uuMLtERiXyfzsKnUmvJcbo1iCOaVcKqiZcYE1ewoS2NqvL
         cmADNiLNtH7egdvxRvqwZkPFCJfyP0dmwAwX2WapHEcii2Y2pb5ddIps3msuKcXSwwwW
         7+dQ==
X-Gm-Message-State: ANhLgQ0loyXLcV2xr0l8g/cP9jBGxXAwTorxvlJaqxOtLZL8I9UnAG1d
        LaMcfqQUSpVaWhcv4XRAuEGeR/C1FEOl
X-Google-Smtp-Source: ADFU+vtr9M5RlW5MuGlLnrqGlXYwL3ZWaR7KKV2UyDwJ+xCSBCO7ALTb+DDczVT7SuJykWhM9nGhVpwv8VCR
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr3253871vkn.0.1582910424004;
 Fri, 28 Feb 2020 09:20:24 -0800 (PST)
Date:   Fri, 28 Feb 2020 17:20:14 +0000
In-Reply-To: <20200228172015.44369-1-qperret@google.com>
Message-Id: <20200228172015.44369-3-qperret@google.com>
Mime-Version: 1.0
References: <20200228172015.44369-1-qperret@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v6 2/3] kbuild: split adjust_autoksyms.sh in two parts
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

Acked-by: Nicolas Pitre <nico@fluxnic.net>
Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 scripts/adjust_autoksyms.sh | 36 +++-----------------------
 scripts/gen_autoksyms.sh    | 51 +++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 32 deletions(-)
 create mode 100755 scripts/gen_autoksyms.sh

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 212ba45595d3..2b366d945ccb 100755
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
@@ -38,35 +37,8 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
-ksym_wl=/dev/null
-if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
-	# Use 'eval' to expand the whitelist path and check if it is relative
-	eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
-	[ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
-	if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
-		echo "ERROR: '$ksym_wl' whitelist file not found" >&2
-		exit 1
-	fi
-fi
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
index 000000000000..ef46200c366b
--- /dev/null
+++ b/scripts/gen_autoksyms.sh
@@ -0,0 +1,51 @@
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
+ksym_wl=/dev/null
+if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
+	# Use 'eval' to expand the whitelist path and check if it is relative
+	eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
+	[ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
+	if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
+		echo "ERROR: '$ksym_wl' whitelist file not found" >&2
+		exit 1
+	fi
+fi
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
2.25.1.481.gfbce0eb801-goog

