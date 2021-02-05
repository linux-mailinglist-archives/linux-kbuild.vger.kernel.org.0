Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0843118E0
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 03:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhBFCsm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 21:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhBFCkF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 21:40:05 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4308DC0613D6
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 14:01:29 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id w11so3280286ybq.8
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 14:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=vfoNqgpFnWRNHkVjKwQ8AkyS8YshOlfTiuGJMTgmnlQ=;
        b=dp4CNzNONIwItj/Vy/dbeHXrpuLQnLCG4XA3mFtrmRoEaXpPY7zxYvX7Djotz41aSn
         quumVyPpvuJMXkTz2EzkS/ft5SNINKzLHe5QchX2SP0KDTDrutv0mYZ4aEKKOnDcwAWA
         xiT495jp84bZXz64FXT7FkpCdbbYizxTIWPwIs+xbnqGVbgm+82j61rmJDip10DkgQnc
         YbDcL+NBbcT6F7YbHf0Yn297PCOBmsqI4QekarKu9j1FRdhBC4h5rlqAViuTZ2VG/UVZ
         Vp6A9FvKrlEhvShlfkeoUVj9Y0PSfbz6w9GG7XPhqkVLT2r4wBkDApitjRUBg4o+n85f
         YmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=vfoNqgpFnWRNHkVjKwQ8AkyS8YshOlfTiuGJMTgmnlQ=;
        b=Y1vXlXomL5QZ8pFbZnXytqXYGRjyAwHxkaBU8tS6K3zo2vmb1RkVbuMDwZTL5gP6ys
         O7xyNivQ6LbRQii54ykwYqyDBpdwqbbqffVFVFdMzFHuIYatqrxE+I87LbIueHNCcLo9
         jac11zdcx4D2CIE2MTj2JO4/6+QFADj2XvsU9i1d6YA1h2t2q1iapPMWHqJYxDDk9Ron
         OHPvSqX6QY4NbVvNWs45BDJQmMp7rQpal/VM4RwZMcSDDHremk7/cOzvXfru/O+A4ErW
         oh+kI3jobSXoWFIDX/O+VfJUOqk2I1vsZaK6ZFzGsQFRNtkmAVWodWAdSMKWCQNupXUY
         /Hrw==
X-Gm-Message-State: AOAM533AzXmrTevPJNQQckSt8FnhVWF+9h7EJ68w7+oEMMl9XgGo80Mn
        ljLVHWP/mayOsZtt/qXVDwXsk9PNmOS5ZKt7bCU=
X-Google-Smtp-Source: ABdhPJwmXa8T2NxOoAX4Ie67xVdkuZ+8Bst4zffqBopO0QAY71XQaJAt9x8A/lAcZ4s04uiSF1XDQ6tnumbxrshBkyc=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:fce9:1439:f67f:bf26])
 (user=ndesaulniers job=sendgmr) by 2002:a25:df48:: with SMTP id
 w69mr9484024ybg.85.1612562488516; Fri, 05 Feb 2021 14:01:28 -0800 (PST)
Date:   Fri,  5 Feb 2021 14:01:25 -0800
Message-Id: <20210205220125.2931504-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH] Makefile: reuse CC_VERSION_TEXT
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I noticed we're invoking $(CC) via $(shell) more than once to check the
version.  Let's reuse the first string captured in $CC_VERSION_TEXT.

Fixes: 315bab4e972d ("kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE")
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index a85535eb6a7d..70034d7c1051 100644
--- a/Makefile
+++ b/Makefile
@@ -557,7 +557,13 @@ ifdef building_out_of_srctree
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
-ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
+# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
+# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
+# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
+# and from include/config/auto.conf.cmd to detect the compiler upgrade.
+CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
+
+ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
@@ -576,12 +582,6 @@ KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
-# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
-# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
-# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
-# and from include/config/auto.conf.cmd to detect the compiler upgrade.
-CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
-
 ifdef config-build
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
-- 
2.30.0.478.g8a0d178c01-goog

