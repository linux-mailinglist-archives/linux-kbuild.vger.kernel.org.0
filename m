Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28104186AF0
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2020 13:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbgCPMdl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 08:33:41 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:22833 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730878AbgCPMdk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 08:33:40 -0400
X-IronPort-AV: E=Sophos;i="5.70,560,1574092800"; 
   d="scan'208";a="86408493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 20:33:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
        by cn.fujitsu.com (Postfix) with ESMTP id 9FD3E50A9967;
        Mon, 16 Mar 2020 20:23:29 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 20:33:32 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 16 Mar 2020 20:33:32 +0800
From:   Xiao Yang <yangx.jy@cn.fujitsu.com>
To:     <yamada.masahiro@socionext.com>, <michal.lkml@markovi.net>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Xiao Yang <yangx.jy@cn.fujitsu.com>
Subject: [PATCH] modpost: Get proper section index by get_secindex() instead of st_shndx
Date:   Mon, 16 Mar 2020 20:28:20 +0800
Message-ID: <20200316122820.11032-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: 9FD3E50A9967.AA9D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(uint16_t) st_shndx is limited to 65535(i.e. SHN_XINDEX) so sym_get_data() gets
wrong section index by st_shndx if object file(e.g. vmlinux.o) has more than
65535 sessions.  In this case, we need to get proper section index by .symtab_shndx
section.

Module.symvers generated by building kernel with "-ffunction-sections -fdata-sections"
shows the issue(i.e. cannot get 89902 by st_shndx):
-------------------------------------------------------------------
[root@Fedora-30 linux]# file Module.symvers
Module.symvers: data
[root@Fedora-30 linux]# head -n1 Module.symvers
0x5caf3011      ipv6_chk_custom_prefix  ▒▒▒▒▒▒▒▒        vmlinux EXPORT_SYMBOL
...
[root@Fedora-30 linux]# readelf -s -W vmlinux.o | grep __kstrtabns_ipv6_chk_custom_prefix
199174: 0000000000032578     1 OBJECT  LOCAL  DEFAULT 89902 __kstrtabns_ipv6_chk_custom_prefix
[root@Fedora-30 linux]# readelf -S -W vmlinux.o | grep 89902
  [89902] __ksymtab_strings PROGBITS        0000000000000000 a94e00 0345a2 00   A  0   0  1
-------------------------------------------------------------------

Fixes: afa0459daa7b ("modpost: add a helper to get data pointed by a symbol")
Fixes: 5545322c86d9 ("modpost: refactor namespace_from_kstrtabns() to not hard-code section name")
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 scripts/mod/modpost.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d9418c58a8c0..c1fec8cac257 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -310,7 +310,8 @@ static const char *sec_name(struct elf_info *elf, int secindex)
 
 static void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym)
 {
-	Elf_Shdr *sechdr = &info->sechdrs[sym->st_shndx];
+	unsigned int secindex = get_secindex(info, sym);
+	Elf_Shdr *sechdr = &info->sechdrs[secindex];
 	unsigned long offset;
 
 	offset = sym->st_value;
-- 
2.21.0



