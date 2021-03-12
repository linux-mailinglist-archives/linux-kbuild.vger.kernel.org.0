Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A49338305
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 02:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhCLBKM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 20:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhCLBJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 20:09:48 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189C9C061760
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 17:09:48 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id l63so13447002qtd.23
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 17:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=n+xPhT43NmscUpw6p+xSEcR+gcJnv0oKtggQXvDZY6A=;
        b=Ro7zBPpxkv9FGSgPZFnM4f/xnbzurCHaDDuwf9MoExNQZwY6ITRKadi3mmz/10oyIk
         jbG9SPspaCX6+P9I0cNl0hbHQnuUokAMvktXjd23CEiEv8ioWJJHcFrrHDNMAeSyDxe2
         wTgf/lwKD88qYnR9E346OOlA7E1St+6zSVdCvQNng/q9X60rKfoLDOBEJeTjIUwtPwqO
         5Lag+KohaD3ZGIYgCHdnCm4tEePfwEmWpgN7I/ZsveYEH+XwuGzGESnb71SMVrR9Rzm1
         8dZXTgH4SKk+Ns9knYcDnQsiHrQ1Fe6lf9tWlzFiK/UGcCaP2UwR0nqyslLqlVKYJEU5
         Wx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=n+xPhT43NmscUpw6p+xSEcR+gcJnv0oKtggQXvDZY6A=;
        b=NgYubMrf1X4PMy0Z1KU8q+fPWB6++xtWE/ZU2fEGciQZVcvrGO7K5/roTmFCo55SfQ
         UxMqN5D+FKsWjknwM4j4DUpNwnFFYeJblG5t4LDAdkOYR0yV4948GTydZM2Z5A0sVSiu
         qMI6sAyauSOwbdZARhu9CLIk/OD0LGQ4UKFDcpgsGm/5wCccNjTtaWkj2Fl7480Kwx49
         qnjk+jA+bMWVtzisXQ5/dd9o/MaoHh9O73ThMJZFUGn4TxjzIBywiEsGHBRs4tXtANK3
         ktIRDmRb9nBYD9Cjut+Y/ldcm3MGHOqNAFBw65cGCpmQpd2943rCSQEB3vk6wWBY6mQd
         jgYQ==
X-Gm-Message-State: AOAM532UX3H+d1Y9xKFRQO/Fwl5RVwAbYfm/DmfrAdtwClkuJZ4YTYjz
        eWqzTytGy9mwTtUv1JCNRcpwbFXvYTlyKdUN43w=
X-Google-Smtp-Source: ABdhPJxYksMhjkXz0qS5Tfc9f8b0uN6DGFNkVdVKfReR40RRwT5Q+xttnmmUY1MNmPTTJzGoFmbUlVIiqIJCxZIfmlU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9c6c:84f8:2058:5b95])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:10e7:: with SMTP id
 q7mr10184252qvt.16.1615511387105; Thu, 11 Mar 2021 17:09:47 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:09:41 -0800
Message-Id: <20210312010942.1546679-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] Makefile: LTO: have linker check -Wframe-larger-than
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Candle Sun <candlesea@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-Wframe-larger-than= requires stack frame information, which the
frontend cannot provide. This diagnostic is emitted late during
compilation once stack frame size is available.

When building with LTO, the frontend simply lowers C to LLVM IR and does
not have stack frame information, so it cannot emit this diagnostic.
When the linker drives LTO, it restarts optimizations and lowers LLVM IR
to object code. At that point, it has stack frame information but
doesn't know to check for a specific max stack frame size.

I consider this a bug in LLVM that we need to fix. There are some
details we're working out related to LTO such as which value to use when
there are multiple different values specified per TU, or how to
propagate these to compiler synthesized routines properly, if at all.

Until it's fixed, ensure we don't miss these. At that point we can wrap
this in a compiler version guard or revert this based on the minimum
support version of Clang.

The error message is not generated during link:
  LTO     vmlinux.o
ld.lld: warning: stack size limit exceeded (8224) in foobarbaz

Cc: Sami Tolvanen <samitolvanen@google.com>
Reported-by: Candle Sun <candlesea@gmail.com>
Suggested-by: Fangrui Song <maskray@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
LTO users might want to `make clean` or `rm -rf .thinlto-cache` to test
this.

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index f9b54da2fca0..74566b1417b8 100644
--- a/Makefile
+++ b/Makefile
@@ -910,6 +910,11 @@ CC_FLAGS_LTO	+= -fvisibility=hidden
 
 # Limit inlining across translation units to reduce binary size
 KBUILD_LDFLAGS += -mllvm -import-instr-limit=5
+
+# Check for frame size exceeding threshold during prolog/epilog insertion.
+ifneq ($(CONFIG_FRAME_WARN),0)
+KBUILD_LDFLAGS	+= -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
+endif
 endif
 
 ifdef CONFIG_LTO
-- 
2.31.0.rc2.261.g7f71774620-goog

