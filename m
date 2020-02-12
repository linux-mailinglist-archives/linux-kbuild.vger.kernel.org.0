Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A185C15B1BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 21:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLUVz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 15:21:55 -0500
Received: from mail-wm1-f73.google.com ([209.85.128.73]:37359 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbgBLUVz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 15:21:55 -0500
Received: by mail-wm1-f73.google.com with SMTP id b133so1427861wmb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 12:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2DNPHWOep8QcJ95jz+HxlpBWa5iebLnkE4jUyw5CpGo=;
        b=AmE1UPqTX9ECKV1YOGGpTha7cgV8T6d/rPVacICrc/OXRYCbnBHxDeSLdQeDusdnhl
         pg616Kby5BUfC/GvJbkaSRg0+yW583b0Hpzvv04B12STCq0v5jMx/rj1DfyecIMEYyn6
         P8x/1+EELKbWBjW+op+08FEyAhUBcv8Dn0Q3aE73P8wgao1vwzR8y1VgvGygT/b9VXg+
         +/NfD9LLHWw0Us14UJ8xwrqwXfe40qCQD1giLHfF+XywXDa55D3G8MTjROb3yiRYt6iT
         xpUL+UtzHu8lETu8k0iRcrOkOh9QnGat/DvTebiMkllmPTemjiedUdsnvOivFVCGAHw0
         JqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2DNPHWOep8QcJ95jz+HxlpBWa5iebLnkE4jUyw5CpGo=;
        b=XEKYATT4Bn/y4rL4M79whPVQsfIHz2L/ITO3MZUYpZcVbq5uvSGIHpocGo/YuhftvP
         wbNkHb/IzkA6kpvbi/LkbQfDB53tHCY22NcO9fGw+qZIbXui+yPSuM31HVJZb/cjGJxd
         azE9/8sZ9iVO1ouOFnIbObi2QphPYrTJjSghd93mPZTYMwNCOvOfv6v67L3u4p2MHpXq
         6jMydcO0IgRGp9F4cbRpSwMzC9M6OugsTNp/d6DvUMampbj66AWyxkPH9nqrJ7cFuNV1
         0Yfak5rgCBUeQDu9KKQaaOaYDcwKUivL/205bh1i2GkcXBB9teqWZY1hSO24EV2Tcm87
         r5gg==
X-Gm-Message-State: APjAAAX5wXhSQ6oEff34V8raj24kP9BYCUtMpwTcA+6mKQD3Q8CN+GnQ
        qg8FqADg6BrHT7zx5GrToSkeiMbsF232
X-Google-Smtp-Source: APXvYqzcCNVWLNt31ErqgahD9QaDO6dVOb7MlaAO1yWuVxRAhzBghE+Nw1/FCs7acOk1CtCAyB1K5ahOpBz7
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr17922390wru.251.1581538911573;
 Wed, 12 Feb 2020 12:21:51 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:21:40 +0000
In-Reply-To: <20200212202140.138092-1-qperret@google.com>
Message-Id: <20200212202140.138092-4-qperret@google.com>
Mime-Version: 1.0
References: <20200212202140.138092-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
Subject: [PATCH v4 3/3] kbuild: generate autoksyms.h early
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
 Makefile                 | 7 +++++--
 scripts/gen_autoksyms.sh | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 84b71845c43f..17b7e7f441bd 100644
--- a/Makefile
+++ b/Makefile
@@ -1062,9 +1062,12 @@ endif
 
 autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
 
+quiet_cmd_autoksyms_h = GEN     $@
+      cmd_autoksyms_h = mkdir -p $(dir $@); $(CONFIG_SHELL) \
+			$(srctree)/scripts/gen_autoksyms.sh $@
+
 $(autoksyms_h):
-	$(Q)mkdir -p $(dir $@)
-	$(Q)touch $@
+	$(call cmd,autoksyms_h)
 
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 2cea433616a8..f52b93ad122c 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -32,7 +32,8 @@ cat > "$output_file" << EOT
 
 EOT
 
-sed 's/ko$/mod/' modules.order |
+[ -f modules.order ] && modlist=modules.order || modlist=/dev/null
+sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
 sort -u |
-- 
2.25.0.225.g125e21ebc7-goog

