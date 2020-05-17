Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3651D670A
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgEQJuH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:07 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39071 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgEQJuD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:50:03 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LQ018560;
        Sun, 17 May 2020 18:49:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LQ018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708963;
        bh=5Y7bJ/6MkN+CtsMEOzco5kPsAEOrX1KqgnDGk0cK6hI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zCWZ7fns2i1QAXekcc79EAHeUq+7aO9Hzm/wRVwhVHSY9ekIBZLdxYjfRhdLovTP8
         kAZcB5t6za/PY87PWCg4WCFbb6hENEufRFxSZMfnf4/18LZuN9n2LFIELAIaYczvpP
         C93bJ/Pzx1xXtiVfDj4ErbPlhUNslSK0d+sEU0wEu6UcHzA432lkFRwIefOk/cZ13O
         Dr4bHwWqR6O6ustj5nA4MOIbFDzZIzGBDhgZ1J05tt0jE7+OBW+WtpmeZDhDUjMLRF
         Z+mSv9t4fJnEWRN3JjQE/ONp9L1pJndkJ92/ev27+fMSbqKdsj129DQ+FQ2QJ44zqC
         mU4ZDpxktdHqQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 29/29] modpost: change elf_info->size to size_t
Date:   Sun, 17 May 2020 18:48:59 +0900
Message-Id: <20200517094859.2376211-30-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Align with the mmap / munmap APIs.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 ++++-----
 scripts/mod/modpost.h | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bcab010f09ce..af5c55d96df3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -429,7 +429,7 @@ static void sym_set_crc(const char *name, unsigned int crc)
 	s->crc_valid = 1;
 }
 
-static void *grab_file(const char *filename, unsigned long *size)
+static void *grab_file(const char *filename, size_t *size)
 {
 	struct stat st;
 	void *map = MAP_FAILED;
@@ -451,7 +451,7 @@ static void *grab_file(const char *filename, unsigned long *size)
 	return map;
 }
 
-static void release_file(void *file, unsigned long size)
+static void release_file(void *file, size_t size)
 {
 	munmap(file, size);
 }
@@ -507,9 +507,8 @@ static int parse_elf(struct elf_info *info, const char *filename)
 
 	/* Check if file offset is correct */
 	if (hdr->e_shoff > info->size) {
-		fatal("section header offset=%lu in file '%s' is bigger than "
-		      "filesize=%lu\n", (unsigned long)hdr->e_shoff,
-		      filename, info->size);
+		fatal("section header offset=%lu in file '%s' is bigger than filesize=%zu\n",
+		      (unsigned long)hdr->e_shoff, filename, info->size);
 		return 0;
 	}
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 1df87d204c9a..efb74dba19e2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -133,7 +133,7 @@ struct module {
 };
 
 struct elf_info {
-	unsigned long size;
+	size_t size;
 	Elf_Ehdr     *hdr;
 	Elf_Shdr     *sechdrs;
 	Elf_Sym      *symtab_start;
-- 
2.25.1

