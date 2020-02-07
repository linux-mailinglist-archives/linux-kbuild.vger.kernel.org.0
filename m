Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CAA155D65
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2020 19:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgBGSIX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Feb 2020 13:08:23 -0500
Received: from mail-wr1-f74.google.com ([209.85.221.74]:36358 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBGSIJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 13:08:09 -0500
Received: by mail-wr1-f74.google.com with SMTP id t6so54754wru.3
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Feb 2020 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Wx4Lk/qcxkAc1kcfbOM2JJx2GgJH5oSaDPZKdVYKXDQ=;
        b=hsaTlcgJklMNfzJzHRvB7XaB+Bo8T0xIMM7/acRqZePCPIKvupjLpYefjqxv9yoFO6
         WWiTwjuMre7mvLufstCGVegdG6Aj+4LcNyaePrMvemmZWU1G++lXYPVvZ7I9uwMOEz/H
         tEJ32T7SwGkHfktmjDK+BUOPHj0o5Q9YDdefdBJrpfsf6D8suxdXEMRC5HDIQWgzCYyQ
         U35j+tIlY1gOzgnZjn/gv5S9dKbVG1nz0Y7iNE1t0AwhHb8zVb22XlytQDFTBIV6GB+o
         CAPI45vnT/YOqcP+luRy1W9yjxhSYcQN8hLJrszPQt91NXkUgQwZN0ao2jLoFBXt3LQN
         FctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Wx4Lk/qcxkAc1kcfbOM2JJx2GgJH5oSaDPZKdVYKXDQ=;
        b=ME3jcyVn9DTyeZ5gMq+BXpgPLPAMGen2ZUDGoao8hT06V5SRgfzVwbRdO5O/t4OX2y
         Zbw9owzG63AxN4oWhJknMb433MHzWX+BL3ODBv4lFKVaHw6v0PSogrulpGmGcMZ0KvV3
         iAeI9ZPd/89iSIxjAyUTn4+Js5kF/9Xrn6gMZyU98NymidKaFrxt2RohpvNA78uBCR49
         LbXL0dP1r5iHmWgiwUhNZhZUHyquoIrT48e5JWM/JGzpXvJznSuvUcqh0JpLPu+J8Dfh
         HAmboW8TqKm7XPKXKGAtjFnFJYP/rz10mfwpiQbQ9Rvf49D9bruxDYjrZwUcF0YoXmSr
         KpGg==
X-Gm-Message-State: APjAAAX/bLCECeGfeG9Vr/tZCz7FBcha7TBkDozvxsUxZG4RhknwKlzw
        WVTupDw43FvwpP38yATf5WPKUGKiFqjX
X-Google-Smtp-Source: APXvYqw7vu25vWGiGIY5yFYv+rMDZzcvNB415zRBWFXZSdBTPzshF4TUzrsyGehmj5mQoi6NoShI7HArFZlm
X-Received: by 2002:a5d:540f:: with SMTP id g15mr258451wrv.86.1581098887238;
 Fri, 07 Feb 2020 10:08:07 -0800 (PST)
Date:   Fri,  7 Feb 2020 18:07:55 +0000
In-Reply-To: <20200207180755.100561-1-qperret@google.com>
Message-Id: <20200207180755.100561-4-qperret@google.com>
Mime-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v3 3/3] kbuild: generate autoksyms.h early
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

When doing a cold build, autoksyms.h starts empty, and is updated late
in the build process to have visibility over the symbols used by in-tree
drivers. But since the symbol whitelist is known upfront, it can be used
to pre-populate autoksyms.h and maximize the amount of code that can be
compiled to its final state in a single pass, hence reducing build time.

Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
creating an empty file.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 Makefile                 | 2 +-
 scripts/gen_autoksyms.sh | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6a01b073915e..e5c389d189f7 100644
--- a/Makefile
+++ b/Makefile
@@ -1065,7 +1065,7 @@ autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
 
 $(autoksyms_h):
 	$(Q)mkdir -p $(dir $@)
-	$(Q)touch $@
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
 
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index ce0919c3791a..ae033ab03a4a 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -32,7 +32,8 @@ cat > "$output_file" << EOT
 
 EOT
 
-sed 's/ko$/mod/' modules.order |
+[[ -f modules.order ]] && modlist=modules.order || modlist=/dev/null
+sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
 sort -u |
-- 
2.25.0.341.g760bfbb309-goog

