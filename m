Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA341747EA
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Feb 2020 17:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgB2QK2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Feb 2020 11:10:28 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41128 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgB2QK2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Feb 2020 11:10:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id b1so3135809pgm.8;
        Sat, 29 Feb 2020 08:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pP4CQ7G4jGSfref1jPaLEXJVzlZ46InxEZXCpcyYqG4=;
        b=hZLFM8W02cvJdSaKuHImhUZzMfHVTlwGe8Mwabawt5gyjhyavIOmg+8fLjPLvIaxC6
         TeKWk/bpIvqXCY4rj+t9PuH9V8+Zks22hgWTj2bRD7wB+aP8hdb7H7S8+Qfek0vkgtRy
         qUh1ZYWkMcSBDReE2KAPFO1dKnvgKKnnvBqdcffCHvsOOuYs+Yayvv8yu9IwzlnTlOiD
         nEtSv4rJ3nMm1dVAyZpj5+S9FbujPH2sdoKsCI9PJwHTIb+HY05dILLlZULDbtAdThk2
         3jiRwuAoHtEvV11V4RCUwuRs+89nRmGDZViYnqeVKjAgffblVv+ewZaIpzWoaS3xFHZx
         NGfQ==
X-Gm-Message-State: APjAAAVqNkk4f20frPFBStaE2a5Wfdp5peW7XuDr/LkQX9t4KfSKRTUc
        W+Q0KyHBAsWHtVGeZ5Hpj1E=
X-Google-Smtp-Source: APXvYqwd9wyn2obC4qdmkw87KNT0wl3dn2/aY9qXt6Mv2H5yqp4oISyTKGJh9qR0OeYzsUE1t8firw==
X-Received: by 2002:a63:b91d:: with SMTP id z29mr10730208pge.52.1582992626847;
        Sat, 29 Feb 2020 08:10:26 -0800 (PST)
Received: from localhost ([123.51.145.16])
        by smtp.gmail.com with ESMTPSA id b21sm15926727pfp.0.2020.02.29.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 08:10:26 -0800 (PST)
Received: from root by localhost with local (Exim 4.93)
        (envelope-from <root@localhost>)
        id 1j84h7-003eot-9I; Sun, 01 Mar 2020 00:10:25 +0800
From:   =?UTF-8?q?SZ=20Lin=20=28=E6=9E=97=E4=B8=8A=E6=99=BA=29?= 
        <sz.lin@moxa.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     =?UTF-8?q?SZ=20Lin=20=28=E6=9E=97=E4=B8=8A=E6=99=BA=29?= 
        <sz.lin@moxa.com>, Kaiden PK Yu <KaidenPK.Yu@moxa.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Fix inconsistent comment
Date:   Sun,  1 Mar 2020 00:09:58 +0800
Message-Id: <20200229160959.871801-1-sz.lin@moxa.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The commit 2042b5486bd3 ("kbuild: unset variables in top Makefile
instead of setting 0") renamed the variable from "config-targets"
to "config-build", the comment should be consistent accordingly.

Signed-off-by: Kaiden PK Yu (余泊鎧) <KaidenPK.Yu@moxa.com>
Signed-off-by: SZ Lin (林上智) <sz.lin@moxa.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 90ee2a22e88b..01ac935f28bd 100644
--- a/Makefile
+++ b/Makefile
@@ -1805,7 +1805,7 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-endif # config-targets
+endif # config-build
 endif # mixed-build
 endif # need-sub-make
 
-- 
2.25.1

