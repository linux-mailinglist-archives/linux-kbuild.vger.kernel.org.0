Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758731D670F
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgEQJuV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:21 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38331 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4L4018560;
        Sun, 17 May 2020 18:49:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4L4018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708949;
        bh=HDyB9iGxCGVtkBKzkgco6muLOnSe+630RxDR+kh602E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pXUKav6F0+9yn2cdiqxWYCjuJwpjYe9/kHJjkF/pG0Yzqkw+gnvh8GdvUKCN/yTaS
         SevUqXEc0XnPasS3DlcNu6K/bp3aPeh1WaVSn1R0x3G8GHN7gRiZG6gSCokv7WIbm0
         +7P7GTN8QtySZUJSkIzDmoSFof0ZjPVLGGFXd3wXkJTg/Ss7NYhewhpCW/ZZPNYZjg
         0Wl84uwE+SFClfNtuimSsUfxhR9jaNOAM+ShwEKvL83tk/iA17czDvD3HChvTZT4yC
         WWWTRLfE7I3pGPR/ZATGHiQW5S3MTyghnXKHJejRhbMIV9rjzAT6uiYa7br8NiMerf
         RlfTWo2Xi6Lsw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/29] modpost: use read_text_file() and get_line() for reading text files
Date:   Sun, 17 May 2020 18:48:37 +0900
Message-Id: <20200517094859.2376211-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

grab_file() mmaps a file, but it is not so efficient here because
get_next_line() copies every line to the temporary buffer anyway.

read_text_file() and get_line() are simpler. get_line() exploits the
library function strchr().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    | 15 ++++++++-------
 scripts/mod/sumversion.c | 11 ++++++-----
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 2c6319f0ce19..8021f7e93448 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2466,15 +2466,16 @@ static void write_if_changed(struct buffer *b, const char *fname)
  **/
 static void read_dump(const char *fname, unsigned int kernel)
 {
-	unsigned long size, pos = 0;
-	void *file = grab_file(fname, &size);
-	char *line;
+	char *buf, *pos, *line;
 
-	if (!file)
+	buf = read_text_file(fname);
+	if (!buf)
 		/* No symbol versions, silently ignore */
 		return;
 
-	while ((line = get_next_line(&pos, file, size))) {
+	pos = buf;
+
+	while ((line = get_line(&pos))) {
 		char *symname, *namespace, *modname, *d, *export;
 		unsigned int crc;
 		struct module *mod;
@@ -2509,10 +2510,10 @@ static void read_dump(const char *fname, unsigned int kernel)
 		sym_set_crc(symname, crc);
 		sym_update_namespace(symname, namespace);
 	}
-	release_file(file, size);
+	free(buf);
 	return;
 fail:
-	release_file(file, size);
+	free(buf);
 	fatal("parse error in symbol dump file\n");
 }
 
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index a1c7b0f4cd5a..89c8baefde9d 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -306,9 +306,8 @@ static int is_static_library(const char *objfile)
  * to figure out source files. */
 static int parse_source_files(const char *objfile, struct md4_ctx *md)
 {
-	char *cmd, *file, *line, *dir;
+	char *cmd, *file, *line, *dir, *pos;
 	const char *base;
-	unsigned long flen, pos = 0;
 	int dirlen, ret = 0, check_files = 0;
 
 	cmd = NOFAIL(malloc(strlen(objfile) + sizeof("..cmd")));
@@ -326,14 +325,16 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	strncpy(dir, objfile, dirlen);
 	dir[dirlen] = '\0';
 
-	file = grab_file(cmd, &flen);
+	file = read_text_file(cmd);
 	if (!file) {
 		warn("could not find %s for %s\n", cmd, objfile);
 		goto out;
 	}
 
+	pos = file;
+
 	/* Sum all files in the same dir or subdirs. */
-	while ((line = get_next_line(&pos, file, flen)) != NULL) {
+	while ((line = get_line(&pos))) {
 		char* p = line;
 
 		if (strncmp(line, "source_", sizeof("source_")-1) == 0) {
@@ -384,7 +385,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	/* Everyone parsed OK */
 	ret = 1;
 out_file:
-	release_file(file, flen);
+	free(file);
 out:
 	free(dir);
 	free(cmd);
-- 
2.25.1

