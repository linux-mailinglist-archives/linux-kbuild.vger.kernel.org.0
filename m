Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E2160D56B
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Oct 2022 22:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbiJYUSa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Oct 2022 16:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbiJYUS2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Oct 2022 16:18:28 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9C711A95A
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 13:18:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 129-20020a250087000000b006ca5c621bacso12561004yba.3
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cjSL7d6TtpGHmS+/EyDxUUIq3/+lnTJkqEF2MfLcH/s=;
        b=aIaYbfghFSe8N4yXxxFNzUL+xWwNokvsoELgDNAQMUXgY/g1agaV1eCR6JZ4QSiJ2c
         fiiQlwjHjzRb+gzyNHBxTE/KPhIbMP4RdRDQr2/eJgcWhRfapPqAT4I9CbZpSPjDnR1J
         AnG/VnL9LP7PGvN43LXn1Wj8/dROhHSoYd8q7UqojhwMbhFth3f7sFKeQQhPEzVZpBMe
         iPh8g95LvHpDVqXboFbg20lUGQPnj1yEEAt1s4hyWU5G+g/NBJFjJmvM/CoSkd2sQEc6
         PbQOLgCQyRq9YoOzSUExGa7cFkZuZKh1yOe1aO3lHgiD03QcwnqqIHMSZXJuXP4t4DNi
         7PTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjSL7d6TtpGHmS+/EyDxUUIq3/+lnTJkqEF2MfLcH/s=;
        b=yfEJhvTToCMyMpn6Bputb0V9JcqbpiqZEJ0mWcIsfaU6Taict2T3YVM+5GF7yZnPRH
         0dKIw3EZ1kxr0RYsbSZke2PuvHHcYWERE8QPHyj1VBpHFtFLtGmRLZlPJ7AWswNN80Pl
         fAR0+lUCdU+zViOe+rHNluzHV92uBWWRe4G8D3TCChbBAogYVw9JhzrNcGvXbvFubI9Y
         i3iB87H8fSZnVK0ySr4M9xgMm8q+zT1oNqIrxdE1UXfRtGo7We2LnAsIYuTGebj/DViQ
         cWmI65Rq7t1FWELiKh8CM5QV9ufAtEGbgnYGanJC4akMN5riepodGiIVpLmdCoiQpPJG
         rU1w==
X-Gm-Message-State: ACrzQf15kDX6MpRfAdlFr0ktgtpbRXLZkWMtRl8aXx5wKdT0NY/axtyH
        TJX9FsakEpBA3MG0ORoNYgg0h5AGNBnmajjmrRo=
X-Google-Smtp-Source: AMsMyM7j92hs0G7IiS9a+MWShNvsGrduR8iIkc9hL78fR0z5tR6biWraKtiR41Njoab5/bqWIhccvlPPZF9XR9BemBQ=
X-Received: from wmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ebe])
 (user=willmcvicker job=sendgmr) by 2002:a25:3757:0:b0:6b0:3ec1:3db3 with SMTP
 id e84-20020a253757000000b006b03ec13db3mr0yba.203.1666729105790; Tue, 25 Oct
 2022 13:18:25 -0700 (PDT)
Date:   Tue, 25 Oct 2022 13:17:44 -0700
In-Reply-To: <20221025201744.1155260-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20221025201744.1155260-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025201744.1155260-2-willmcvicker@google.com>
Subject: [PATCH v1] kbuild: fix typo in modpost
From:   Will McVicker <willmcvicker@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit f73edc8951b2 ("kbuild: unify two modpost invocations") introduced
a typo (moudle.symvers-if-present) which results in the kernel's
Module.symvers to not be included as a prerequisite for
$(KBUILD_EXTMOD)/Module.symvers. Fix the typo to restore the intended
functionality.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

base-commit: 1a2dcbdde82e3a5f1db9b2f4c48aa1aeba534fb2

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 8489a3402eb8..e41dee64d429 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -122,7 +122,7 @@ quiet_cmd_modpost = MODPOST $@
 	sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) -T - $(vmlinux.o-if-present)
 
 targets += $(output-symdump)
-$(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(moudle.symvers-if-present) $(MODPOST) FORCE
+$(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(module.symvers-if-present) $(MODPOST) FORCE
 	$(call if_changed,modpost)
 
 __modpost: $(output-symdump)
-- 
2.38.0.135.g90850a2211-goog

