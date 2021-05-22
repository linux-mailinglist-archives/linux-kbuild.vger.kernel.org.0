Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADA438D2C9
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 May 2021 03:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhEVB2D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 May 2021 21:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbhEVB2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 May 2021 21:28:02 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6B3C06138A
        for <linux-kbuild@vger.kernel.org>; Fri, 21 May 2021 18:26:31 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id w4-20020a0c8e440000b02901f0640ffdafso14159033qvb.13
        for <linux-kbuild@vger.kernel.org>; Fri, 21 May 2021 18:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gS3/FjH30criEdlZq0ZHdAnAGJSA0ILT1HmCoVmE9Yc=;
        b=aV10v99JMPHFg1NGBvCWnUWFb+H8K8fj4R2z1KjHTliOlyuuNv7N+E++NFeU+qFtZp
         3+FqCv1he5VC08dsXqqBEoOp6dlq+Jim+eqm8bBhg3Wa39Dqo7D3c93BffdlaEcWXif9
         gKyWuMLV4UfrKS62gts+QsiUfFhgZSM0wvBZ1vwWmHDaOkAIzh5gikMRUosZD8liZYjE
         BLZ4d9v3A4E2C1pTRMRgb2VRbAyQMKVD/JqJSvxrxPWl8UN18mHMBEgV8ftxpiAmIuWT
         dmxDu6tCcGafJAMnYk82Zo6sopbp3ZB6XTbx9MrZ3STv27IcXF//ymaHhlTkLron6P5f
         L8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gS3/FjH30criEdlZq0ZHdAnAGJSA0ILT1HmCoVmE9Yc=;
        b=AwiU8OY4w5lvIwRl5i7WAXua9KSWpwq2kYEaIIXAdihyWSck15nU0PbPQHllLrNLMD
         y77KycmDY9U1qcIdX5wHj4DhkSUoW2Tq9oNYe8bK9oxm9ku/olmDYHwqXikE0doeHg9p
         OaBB4VNE6SFNiANuL2D/xl8ILOhETiHHEZR6qpRvrnR70Px9FnlgjkbePvIV3aUSvUlA
         rSLfmHJBAlVrLbB194hmbmqyVJW8Fz3I61nIuVRiDYmmtK9L7c3261b4S9ljTYYwQTQe
         OS1I5C0wPkLz43m7Xc5owp9vVS6Hdb90eI+7J0n38pZf20a7V/SoHUdCPqibtSAB3Tya
         zpXg==
X-Gm-Message-State: AOAM532DcayyEfZ30zNgdq9VqCbMUB3qeiNasxq4oVWbEyLSrxcfX2Xi
        jyHDqgHa1ockPh3R69zhwrY2G6wLWGN6bDDbUQc=
X-Google-Smtp-Source: ABdhPJyCEvd+l3Rqhyp51TSzPr9jAnAvnyIGE5YRxodQwxa5AYSuBGV7+leKsEDF2cfme0a7brTTz1HcQqAGnDK+DBI=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:e55d:7de8:da36:30e8])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:f64e:: with SMTP id
 s14mr16600523qvm.56.1621646790253; Fri, 21 May 2021 18:26:30 -0700 (PDT)
Date:   Fri, 21 May 2021 18:26:24 -0700
In-Reply-To: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
Message-Id: <20210522012626.2811297-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH v2] Makefile: fix GDB warning with CONFIG_RELR
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GDB produces the following warning when debugging kernels built with
CONFIG_RELR:

BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'

when loading a kernel built with CONFIG_RELR into GDB. It can also
prevent debugging symbols using such relocations.

Peter sugguests:
  [That flag] means that lld will use dynamic tags and section type
  numbers in the OS-specific range rather than the generic range. The
  kernel itself doesn't care about these numbers; it determines the
  location of the RELR section using symbols defined by a linker script.

Link: https://github.com/ClangBuiltLinux/linux/issues/1057
Suggested-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* rebase
* pick up Nathan's reviewed by tag.

 Makefile                      | 2 +-
 scripts/tools-support-relr.sh | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0ed7e061c8e9..2dbb56f831d4 100644
--- a/Makefile
+++ b/Makefile
@@ -1031,7 +1031,7 @@ LDFLAGS_vmlinux	+= $(call ld-option, -X,)
 endif
 
 ifeq ($(CONFIG_RELR),y)
-LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
+LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr --use-android-relr-tags
 endif
 
 # We never want expected sections to be placed heuristically by the
diff --git a/scripts/tools-support-relr.sh b/scripts/tools-support-relr.sh
index 45e8aa360b45..cb55878bd5b8 100755
--- a/scripts/tools-support-relr.sh
+++ b/scripts/tools-support-relr.sh
@@ -7,7 +7,8 @@ trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
 cat << "END" | $CC -c -x c - -o $tmp_file.o >/dev/null 2>&1
 void *p = &p;
 END
-$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr -o $tmp_file
+$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr \
+  --use-android-relr-tags -o $tmp_file
 
 # Despite printing an error message, GNU nm still exits with exit code 0 if it
 # sees a relr section. So we need to check that nothing is printed to stderr.

base-commit: 45af60e7ced07ae3def41368c3d260dbf496fbce
-- 
2.31.1.818.g46aad6cb9e-goog

