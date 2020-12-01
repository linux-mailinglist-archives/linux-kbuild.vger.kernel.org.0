Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CBF2CAEE1
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 22:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389777AbgLAVja (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 16:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389977AbgLAVj3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 16:39:29 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA65C094257
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 13:37:38 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id w8so4011897ybj.14
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=sUICI29mkgxH8XDf6qhMCrhn46+Hzc1owynREvsajYA=;
        b=oZ+MM9v/NqF/Ggik7eWdIKvvWz1hAClVJ55m2ya/8pnBTT4o/65pegfy91/nHJxuWW
         ng2vF4fEe4Kj1Wfo4enCljLrXc2mZuGKhe/N5E7LtdgFcAC58htdoc+UkHFNsGz4aAO6
         TYAhpoNLG2sGulec3iEXV0wmrbA+e+YsFU8sNFgOxk4nqaFp778EB7curP1ohGdIJjsj
         jH7zCxSQUvDQVtB7+IQqbxbFDnA6gYb/Jb2c4ZAC83nAvZnZSoqo2Wh/6Eso5Pv41c0O
         eamKVAZq1cPjmGaxAjBPryDgnplTnhHhjw0xN8W2cnY2EG+4MSMt3K5GchHtvIv5V7pm
         oWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sUICI29mkgxH8XDf6qhMCrhn46+Hzc1owynREvsajYA=;
        b=I6EeWILY4tdBeQx+TqJ4no757dK138+Kl9wvf25HIcgIo42rxrnz3UDzvPYuDrPicd
         zkowLtGxuRJnlmFPT+rVwZLOk/gQctwKovcGB4W9Cp7tc/lPICtj1C3cxvNfxmkHGNaR
         EvmgNJQSFt2SfNnnxPJcTpIfSF/OegYx8+YuKhMjTtKIi3XfPAdYj9ZvfkZSRlHzO61j
         Ywm4WCM+ZFFQAW7ncornGMlSwRa1gaQI/RbxJFF5ROJODCIw26Gv56n/zmqd02F4/uZ1
         WSXlqdFzW1V/sZciixplCfJK5U+n+0eI5JEwg3reg0vA93PDWAITPj9FAutCFb5GhOGg
         z8wA==
X-Gm-Message-State: AOAM533O6lipYUCiSbH1Ie3lpSGCZB9eoaipJtvyHT2s6pehKhDw6Rlg
        r4EYYiqGv5rntYkBZ5jI6P4z1U0T7dNDYYovgWU=
X-Google-Smtp-Source: ABdhPJz1Mu2iPraONhTPw2Ye1e/CkH6U6l9Tg0xaIlFIbJtK0qFhhhtu0340/zvjR8Y2IkVG3dJHFOz9M5J3EVMgNhI=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:38c1:: with SMTP id
 f184mr5273120yba.41.1606858657749; Tue, 01 Dec 2020 13:37:37 -0800 (PST)
Date:   Tue,  1 Dec 2020 13:37:02 -0800
In-Reply-To: <20201201213707.541432-1-samitolvanen@google.com>
Message-Id: <20201201213707.541432-12-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v8 11/16] scripts/mod: disable LTO for empty.c
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

With CONFIG_LTO_CLANG, clang generates LLVM IR instead of ELF object
files. As empty.o is used for probing target properties, disable LTO
for it to produce an object file instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/mod/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 78071681d924..c9e38ad937fd 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
+CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
 
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
-- 
2.29.2.576.ga3fc446d84-goog

