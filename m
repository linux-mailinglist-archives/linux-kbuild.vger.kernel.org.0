Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE60A8F751
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 00:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733301AbfHOW7L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 18:59:11 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:36718 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732034AbfHOW7K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 18:59:10 -0400
Received: by mail-pl1-f201.google.com with SMTP id a5so2163637pla.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bsc+oL3W9Qap3NqyiuNHWglQP2bNTVPp35x6p7f/ATk=;
        b=D+oh9EMlMt/QrNGNxmKtbHKxtThq4UQj8l+9apxFZP4dZXqtTpOJs9bJLmToApG59S
         GaOY6ObFUzKYpVIG9qdvaiG0+kZuwnpwJw8LK23gCHiVWgXJtibE17rzKZox21eWijh2
         ciaSQNYIJbqYg7VZa9USfTiUlCTe26mCTeT/9e40VkPiYHibcjbOvK4BJCgdic37Nebe
         xOvvGO9Ob0Advw2z3JY/EUdh+RhFtDLU6IhE7uGqF84dsk7ImMtLOvuZPmQ0LhNJfki5
         eyi5ukjCrDZC8GDJxetUCfuWb6/MWSKsotN7XWqqukpiQJqO9StPF50y0Dg/Hc9+jJeO
         2rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bsc+oL3W9Qap3NqyiuNHWglQP2bNTVPp35x6p7f/ATk=;
        b=ehkaJEsDsf9dvvCxNoMFyWDj1ycUT88z6yc90gCFHzd5O+5GHGiTQNGjlSl9jsU33k
         FPXyjnph+mSCqeVKpFC5zmNPSm8cXpKmcg/wY2CQxj3QNna7MneG3cqnjDwlf1d8ubxm
         J0xkkSin3+0LFpmwioj8IHuLW+0mJxt1UwDMBG0SZdDdBMItGtlHnY7ZfsLEGABVvm2g
         gb3CN4ThPtYthPmLasMf+6k/1OZpPqvF8eOWbA48v8aSOf03L0qk+MUYrWdHeV7A/Wk8
         OjHJiYq1sZXwyQ0TnTXKy0pFCadxRxw3tvoAamXOs70sJHC3+buMKo7RtdLP2lCNiYc8
         CIEA==
X-Gm-Message-State: APjAAAVxakPowm74ygKA0vVZJT0nQ9JCk+MzxX60N5hC0jqoD8yCOLdD
        n94Uw+kr/USkDmb9sMg+IILYSTyg7g==
X-Google-Smtp-Source: APXvYqxXDHy3HLU992MgApTbMZ1Xyyi/HhIlYlYEpdvdMcL06xUXNlzd8fHMXPFb5Ux6ET2bsEqM0hMy0g==
X-Received: by 2002:a63:c442:: with SMTP id m2mr5399788pgg.286.1565909949663;
 Thu, 15 Aug 2019 15:59:09 -0700 (PDT)
Date:   Thu, 15 Aug 2019 15:58:44 -0700
In-Reply-To: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
Message-Id: <20190815225844.145726-1-nhuck@google.com>
Mime-Version: 1.0
References: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v2] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
From:   Nathan Huckleberry <nhuck@google.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        joe@perches.com, miguel.ojeda.sandonis@gmail.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Huckleberry <nhuck@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang is updating to support -Wimplicit-fallthrough on C
https://reviews.llvm.org/D64838. Since clang does not
support the comment version of fallthrough annotations
this update causes an additional 50k warnings. Most
of these warnings (>49k) are duplicates from header files.

This patch is intended to be reverted after the warnings
have been cleaned up.

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
---
Changes v1->v2
* Move code to preexisting ifdef
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..95973a1ee999 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
+KBUILD_CFLAGS += $(call cc-option,-Wno-implicit-fallthrough)
 endif
 endif
-- 
2.23.0.rc1.153.gdeed80330f-goog

