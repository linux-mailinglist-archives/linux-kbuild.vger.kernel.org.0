Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1623EE1B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2019 03:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbfD3BBv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Apr 2019 21:01:51 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38159 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbfD3BBv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 21:01:51 -0400
Received: by mail-ed1-f66.google.com with SMTP id w11so4058231edl.5;
        Mon, 29 Apr 2019 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3gDh2REee/qywEIFiYNH8hrzOOKejsHhyYhN3OyguA=;
        b=smVllj4Rw+I/C7sGyIkHVFuoI00NANpFxPV6FTp5nIqjcwyT9zDLawbf0hdfgDIta1
         xYGOAH80CAqJeTgm8+y/dYekKREARHma/e3XRgo+lMgLDhbSZmLg9tUs9Xq9OMi3wwco
         AOURn4tfEJhtHjww0HDwYayvQzLJrLulo5aEu/juGpefSYY4ooor0lnvmOcnAfVeSiXU
         HnFaj4n/50Vq8SCT8TatOY5R8w6dHfye5fEPPgwbmY9if2in+Mfi/OphQ7gztRDv4BvU
         jvfB58uzX5tc+0R+rP6XFzPN0n17GZZHyp9ulyL4/Kj1k24/DGDEEYfWmHTU/ibcUHxK
         sU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3gDh2REee/qywEIFiYNH8hrzOOKejsHhyYhN3OyguA=;
        b=M3HY2do4KwQ5TbsM7GmzDIHSFBM6yyl6SLm8jaB39bG5+xOqQ8lPhEkcfKWn5ZXhGo
         xnhDXYopBoRspw4jZSWh8j9FJofbOofukF0WWS0Z2NKbT7yAU72j7wYs2ucNwkvqF/Ou
         bEsxQTcV6ASYR0HEnvVG0yoz/AEzd1jeQLBI2MUmef94fC0JR9H2ME0Euo3PQ7bJ1Gtt
         2DDCagYmcYZeuB3BbDTliirKDO9pZKmZ80SGc5Hw06gNjiL/zPN63TOCatX0Libthgez
         on0Jh6GD7zScQdjqEKqbs0J/Z6Alizb+6iFsRsydObq4tfuSYyOTz5YJaFbr5bzg/p8o
         QI2w==
X-Gm-Message-State: APjAAAXc4IKZfz3eQGkVQg8KzOvsTEdVxWNdyGBUQ/5NOUbu41p0ZZlt
        v5d7GtPf3yQu7a0SSVOetIQ=
X-Google-Smtp-Source: APXvYqypsZ3rUaABQ4Dsp+Lif+n0v9xmZgTTEpdMmMakchOMnRLQiuva+5xVF8/MB5UfwRHy5E02AA==
X-Received: by 2002:a17:906:1e4f:: with SMTP id i15mr2551656ejj.239.1556586109493;
        Mon, 29 Apr 2019 18:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id ay12sm6151507ejb.15.2019.04.29.18.01.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 18:01:48 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Date:   Mon, 29 Apr 2019 18:00:38 -0700
Message-Id: <20190430010037.6216-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
point, it has not been used because -Wuninitialized has been disabled,
which also turns off -Wsometimes-uninitialized, meaning that we miss out
on finding some bugs [1]. In my experience, it appears to be more
accurate than GCC and catch some things that GCC can't.

All of these warnings have now been fixed in -next across arm, arm64,
and x86_64 defconfig/allyesconfig so this should be enabled for everyone
to prevent more from easily creeping in.

As of next-20190429:

$ git log --oneline --grep="sometimes-uninitialized" | wc -l
45

[1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/

Link: https://github.com/ClangBuiltLinux/linux/issues/381
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Masahiro, I am not sure how you want to handle merging this with regards
to all of the patches floating around in -next but I wanted to send this
out to let everyone know this is ready to be turned on.

Arnd, are there many remaning -Wsometimes-uninitialized warnings in
randconfigs?

 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 768306add591..f4332981ea85 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
 KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
 KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
+KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
 endif
 endif
-- 
2.21.0

