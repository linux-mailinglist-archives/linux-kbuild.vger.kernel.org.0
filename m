Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC621E9DAE
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgFAF6W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:22 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39992 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM0023694;
        Mon, 1 Jun 2020 14:57:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM0023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991066;
        bh=A8ZNE7lF0YmzyG3nrffQEG/n5KXH1UkTXudtbTEqgq8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KOoJVQgxSipYMNLVqi3fqK0AR8hJvfbHOQzNkbmmWZ+75g7IJ9gPJ8lObFzgfLEsC
         vHrFnZfP3qdsAbal8u/2jafZ2dlBWFkvbCKtWDoxyjbDuMxy9sLEUsX8BMjfXHGZnc
         3h/cwBTuXInXIk8iC1XnGhdhlBAu8W5BneSrbhR04VSbamD9FsqQvzU0tc0qBI6lQf
         wN3EthNzjPf6PLkVdY4qPCt9x8FwA4sqZkDBwc6cgy4aSUNCq3sdvU8JzKwGztyj0T
         fpnCoEWKo4ETbe3ztkgjJf5zg91LjQ36MZUnSL0PMtFyY7OX9WXdtStPCbMVJlRhMq
         efkqCm/W8kbEw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 21/37] modpost: drop RCS/CVS $Revision handling in MODULE_VERSION()
Date:   Mon,  1 Jun 2020 14:57:15 +0900
Message-Id: <20200601055731.3006266-21-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As far as I understood, this code gets rid of '$Revision$' or '$Revision:'
of CVS, RCS or whatever in MODULE_VERSION() tags.

Remove the primeval code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    |  3 --
 scripts/mod/modpost.h    |  4 ---
 scripts/mod/sumversion.c | 66 ----------------------------------------
 3 files changed, 73 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3df26789c2e6..fbb3d3391e52 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2066,9 +2066,6 @@ static void read_symbols(const char *modname)
 		check_sec_ref(mod, modname, &info);
 
 	version = get_modinfo(&info, "version");
-	if (version)
-		maybe_frob_rcs_version(modname, version, info.modinfo,
-				       version - (char *)info.hdr);
 	if (version || (all_versions && !is_vmlinux(modname)))
 		get_src_version(modname, mod->srcversion,
 				sizeof(mod->srcversion)-1);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index b8b7a82d2ff7..f728e250b8d2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -188,10 +188,6 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 void add_moddevtable(struct buffer *buf, struct module *mod);
 
 /* sumversion.c */
-void maybe_frob_rcs_version(const char *modfilename,
-			    char *version,
-			    void *modinfo,
-			    unsigned long modinfo_offset);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 63062024ce0e..f27f22420cbc 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -429,69 +429,3 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 release:
 	release_file(file, len);
 }
-
-static void write_version(const char *filename, const char *sum,
-			  unsigned long offset)
-{
-	int fd;
-
-	fd = open(filename, O_RDWR);
-	if (fd < 0) {
-		warn("changing sum in %s failed: %s\n",
-			filename, strerror(errno));
-		return;
-	}
-
-	if (lseek(fd, offset, SEEK_SET) == (off_t)-1) {
-		warn("changing sum in %s:%lu failed: %s\n",
-			filename, offset, strerror(errno));
-		goto out;
-	}
-
-	if (write(fd, sum, strlen(sum)+1) != strlen(sum)+1) {
-		warn("writing sum in %s failed: %s\n",
-			filename, strerror(errno));
-		goto out;
-	}
-out:
-	close(fd);
-}
-
-static int strip_rcs_crap(char *version)
-{
-	unsigned int len, full_len;
-
-	if (strncmp(version, "$Revision", strlen("$Revision")) != 0)
-		return 0;
-
-	/* Space for version string follows. */
-	full_len = strlen(version) + strlen(version + strlen(version) + 1) + 2;
-
-	/* Move string to start with version number: prefix will be
-	 * $Revision$ or $Revision: */
-	len = strlen("$Revision");
-	if (version[len] == ':' || version[len] == '$')
-		len++;
-	while (isspace(version[len]))
-		len++;
-	memmove(version, version+len, full_len-len);
-	full_len -= len;
-
-	/* Preserve up to next whitespace. */
-	len = 0;
-	while (version[len] && !isspace(version[len]))
-		len++;
-	memmove(version + len, version + strlen(version),
-		full_len - strlen(version));
-	return 1;
-}
-
-/* Clean up RCS-style version numbers. */
-void maybe_frob_rcs_version(const char *modfilename,
-			    char *version,
-			    void *modinfo,
-			    unsigned long version_offset)
-{
-	if (strip_rcs_crap(version))
-		write_version(modfilename, version, version_offset);
-}
-- 
2.25.1

