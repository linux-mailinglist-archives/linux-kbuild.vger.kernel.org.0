Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45223C99B4
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jul 2021 09:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhGOHkX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jul 2021 03:40:23 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:36482 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229620AbhGOHkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jul 2021 03:40:23 -0400
X-UUID: 6d577b4522f542c0af4e6c6b7242da3c-20210715
X-UUID: 6d577b4522f542c0af4e6c6b7242da3c-20210715
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1235068172; Thu, 15 Jul 2021 15:37:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 15:37:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 15:37:25 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <lecopzer.chen@mediatek.com>
CC:     <clang-built-linux@googlegroups.com>, <keescook@chromium.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <nathan@kernel.org>, <ndesaulniers@google.com>,
        <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: [PATCH v4] Kbuild: lto: fix module versionings mismatch in GNU make 3.X
Date:   Thu, 15 Jul 2021 15:37:16 +0800
Message-ID: <20210715073716.17477-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building modules(CONFIG_...=m), I found some of module versions
are incorrect and set to 0.
This can be found in build log for first clean build which shows

WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed,
symbol will not be versioned.

But in second build(incremental build), the WARNING disappeared and the
module version becomes valid CRC and make someone who want to change
modules without updating kernel image can't insert their modules.

The problematic code is
+	$(foreach n, $(filter-out FORCE,$^),				\
+		$(if $(wildcard $(n).symversions),			\
+			; cat $(n).symversions >> $@.symversions))

For example:
  rm -f fs/notify/built-in.a.symversions    ; rm -f fs/notify/built-in.a; \
llvm-ar cDPrST fs/notify/built-in.a fs/notify/fsnotify.o \
fs/notify/notification.o fs/notify/group.o ...

`foreach n` shows nothing to `cat` into $(n).symversions because
`if $(wildcard $(n).symversions)` return nothing, but actually
they do exist during this line was executed.

-rw-r--r-- 1 root root 168580 Jun 13 19:10 fs/notify/fsnotify.o
-rw-r--r-- 1 root root    111 Jun 13 19:10 fs/notify/fsnotify.o.symversions

The reason is the $(n).symversions are generated at runtime, but
Makefile wildcard function expends and checks the file exist or not
during parsing the Makefile.

Thus fix this by use `test` shell command to check the file
existence in runtime.

Rebase from both:
1. [https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/]
2. [https://lore.kernel.org/lkml/20210702032943.7865-1-lecopzer.chen@mediatek.com/]

Fixes: 38e89184900385 ("kbuild: lto: fix module versioning")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 10b2f2380d6f..02197cb8e3a7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -386,7 +386,7 @@ ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
       cmd_update_lto_symversions =					\
 	rm -f $@.symversions						\
 	$(foreach n, $(filter-out FORCE,$^),				\
-		$(if $(wildcard $(n).symversions),			\
+		$(if $(shell test -s $(n).symversions && echo y),	\
 			; cat $(n).symversions >> $@.symversions))
 else
       cmd_update_lto_symversions = echo >/dev/null
-- 
2.18.0

