Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A30130356
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgADPho (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:37:44 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:45754 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgADPhn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:37:43 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 004Faw61022777;
        Sun, 5 Jan 2020 00:36:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 004Faw61022777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578152219;
        bh=tV/KSjNMmwmjEzyTu+uQ7dm3w/eBbGsBUx5SRxF+k+8=;
        h=From:To:Cc:Subject:Date:From;
        b=oubbIxWAEu95j2GDVXf1eMJHA0m5QzAW7Smau+6TPjB1EKpBkVMvEXoKpgfogGjem
         rcprW5oVfaPtcSDLvvhzxiQk+0Mfk5LNmrar4fEqkNknrkzWhQX2sDeDX2d8pKJwqB
         yv/VwEGN46tJU2bUFCcCPd8JMiwOPw+ssIF+65bT1Gh04uJxw0zNJXWXnfUgJy8HFL
         b4g4i5EyoyaA9eSbEm5eORG80lqcfY/nYfln2buxqVaAUmk6bnOB4kRbTvf+Kc9xSs
         kaElh4r5d32wNq6VP+aOa+f7LPBkaNu86VZAxIKKtjUiw1ZMEyM1m4a9kz/0JpicZ3
         AxNqEFZN8cMSw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Ben Colline <bcollins@debian.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: assume STT_SPARC_REGISTER is defined
Date:   Sun,  5 Jan 2020 00:36:51 +0900
Message-Id: <20200104153651.2258-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 8d5290149ee1 ("[SPARC]: Deal with glibc changing macro names in
modpost.c") was more than 14 years ago. STT_SPARC_REGISTER is hopefully
defined in elf.h of recent C libraries.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6e892c93d104..7edfdb2f4497 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -12,6 +12,7 @@
  */
 
 #define _GNU_SOURCE
+#include <elf.h>
 #include <stdio.h>
 #include <ctype.h>
 #include <string.h>
@@ -729,12 +730,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 			break;
 		if (ignore_undef_symbol(info, symname))
 			break;
-/* cope with newer glibc (2.3.4 or higher) STT_ definition in elf.h */
-#if defined(STT_REGISTER) || defined(STT_SPARC_REGISTER)
-/* add compatibility with older glibc */
-#ifndef STT_SPARC_REGISTER
-#define STT_SPARC_REGISTER STT_REGISTER
-#endif
 		if (info->hdr->e_machine == EM_SPARC ||
 		    info->hdr->e_machine == EM_SPARCV9) {
 			/* Ignore register directives. */
@@ -747,7 +742,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 				symname = munged;
 			}
 		}
-#endif
 
 		mod->unres = alloc_symbol(symname,
 					  ELF_ST_BIND(sym->st_info) == STB_WEAK,
-- 
2.17.1

