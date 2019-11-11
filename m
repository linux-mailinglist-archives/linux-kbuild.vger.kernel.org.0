Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353ABF6C1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2019 02:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfKKBLL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Nov 2019 20:11:11 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41709 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfKKBLL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 20:11:11 -0500
Received: by mail-pg1-f196.google.com with SMTP id h4so8326240pgv.8;
        Sun, 10 Nov 2019 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ZT7hBDoeXOqqMvo+S9MUnqrXtKd3dKsoJu8zfEhQFVQ=;
        b=vg3TC9L3QVYFXoXpX3cPkvdGbaacXBm9LYHUvaOfg/yxNT0kzDN82/asbv/o8s+6rM
         wiXVZi7sWSi2D/nS4W/WwceSj9K7IuwCb+x/kh4X9Pypi1AcX4yEvbqSEDwcqVCzPWD8
         ym4/3JRv/KLD4wnAgHAALWe3X9+OLHQnvrb9d7FgLOyzZHtAf4iF7kTylyoWhRt3CFMs
         7lmkdcL8/IJJX9FOAERq/25c+Ra2KxagmLB9a7j9LyPGU0I9+niKZWQGuUa5kzZ027Rh
         YqUt8AGmxFUDL0UPAhfSO98xOb6+Wrz5TEkSKO4W6cfsjBTdPVdym+JLdr1ibOKt05mx
         mX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ZT7hBDoeXOqqMvo+S9MUnqrXtKd3dKsoJu8zfEhQFVQ=;
        b=do7bDpIn/zvYSiFcbqnEyEkDTTNmjxI0EfGSZeaiQlqmm97kFwI6P+4NlHSTtX5WiQ
         h3fHIag7gXZ3WG8t9dRbKzj2/K2VNY3adJGiiHPHgMBKLnoQhWoSaOuRG5SI7w83/Jy5
         dVa4wmApqIqTlhmy2nCiEekWLQDfFZRu0DvF4NoygLO5h4cKrQkp/KKcOMuJ54jpJcKZ
         nVcUB4sNUFrHotYRCpp7g3ofD3x6PJvsfRsoL1sLv6cVLbHtWtVpwPens2KuUTpCwI3N
         Jcc6lrvEC5bVIVTkyBZbSNAReSM5uW2COGNCVZcdGIoea9o1H5TJSHP5b7+CyT23dmHM
         tzZA==
X-Gm-Message-State: APjAAAXy+hCsz/ezT871J70jCfKwDsPO0PByjXw4wSpwx/X3wsTid0vy
        e5xeY0+WFCrgXTMd5c/4lS7GORVK
X-Google-Smtp-Source: APXvYqxYab7RGX5Ti0t9cegFQSyWnngYtUxiwMdWsErNNbvIzPt7Mz4NrHnDuoj2HALlg2quqaVztA==
X-Received: by 2002:a62:ac06:: with SMTP id v6mr26212960pfe.210.1573434670471;
        Sun, 10 Nov 2019 17:11:10 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q185sm17741656pfc.153.2019.11.10.17.11.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2019 17:11:09 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     "David S . Miller" <davem@davemloft.net>
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] sparc: vdso: Fix build failure seen due to kbuild changes
Date:   Sun, 10 Nov 2019 17:11:06 -0800
Message-Id: <20191111011106.18427-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sparc64:allmodconfig fails to build with the following error.

unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
arch/sparc/vdso/vdso32/vclock_gettime.o: failed
make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
make[2]: *** Waiting for unfinished jobs....

The problem bisects to commit a3de7a72c517 ("kbuild: change
*FLAGS_<basetarget>.o to take the path relative to $(obj)").
Duplicate the x86 specific defines from this commit to the sparc
vdso Makefile to fix the problem.

Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/sparc/vdso/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 324a23947585..cb72a205cd7e 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -67,6 +67,7 @@ $(vobjs): KBUILD_CFLAGS := $(filter-out $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS
 #
 CFLAGS_REMOVE_vdso-note.o = -pg
 CFLAGS_REMOVE_vclock_gettime.o = -pg
+CFLAGS_REMOVE_vdso32/vclock_gettime.o = -pg
 
 $(obj)/%.so: OBJCOPYFLAGS := -S
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
@@ -74,6 +75,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 
 CPPFLAGS_vdso32.lds = $(CPPFLAGS_vdso.lds)
 VDSO_LDFLAGS_vdso32.lds = -m elf32_sparc -soname linux-gate.so.1
+VDSO_LDFLAGS_vdso32/vdso32.lds = -m elf32_sparc -soname linux-gate.so.1
 
 #This makes sure the $(obj) subdirectory exists even though vdso32/
 #is not a kbuild sub-make subdirectory
-- 
2.17.1

