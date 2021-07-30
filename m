Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50843DC09D
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 23:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhG3V6j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 17:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbhG3V50 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 17:57:26 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44452C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:20 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v71-20020a252f4a0000b029055b51419c7dso11961560ybv.23
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YFm85Wduq5y+10ZdlPwZKrCLoXRuDpiE2SUIBEh05mI=;
        b=U0mvENCWcvRKyRvn2QhOha2v5msMUAgGJd6qWARN8JlVW+SveSBU9AHZzHY30udLTL
         dI8y2k2L3gKEb44JexJ+BqMr5Yec1/6JguqFBD3HOjiUhVoW3weEYXfUtrCucRvhlVJt
         vEUh4gDN3mGnHfGk8IIovXQp7Cyey8l3UV2eGc23s2qBtcg1BBUWYn2db+YCaEtLcWT+
         4qQYphnmueeR0vQkQGS0jkiWyz2GS6mEbgEOOap5n3f2FX/5lmDHG7qwbCxTaMF1td4v
         S1EP0zPv7XZL2zo+MmGcMphWl2vOXBdAiqwMurtYO7Vt0KxOGVIJtQjPFYuF6BTklkgL
         eu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YFm85Wduq5y+10ZdlPwZKrCLoXRuDpiE2SUIBEh05mI=;
        b=aSe2cgYltBVbDtMzke0IAzokAnK/Fwk5nYzjVI+1ycz1mJKZeOaY3pEBPaBbR4iwSf
         qCAywVXcyjvbm5dKXT2EKi9q0ZHtyTWrPHHVFtluCBi98PkBf4U+kujTYyWUWUUQKyN6
         a4L5qUqfHZfr60yhVPXlqSXKeY9bLoMq8dt344Z3a6+avlcyHvR8GoSmNqq+0wq3Ydaj
         4ImKqQCEy9Ub1EKdgR6Ylydm+jDEDjjNQpga2O6ZgM/Ffou+dB0yctM6IEOfjxp5+nIp
         H/a4qDJgZgt7dikSioMrg2SqG44E7RDAj+YPq/t27LPMJb0Eb4ud0dYnuWIm6hrI92nr
         FsUw==
X-Gm-Message-State: AOAM532hIfuZRaoDbJi1jlyS3AtQTZ/ewHnhQntSFDNwQ1nLNR6ExaFJ
        2IJ3lfuS7bQ6z7xmxlKOT9qsnRNDjo4Tgd852RE=
X-Google-Smtp-Source: ABdhPJzdLBT8dtfCnaLy3CE11KSU6t4LX4eIvQ8k5CuX6emkmHk9XAUJ1ZA/83lNHoKbhGP4p5mChGd3H//kC7ZmI1g=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:ca8b:b433:7c1d:90d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:aea0:: with SMTP id
 b32mr5811780ybj.474.1627682239441; Fri, 30 Jul 2021 14:57:19 -0700 (PDT)
Date:   Fri, 30 Jul 2021 14:57:08 -0700
In-Reply-To: <20210730215708.276437-1-ndesaulniers@google.com>
Message-Id: <20210730215708.276437-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210730215708.276437-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v5 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As noted by Masahiro, document how we can generally infer CROSS_COMPILE
(and the more specific details about --target and --prefix) based on
ARCH.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/kbuild/llvm.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b18401d2ba82..4292f0686316 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
 Currently, the integrated assembler is disabled by default. You can pass
 ``LLVM_IAS=1`` to enable it.
 
+Omitting CROSS_COMPILE
+----------------------
+
+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
+
+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
+``--prefix=<path>`` to search for the GNU assembler.
+
+If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
+from ``ARCH``.
+
+That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
+
+For example, to cross-compile the arm64 kernel::
+
+	ARCH=arm64 make LLVM=1 LLVM_IAS=1
+
 Supported Architectures
 -----------------------
 
-- 
2.32.0.554.ge1b32706d8-goog

