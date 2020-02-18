Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D8616239D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 10:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgBRJlx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 04:41:53 -0500
Received: from mail-wm1-f73.google.com ([209.85.128.73]:54874 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgBRJlw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 04:41:52 -0500
Received: by mail-wm1-f73.google.com with SMTP id u11so788929wmb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 01:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rkOOsJ3B+WebwmY0ZjWij56PYosAY9ID4DSUuStj67k=;
        b=DuiKbbx3G+8UCUti23flMr0hIHrRgibO7CnnbD1y3sEYNMn9xexsm5tKWC7sy6d8aM
         sDeyipO8OHcDkeFOAJ+eZHtCUKGJM84Dfn4H37w7CX+ybmwfG6n4itd0jhj8h6d0gUfj
         zbZmg7W5PsmU+d6+PoTgJ2fygTI+4dXzeGBgijSKBTSyQr0lIdkqVyNuvA0GOTLP9qMU
         PhT3BJzbonesgwJenxZaqb2X5+BYWGVG+k/CU/XQxFk1Nhwn4DpKL+py9xrjZFTk4i3M
         6Lh8hiPgBSGvDY+99KT2CaMTB/uDRUl7z0GzM1MC62Afvk3iq5CNyOGdoypspQ2UwOSO
         Q2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rkOOsJ3B+WebwmY0ZjWij56PYosAY9ID4DSUuStj67k=;
        b=NitdSde415gtnuQmOHdaD/Gtztvdg9+1cAildfvYyl7h5/IcKFAZoy3KSCYnthV8hf
         BTnDRmJPd6G1XXlFPygKSrCZaCsj0OLj3k1V+6gw9LSt/Q+Stmju1ti1IOY8qjJicXjB
         yf0Oq3BjsPvMLYb15Sywb7b93AUasEQb85+njBs+i1lrmrzZBaVUmj/yLD0tgRVn3we6
         EjCCX6AgYwDCVxJjs/0rN5eOUm+PFglIE5/4ZQC6a+n9zT50Jb+16HZRMr+tnYQKQpdK
         31Khb6tZlD17BMfB2/BFgCI0t+Wo/rxbXkHKlpVspmjuqTNqNUHUPcKBxtKApbs7BD0p
         O7Mg==
X-Gm-Message-State: APjAAAUM0yh92ahVpbnCdKZ4hQAXDKKf4rplfqwhlCZUI3Dz66Gzbfhe
        QNQm1v0o2cuOPLKG8zhuNhhtJV9+wiiD
X-Google-Smtp-Source: APXvYqzDhSYD+GHuYYP6mN4vmPaPD61VA4K+WkMdE1BxYDoYNf0gJ/ExVqrPf3+eV338d9Gle38b4Cs+POYA
X-Received: by 2002:adf:fac7:: with SMTP id a7mr309389wrs.299.1582018910624;
 Tue, 18 Feb 2020 01:41:50 -0800 (PST)
Date:   Tue, 18 Feb 2020 09:41:39 +0000
In-Reply-To: <20200218094139.78835-1-qperret@google.com>
Message-Id: <20200218094139.78835-4-qperret@google.com>
Mime-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v5 3/3] kbuild: generate autoksyms.h early
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

Acked-by: Nicolas Pitre <nico@fluxnic.net>
Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
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
index 6c625f52118f..679c9f05e4b4 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -39,7 +39,8 @@ cat > "$output_file" << EOT
 
 EOT
 
-sed 's/ko$/mod/' modules.order |
+[ -f modules.order ] && modlist=modules.order || modlist=/dev/null
+sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
 sort -u |
-- 
2.25.0.265.gbab2e86ba0-goog

