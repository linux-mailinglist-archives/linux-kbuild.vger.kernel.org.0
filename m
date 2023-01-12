Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F60668746
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 23:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240378AbjALWuE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 17:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239940AbjALWty (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 17:49:54 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6185E655
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 14:49:53 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id dc11-20020a056a0035cb00b00589a6a97519so6159314pfb.8
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 14:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=krOkhLT+c7U46nktWLemrW1bS9Yrnn+8SFntyDlkQac=;
        b=QTK4nSUmuxy+1J35jcLAd518bIk7u1ZRts53DRc59ez2TYPhG7P4A+G8LrOzOvVg5l
         XICuTPpLTuo2N81UUVWtWGP4g603in2GlUecwbD3oBurd0VOHeN1/m3u7DB243M6ge9I
         b++NQso6tX2ypDaqddh24rZVPZJL32vyQzhwH1PDNuLtNJwJA2yawRzibA7+OY/Bsp0U
         Fpq9nl8bgW1IMJxmmNjZinG0kf5D3V9feHhQs5Ozk4xGG9WtkbiiVwT9olcv3+k5D38R
         HhmAbG0e0W2zS4dLtTXGI00NuCuwDKUU03m0zurJ9usQr7jNk71/O5aKE0Uupyxi38vr
         xULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krOkhLT+c7U46nktWLemrW1bS9Yrnn+8SFntyDlkQac=;
        b=yHQWqGyNwTBnY5zIFGUI7g6FunnOB6Q/UY1DhDXCwxoqHAXbz4+DegSD8HYWF1bUcr
         0xLZ9K8e89GDXpEJ/i2bjJB5RyIdu0aiQEaFbhBD6Fws6OGMvwpmPDZWnAoBrw2Dfmw2
         9AbLSaA+vXn3w41KuNlLihCVW0TflAmiDWTIg2rg7QaUC8/9QufIJV1FklKnbbjPufZT
         I/aRywB+im6jdY46+y4/eQ/7aCMIaMPUgdLkg0zgPZPnNLnx0CSpivDYxfFhy8MYdJs/
         XGVrc7mXiaJ1JAG+aFNUryqDO0cVF+WphAremBcldZTA4mnZzHg3o47xb8TaXOlilUnr
         fx9g==
X-Gm-Message-State: AFqh2kps8KvSFeQgIKR4ROGuJJ5ApZ87ilnXJtgYTWIswDBIp3eMtOFs
        9qWXqYFXL47ykaEHrf53WRFXZPUg9/s7DEX1mG8=
X-Google-Smtp-Source: AMrXdXt3bTqmMIgY22mEuRxBHVyyH/cxAfO4FD/JNlNClzeThq9oHGhDyk94Ewfp3blP1epRjxbjP4avGteI2bCJQ6A=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a62:55c3:0:b0:576:b4ce:42b4 with SMTP
 id j186-20020a6255c3000000b00576b4ce42b4mr5678543pfb.61.1673563792959; Thu,
 12 Jan 2023 14:49:52 -0800 (PST)
Date:   Thu, 12 Jan 2023 22:49:48 +0000
In-Reply-To: <20230112224948.1479453-1-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230112224948.1479453-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=samitolvanen@google.com;
 h=from:subject; bh=aSZfn870i7k4AYxDF7PqueNLtd+APFuGBHTKsmwxabQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjwI6Mvhx8Oxw1AYEyInnbt2OtbnMq3R5QH8tnwyBU
 SUDO5MqJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCY8COjAAKCRBMtfaEi7xW7t54C/
 9haN+wS+iX3MzxAKhMMfqlGPK+BBUu09OknboN/hvMycgG50DAjXulhQnaUr1e42QFEk3L93F4fhea
 4XgvwySRQMiHcwcUeXCwuTlUvo3HDAb4tODMIv0e7nlCbTQJxusOnk5tNyMuAVAyFobrKQIkVtA6ph
 /Vyqh7rkUtGymkQt55HR4ngM93pvXyjnKhvir9La5L1rQxUEHNPfk4Exfa6GblSBErK083zNOrktHK
 DC7092XdcelrXaAZ8+SQdGqiVb1kGTOXqCLxkV1dzXbEeqVNuIuBaQQyYbqVLohZmxGvfKz2RtxqRt
 IJ93l/DuXunlEuW3fXbjrwUxW9lDtuKVcEx7XEFUV5qLpEtmXMmCLE9ObyWUy0bpwN/895k3DUlwNq
 CjXpqm5UyUMjd4r7YQP0aoolx1BVBn8NYj1CeAhsUnmAkKob4v1IFXhtT1ZtWVYut+3VrQ35CUnQMS
 8Sz12h+mNkDMcXl/FZgJaYdYOt0L8p3yh/Zp5TOEhVOiE=
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230112224948.1479453-2-samitolvanen@google.com>
Subject: [PATCH 1/1] kbuild: Fix CFI hash randomization with KASAN
From:   Sami Tolvanen <samitolvanen@google.com>
To:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
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

Clang emits a asan.module_ctor constructor to each object file
when KASAN is enabled, and these functions are indirectly called
in do_ctors. With CONFIG_CFI_CLANG, the compiler also emits a CFI
type hash before each address-taken global function so they can
pass indirect call checks.

However, in commit 0c3e806ec0f9 ("x86/cfi: Add boot time hash
randomization"), x86 implemented boot time hash randomization,
which relies on the .cfi_sites section generated by objtool. As
objtool is run against vmlinux.o instead of individual object
files with X86_KERNEL_IBT (enabled by default), CFI types in
object files that are not part of vmlinux.o end up not being
included in .cfi_sites, and thus won't get randomized and trip
CFI when called.

Only .vmlinux.export.o and init/version-timestamp.o are linked
into vmlinux separately from vmlinux.o. As these files don't
contain any functions, disable KASAN for both of them to avoid
breaking hash randomization.

Link: https://github.com/ClangBuiltLinux/linux/issues/1742
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 init/Makefile            | 1 +
 scripts/Makefile.vmlinux | 1 +
 2 files changed, 2 insertions(+)

diff --git a/init/Makefile b/init/Makefile
index 8316c23bead2..26de459006c4 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -59,3 +59,4 @@ include/generated/utsversion.h: FORCE
 
 $(obj)/version-timestamp.o: include/generated/utsversion.h
 CFLAGS_version-timestamp.o := -include include/generated/utsversion.h
+KASAN_SANITIZE_version-timestamp.o := n
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..10176dec97ea 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -18,6 +18,7 @@ quiet_cmd_cc_o_c = CC      $@
 	$(call if_changed_dep,cc_o_c)
 
 ifdef CONFIG_MODULES
+KASAN_SANITIZE_.vmlinux.export.o := n
 targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif
-- 
2.39.0.314.g84b9a713c41-goog

