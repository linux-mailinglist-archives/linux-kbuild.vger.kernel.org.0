Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA15D20F7E7
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 17:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729324AbgF3PHr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 11:07:47 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:19690 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730802AbgF3PHr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 11:07:47 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 05UF6SbU008591;
        Wed, 1 Jul 2020 00:06:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 05UF6SbU008591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593529590;
        bh=VAm+cXSDo5Fh+pmfFmuYCgdzmU5mfMMJMsLOGDZz1aI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VdVrQq7pf/F54WjhoJ7QII1VXVEV1mx1OyOk1ADM6rNqTNcg2fZcqJH1FnSsbp1LN
         tR9YWNfeIxYdHFcWYd48LcDnx5I0f40hany/dGqRu8IAH4lMVEVa2N90vdvPm6Rzz7
         QNjbmiaqoPP/bPKDcHA+kuVKKjsd0OaoMQtucWeO+GGDS222j72ixypfKopKN6INSw
         82bCHpNEizACoWp6qgA7/RC+KSfWbPq0GLc42dMawCFZW4vrC/u4zxUsZ+HuWh0HSp
         /OwQBOchrHLZ+EShuJ+9xwIyqdfmRXBFcDCk+osm/LgExkubO/C2rtJpFtRIq7pHhq
         1gpf4HldgyTLg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2 2/2] kbuild: make Clang build userprogs for target architecture
Date:   Wed,  1 Jul 2020 00:06:25 +0900
Message-Id: <20200630150625.12056-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630150625.12056-1-masahiroy@kernel.org>
References: <20200630150625.12056-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Programs added 'userprogs' should be compiled for the target
architecture i.e. the same architecture as the kernel.

GCC does this correctly since the target architecture is implied
by the toolchain prefix.

Clang builds userspace programs always for the host architecture
because the target triple is currently missing.

Fix this.

Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

(no changes since v1)

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ac2c61c37a73..bc48810d1655 100644
--- a/Makefile
+++ b/Makefile
@@ -970,8 +970,8 @@ LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
 endif
 
 # Align the bit size of userspace programs with the kernel
-KBUILD_USERCFLAGS  += $(filter -m32 -m64, $(KBUILD_CFLAGS))
-KBUILD_USERLDFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
+KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
+KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
 
 # make the checker run with the right architecture
 CHECKFLAGS += --arch=$(ARCH)
-- 
2.25.1

