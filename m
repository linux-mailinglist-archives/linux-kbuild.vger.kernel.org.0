Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26779FCC01
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfKNRmd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:42:33 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:64704 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfKNRmd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:33 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xAEHgSo2028428;
        Fri, 15 Nov 2019 02:42:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xAEHgSo2028428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573753349;
        bh=nOkFN6j7wUXdObUwKpD/Qbkrxvoi6EK7nlyZ3Mg/dAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uEncBA+O3SNqUdvvNlH3dEgHHVCmaxWlnm27jkPch+McdgAj0vqYkUbKn+0Caq4v2
         kCQ0irvT3KAOYSlobPeVMLWlY7CpjvOjKNnH3wN1fUGlxxXzry+jnooYyDymAQDicL
         f8Bu+C62B+7wHbIIqK7sVO2Y5WMXdjOieoh3ptxZmzZeDp0C/7BqmjBp0af1ZZArGq
         eCi1tZ+o80cyRRhphOeIJzgYKHlXD7DJelGt0++ZkI7GA60zm+YVqsjun4zoPzzTF8
         Q1yLJafPe55oRAvsRxoIrtUOfKIsCT7SWHcT65Hjw4y3bfSNpotKUWB44cS1La4Kyc
         Ne5+izeRz9SEA==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] modpost: refactor namespace_from_kstrtabns() to not hard-code section name
Date:   Fri, 15 Nov 2019 02:42:22 +0900
Message-Id: <20191114174226.7201-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, namespace_from_kstrtabns() relies on the fact that
namespace strings are recorded in the __ksymtab_strings section.
Actually, it is coded in include/linux/export.h, but modpost does
not need to hard-code the section name.

Elf_Sym::st_shndx holds the section number of the relevant section.
Using it is a more portable way to find the namespace string.

sym_get_value() takes care of it, so namespace_from_kstrtabns() can
simply wrap it. Delete the unneeded info->ksymtab_strings .

While I was here, I added more 'const' qualifiers to pointers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 10 +++-------
 scripts/mod/modpost.h |  1 -
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cd885573daaf..d9418c58a8c0 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -356,10 +356,10 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_unknown;
 }
 
-static const char *namespace_from_kstrtabns(struct elf_info *info,
-					    Elf_Sym *kstrtabns)
+static const char *namespace_from_kstrtabns(const struct elf_info *info,
+					    const Elf_Sym *sym)
 {
-	char *value = info->ksymtab_strings + kstrtabns->st_value;
+	const char *value = sym_get_data(info, sym);
 	return value[0] ? value : NULL;
 }
 
@@ -601,10 +601,6 @@ static int parse_elf(struct elf_info *info, const char *filename)
 			info->export_unused_gpl_sec = i;
 		else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
 			info->export_gpl_future_sec = i;
-		else if (strcmp(secname, "__ksymtab_strings") == 0)
-			info->ksymtab_strings = (void *)hdr +
-						sechdrs[i].sh_offset -
-						sechdrs[i].sh_addr;
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB) {
 			unsigned int sh_link_idx;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index fe6652535e4b..64a82d2d85f6 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -143,7 +143,6 @@ struct elf_info {
 	Elf_Section  export_gpl_sec;
 	Elf_Section  export_unused_gpl_sec;
 	Elf_Section  export_gpl_future_sec;
-	char	     *ksymtab_strings;
 	char         *strtab;
 	char	     *modinfo;
 	unsigned int modinfo_len;
-- 
2.17.1

