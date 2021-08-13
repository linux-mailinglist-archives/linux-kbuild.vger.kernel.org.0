Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC9F3EBE56
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Aug 2021 00:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhHMWmD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 18:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhHMWmC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 18:42:02 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56516C061756;
        Fri, 13 Aug 2021 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=9LVCyfqZR/mJDKYzPBzlmzTBTxLDn7h7pvpHyqkQo6A=; b=LFI/tyvxzL1hQTH5R1lZEI8E7q
        9SHEHzqBlZLD6FUMp1RVSGYGx7ibosArsCgo4sKgp+fe5j6SNmHoDI0onGPjmGASvsB05RTchMDJj
        bRS0DTYIPshTLjxPDDxvIfk/LDW6TevpH4I+rjMCww55520LeNrEsDFNfbrCUke9Qnu1dHU2uAGww
        wzNkiXAHa7ph7cr+iZYFTgIxZFsga42YJ4pYfmMppiwHFrkcVgyiuIEqJf4y+AOev5AlFGPDftETB
        p2YjUfiWJbJDSbFXgOdEUQCetL220a8NPJu77vfX0YKCHhyJVlUEBgSAfNNjriMPfXIUzY41sKe3S
        9A5tMLAw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mEfrp-00Df0o-1T; Fri, 13 Aug 2021 22:41:33 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: use -Wno-main in the full kernel tree
Date:   Fri, 13 Aug 2021 15:41:31 -0700
Message-Id: <20210813224131.25803-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When using gcc (SUSE Linux) 7.5.0 (on openSUSE 15.3), I see a
build warning:

../kernel/trace/trace_osnoise.c: In function 'start_kthread':
../kernel/trace/trace_osnoise.c:1461:8: warning: 'main' is usually a function [-Wmain]
  void *main = osnoise_main;
        ^~~~

Quieten that warning by using "-Wno-main". It's OK to use "main" as a
declaration name in the kernel.

Build-tested on most ARCHes.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210812.orig/Makefile
+++ linux-next-20210812/Makefile
@@ -522,7 +522,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-P
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
-		   -Werror=return-type -Wno-format-security \
+		   -Werror=return-type -Wno-format-security -Wno-main \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_RUST_TARGET := $(srctree)/arch/$(SRCARCH)/rust/target.json
