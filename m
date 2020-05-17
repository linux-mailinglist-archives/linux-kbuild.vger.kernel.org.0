Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE12D1D6719
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgEQJuk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:40 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38313 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4Kw018560;
        Sun, 17 May 2020 18:49:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4Kw018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708946;
        bh=ukd2Ha5ycOJDtM88DPTp8S4fSLpCUGmKI4WkTZgG/dg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HYz3Qv1DYXST6RSYafZFxihXRJfXVrchyZUsUEAWgs5nc22QSOkmi7J92uGDgpO4A
         ElCr/yz9QtcOQq0JRj6rr+Q47nxWorUxWf8Iw5RqwYSuZ8PN6qq7vI2ZpEP1Gj91S/
         hrGOV0IMP+eudk+TFRf7P3OjH/XQTKmfojKY7fO+ixmXtUts1dAQKvGHq8kjsN53q5
         txYYjT7e+Eyfc0Pgdn/9ahV0sFzwIjhQ3yuLG4kFdbS9lZOCu4VmaQhWvhMOKt/gQ1
         adpq5RAtXQYgngbWfISOK7E5BV6MLherplub3N+N8IbixKmmkvETeEW+Y7NTSRNDPW
         Rn55lMo7QyEHQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/29] modpost: drop RCS/CVS $Revision handling in MODULE_VERSION()
Date:   Sun, 17 May 2020 18:48:31 +0900
Message-Id: <20200517094859.2376211-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
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
index 4d4b979d76be..77e5425759e2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2074,9 +2074,6 @@ static void read_symbols(const char *modname)
 		check_sec_ref(mod, modname, &info);
 
 	version = get_modinfo(&info, "version");
-	if (version)
-		maybe_frob_rcs_version(modname, version, info.modinfo,
-				       version - (char *)info.hdr);
 	if (version || (all_versions && !is_vmlinux(modname)))
 		get_src_version(modname, mod->srcversion,
 				sizeof(mod->srcversion)-1);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 39f6c29fb568..bbaf5cc37bfb 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -187,10 +187,6 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
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

