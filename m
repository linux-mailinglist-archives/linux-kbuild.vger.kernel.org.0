Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255F33DDF6A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 20:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhHBSjg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 14:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhHBSje (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 14:39:34 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF00C061796
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 11:39:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id c63-20020a25e5420000b0290580b26e708aso19958009ybh.12
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=kxeZ499IZ34ScBxCoMfNAW68U3dStYlxpnDRACL6igo=;
        b=UDtO0O6rkVrtHHJ0SY0aJGfDOIrgTELa5pL49JkakQig4VEH4F1RYPBtFkzclcT1AW
         3PYpRFCoePQetkTDZL+0BrzS8/HVZxoo3wrAfaXiYGNEjJjkjR+Lre0Z/trVZs8EOrvE
         xPjy1vqLoQfm3SdKS6zR92Rcz8ZeeCJi1mnhoMXiR5Kefvq5XTnqWPAF538d0TmdybiM
         WAxHashTaJSGdc3V0M7MnMsaLgYpLGV8PnWc95a3yhi4twIkoMJyHTee6JOPjOxtnWms
         ZDgytj6HYE24k3Hd02+cJBlh6WcUtHK35hdESUs3xtAkQDy8TTjgHRXBAxVi4MdOArRh
         BPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=kxeZ499IZ34ScBxCoMfNAW68U3dStYlxpnDRACL6igo=;
        b=Rw0rnvQIlYHJsmUmk8MYgXwmfSmIlY+YV+Ui5ooIjnl/KGdvhGbpyqLu7Vb2rRzxN5
         kBCiV5baBOd+QHM44FRgwUTEO1wtUPQ9L5z90kEW9c95xVbEMIgqjeHBVYWVHbVCANrg
         aZwhtKt46dsMBkVu549egunpVJWzsvHiKBunhpicLBhM9aFqfIFr2GCNicBGR02We082
         6bd7rMatkOfgCsG4yBkYEG7HXeKK6feF1JmGLgUBTHIFj2Mg42ZAy4n3e1FgLgpTeZnk
         k6C7IhxMg4rfzqwc/uQyEVaFVnshM1w5rrQFRBALu45AYt21xmGrjixhRLL+C2zD6Ek/
         tNDg==
X-Gm-Message-State: AOAM533J0ahrBQFXlRdkm8Cu2Jzy7BUqL0zaNVqfC+MgAevHf35dL7JG
        llwDmsN0bODtu8f+QSn8h0ktTHUuKi5qinWHAlg=
X-Google-Smtp-Source: ABdhPJyBc75e6umajU61NkjBzyfbdudAXcaX8RkqZXnlzjHPPA2xyUOOdVxKt0zDI5XsREBsXdW2CnvdVowH+Cip42Y=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:3db0:42c:8665:a4ae])
 (user=ndesaulniers job=sendgmr) by 2002:a25:320f:: with SMTP id
 y15mr22007134yby.515.1627929564059; Mon, 02 Aug 2021 11:39:24 -0700 (PDT)
Date:   Mon,  2 Aug 2021 11:39:10 -0700
In-Reply-To: <20210802183910.1802120-1-ndesaulniers@google.com>
Message-Id: <20210802183910.1802120-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v6 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
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

Change use of env vars to command line parameters.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v5 -> v6:
* Pick up Fangrui's RB tag.
* Change use of env vars to command line parameters for consistency.

 Documentation/kbuild/llvm.rst | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b18401d2ba82..f8a360958f4c 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -38,7 +38,7 @@ Cross Compiling
 A single Clang compiler binary will typically contain all supported backends,
 which can help simplify cross compiling. ::
 
-	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
+	make ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu-
 
 ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
 ``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
@@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
 Currently, the integrated assembler is disabled by default. You can pass
 ``LLVM_IAS=1`` to enable it.
 
+Omitting CROSS_COMPILE
+----------------------
+
+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
+
+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
+``--prefix=<path>`` to search for the GNU assembler and linker.
+
+If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
+from ``ARCH``.
+
+That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
+
+For example, to cross-compile the arm64 kernel::
+
+	make ARCH=arm64 LLVM=1 LLVM_IAS=1
+
 Supported Architectures
 -----------------------
 
-- 
2.32.0.554.ge1b32706d8-goog

