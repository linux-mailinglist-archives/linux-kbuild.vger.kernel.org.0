Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F05960D569
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Oct 2022 22:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiJYUSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Oct 2022 16:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbiJYUSH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Oct 2022 16:18:07 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E816D4A0B
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 13:18:06 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id k16-20020a635a50000000b0042986056df6so6756341pgm.2
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C7CkfUfWzwXgtTSIoah0XnkQ0qFYc1jCCWhpHDWDR/w=;
        b=fJTsmos5rey7JYMoKY6ndFZ4d6icJ82KMqv/nHDL04N6WZkkkMtVyQQ1nqF0Y0KtUH
         OfISz2ZVCDmkeGuYQVLesYBbEDIWR5JRL6NrcGUZkIZQpqDWZwDfON/75kyD/V2UU39Z
         t30JBhaaeGTXXf92GzykGiILyMOVl+eFiBMbOZObKdlDwhl5cmrAPv3agCtXNF8Qd1w5
         s7zVfdQ1sV8EMuKTHonj2b3YRWqJdyV87VQ7aMYGrzsb15Rrc37qg92PcxIbOcfbZOfW
         iGodEWSW391ayu/mPqRU18EFXQyWnbHBJnOiXk0IkkcF8Sz+FDJKjzWR05UFg1cnwbLX
         n17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7CkfUfWzwXgtTSIoah0XnkQ0qFYc1jCCWhpHDWDR/w=;
        b=1JeYRO4QX+L2OoKGfl/IeTgxG9QeGKYKsjsD0+AKMZD7+LJ5GCv4pry1TNvA1Z6TqH
         iCMd1MaAmWvokmHlxpk9ZpGQXgy0Q2U9f9Lnjfgn+fQg72rZ0sJjn5WqLSiiitEBgQ6J
         COOSjUmQYeFpO2h7GlmCO8xBbrskd+eELmluuFplDq5HD54Ex3NSPZ3Sk89xykEGPn2c
         qSAAH1nTdxRqbTltoc2e7cDPqKveMot3oN3icvrJsgbEeCBfmgdhQ5D64Pi2bdjBjBrz
         RikkSeWfpBpd/oMZB3IrWxKu+9wISK/rZmCmm5RWnrYF4yPOV9SWxYe9g70gnbITPFMS
         n4Hg==
X-Gm-Message-State: ACrzQf0Hm2WTzwp443ZE99pv7opAnchX2SqfemtS5Dv/7jbhvl5CQy6F
        JdaX1ADwExoE5dIGeuvh6TijAa4zxmQsOKIMvD8=
X-Google-Smtp-Source: AMsMyM5gXj+rNt9GYNmjhHqxrpnXLvG7Pt3sQ6ETQMq57QUvneQuGAvf1bWado5LSH5olUhXQ0TZBgxb1sQAOHrRrz0=
X-Received: from wmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ebe])
 (user=willmcvicker job=sendgmr) by 2002:a05:6a00:acb:b0:555:ac02:433e with
 SMTP id c11-20020a056a000acb00b00555ac02433emr40750199pfl.3.1666729086159;
 Tue, 25 Oct 2022 13:18:06 -0700 (PDT)
Date:   Tue, 25 Oct 2022 13:17:43 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025201744.1155260-1-willmcvicker@google.com>
Subject: [PATCH v1] kbuild: Use '-f' instead of '--file=' for grep
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

The posix grep utility doesn't support the longer '--file=pattern_file'
command line option which was introduced in commit ce697ccee1a8
("kbuild: remove head-y syntax"). Let's update Makefile to use '-f
pattern_file' to fix the compiling error:

  grep: Unknown option 'file=.../scripts/head-object-list.txt'
  (see "grep --help")

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

base-commit: 1a2dcbdde82e3a5f1db9b2f4c48aa1aeba534fb2

diff --git a/Makefile b/Makefile
index d148a55bfd0f..e90bb2b38607 100644
--- a/Makefile
+++ b/Makefile
@@ -1218,7 +1218,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
 	rm -f $@; \
 	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
+	$(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += vmlinux.a
 vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
-- 
2.38.0.135.g90850a2211-goog

