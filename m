Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BCC1E0017
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387942AbgEXPo3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:29 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19696 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUn017561;
        Mon, 25 May 2020 00:42:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUn017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334961;
        bh=C9SkWcDjS1G0ZjL6SShMHVdZAUZnR9C+tPjC6mkPDew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mf3NMY/E4hxeYWeX8iB+Xm00FQgpzedInc2N5sR6m1M91I+o5lqQnahgthhq6wuUO
         eraED5Y7IxQk//X4VPzKO7s5gxz2Cx/4EjboYrPwM07PszztSCIzRRnkJePUwbTZLw
         uuTwnvgSO2GEED6d2S2UVwndGxTWZEhNMKqYXln9W+74qhvxaNDsHC4YgD8gm0rwi0
         LQ/4RsoLXgX+KsGPYCe5wEG5zLHZDiQSXXaRprv0TSUPsLW/hILURSTnKzv5dmpH5L
         kLqMLdjEozu3CQi0Sm9mdvNheTi4iJW30vcaJLxmI8ffGED8e7jIU+vHMvGsOYIJuL
         /lgn7t7mBoGMQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/29] modpost: fix potential mmap'ed file overrun in get_src_version()
Date:   Mon, 25 May 2020 00:42:10 +0900
Message-Id: <20200524154235.380482-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not know how reliably this function works, but it seems dangerous
to me, at least.

The function call

    strchr(sources, '\n');

... continues searching until it finds '\n' or it reaches the '\0'
terminator. In other words, 'sources' should be a null-terminated
string.

However, grab_file() just mmaps a file, so 'sources' is not terminated
with null byte. If the file does not contain '\n' at all, strchr() will
go beyond the mmap'ed memory.

Instead, use read_text_file(), which loads the file content into a
malloc'ed buffer, appending null-byte.

Here we are interested only in the first line of *.mod files. Use
get_line() helper to get the first line.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/sumversion.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f27f22420cbc..f9aa532d93cf 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -392,40 +392,37 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 /* Calc and record src checksum. */
 void get_src_version(const char *modname, char sum[], unsigned sumlen)
 {
-	void *file;
-	unsigned long len;
+	char *buf, *pos, *firstline;
 	struct md4_ctx md;
-	char *sources, *end, *fname;
+	char *fname;
 	char filelist[PATH_MAX + 1];
 
 	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%.*smod",
 		 (int)strlen(modname) - 1, modname);
 
-	file = grab_file(filelist, &len);
-	if (!file)
+	buf = read_text_file(filelist);
+	if (!buf)
 		/* not a module or .mod file missing - ignore */
 		return;
 
-	sources = file;
-
-	end = strchr(sources, '\n');
-	if (!end) {
+	pos = buf;
+	firstline = get_line(&pos);
+	if (!firstline) {
 		warn("bad ending versions file for %s\n", modname);
-		goto release;
+		goto free;
 	}
-	*end = '\0';
 
 	md4_init(&md);
-	while ((fname = strsep(&sources, " ")) != NULL) {
+	while ((fname = strsep(&firstline, " "))) {
 		if (!*fname)
 			continue;
 		if (!(is_static_library(fname)) &&
 				!parse_source_files(fname, &md))
-			goto release;
+			goto free;
 	}
 
 	md4_final_ascii(&md, sum, sumlen);
-release:
-	release_file(file, len);
+free:
+	free(buf);
 }
-- 
2.25.1

