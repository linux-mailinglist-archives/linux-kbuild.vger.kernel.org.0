Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B33C73AD9C
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 02:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjFWALs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Jun 2023 20:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbjFWALr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2023 20:11:47 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6225C6
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2023 17:11:46 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-bfe92598ffaso116733276.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2023 17:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687479106; x=1690071106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tThWctNxr0P6K/4oZ/wXBVxJrPYbzfzGbA3tKrbPj+Y=;
        b=5WvHnRo4OF/MJfUD8mOGhYp1gQyCBXWXyvCkFGb5YqzOnxpmZ4Eq0scfXbv9mzv4ay
         cpM+qEQ7c+nfUKs4rg7VhcF2FAgSNrDjHUzWaTdg7dCaOSZnEU2RwjYa6O0hxQzocZi2
         nYtFSQimWkYUrjFoG9/8ZcaxGUvpPvnqWAgd4dWOaJqbxgeoTB18u1zIOJdxKUza6/El
         SJxG5/1dyzAdcrrgVLjaca3hRu1GHwUa61MOMdBFzMTQPSdNqRzMsz9jF02hmJscxpcq
         axcBI5L1v8TaZrMg4IqHF5YCnEhDKKA+UyY09Arso5cwbbm1pCwePzXRmzubX0C3Hw44
         9/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687479106; x=1690071106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tThWctNxr0P6K/4oZ/wXBVxJrPYbzfzGbA3tKrbPj+Y=;
        b=hQe6OiDwRQToZSy6JymxowP6xduEJE+X+lh2UQfYmEbnuBrkjPAJwHU/KWY32n34NK
         1oV6dsiu+ndG6zGN1rEvTH4da2hHz9dcssbHDbmeMcP4i1+aE/llvC2S1afDHaOyrdp2
         /YuADN3I1ORpv4sT9lLvJVCTz21ukf1g60KgEpeoMZscT8irIRf+fYkgy0CTmdRMmLcj
         lL0AaJwkyG5Cs+OAEKzKXFw32KMj5bQYifvhiYS6win+kbFAJ6WU3X25XkftFstzNSnO
         gHcTRf/97GrzXWCyxGFYZ6H8ZB1SRrb276tU3kRQqkCfIsT8SytN83gsHnPb/r7t+ozw
         z2fg==
X-Gm-Message-State: AC+VfDya7qexf8/YitxV894hSjJhcRf3zjQGgtuLY3GkTDb1B4wwZ7YL
        ON4Xm0UK+TaTP+0oX/+IxjDPfs7VPdeQBL6WxoI=
X-Google-Smtp-Source: ACHHUZ7PRsW6GYItuG1JfkYaF3EnnKep63p9SmT0RWtjeot9zqQggY5ve/H367IBeP2LlU60tEx0Ae3OUB+V9LVhN5s=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:d30b:0:b0:be7:7690:db57 with SMTP
 id e11-20020a25d30b000000b00be77690db57mr8154656ybf.1.1687479105997; Thu, 22
 Jun 2023 17:11:45 -0700 (PDT)
Date:   Fri, 23 Jun 2023 00:11:42 +0000
In-Reply-To: <20230623001140.1111494-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=samitolvanen@google.com;
 h=from:subject; bh=Lz/R6d9nIfqb2597G9UKgdcrdHqOlpRtva9W3N3YieY=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBklOM8We2cxfGf1dzuG6LebnHRUj0Vau7v9zch5
 7QRtA6fqOOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJTjPAAKCRBMtfaEi7xW
 7nulC/wJ80cDBsx2quKpFNhZMKEOutfs60zV2cff1frDXQ95y54zZ33okKLREEf68ErFIJwjk7T
 yRERrTSxWLuaUWVcMi2RSuPaQUidEicjkC73Lfy/fEm0KQii/1i5j+cDC3DyD1rd5+os1Z7rvwV
 COrJmytSn99K8nJE1jxf3CzDLq/fiaVVfPhN9IIVqd/BOz7hA/xrkfeZXrx5+MILD3Fhawb6gSf
 JMezB1pmkfgbpiPcvH4lbItf3OrenTTJL/rIcyTrhlbTPe66SuWPP0DfRVpfwJUmJjDl37InI2U
 UZbNCJmk8sIgF/CYpw9O5KBdUaXrJT7JVOHMtRp4R3W2kridrkLV6w1w93x8AtYWKyHxEgH6WKO
 xQ+sUNZ+mnokdZrRIaFb0XlBu86zYvLM39ooK/fd0BBO8trTDG8/NINvbChn49JQ8yugKop7pnE 2B1EjFV+5+I9rJw7WVEgp94GLcnI4z+QXpATrhLKXTN8/qyvUg4O8qa7Fs2es7YZFKd2U=
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623001140.1111494-5-samitolvanen@google.com>
Subject: [PATCH 1/2] kbuild: Fix CFI failures with GCOV
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Joe Fradley <joefradley@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With GCOV_PROFILE_ALL, Clang injects __llvm_gcov_* functions to
each object file, and the functions are indirectly called during
boot. However, when code is injected to object files that are not
part of vmlinux.o, it's also not processed by objtool, which breaks
CFI hash randomization as the hashes in these files won't be
included in the .cfi_sites section and thus won't be randomized.

Similarly to commit 42633ed852de ("kbuild: Fix CFI hash
randomization with KASAN"), disable GCOV for .vmlinux.export.o and
init/version-timestamp.o to avoid emitting unnecessary functions to
object files that don't otherwise have executable code.

Fixes: 0c3e806ec0f9 ("x86/cfi: Add boot time hash randomization")
Reported-by: Joe Fradley <joefradley@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 init/Makefile            | 1 +
 scripts/Makefile.vmlinux | 1 +
 2 files changed, 2 insertions(+)

diff --git a/init/Makefile b/init/Makefile
index 26de459006c4..ec557ada3c12 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -60,3 +60,4 @@ include/generated/utsversion.h: FORCE
 $(obj)/version-timestamp.o: include/generated/utsversion.h
 CFLAGS_version-timestamp.o := -include include/generated/utsversion.h
 KASAN_SANITIZE_version-timestamp.o := n
+GCOV_PROFILE_version-timestamp.o := n
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 10176dec97ea..3cd6ca15f390 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -19,6 +19,7 @@ quiet_cmd_cc_o_c = CC      $@
 
 ifdef CONFIG_MODULES
 KASAN_SANITIZE_.vmlinux.export.o := n
+GCOV_PROFILE_.vmlinux.export.o := n
 targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif
-- 
2.41.0.162.gfafddb0af9-goog

