Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5F07E115F
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Nov 2023 23:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjKDW1k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Nov 2023 18:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjKDW1j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Nov 2023 18:27:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E93BD6A
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Nov 2023 15:27:36 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32fb95dfe99so1064273f8f.2
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Nov 2023 15:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699136854; x=1699741654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8s2yoRUeKgroJRQQN5i4eD7t3aini7S28e/D8lZRFg=;
        b=kNTWNr0Pl+bOZwgBsxm+9ho9fF8l+scaSrbtFziosIhLgnsNJsNyKIbCX6Ws4WXjRm
         EjZNGcEsYbrwPeB7CmDjoxPAfKC9LOU3dEohA51SMjXNTJlkV4V9sin2GIY2z+ku3pER
         NqfcujjVH+UI2+vG45hBDL4pVZuWDVhmojKlRGXF+jmcanLC4T4loyM6QRd/7g1oJ+tn
         unYHP3QfX4oo9mVvqqSuaR1M+U9q2zwAFd7hLou72Qwc6VWmQGYZZ2yao/gyMh7G3L9R
         w4NZkAvACE5o74YnOKyL7j0Yv44DkuVPrniW0vlZD+faX9dzJIF5uoOmsVcmhph5PhL8
         rt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699136854; x=1699741654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8s2yoRUeKgroJRQQN5i4eD7t3aini7S28e/D8lZRFg=;
        b=kbXZOA41eaKS+ICLyITw+Bb9sPLOtBe5vyysdcKXbo68xANTgNXskKr53/CG0s5sfm
         7lsbO7ncdPNmT2GYUorqWErwjvdSxuuS84vi1ncoTiodAQPdwvRzotQ3zw1BoYZN5tsN
         zZzQQIW8kTgGd87J/j908ucdCoNZiP/3GYAkttvyqwQHKXBnAC5URU+aQWIux2bTWY9a
         ANSGIpTG5ks0JSKCkokHbNhyIL6CcfeX5XtDLOviqspYKJq/lWQlAMlNEMB8z1VQ6IvX
         ELH0s4/KWyIx0R+CJGW8rm2X+XJC43M/inWT1R7s8E6Sc3Fh5RzbuRKNpa7dsWPpz/AV
         fhTA==
X-Gm-Message-State: AOJu0YzW1pt7eyjiAMozixz/YkAvWljtslG6dDqFLwvVdNO7hyKcNC1F
        5YBMcWyZtUvcHY94OJRmpHf6Fw==
X-Google-Smtp-Source: AGHT+IGs9hk9yWFiEyPpATtAnF8XYLh+dsKh5fiy0L0GIoiXsPwCpxqwvdwXknjJLgaAoPSnYBo2Mw==
X-Received: by 2002:a05:6000:2c2:b0:32f:8581:4f8a with SMTP id o2-20020a05600002c200b0032f85814f8amr16908549wry.11.1699136854379;
        Sat, 04 Nov 2023 15:27:34 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d6644000000b0032da49e18fasm5384724wrw.23.2023.11.04.15.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 15:27:34 -0700 (PDT)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Yoann Congal <yoann.congal@smile.fr>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH v5] kconfig: avoid an infinite loop in oldconfig/syncconfig
Date:   Sat,  4 Nov 2023 23:27:15 +0100
Message-Id: <20231104222715.3967791-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Exit on error when asking for value and reading stdin returns an error
(mainly if it has reached EOF or is closed).

This infinite loop happens in particular for hex/int configs without an
explicit default value.

Previously, this case would loop:
* oldconfig prompts for the value but stdin has reached EOF
* It gets the global default value : an empty string
* This is not a valid hex/int value so it prompts again, hence the
  infinite loop.

This case happens with a configuration like this (a hex config without a
valid default value):
  config TEST_KCONFIG
       hex "Test KConfig"
       # default 0x0

And using:
  make oldconfig < /dev/null

This was discovered when working on Yocto bug[0] on a downstream
kconfig user (U-boot)

[0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14136

CC: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v4->v5:
 * Switched to Masahiro Yamada's suggested code.
v3->v4:
 * Added Brandon Maier's "Tested-by". Thanks!
v2->v3:
 * Simplify the patch by fusing comments of :
   * Masahiro Yamada : Exit as soon as reading stdin hits an error
   * Randy Dunlap : Display the name of the currently read symbol
v1->v2:
 * Improve coding style
 * Put more info in the commit message
---
 scripts/kconfig/conf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 33d19e419908..62de1fbaff97 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -76,8 +76,10 @@ static void strip(char *str)
 /* Helper function to facilitate fgets() by Jean Sacren. */
 static void xfgets(char *str, int size, FILE *in)
 {
-	if (!fgets(str, size, in))
+	if (!fgets(str, size, in)) {
 		fprintf(stderr, "\nError in reading or end of file.\n");
+		exit(1);
+	}
 
 	if (!tty_stdio)
 		printf("%s", str);
-- 
2.30.2

