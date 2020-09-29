Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2DD27DA96
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 23:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgI2VrL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 17:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728875AbgI2VrK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 17:47:10 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E12C0613D6
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:09 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id w32so3345569qvw.8
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=SD1yF5YD1LCllhQ+wHxnWDGScJRWPVuGZBuH/1UV7E0=;
        b=J0iZkzh/GjzAvSvvMSQSffvTtscp77TuS/rOOUU4WJ9pgFewxPSYIc3SuYF5TYZa3f
         nnJs5NE+Z7HnfV7im6jer/93vPDjH2tAsMsDCCOkNJH1RmXE5K6MIkNKUWtTL0TsRGwX
         qAdqdJq3CyXfTerbts+lbY6m8AMjwxizFh09pkc2952byTSLnpnpLEsH+VeTxDQPhQlK
         KJc/bEwAWARFDxCjnLIpypY36iZV6YBpeoMe0S3Fhkxk2EnpJ3bKxAnnRVKOCtJywZ8S
         cn4idbWnDoWjvaMpJXjclpVdG1XxH/TZB3j/SaC5oSMROSGKYvddyUIYzmMFA/b7OTLC
         QNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SD1yF5YD1LCllhQ+wHxnWDGScJRWPVuGZBuH/1UV7E0=;
        b=TjEmuEzvmyuJF6uaOz0tkMs16W/kVr+rPP8d0hENSPqaUTku9+iqXSdox118RToKWI
         8zNmA8iPrIYYfVITDK5PVm8Y0NSVwUViJJ1JSDwx5O5X3fbWHxMrEc9pKL0g86gFw/yZ
         61hAkwHdQCNPIckgQCplWco7xOLnQvk8FSA1xFyMr4NmVGsnvAcqZgnup6JWDCIuuJ2a
         4JJ8h1kM2gDf37gBNo3xOB20e0+L6rzsMvq2wQSHIX5u3VA0CeuEoIk/BIjU6TzGVJik
         X//uPfjXrv40yh8gDvn/BTPa+UYRAIka8eFaCrRQ2D0MEyNzJbgLz+NpDF7B5gw/yxn8
         KbfA==
X-Gm-Message-State: AOAM533ZroRRApt4TAJNOb+abBprbU2yQWQEtzAxpZKBeAfKlUpJfOUP
        5iVIfxQcjQ1xFRjV314fk0Iy+/4UpoJybBNed0o=
X-Google-Smtp-Source: ABdhPJy7ECnfWEGwUFe6hxmbM3YxQNxU/8qssaAcXSiWxNNwaQyUUyZL5rJnjOfK3ZrxDFzMzY/3wIlsYUo/Me039B4=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:55ce:: with SMTP id
 bt14mr6729584qvb.2.1601416029039; Tue, 29 Sep 2020 14:47:09 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:46:18 -0700
In-Reply-To: <20200929214631.3516445-1-samitolvanen@google.com>
Message-Id: <20200929214631.3516445-17-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200929214631.3516445-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 16/29] kbuild: lto: remove duplicate dependencies from .mod files
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
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
index ab0ddf4884fd..96d6c9e18901 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -266,7 +266,7 @@ endef
 
 # List module undefined symbols (or empty line if not enabled)
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
+cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | sort -u | xargs echo
 else
 cmd_undef_syms = echo
 endif
-- 
2.28.0.709.gb0816b6eb0-goog

