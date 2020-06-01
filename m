Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BBC1E9DBA
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgFAF6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:25 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40028 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727776AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM3023694;
        Mon, 1 Jun 2020 14:57:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM3023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991067;
        bh=PkEcky+2nbSPL/QvtYB9+TkDgKl7m2g6/MD3lgv36Sg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EqnZF4jtiO4Etk00MVJYWUDRUOG3Wcr/YlB5GD2n8HIa4/rZMeY1zZ+97M7ocqZz0
         f2mv137lhxWeKiVMkJ4j4A7wEJT3ULuyqiKr86Q+uG2QvBd72Z5OhRqATMOlwLaj/Q
         zWZZcD4ymLZ6YBIOxlZ+fSP+fsVJLzeUOT14KjF1bWT/aDVo9Bzr4RuJ93bZiiIPx0
         P1OR2R4BIX0oqaL7S3kruDIPZI+PIRLH4D5PEqKW86q2OupXR1X5mCbHs9DqOz62Fi
         pGJAMvIMzb+9K2tJvWyYkn8SVKJhm3mHJxi7MKiocRG6idrMUs4DWUZYML88PYUokX
         H6BxEZTKQ6iwQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 24/37] modpost: fix potential mmap'ed file overrun in get_src_version()
Date:   Mon,  1 Jun 2020 14:57:18 +0900
Message-Id: <20200601055731.3006266-24-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not know how reliably this function works, but it looks dangerous
to me.

    strchr(sources, '\n');

... continues searching until it finds '\n' or it reaches the '\0'
terminator. In other words, 'sources' should be a null-terminated
string.

However, grab_file() just mmaps a file, so 'sources' is not terminated
with null byte. If the file does not contain '\n' at all, strchr() will
go beyond the mmap'ed memory.

Use read_text_file(), which loads the file content into a malloc'ed
buffer, appending null byte.

Here we are interested only in the first line of *.mod files. Use
get_line() helper to get the first line.

This also makes missing *.mod file a fatal error.

Commit 4be40e22233c ("kbuild: do not emit src version warning for
non-modules") ignored missing *.mod files.

I do not fully understand what that commit addressed, but commit
91341d4b2c19 ("kbuild: introduce new option to enhance section mismatch
analysis") introduced partial section checks by using modpost. built-in.o
was parsed by modpost. Even modules had a problem because *.mod files
were created after the modpost check.

Commit b7dca6dd1e59 ("kbuild: create *.mod with full directory path and
remove MODVERDIR") stopped doing that. Now that modpost is only invoked
after the directory descend, *.mod files should always exist at the
modpost stage.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f27f22420cbc..5fb142db6195 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -392,40 +392,34 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
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
-		/* not a module or .mod file missing - ignore */
-		return;
+	buf = read_text_file(filelist);
 
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

