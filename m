Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6EB5A85F2
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Aug 2022 20:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbiHaSo1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Aug 2022 14:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbiHaSoT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Aug 2022 14:44:19 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F0E1F0
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2022 11:44:18 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id j11-20020a05690212cb00b006454988d225so2787845ybu.10
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2022 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=MAguRqe6d5HTDJzfY/4c4ymnDwIQdY6ECkW7ZQgoLNw=;
        b=lLpdU5JClnKvEn/Gjr4GzD569CDxOzC9A2l7JJtmlIw0QmqkRleBGN7K/MkqlowrMc
         eB4kklda7dRbzl7OP5b3PBBDrFZg68Q9Art7RJscyj8EPXmL4NezkymgMjS4yzeCS0om
         aTwJU4zA4WWTPRYIHEOrwxQLBXewtnwrpQfXnXR/bGn8FCIvXLHQsuDgB+xqmD1uMUSg
         GJbMAq/lFD3+PA28c0PIyfaaHV46bv/0zDNF+K14nzXjdjiVq2KyUA2BkuAWkpgFJZ6r
         XreGAn31i0HAzl/FoHyUDd6NRg/Xz9hfEKHkEFRNW8R//VAOxa/sCfFqsAhTblQgMB7F
         WyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=MAguRqe6d5HTDJzfY/4c4ymnDwIQdY6ECkW7ZQgoLNw=;
        b=hKm784z5hsyZHSeCm4Uohyvf1CYDm3wkoHa3FuNRPNBy5PBYs8y3WZMZUcfrqRpV4r
         7CUIljTFAvgwk9ttvRY70Xqm5DH2arkXpcoHY5puivg9noOU/NusteQU8vaAx0TbGtGY
         aIKqjw+4oCNxg7hOcQSTm77YvaxKQ5GR7XNoH2Rh2gr24XArgXaDlnVzyMcdeKpq3908
         nwjDdjbIJwk7C+TlAANfwGHScXBUiQa/PoEXVtreU52ej4lMPQeeqMeHV73eKhdBMtht
         /vhR8oXoHuhNwQ/sTno7aZ2ZnRGN2VyrDf+/VLrgYmB6FLU5EQZe5b5f3DDFaA23x72u
         wW4A==
X-Gm-Message-State: ACgBeo0lGkrMh5HV43J33PmLrWfbe82x7tTALCZX3kir0FKmWRz+QuGu
        1h9C9ioBq5oy3CM9qSu/121ts6mZbuTfXBqkblo=
X-Google-Smtp-Source: AA6agR4p7Kp/AOktsa3PVwZf+E9KjpLFgWWbGnI9zwHlkeKlGhPyWPytRi9y6bP/8vCcBhJE3Gf55QU1RKXkrNnB+10=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:5f5d:95d5:9a3:d41])
 (user=ndesaulniers job=sendgmr) by 2002:a81:a905:0:b0:33c:1ec4:e704 with SMTP
 id g5-20020a81a905000000b0033c1ec4e704mr19390415ywh.275.1661971457428; Wed,
 31 Aug 2022 11:44:17 -0700 (PDT)
Date:   Wed, 31 Aug 2022 11:44:05 -0700
In-Reply-To: <20220831184408.2778264-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661971448; l=1550;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=xn2eK78nuKFsrx144Xn+vmQ1XO0dKmn4QRoxa/IrOQQ=;
 b=FBM2n36UJ2NPU2dr4Ry0FWWemrN0IbAHk/nAkgqQ1k7F1XgiFnavYAEad6JcMZLiqrTNAxxwX3VS
 UiZHtT+CDff5XY04hUNq35dwQ8M78Khr4I1cSE5UqBOqwzh+MLiz
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220831184408.2778264-3-ndesaulniers@google.com>
Subject: [PATCH v2 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>,
        Greg Thelen <gthelen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
cause as-option to fail unexpectedly because clang will emit
-Werror,-Wunused-command-line-argument for various -m and -f flags for
assembler sources.

Callers of as-option (and as-instr) likely want to be adding flags to
KBUILD_AFLAGS/aflags-y, not KBUILD_CFLAGS/cflags-y.

Link: https://github.com/ClangBuiltLinux/linux/issues/1699
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Split off changes to arch/x86/boot/compressed/Makefile into parent
  patch, as per Masahiro.

 scripts/Makefile.compiler | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 94d0d40cddb3..d1739f0d3ce3 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -29,13 +29,13 @@ try-run = $(shell set -e;		\
 	fi)
 
 # as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(KBUILD_AFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+# Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
 	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
-- 
2.37.2.672.g94769d06f0-goog

