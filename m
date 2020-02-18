Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC0216239C
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 10:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgBRJlw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 04:41:52 -0500
Received: from mail-wm1-f73.google.com ([209.85.128.73]:53424 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgBRJlw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 04:41:52 -0500
Received: by mail-wm1-f73.google.com with SMTP id w12so791226wmc.3
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 01:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nhHiHaMsZ9F+6SuWDcHjdupAiyePbAwzDM3WvZHIuT4=;
        b=e+UgUixe1CN8KmeclE5y+9TQPXdNRwFFky1fnDRqdgvmvJ7ul6hgRxwx4hI/n3GT95
         OhGOIx9D1Qqh3+DWHaZAcp3IUBbssRSpJEEg924xKtbjkCbQlssdojWZc5rhcnnHEk/p
         q9nME/SOZCp9HloSznLPJ8Us5wkiywY7zR9c4OhzDhOy8+R/lZ+GahR1kRVwrb8y0GNp
         GpwN0zxOclZzUIf4RQeK/75Jqk5G1mhHwpov56Xdop+gyHdRr51XThWhy+YKa8pOnZgA
         aRwrxyxR5EYQOoWRyASISWUnGA9JcRuf90aJosMYev5BWALX1EZQ6odlXQnn+EFh4HqH
         jwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nhHiHaMsZ9F+6SuWDcHjdupAiyePbAwzDM3WvZHIuT4=;
        b=kivL8E0fyBmhtdiFxy+DnC2pKTcmfEHRhHJIWdfWlkjQJd0LpfHi54kf43OZkn0kMx
         /NmKeytI4T/5lxV7TCJf631rPg3ofPNy8Vq2ySlNeIhO6RZzQOIwM7j9ZTSn1Di+1VCJ
         OF/FS1Khf3FMVTCKcPtPRpxX1IlFaB2kK8nhUCg+TscwPDLPIgO8VbjF9TzYsCkYQdSF
         j4WqfCEKBVn55S3h7K+9g0CjkSUSdE4uQucv1fsAg4oNGftcL7QNbUFt+ApUEw+rdBt5
         hVDzM1Kza8hKMdger817O5SU682HnF8pGF9F+PLzMiFEpU5aaNDAJlJb0ZoAYBPxB7rP
         PYLg==
X-Gm-Message-State: APjAAAUxuyjl6pN6gz0B0b8DltGMhm7h1J3OvUPznCxV5NVru0OUVjyE
        ZOHYytfkzn0krIAGzaKq6XyI7V3/WdW9
X-Google-Smtp-Source: APXvYqxuSuB4M08GH32NrWfqqEULCF+O+/GZ7UnDBHpjn/GaFm+3VSymiekPbO/Aa134hA2gF+a/h//DgrXT
X-Received: by 2002:a5d:4446:: with SMTP id x6mr27524961wrr.312.1582018907959;
 Tue, 18 Feb 2020 01:41:47 -0800 (PST)
Date:   Tue, 18 Feb 2020 09:41:38 +0000
In-Reply-To: <20200218094139.78835-1-qperret@google.com>
Message-Id: <20200218094139.78835-3-qperret@google.com>
Mime-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v5 2/3] kbuild: split adjust_autoksyms.sh in two parts
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
index ff46996525d3..2b366d945ccb 100755
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
-	if [ ! -f "$ksym_wl" ]; then
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
index 000000000000..6c625f52118f
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
+	if [ ! -f "$ksym_wl" ]; then
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
2.25.0.265.gbab2e86ba0-goog

