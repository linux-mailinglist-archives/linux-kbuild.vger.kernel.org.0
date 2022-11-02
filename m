Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9202E616167
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Nov 2022 12:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiKBLGd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Nov 2022 07:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiKBLG3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2022 07:06:29 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9B129368
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Nov 2022 04:06:22 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id l18-20020a056402255200b004633509768bso6419655edb.12
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Nov 2022 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQfvgq1r8lF9rRRm4NumpIHqFvDpVd5cUWloyxUIys=;
        b=ZOFvSA0cmseSVYIuYaM2BdEV+9xbe5Xbf2t7D0GgypSpP1gnX3wIZjxGtpGcZlix5E
         FCdURGEXcoZhbn0atFQBOKA8PWu5GZmM0PepNS7WW/UOv8wS8UBvhYQA/S017ZeMaU6B
         pduViuSKslfAwUv/JkReNhliQybOgcLy8uFrc0LLbfBUiBcHAE6KfsJe1A8kD7TZje6B
         IGivUc1aeRKlICNXfm5j+lzmy+rGqkvLo+gUkMJchlsBDJTqDJ/HltB0c5Jh1EmtZrYy
         udfceaJkn1m4l67dY8Nrhn/+bADs62+zBKdKM2OPoBBpBSlwpT6u6Adqi1g1JykfTIHV
         nquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQfvgq1r8lF9rRRm4NumpIHqFvDpVd5cUWloyxUIys=;
        b=hQT5KhyVcagNYfrETgEJTt4V0gkr7flgMbg2iKUymxQK5llFR7p5+Mzp9iwJr8PIlr
         246KdE0ZR0NwlQxLBCvh4cR4AycK9W+uu3uoxO1dB17Y+pkzYbxwoFe3pfY+A7axNtof
         xvuTBtSGfpr1Nkz0jcGg7r2w7nljvCcnSlfKEEC3qE5J/aM7WRprAAP5xdAKdOl94QSY
         Lx50DBa8lp3BXB47gOF8puX3jtDQtMA8kbBUpQVyMfy1OL3AnK0a2SkWIQeoDfPbQL77
         SclZJrngpq/vZxftAIgIz+FPMMqveWbSQfFZNXTl/AnywIFVcwJ5YzUMzYmz2BufQHmQ
         aGiA==
X-Gm-Message-State: ACrzQf0eTcmtEPybA0KqEdyysdg7uE4CDFedgAwFMXe5V0w0WwWolrwB
        TUHM3li1osoyGXAG0J4PB5BisZv2jrM=
X-Google-Smtp-Source: AMsMyM6PXK1AcgbPYvS415aXFf4iDD8g9auqwdAGE8GYIznokzqnaxqJcwlrYZDt7ihqGTup8MwZef43Ezw=
X-Received: from glider.muc.corp.google.com ([2a00:79e0:9c:201:7f41:af20:8:a96d])
 (user=glider job=sendgmr) by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id
 ez12-20020a056402450c00b004436279774fmr24423763edb.11.1667387181029; Wed, 02
 Nov 2022 04:06:21 -0700 (PDT)
Date:   Wed,  2 Nov 2022 12:06:09 +0100
In-Reply-To: <20221102110611.1085175-1-glider@google.com>
Mime-Version: 1.0
References: <20221102110611.1085175-1-glider@google.com>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Message-ID: <20221102110611.1085175-3-glider@google.com>
Subject: [PATCH 3/5] Kconfig.debug: ensure early check for KMSAN in CONFIG_KMSAN_WARN
From:   Alexander Potapenko <glider@google.com>
To:     glider@google.com
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
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

As pointed out by Masahiro Yamada, Kconfig picks up the first default
entry which has true 'if' condition. Hence, the previously added check
for KMSAN was never used, because it followed the checks for 64BIT and
!64BIT.

Put KMSAN check before others to ensure it is always applied.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Link: https://github.com/google/kmsan/issues/89
Link: https://lore.kernel.org/linux-mm/20221024212144.2852069-3-glider@google.com/
Fixes: 921757bc9b61 ("Kconfig.debug: disable CONFIG_FRAME_WARN for KMSAN by default")
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 29280072dc0e4..b4a0988a7ffd2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -395,12 +395,12 @@ endif # DEBUG_INFO
 config FRAME_WARN
 	int "Warn for stack frames larger than"
 	range 0 8192
+	default 0 if KMSAN
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
 	default 2048 if PARISC
 	default 1536 if (!64BIT && XTENSA)
 	default 1024 if !64BIT
 	default 2048 if 64BIT
-	default 0 if KMSAN
 	help
 	  Tell the compiler to warn at build time for stack frames larger than this.
 	  Setting this too low will cause a lot of warnings.
-- 
2.38.1.273.g43a17bfeac-goog

