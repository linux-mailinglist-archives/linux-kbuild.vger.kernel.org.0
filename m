Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B2B1B5DB7
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 16:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgDWOYu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 10:24:50 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:43061 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgDWOYu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:24:50 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 03NEO72U028581;
        Thu, 23 Apr 2020 23:24:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 03NEO72U028581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587651848;
        bh=GblWkrQ3fEk/yGag5fkIHPDknZcOQFOJ4u0hcJxUM+0=;
        h=From:To:Cc:Subject:Date:From;
        b=LM0K96az7fkbv+R8SxUG4eo39HU/jM6q0JT1kmFn40n2ZeU2VcTuuq9rkkDA6WO13
         kSa+i/6AW3PCOZYmYQgUhXvi5KVN0D0ikpkk2GkVfAvMosWhIJNUPiUpz+3KHoI5tR
         13l+n2REvpNMl9O+yPXCLVY+VllaTK0xiH/xGhOF0B8bal+xN5IB+0wjElmoETZ8DO
         RZnExlLkdTchPBZAxL5TyM6S4P48PWVzaS5EYuuOfSrsP10EGfVnYtbtcvTEGQCNyN
         80U444az98uXO4FO7MiSQINQ3RAjBj+5ngYaZdJ0VZyCuLpvI4fA1PcGojC1iiCsO+
         w1mhux82lz5RA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] kbuild: use $(CC_VERSION_TEXT) to evaluate CC_IS_GCC and CC_IS_CLANG
Date:   Thu, 23 Apr 2020 23:23:51 +0900
Message-Id: <20200423142354.312088-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The result of '$(CC) --version | head -n 1' is already computed by the
top Makefile, and stored in the environment variable, CC_VERSION_TEXT.

'echo' is probably less expensive than the two commands $(CC) and
'head' although this optimization is not noticeable level.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 9e22ee8fbd75..5f797df3f043 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -9,7 +9,7 @@ config DEFCONFIG_LIST
 	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
 
 config CC_IS_GCC
-	def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
+	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
 
 config GCC_VERSION
 	int
@@ -21,7 +21,7 @@ config LD_VERSION
 	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
 
 config CC_IS_CLANG
-	def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
+	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
 
 config CLANG_VERSION
 	int
-- 
2.25.1

