Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7E416164D
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 16:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgBQPhg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 10:37:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39362 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgBQPhg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 10:37:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so18965522wme.4
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sj0ZG4VD+UjkrUGw8YOU5MleYJNCBmlw9yndN/QBHts=;
        b=l4StWRaHLrA5bn34nbio/qg29dHV8tKN5ynUuV7Tzxc74GviFT5BMwS8/u+QzyjAeh
         b5gXPpEdQHT2vzzNSMUfQIVaDMxOPBxfObCcVyg/5acV7G9Wi/WM+8IKtdQLzPXJgCP4
         V480jjaTelup5A1e18NoOj2JPcSsI/8fXVAZgch3TOaJprNv2uiFoaBEi7TqKYUxkDcI
         SOZDyLQLB/c0vYaMcPV6L+w7lH8qIfGf6fDstKLixi7GEDkc8fteESBDrhlyNSnQQxq+
         MnhL26xfJY1ba9GeIWuHyn/pc4YC6eHXy3Dx6fz1smKWAAW4XPIqsY6NctmFMpjzAPXi
         4NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sj0ZG4VD+UjkrUGw8YOU5MleYJNCBmlw9yndN/QBHts=;
        b=bT85IJCnrlvb5uT4pPpQYkezWwlR+/60YPkObG7DfIqk+/Q9OaQJzHNAwEVeEXXSsO
         gVbfEfmxXU4ReaW2A3dzNK3HNjlvfS8tbNEb8egXooB97a/fnYZNIzwgFZZWCyP2jxXE
         7FWuTyjgejWnlfA5IjSvjDGci7p4h6L+c7flKxIHa250ynYW5YZieTo2ZeOT9DhL8hTW
         3no/6SLhqn993cURlejctM3gQUkWAUYYeVkUgVT01SvbMs3N5Y4rCAUz+gdWCeRAjHIn
         EGy6XCChEfZHDnlfP80NvbCgWtu8HUJ6Rm1aScmq/1mVdnnp4HO2KiJlzzj8V7HTaHaq
         Wo4A==
X-Gm-Message-State: APjAAAWfCytjfCLAe0/Oc4BJYA5zh8xVclvExC0xuaaCen/XF6+2wN/n
        RwBXeKoae2SzQa9mj/G3TzpaYQ==
X-Google-Smtp-Source: APXvYqzkuwM6cQc8NV3hZdCoZrFyoyWpoLQEoqsWKj5+azYt+uiWp9Bv+SLW6qNptB00WTjjalqVQw==
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr23085737wmm.79.1581953853540;
        Mon, 17 Feb 2020 07:37:33 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id g7sm1563737wrq.21.2020.02.17.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:37:33 -0800 (PST)
Date:   Mon, 17 Feb 2020 15:37:32 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Quentin Perret <qperret@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 2/3] kbuild: split adjust_autoksyms.sh in two parts
Message-ID: <20200217153732.GB48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-3-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-3-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 12, 2020 at 08:21:39PM +0000, Quentin Perret wrote:
>In order to prepare the ground for a build-time optimization, split
>adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
>based on all currently available information (whitelist, and .mod
>files), and the other to inspect the diff between two versions of
>autoksyms.h and trigger appropriate rebuilds.
>
>Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Matthias Maennich <maennich@google.com>
Tested-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>---
> scripts/adjust_autoksyms.sh | 29 ++++--------------------
> scripts/gen_autoksyms.sh    | 44 +++++++++++++++++++++++++++++++++++++
> 2 files changed, 48 insertions(+), 25 deletions(-)
> create mode 100755 scripts/gen_autoksyms.sh
>
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index 93f4d10e66e6..2b366d945ccb 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -1,14 +1,13 @@
> #!/bin/sh
> # SPDX-License-Identifier: GPL-2.0-only
>
>-# Script to create/update include/generated/autoksyms.h and dependency files
>+# Script to update include/generated/autoksyms.h and dependency files
> #
> # Copyright:	(C) 2016  Linaro Limited
> # Created by:	Nicolas Pitre, January 2016
> #
>
>-# Create/update the include/generated/autoksyms.h file from the list
>-# of all module's needed symbols as recorded on the second line of *.mod files.
>+# Update the include/generated/autoksyms.h file.
> #
> # For each symbol being added or removed, the corresponding dependency
> # file's timestamp is updated to force a rebuild of the affected source
>@@ -38,28 +37,8 @@ esac
> # We need access to CONFIG_ symbols
> . include/config/auto.conf
>
>-# Use 'eval' to expand the whitelist path and check if it is relative
>-eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>-[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
>-
>-# Generate a new ksym list file with symbols needed by the current
>-# set of modules.
>-cat > "$new_ksyms_file" << EOT
>-/*
>- * Automatically generated file; DO NOT EDIT.
>- */
>-
>-EOT
>-sed 's/ko$/mod/' modules.order |
>-xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>-cat - "$ksym_wl" |
>-sort -u |
>-sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>-
>-# Special case for modversions (see modpost.c)
>-if [ -n "$CONFIG_MODVERSIONS" ]; then
>-	echo "#define __KSYM_module_layout 1" >> "$new_ksyms_file"
>-fi
>+# Generate a new symbol list file
>+$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
>
> # Extract changes between old and new list and touch corresponding
> # dependency files.
>diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
>new file mode 100755
>index 000000000000..2cea433616a8
>--- /dev/null
>+++ b/scripts/gen_autoksyms.sh
>@@ -0,0 +1,44 @@
>+#!/bin/sh
>+# SPDX-License-Identifier: GPL-2.0-only
>+
>+# Create an autoksyms.h header file from the list of all module's needed symbols
>+# as recorded on the second line of *.mod files and the user-provided symbol
>+# whitelist.
>+
>+set -e
>+
>+output_file="$1"
>+
>+# Use "make V=1" to debug this script.
>+case "$KBUILD_VERBOSE" in
>+*1*)
>+	set -x
>+	;;
>+esac
>+
>+# We need access to CONFIG_ symbols
>+. include/config/auto.conf
>+
>+# Use 'eval' to expand the whitelist path and check if it is relative
>+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>+[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
>+
>+# Generate a new ksym list file with symbols needed by the current
>+# set of modules.
>+cat > "$output_file" << EOT
>+/*
>+ * Automatically generated file; DO NOT EDIT.
>+ */
>+
>+EOT
>+
>+sed 's/ko$/mod/' modules.order |
>+xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>+cat - "$ksym_wl" |
>+sort -u |
>+sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
>+
>+# Special case for modversions (see modpost.c)
>+if [ -n "$CONFIG_MODVERSIONS" ]; then
>+	echo "#define __KSYM_module_layout 1" >> "$output_file"
>+fi
>-- 
>2.25.0.225.g125e21ebc7-goog
>
