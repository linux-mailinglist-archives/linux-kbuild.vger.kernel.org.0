Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB9CABBE2
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2019 17:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfIFPLZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 11:11:25 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33425 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbfIFPLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 11:11:25 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MV2Sk-1hgIWR2ZKI-00S57m; Fri, 06 Sep 2019 17:11:01 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        WANG Chao <chao.wang@ucloud.cn>,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mostpost: don't warn about symbols from another file
Date:   Fri,  6 Sep 2019 17:10:48 +0200
Message-Id: <20190906151059.1077708-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MYSsX62M3kMVOdBJmO0fvdsGZ8LVBevwQAuhV3ZGapv8NxCoKjk
 ewBSHOJ+U+W4Bx40YN/DKiYCMc86z16Ni9hwgNX31KTZIAQYIAvTD4YPKc19zHK2HJ7KxZM
 34zimubqZDjIL66j4kVkFU7LPxsU3RM9eaT4qGUqavdgjJa2/3/5bWTiBhHSmqT+lHTR+FE
 1IJMRDtXw4khhHR8Tekyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jPkOfdxtGfs=:MMY/6CGqG/UaoJb6vlh/AH
 U2S63vjc7H4TGNfEYOqhGsvpyk6EgV+g15g+sMayiSRR2f+MT5IdUdb9rZbHaLCr1GotwD6pT
 frLmDSswIbANiqQSInn3yIX8G+ziGOO1Vf8V+QB7qpyhit/8ieCC9j1bUYMkjNqIa9MW9hQRU
 0wDsEX+hDy3qwUhpRGa5jGdsgIyiwXrqC7dAamrIzlrtHEIXYOwFm57GshwlU1WJsJTv1E4Wb
 xsUowHX2NJGL9RhYj6GDxJTEpJSjQ57naMl2kC4yOS+g1vrghWwECPYRqyWAkU0B53jE2KYjA
 9IeJbdtviemSV3LsUtpKGAYOs8dP3JyKnqwEc86GmeYVf8vq48AVfft6Fz7RBCqzxoNAmN/p/
 YXcn/DnAtGdcEOLAsYjgKfMOdHQQ+QaCZhPPlO57z1uJlMOS2rYP63phI8tKm9B/Op1IKdLjv
 jidOQNVMWyVc3yCdnIOwBi/tpIsQw98d2VCKlQ8ubtacaqaZYNLeER6RhMT7XloK403DppwZH
 rrqtyQcwavMJMWQHm5RieV9NqUJ9+Hl2NrPRneE99v6dqcFZpj0L14cUuPF5zsuG5pmVzHokf
 VHIi1FgSaP3HccwZyt5aUm1TzelqEujdKzlU2LW0gWyrCA6oWslARprr7xAC9FtdH4p4IEwag
 XmIzaJIggQbqgbEp6I8u7zm9W/9lX7C3XdPYzmFLfsI6Efy72BQg9wlFSXnrgago5Pc4yXeuO
 l053iPLVHskj4J3ftQDlLripZ8/U19RyokcegBgwFccbc9qkshuvbS5fWqozc5bhMuWZPtPEc
 sAOqHEpf3V0xguUpX9MgRl1zWeeGg==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On architectures such as ARM that have a list of symbols exported from
assembler in a separate C file, we get a lot of new warnings:

WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
WARNING: "__udivsi3" [vmlinux] is a static (unknown)
WARNING: "_change_bit" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
WARNING: "__umodsi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
WARNING: "__muldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
...

This is not helpful, as these are clearly not static symbols
at all. Suppress the warning in a case like this.

Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 76c221dd9b2b..4265dd924933 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
 		struct symbol *s = symbolhash[n];
 
 		while (s) {
-			if (s->is_static)
+			if (s->is_static && s->export != export_unknown)
 				warn("\"%s\" [%s] is a static %s\n",
 				     s->name, s->module->name,
 				     export_str(s->export));
-- 
2.20.0

