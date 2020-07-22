Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F4236228D30
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jul 2020 02:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgGVAr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jul 2020 20:47:59 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:36963 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbgGVAr6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jul 2020 20:47:58 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 06M0lCmA017008;
        Wed, 22 Jul 2020 09:47:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 06M0lCmA017008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595378833;
        bh=eG+ayNnFCXKOBzxmUjHFFQOzueXyYgjhP95zI9sGS9o=;
        h=From:To:Cc:Subject:Date:From;
        b=U/oZ8DycR+wdfRU3577VbpGliWLjPEp+xCgcXj4QnkJDTHtMBdfxtDgPHZnNnHJKG
         TDbqE3F2T8wGtDwIFDV0qIpRraRdzKX7VrNuLubw/+NB6nMtpvqa74i8rllr57Txlr
         pzDQPyR94wJVSYqco/b56hyR15eV0Y+xEAwlRWN9XuEi+QY79yMV221IAE58u3lopc
         OAbDglRecAa0EYtowdZzpQur6X6RRq6ZGj3XQqtQa3guLwsFxzCXEBzp3f6vaH0GZ9
         t11G/4zR1fuLv+hatEOOPKF4yU9qtN2PEwv8uHM1dI2x4Jzncp6POYpl2w1NnxIQM7
         VGRmfykr26B0w==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] xtensa: add boot subdirectories build artifacts to 'targets'
Date:   Wed, 22 Jul 2020 09:47:07 +0900
Message-Id: <20200722004707.779601-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Xtensa always rebuilds the following even if nothing in the source code
has been changed. Passing V=2 shows the reason.

  AS      arch/xtensa/boot/boot-elf/bootstrap.o - due to bootstrap.o not in $(targets)
  LDS     arch/xtensa/boot/boot-elf/boot.lds - due to boot.lds not in $(targets)

They are built by if_changed(_dep). Add them to 'targets' so .*.cmd files
are included.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/xtensa/boot/boot-elf/Makefile     | 1 +
 arch/xtensa/boot/boot-redboot/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
index 12ae1e91cb75..badee63dae27 100644
--- a/arch/xtensa/boot/boot-elf/Makefile
+++ b/arch/xtensa/boot/boot-elf/Makefile
@@ -15,6 +15,7 @@ export CPPFLAGS_boot.lds += -P -C
 export KBUILD_AFLAGS += -mtext-section-literals
 
 boot-y		:= bootstrap.o
+targets		+= $(boot-y) boot.lds
 
 OBJS		:= $(addprefix $(obj)/,$(boot-y))
 
diff --git a/arch/xtensa/boot/boot-redboot/Makefile b/arch/xtensa/boot/boot-redboot/Makefile
index 8632473ad319..1a277dd57b2a 100644
--- a/arch/xtensa/boot/boot-redboot/Makefile
+++ b/arch/xtensa/boot/boot-redboot/Makefile
@@ -13,6 +13,7 @@ endif
 LD_ARGS	= -T $(srctree)/$(obj)/boot.ld
 
 boot-y	:= bootstrap.o
+targets	+= $(boot-y)
 
 OBJS	:= $(addprefix $(obj)/,$(boot-y))
 LIBS	:= arch/xtensa/boot/lib/lib.a arch/xtensa/lib/lib.a
-- 
2.25.1

