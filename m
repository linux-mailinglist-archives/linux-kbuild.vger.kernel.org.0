Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD272AA2F6
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Nov 2020 08:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgKGHHx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Nov 2020 02:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgKGHHw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Nov 2020 02:07:52 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959A7C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2020 23:07:52 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id a126so4371014ybb.11
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2020 23:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=e8lDdvwN5A87X4mrssc2W/DXV9FoYTcd68DGfAz+9v0=;
        b=bcfIQYMO8gIHYjQiAsvYf1bZfaq0+9ip4/Ek2+b3g0BSos4DIXggr8J3ChCxELXTLM
         a9/Ucs0rdqkKIlhXp3df983iwKmjVK6cvbD2mhNTFqatMd3SVltSJUG4yWs2Fr4pwAnF
         3DHn+Yw3R6HEV3ysoJRbSxBsWV4ETmJ/0NrZlBb3g2iUrOli/8Mt4AySXmlK1l5AXDug
         tHQB37pZAdRZ4VDeDrmgkJh6gFypB+whj87Mn/VtrhS0TJSFc62zG8devokggwYT/f7S
         7y/Zb1WEF/wlmM1RuYw1RahMkVRd9CrKMn2buACvxMgx135dOtfLVjl6+32ReyYzL+H5
         Xqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=e8lDdvwN5A87X4mrssc2W/DXV9FoYTcd68DGfAz+9v0=;
        b=ElW9CbqmkJvFpgWmKV/G2vXg77TSqwqfivP38L4+UhBNugV1rDtMtFKBpf7sLLl6Gu
         NyiIZvorhGrQ0B5RW7xjq6Drh/5Z148UDDRVqoVDuwVl+4q5Zl+W0ANa73xK61UheMIx
         OjPstx+64TBSfV/1tc9fEeL8Ipx1FcH5K6Vdt4RcWwNIFdkdBSo/kDjLKC0pV6yxAcvr
         C7UIjJMBa+MuofKJJ4dOtZorT5BeAvjbOI8DLkUQtiD0y/Va/WQZmPsxWn4B3nknB5Uj
         1DYghI1vM1VTtlbpkwYn3Aa/N7A68I2vj1iFVmioDDw4qfK2xHi9ettXU6ft+NudQ2tQ
         1kdA==
X-Gm-Message-State: AOAM533kQ+sZxsChASrctgr7DpyklM9mMuyPuR7p5HE/jCGObyICnfOO
        PuGSFkuZx924bNRS0f3b1ByYnvcMA/yqQx7IXzQ=
X-Google-Smtp-Source: ABdhPJxnSGmUOMuQ97nd2XP1wiS6S13KviX5/SsKpMB4PCMTEEmCcoGW4lP7SQXMgxkPNwIokaCwxzXiuU5evs8U7tY=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a5b:a87:: with SMTP id
 h7mr7458808ybq.484.1604732871723; Fri, 06 Nov 2020 23:07:51 -0800 (PST)
Date:   Fri,  6 Nov 2020 23:07:44 -0800
Message-Id: <20201107070744.1133811-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
Subject: [PATCH] Kbuild: enable -Wfallthrough for clang
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Joe Perches <joe@perches.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Partial revert of commit e2079e93f562 ("kbuild: Do not enable
-Wimplicit-fallthrough for clang for now")

This has been fixed up over time thanks to the addition of "fallthrough"
pseudo-keyword in
commit 294f69e662d1 ("compiler_attributes.h: Add 'fallthrough' pseudo
keyword for switch/case use")

Link: https://github.com/ClangBuiltLinux/linux/issues/236
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Makefile b/Makefile
index f353886dbf44..c1c61c276f60 100644
--- a/Makefile
+++ b/Makefile
@@ -777,11 +777,6 @@ else
 # These warnings generated too much noise in a regular build.
 # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += -Wno-unused-but-set-variable
-
-# Warn about unmarked fall-throughs in switch statement.
-# Disabled for clang while comment to attribute conversion happens and
-# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
-KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
 endif
 
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
-- 
2.29.2.222.g5d2a92d10f8-goog

