Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11015F7ED4
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Oct 2022 22:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbiJGUcw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Oct 2022 16:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiJGUct (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Oct 2022 16:32:49 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2396127BDB
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 13:32:40 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id a2-20020a5b0002000000b006b48689da76so5564838ybp.16
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Oct 2022 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H5PXFuGO6LsvTkGWSyH4IIntX/pmrPgQBzEpfjypKsw=;
        b=kNHjn6x5hUfuwCtRtaf+cYbg52QTq7S6GaEZitIAjgKwdSB3u0cm0l4Z6cQKD87jUI
         7G35Df2pOwo9gMegtlSck62AyJCe/hQYv41mG0jr5PlAfqmsxJ6cNbn41KEX8eK0jdAk
         x00IK7IRfBlhy98VPZbjK0kKoaNqW/+apqS1HiT9CgaBtWfZpXvHBTNzCCO71Xgtsxwz
         tJcPDlCgmP2sGYhAzqtCk0MkIyVJN8Oe7CbnUo8EpzgQYIM63Z2IbcoSqN3r/6cIXyS8
         YVq7TDHTpzUCi016DXCol0Sa1pUcq5lk7P3ZalJgZxc6tcDSo29XOspe2BLCNt1a5pXn
         FQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5PXFuGO6LsvTkGWSyH4IIntX/pmrPgQBzEpfjypKsw=;
        b=H9dCA4bkX1LMftpp6HC0Hqayw8PxydxyN/lEFGi4lUR7REcIFrRsNrbpBxn4HvyGmc
         XQRMD8yijxnl+W3OGzdIxelLQNm5OiE+FBkhyPw4bpxwpxWvXyu7ZgxJefR9gkpLFoU8
         UjraY94ww95nj1bpppT53fr3+MjgEC955xkDyvFJo2jDGcsnS1nOj2hFOCQERRwo4EVs
         gonaZ5ASV0WTqzv04XulVbT0n3eHWzG1Iv88jKYSmsi5Zti8VqyL8oF1QVW8EtI7RLjH
         P0ki8RT0nCnLLDrZ4W0WEhhf4TFdiQH8xeuQKCDRYNKxZAhS6cMfCt27o2/lm5igXkWS
         a23g==
X-Gm-Message-State: ACrzQf3wZv+UrjPyv2qgKDNk9hssYMb8aTlgWZb8xzdhu4pEdQhMqd3S
        a3vZUUQrEt5V5w5QDnR0HB60I5Qh3ZwSQKQxg10=
X-Google-Smtp-Source: AMsMyM5xkodeESX8Qe1smo5uI+0KcKPVRF8fNmAe7oJoszCv7gYXUaxSXjbqe03Q4+THi22jagWiUXAdbj+BsGqXHJA=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:35a0:96d6:8c4e:f207])
 (user=ndesaulniers job=sendgmr) by 2002:a25:8a8a:0:b0:6bc:e04a:d340 with SMTP
 id h10-20020a258a8a000000b006bce04ad340mr6415762ybl.549.1665174760237; Fri,
 07 Oct 2022 13:32:40 -0700 (PDT)
Date:   Fri,  7 Oct 2022 13:32:36 -0700
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665174756; l=1716;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=TzGJay1lXQMdgQA/ZyjvCG6BrJE34h1xkzf3M2zsIDQ=;
 b=GirJqyZImL21fWOg762M3V4qsRhWN8goTG9W87OS1Xjtj8APnccjbNLrKgsb+Bz7D+7np/E1o89C
 EmDaEm5BA81mqRB58hnAPO8IdaObGngDH2RIkMQBUmPcBnuRdCgk
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221007203236.1750890-1-ndesaulniers@google.com>
Subject: [PATCH] kbuild: add -fno-discard-value-names to cmd_cc_ll_c
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When debugging LLVM IR, it can be handy for clang to not discard value
names used for local variables and parameters. Compare the generated IR.

Implicit Default (-fdiscard-value-names):
  define i32 @core_sys_select(i32 %0, ptr %1, ptr %2, ptr %3, ptr %4) {
    %6 = alloca i64
    %7 = alloca %struct.poll_wqueues
    %8 = alloca [64 x i32]

Explicit -fno-discard-value-names:
  define i32 @core_sys_select(i32 %n, ptr %inp, ptr %outp, ptr %exp,
                              ptr %end_time) {
    %expire.i = alloca i64
    %table.i = alloca %struct.poll_wqueues
    %stack_fds = alloca [64 x i32]

The rule for generating human readable LLVM IR (.ll) is only useful as a
debugging feature:

$ make LLVM=1 fs/select.ll

Clang defaults to -fdiscard-value-names to save memory when generating
LLVM IR. For debugging purposes, the improvement in readability at a
cost of more verbose IR is a cost we're happy to pay.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 27be77c0d6d8..d0e4f476dfee 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -140,7 +140,7 @@ $(obj)/%.symtypes : $(src)/%.c FORCE
 # LLVM assembly
 # Generate .ll files from .c
 quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
-      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
+      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -fno-discard-value-names -o $@ $<
 
 $(obj)/%.ll: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_ll_c)

base-commit: 93ed07a23fd08b8613f64cf0a15d7fbdaca010fd
-- 
2.38.0.rc2.412.g84df46c1b4-goog

