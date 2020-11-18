Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9612B8776
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Nov 2020 23:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgKRWHu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Nov 2020 17:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgKRWHq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Nov 2020 17:07:46 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7F6C061A48
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2020 14:07:46 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id w8so4620047ybq.4
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2020 14:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=tITgh0Ssflf3KIdl9iLTasR/nuysgEKXGj2aGzu0djg=;
        b=tgB3HeaMLte4FwdwEskpNo3M1G5NMSWdaU3NGnSytOclNILrFVdkD4YBIH/89JtDHP
         XW414KEtYQqChtXVzZCo6FESh8Tttug6ipG4Xwymb06bhNxw7eh44JTB82tQMjdgKeKe
         mvE5QooVVjUOl15f8Ufkoo4CuDQMkoEAowvId9Xo6ILJqfJzsuuAiniFNxOTXgItR15s
         eH6Dk79v+bV/G/7k27PzU2M0pCmQclWaJYIJjA3ojY/R+Z8tO+3QxQrtlIwXnz5RyeCM
         j8ggYjzxLirUlC9AaKsU1v+JkHXIBzxtLSTtx1qvPQUhEgNQSe/pESJS3QjFV5EMv/+O
         IZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tITgh0Ssflf3KIdl9iLTasR/nuysgEKXGj2aGzu0djg=;
        b=F0MX8NP3+G7dlQo8UxaHp/dxQNHCmdLqrLUT25tLTa4hCWBCwafU5Bshu9z+acbXRi
         IKWiEltoEiHadwWd1h3tREzjLk2GWnu/1tp9dzRf0nZVlvTKzLd2cBEVUoY5HDIwLEgu
         aaMtouEI4/orgb1vFVyLA7/SU31F9Ydy6Jaz5bsKm6GXujPgu37VCqCgIwOSj1TWFg/A
         Kyosto9DMatf8jWIc4A6PvKBNpWmWTXKH6NZDYo+oAv/AJYEXAHqr1geYMmI9pkQ6uKP
         QNEhRug8VcXqODGvou34MxXs2LDlPts1xOJT+J/xDpfVYBfLW6+o1mztfJKnUdjPU0gQ
         8AGw==
X-Gm-Message-State: AOAM530O54OtYl2thi3tyt/kwmdUw+p419BlcNTKGUBYL+5GJtRqXpeV
        9Au81LHTsGzajdmeRyX2X+e2q7vGETeKwP+n2ww=
X-Google-Smtp-Source: ABdhPJyru6u4Sy3c6z545hXKz2Lse9yOurfwR7Sqj4soym8ldc5jriOTeAoDW2j8p87AYgdDtayu2H1jxl4fDBYzugo=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a5b:c0e:: with SMTP id
 f14mr12957716ybq.83.1605737265629; Wed, 18 Nov 2020 14:07:45 -0800 (PST)
Date:   Wed, 18 Nov 2020 14:07:20 -0800
In-Reply-To: <20201118220731.925424-1-samitolvanen@google.com>
Message-Id: <20201118220731.925424-7-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201118220731.925424-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v7 06/17] kbuild: lto: remove duplicate dependencies from .mod files
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

With LTO, llvm-nm prints out symbols for each archive member
separately, which results in a lot of duplicate dependencies in the
.mod file when CONFIG_TRIM_UNUSED_SYMS is enabled. When a module
consists of several compilation units, the output can exceed the
default xargs command size limit and split the dependency list to
multiple lines, which results in used symbols getting trimmed.

This change removes duplicate dependencies, which will reduce the
probability of this happening and makes .mod files smaller and
easier to read.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index eae2f5386a03..f80ada58271d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -281,7 +281,7 @@ endef
 
 # List module undefined symbols (or empty line if not enabled)
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
+cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | sort -u | xargs echo
 else
 cmd_undef_syms = echo
 endif
-- 
2.29.2.299.gdc1121823c-goog

