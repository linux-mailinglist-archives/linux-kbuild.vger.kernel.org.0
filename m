Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871EA46506
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2019 18:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfFNQxG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Jun 2019 12:53:06 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37114 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNQxG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jun 2019 12:53:06 -0400
Received: by mail-ed1-f65.google.com with SMTP id w13so4414041eds.4;
        Fri, 14 Jun 2019 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHZ93hSaXvBIUfC/oiibZgsNE+onQZFaMpofrsm5QRs=;
        b=RGCqVCEVOvGtqgZ5Mzpy8QvghnSvBK3Xo/Xlu0LwJ1giRoV8vEHQE6hIGpFP3n24FZ
         DBrzdlbIWh0oktuDVCAL7aJivgeMO2KmgDcC9bX5YOIBK6UsrrXhrksAJBjWBUgoRj+2
         p9SoQuvBGcHkAAVVmiLP30UGUpfLooiTGUU2VEW0MUND2MVMFb4H0wOI0XHMYd/96ac1
         7g7nvL/Y5f1zI2/FK0maKe0m6Kz0BvtoJKo5BO2uZu0wqY6PaLlus1qmcVy54zKU3NEr
         EH054TIlIUnXYlrvmrsTWW77NySubaRRTWhydGJClHBtqe5kMmL3W1jXy8cwjNfXQT17
         gfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHZ93hSaXvBIUfC/oiibZgsNE+onQZFaMpofrsm5QRs=;
        b=C10oqerllFSskpbKHk8T/1tHAYGxRQ6rS258EF+J5pAEhYaz7eoW9kSnDeXGRTnDXB
         gd0+OWoJojZUK5fnjwz+Jy6OMkK+iOixAtiXQ7kIb9HbwY53wn43TzSEjSQxSoDFk/jK
         YjSxmiFm0ULeNDSfPNQR6+Mu9nLkdSf8ECP2rVPSWyr5PB1SkDZ/Zc+j9KNWQC+q4a3B
         /ky9AQRgMgDo7snXxt42PfSzOBthjXPmum7xZN1/vFfxh6u1fqIjzrbZV99s354rSX/n
         /vVwdQoCG/TKMN05BAYWLBCmJl4zOVVx6NwmhCsE+A3MV3RBfAz65gPeu2Nrdh1dC7Es
         FuFA==
X-Gm-Message-State: APjAAAV1AU19MKIpwSJx6tze5Gu+PZnPvPJ+jlf87nmIVZOB4gId81zx
        QbbUItFfjjwyLpnsWQlLpME=
X-Google-Smtp-Source: APXvYqx6ZDojnqhlSd2k7ozAEmSGDkG898ANZmRrlZFUE1pa9P1mZv8eNHb1xEH1hsrhXRInburn2A==
X-Received: by 2002:a17:906:fae0:: with SMTP id lu32mr60547284ejb.283.1560531184674;
        Fri, 14 Jun 2019 09:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id z24sm691944ejn.40.2019.06.14.09.53.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 09:53:04 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] kbuild: Enable -Wuninitialized
Date:   Fri, 14 Jun 2019 09:52:42 -0700
Message-Id: <20190614165242.79257-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This helps fine very dodgy behavior through both -Wuninitialized
(warning that a variable is always uninitialized) and
-Wsometimes-uninitialized (warning that a variable is sometimes
uninitialized, like GCC's -Wmaybe-uninitialized). These warnings
catch things that GCC doesn't such as:

https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/

We very much want to catch these so turn this warning on so that CI is
aware of it.

Link: https://github.com/ClangBuiltLinux/linux/issues/381
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 98081ab300e5..699683a7c116 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -71,6 +71,5 @@ KBUILD_CFLAGS += -Wno-unused-value
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
-KBUILD_CFLAGS += -Wno-uninitialized
 endif
 endif
-- 
2.22.0

