Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192032CAECD
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 22:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389199AbgLAVjM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 16:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388655AbgLAVjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 16:39:11 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C05C061A56
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 13:37:20 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id c9so4009059ybs.8
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=vhe2fhhubG0SMFTgpBNX4/KlbzQ2mtF+9llrSjbBo08=;
        b=WQCyqpywTb9sjhDQE0uOd7b+9m6ebi816QKf9yVHZCPLWaGBG+ipLHxcUm8kqWX+KJ
         kfKXPytExTkGVOe4NfXDntXrOaPJsp9DGA/e+Z5eC+AB1fjt5JjOY6moHYKtMdYABXlc
         pqwT9bceah0mNt1zUgNTQJmG7XZ4Nqu08tOaPOFkTunOluNW1v+MiVxaG85YN4/M5u+k
         HXPgLPzYDq4JSCLjbyTdrYr0q8bfH/+KpCl0SDkUgF3lejzLr/TISZQcZo011awEDOER
         hEKx1vs28+FQbBudhpM53qOZF9Lg00bdHxOHtQRU8na1jUSF06Ou0gmHopnqw5/ud94s
         4QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vhe2fhhubG0SMFTgpBNX4/KlbzQ2mtF+9llrSjbBo08=;
        b=gRGY43hCa8LkdjNvT39su52qexzJY8VRgSMNSSlQfeakHW9xU5WkCzQTw2YMV6teUo
         eoXyrGDI1YJ+bx9Mjkzc740GNzpxbUmwnUjOOCCUDdf3elU9rAmlh2Ngia/kvDE2XiBC
         /K+XV2rYmXN8KTA7a++fg//oNgMseoGVbeul6T7k+stcoSCeQmrAuCIUV+CoInmYia1L
         H7XD4FXyntEjz4LZ2biyzR/bXq93EIbGxBR7D02NjcytsQl+sZWAxhEpXr+WpiSL/HdQ
         mAkS+9jlF2xzV8pom46GBVHXiaWDhCBtRnzJos8/b0AtH2t65kgeE7L4f6e541VPVKhN
         T02Q==
X-Gm-Message-State: AOAM533iW5VHK2edYdCzxpYLOzu84+ap7rPlunnzIh7M2lb4VP1tBPvp
        QupF7aDM3Ld4DjgmSfQ2fiUyDDe5NqsZBpvOuEc=
X-Google-Smtp-Source: ABdhPJzj8ZnKlwOa7MfJuQkhiVpth6ScVKMd4AIpnLjVPcTB19+WZbXrany4DQG3oU9eJ5gCXDSYO/sX5i8KB6YTJcA=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:468a:: with SMTP id
 t132mr5364497yba.312.1606858639932; Tue, 01 Dec 2020 13:37:19 -0800 (PST)
Date:   Tue,  1 Dec 2020 13:36:55 -0800
In-Reply-To: <20201201213707.541432-1-samitolvanen@google.com>
Message-Id: <20201201213707.541432-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v8 04/16] kbuild: lto: limit inlining
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This change limits function inlining across translation unit boundaries
in order to reduce the binary size with LTO. The -import-instr-limit
flag defines a size limit, as the number of LLVM IR instructions, for
importing functions from other TUs, defaulting to 100.

Based on testing with arm64 defconfig, we found that a limit of 5 is a
reasonable compromise between performance and binary size, reducing the
size of a stripped vmlinux by 11%.

Suggested-by: George Burgess IV <gbiv@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 222ae96d179d..ac836907d8b1 100644
--- a/Makefile
+++ b/Makefile
@@ -899,6 +899,9 @@ else
 CC_FLAGS_LTO	+= -flto
 endif
 CC_FLAGS_LTO	+= -fvisibility=default
+
+# Limit inlining across translation units to reduce binary size
+KBUILD_LDFLAGS += -mllvm -import-instr-limit=5
 endif
 
 ifdef CONFIG_LTO
-- 
2.29.2.576.ga3fc446d84-goog

