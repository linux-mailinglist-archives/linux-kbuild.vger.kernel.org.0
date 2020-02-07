Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D07155D60
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2020 19:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBGSII (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Feb 2020 13:08:08 -0500
Received: from mail-wr1-f73.google.com ([209.85.221.73]:53221 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBGSIG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 13:08:06 -0500
Received: by mail-wr1-f73.google.com with SMTP id a12so31809wrn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Feb 2020 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=A7PWbQJvwTT2txufQoHkwkpHKFDGayZbc6KQ+5UBHbA=;
        b=Z5jI4GcK8Flh69AYYAPiQsc3vSjflTiRzzJWbXZv1sESVps0TUOOG2oybAfZ2UjS/v
         mqz0Wvy3w6uMYPlrlJ7ypDEOEAnndwWsdp1KbarRJ+9WipW14lAPEBt+MIG++VFad4rc
         HZfDmLDsPzu1cEO3+xzL5CX+8C2hnFtWOfH5p9fGrWRIgKTJBNXcCQ9l+o2bHE54C9W1
         6Ue6HBEWW2jBxomU0c9i5IXpOe/aDrvW/IBQT/X/UBh7zM4gm+Fhgc1kK8YBG1D3qLgo
         ChKnw6N7f0J4w3iHixWWUZhMAfJpI4fwril4/nTiHRfUt/U4YeJlf6vd5BMqHAyc6tyd
         h0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=A7PWbQJvwTT2txufQoHkwkpHKFDGayZbc6KQ+5UBHbA=;
        b=s9HMytVEGo0GvYMroYazJtTQ0PntjmWfo8Fvk3hjbkSZYXC+rsfj5mlRHMXbl9tVd+
         4SAC53L8DHs6t8uIKDDL8EmssPstSXX3fYA95ZotvmGTE/yPDVXwLx+Dp8/C2wgrvulS
         oIba8JSORPedYrBYbN3ZKGuoL5/y8PDbC5ftgwWUdtlmw1R+JJfuRJyoQUvgu0ig8rvx
         uWBDkLJdp6SCAC+3WMWlQ4ywOMwfERW289RNTrBkcIadCw+RWScvAwtvt6XeVWBibeul
         AzJxSmc6qIwSapTfZB1COmw3fOndsnja69G48o9I/K9Iloosrk21aIh9tGdLzu3bWAyS
         xM1A==
X-Gm-Message-State: APjAAAXg7QeqDVFpz5xOBLb+xXxuBhMg4TU/sAaeri1SGtXVjvTwn80w
        FyJCVMfcp42+UbdzR4oWyJ7uTwCyiYH1
X-Google-Smtp-Source: APXvYqwxH/wYNA3xn5eSjBa7Rig0zjIiv+h+bHvXQRoTPp3XHf1Mkt4SfMFNgVOpvFmJVmkVSpCUg1ES2qlP
X-Received: by 2002:adf:e543:: with SMTP id z3mr195066wrm.369.1581098884370;
 Fri, 07 Feb 2020 10:08:04 -0800 (PST)
Date:   Fri,  7 Feb 2020 18:07:54 +0000
In-Reply-To: <20200207180755.100561-1-qperret@google.com>
Message-Id: <20200207180755.100561-3-qperret@google.com>
Mime-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v3 2/3] kbuild: split adjust_autoksyms.sh in two parts
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
 scripts/adjust_autoksyms.sh | 32 ++++-----------------------
 scripts/gen_autoksyms.sh    | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 28 deletions(-)
 create mode 100755 scripts/gen_autoksyms.sh

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 58335eee4b38..ae1e65e9009c 100755
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
@@ -35,31 +34,8 @@ case "$KBUILD_VERBOSE" in
 	;;
 esac
 
-# We need access to CONFIG_ symbols
-. include/config/auto.conf
-
-# The symbol whitelist, relative to the source tree
-eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
-[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
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
+$srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
 
 # Extract changes between old and new list and touch corresponding
 # dependency files.
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
new file mode 100755
index 000000000000..ce0919c3791a
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
+# The symbol whitelist, relative to the source tree
+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
+[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
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
2.25.0.341.g760bfbb309-goog

