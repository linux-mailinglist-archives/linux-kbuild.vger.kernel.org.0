Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1FB1E0689
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2020 07:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388508AbgEYFr2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 May 2020 01:47:28 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62120 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388743AbgEYFr1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 May 2020 01:47:27 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 04P5l9A1013208;
        Mon, 25 May 2020 14:47:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 04P5l9A1013208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590385630;
        bh=0uTKdW1KbUmtGYeOi/qQd7Taz/4BizcEeyoYfCw1RgQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vVbOCC+QI3UNPkBYtTTGyY+sFEk9ccI3jons1o/CoGQ1wWDz0lYwYbr1cfmhEHNoj
         LqSKxcvue3yJRwVbDLUcJpqFN/4cDuJ8ZXq1hFM0Idg965qxCPijV2i/Hek5D4GlwC
         R3UZf94I4xibS7241/Og2YFVhB1vdL4F80VhHfpbMf31K742saq7Gxn8xVmERIxIqq
         5RPrAeWSAN3I7kadidHG0u04EIA9Oo46hE03OP2HEN2p7iSBRxWiIu+eYN6HDFoVva
         wnzEKpkB4AcxgiX7NImOvp+WbE85U41eZ8hshxBMaxoSrqNLOvpZtfhYuc7adDp8sD
         2lqrBWjHTMw8g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] modpost: refactor sech_name()
Date:   Mon, 25 May 2020 14:47:05 +0900
Message-Id: <20200525054705.1066033-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200525054705.1066033-1-masahiroy@kernel.org>
References: <20200525054705.1066033-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use sym_get_data_offset() helper to get access to the .shstrtab
section data. No functional change is intended because
elf->sechdrs[elf->secindex_strings].sh_addr is 0 for both ET_REL
and ET_EXEC object types.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a8306adb3554..a5f3908bc9e4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -333,18 +333,6 @@ static enum export export_no(const char *s)
 	return export_unknown;
 }
 
-static const char *sech_name(struct elf_info *elf, Elf_Shdr *sechdr)
-{
-	return (void *)elf->hdr +
-		elf->sechdrs[elf->secindex_strings].sh_offset +
-		sechdr->sh_name;
-}
-
-static const char *sec_name(struct elf_info *elf, int secindex)
-{
-	return sech_name(elf, &elf->sechdrs[secindex]);
-}
-
 static void *sym_get_data_offset(const struct elf_info *info,
 				 unsigned int secindex, unsigned long offset)
 {
@@ -362,6 +350,16 @@ static void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym)
 				   sym->st_value);
 }
 
+static const char *sech_name(struct elf_info *elf, Elf_Shdr *sechdr)
+{
+	return sym_get_data_offset(elf, elf->secindex_strings, sechdr->sh_name);
+}
+
+static const char *sec_name(struct elf_info *elf, int secindex)
+{
+	return sech_name(elf, &elf->sechdrs[secindex]);
+}
+
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
 
 static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
-- 
2.25.1

