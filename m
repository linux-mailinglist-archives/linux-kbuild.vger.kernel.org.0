Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61D74695182
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Feb 2023 21:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjBMUNx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Feb 2023 15:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjBMUNw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Feb 2023 15:13:52 -0500
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1C62196F
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Feb 2023 12:13:51 -0800 (PST)
Received: by mail-ed1-x549.google.com with SMTP id eo7-20020a056402530700b004aab4319cedso8257219edb.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Feb 2023 12:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VhrJl5YJ7d2XgMTj7m/kCtzHq/X4U46pZjqetmx6EIU=;
        b=E84LspmK1D8CXYJ1386IiSX+2k5JvewADoqzxlVfJfiuzplqS+qe96ezEhckq47eoC
         I7MJxBjlzNIhSX7Luw4uTSli+Chwbl/PPWFlMOWohdwzIjriQ7EN6xOiPO0fJ0/VuUvg
         8cgjJ+VL2sso67wojRMlMstNwr4HP2B8/KtBlYx9+ulA3D5b7xkHHflOa5+nsJEEjLxV
         xTZVcIVI/F2oQ9HDud3W+SFSQoSiA3TSAXdF0W8PZvJyp/y88r50fsxg4TWdiUKdeIXN
         uL82iRVvCTHNjqxwZ+4Y6O2F0xn403iW7uF/DnPkemHbXKiDYFAcQoAPHJzBi1NhRl9/
         ZkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhrJl5YJ7d2XgMTj7m/kCtzHq/X4U46pZjqetmx6EIU=;
        b=yqEkLFJzyA1RXAY/uzqGKIOnl6o3q1dO9ajgW/K3OFZ+QpLD/shmfcREfIO7PUmyEl
         lnHCw3MXr51hxvboUg8CYPVpRdBwpVwHaQnErBM6ACYBf8IqpE9z5xgr1e1eyfJd5yRX
         SmLZ/KO4ghcrH/lC/P2DMcI5BIf1W9f+P6DxcehGecuIJfKS3mCqGoNv45YCQZCIt2HF
         rmGOdl4RQD5UyyvSgvu9ZeVZH/XNT1FSPZB2AYl6KWl5kzqkAmgurlRbK2HNlCAms2SX
         03xpIgsLWBydARwNmgN/AnhibUkiAMfD3FYApP6hEjiixMZ0QGSynGZyU7dTcheMKCHG
         vd9A==
X-Gm-Message-State: AO0yUKWqqis9EAD2hkFXmL9BkAP75G4pV2QTUH2X8ZCezPgHu/E1n7vw
        ZOYi74zunrGPKerYp6GaiZqTifiJlg==
X-Google-Smtp-Source: AK7set/YX+nQGo+fkH1LmT5uNQKhRY+VXPy7aEj/l1Z715GOIrZhtZCLlU/Yyd4YY6+utR6I4vl/W5A/Fw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6cba:3834:3b50:a0b2])
 (user=elver job=sendgmr) by 2002:a50:ab5b:0:b0:4ab:c702:656 with SMTP id
 t27-20020a50ab5b000000b004abc7020656mr4694edc.1.1676319229479; Mon, 13 Feb
 2023 12:13:49 -0800 (PST)
Date:   Mon, 13 Feb 2023 21:13:35 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230213201334.1494626-1-elver@google.com>
Subject: [PATCH -tip v3] kasan: Emit different calls for instrumentable memintrinsics
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Jakub Jelinek <jakub@redhat.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang 15 will provide an option to prefix calls to memcpy/memset/memmove
with __asan_ in instrumented functions: https://reviews.llvm.org/D122724

GCC will add support in future:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108777

Use it to regain KASAN instrumentation of memcpy/memset/memmove on
architectures that require noinstr to be really free from instrumented
mem*() functions (all GENERIC_ENTRY architectures).

Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() functions")
Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Resend with actual fix.

v2:
* Use asan-kernel-mem-intrinsic-prefix=1, so that once GCC supports the
  param, it also works there (it needs the =1).

The Fixes tag is just there to show the dependency, and that people
shouldn't apply this patch without 69d4c0d32186.
---
 scripts/Makefile.kasan | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index b9e94c5e7097..3b35a88af60d 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -38,6 +38,13 @@ endif
 
 CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
 
+ifdef CONFIG_GENERIC_ENTRY
+# Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
+# instead. With compilers that don't support this option, compiler-inserted
+# memintrinsics won't be checked by KASAN.
+CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix=1)
+endif
+
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
-- 
2.39.1.581.gbfd45094c4-goog

