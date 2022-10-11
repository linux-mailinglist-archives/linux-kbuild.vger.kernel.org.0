Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86935FAA37
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Oct 2022 03:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJKBim (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Oct 2022 21:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiJKBid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2022 21:38:33 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C242CDF9
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 18:38:32 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id p16so4071690iod.6
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/x54dpNtflIDUBDnoBNjlqmFphEjwfRNTQlm4zS9vE=;
        b=HHZN3Y2sTUZr4Q71s0Ks54/jPd8qD2hsVd4EdHu+JvmFpodZle4Ma8Kk9jmcUDlEmG
         6sPqghQ+XWc2wpdmFIJgEGdLv820fuaYzLVfy5yGfgPkhcvx4uIcrzbQUqZzF4UcXGev
         F8MKXW14Kt//a/9WBLv2w6mK9ZroFWMWnVfC5PHSiwx3suEBw3sieAm3VZekdtJp5qhZ
         MWzAOkUeLMwBIhGblxGaN8RYOtMt54cAAqhGKIAnk7h3aQx2b9qz7tij9wgCkQowWwuU
         slTl9kdfYsXPs1Xqm5r6dT7sxiWS4ckISpaeH4XYiIpSYq/dNThVT/ajxV3HDgT4kLTU
         xZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/x54dpNtflIDUBDnoBNjlqmFphEjwfRNTQlm4zS9vE=;
        b=SMMwOqIyTtKI004IOBDIxoBKiAjLnUmhqmpcuYprNOluscGs3zja42VmvjqSoVXX66
         194SGJ3/FFcE7E10OFbwAwq8MKYR1mDyhJ8TgfPE2XZS/U+34lRwG/uJwjwKGhgZe44B
         eLbonQN5oZnwAOyu7m3qv2C5/VgLr6K7CuUQeSiWe7BmD2q9mBmc8Oxbc7hX511vpawl
         yhEy+/XDqIGsQVZILiOk8MreLUHltFm6MfL9zQgSm5wFmtg7zUANTO9HPb7BOBwqKnEH
         lGR4dxo1Odr1VxP7rkl3SpCwGzPQI4oDqIbuOpLlqX4Kd1TrHdXR4520Ek3Bagsjrxx5
         KZ3g==
X-Gm-Message-State: ACrzQf2whkLPVHioiyRXsiVkPR4AirwNvwCI0UXnJXO+50u/IxqC9Qhf
        w0pA3v6jMz/4+VWsiCo7UCvWOb3gOX4Vaw==
X-Google-Smtp-Source: AMsMyM4rYCjzVRegUw9SG2g9qoMZxvOC/tr8qsydePnFaPGAzu+jgNcv+RXu+2qyXHSH1CoMNDYjrw==
X-Received: by 2002:a02:a682:0:b0:34c:14fc:b490 with SMTP id j2-20020a02a682000000b0034c14fcb490mr11582401jam.196.1665452311981;
        Mon, 10 Oct 2022 18:38:31 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::deb2])
        by smtp.gmail.com with UTF8SMTPSA id f11-20020a02a10b000000b0036390180240sm4240557jag.177.2022.10.10.18.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 18:38:31 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] modpost: put modpost options before argument
Date:   Mon, 10 Oct 2022 21:38:28 -0400
Message-Id: <20221011013828.267658-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The musl implementation of getopt stops looking for options after the
first non-option argument. Put the options before the non-option
argument so environments using musl can still build the kernel and
modules.

Fixes: f73edc8951b2 ("kbuild: unify two modpost invocations")
Link: https://git.musl-libc.org/cgit/musl/tree/src/misc/getopt.c?h=dc9285ad1dc19349c407072cc48ba70dab86de45#n44
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 7740ce3b29e8..8489a3402eb8 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -119,7 +119,7 @@ quiet_cmd_modpost = MODPOST $@
 		echo >&2 "WARNING: $(missing-input) is missing."; \
 		echo >&2 "         Modules may not have dependencies or modversions."; \
 		echo >&2 "         You may get many unresolved symbol warnings.";) \
-	sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) $(vmlinux.o-if-present) -T -
+	sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) -T - $(vmlinux.o-if-present)
 
 targets += $(output-symdump)
 $(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(moudle.symvers-if-present) $(MODPOST) FORCE
-- 
2.38.0

