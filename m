Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875AF20F7E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731100AbgF3PHE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 11:07:04 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:18808 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgF3PHE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 11:07:04 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 05UF6SbT008591;
        Wed, 1 Jul 2020 00:06:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 05UF6SbT008591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593529589;
        bh=ex39KmxT7SPfAvJbb0E3RhcbX8PtVqkNn9BxsYalfbs=;
        h=From:To:Cc:Subject:Date:From;
        b=D8wEor/YWRpl7yVMid/3Yn8/6rY36fxaoit/vtG6wIyvraL8vHYgFsaCP3ypLITAL
         s+eDscx0ZDYGRMtoHOLmNIAqZZ3NakHeRvXfKl210521otdEbgofGLmb6yOo+agJ8k
         CBl8NPZv4qRGX/4F08pGemPoB1mOAw6glRXb3TpXGGP5+pN4ouEqH+CRRYCP10yNSI
         FUyOl96XFlXpxmkttbMtfd3GVdfvOkupL/HArRGhNFpm43oqlguD1Z89Lg3B2VbZEX
         utvfO2DlzORouMAuZs+ZPAlaZUqpFM91zJtsgjXvhJPHTjvE6Ex4vzYegtfrBaprrQ
         GHxNeefRbNK5A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2 1/2] kbuild: fix CONFIG_CC_CAN_LINK(_STATIC) for cross-compilation with Clang
Date:   Wed,  1 Jul 2020 00:06:24 +0900
Message-Id: <20200630150625.12056-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/cc-can-link.sh tests if the compiler can link userspace
programs.

When $(CC) is GCC, it is checked against the target architecture
because the toolchain prefix is specified as a part of $(CC).

When $(CC) is Clang, it is checked against the host architecture
because --target option is missing.

Pass $(CLANG_FLAGS) to scripts/cc-can-link.sh to evaluate the link
capability for the target architecture.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch

 init/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a46aa8f3174d..d0313e7725fa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -49,13 +49,13 @@ config CLANG_VERSION
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m32-flag))
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
 
 config CC_CAN_LINK_STATIC
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m32-flag))
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m64-flag)) if 64BIT
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m32-flag))
 
 config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
-- 
2.25.1

