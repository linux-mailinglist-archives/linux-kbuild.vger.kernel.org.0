Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34B61DFFF5
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbgEXPn3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:29 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19706 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUm017561;
        Mon, 25 May 2020 00:42:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUm017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334960;
        bh=ltKUKwKoT/xINBQfFMME2V5ALlfENSf7K0MTRiw/HwI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TOa3pY6OqEVB/EfNa7Wur+gqCbdN2vvmzJFPpcF8SNUgNo73ZQPRSiCYNS0N/INCy
         HAYaT5jiZxyzFGiMTZUNd0m4JyFXKG+el3+75ioJlzjea9IuABX02CbCX7M6Fy7DRp
         LNTmF3E7g+5izlro5lMD36I3LWeW1CtDQMGurfKVJtXEIjnYmTyzrCTTgR/ZHJ1+bZ
         3jbQaXS490XZNB4n/z31S7+kN08EpZ0SBzOnwNMo5RzS/CR0VCtwmND8uJ/b1CqMHE
         Esg+X5x/wPHrkpg9jf3fvt0En2Gz56qvyqU+mmJgpa5A2OIU5sLxuqio848vZhuS5s
         eJPACD4L3WsKA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/29] modpost: add read_text_file() and get_line() helpers
Date:   Mon, 25 May 2020 00:42:09 +0900
Message-Id: <20200524154235.380482-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

modpost uses grab_file() to open a file, but it is not suitable for
a text file because the mmap'ed file is not terminated by null byte.
Actually, I see some issues for the use of grab_file().

The new helper, read_text_file() loads the whole file content into a
malloc'ed buffer, and appends a null byte. Then, get_line() reads
each line.

To handle text files, I intend to replace as follows:

  grab_file()    -> read_text_file()
  get_new_line() -> get_line()

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Iterate in while () {} in case read() returns shorter read bytes

 scripts/mod/modpost.c | 46 +++++++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index af098d7efc22..139b811dc183 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -112,6 +112,52 @@ void *do_nofail(void *ptr, const char *expr)
 	return ptr;
 }
 
+char *read_text_file(const char *filename)
+{
+	struct stat st;
+	size_t nbytes;
+	int fd;
+	char *buf;
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0)
+		return NULL;
+
+	if (fstat(fd, &st) < 0)
+		return NULL;
+
+	buf = NOFAIL(malloc(st.st_size + 1));
+
+	nbytes = st.st_size;
+
+	while (nbytes) {
+		ssize_t bytes_read;
+
+		bytes_read = read(fd, buf, nbytes);
+		if (bytes_read < 0) {
+			free(buf);
+			buf = NULL;
+			goto close;
+		}
+
+		nbytes -= bytes_read;
+	}
+	buf[st.st_size] = '\0';
+close:
+	close(fd);
+
+	return buf;
+}
+
+char *get_line(char **stringp)
+{
+	/* do not return the unwanted extra line at EOF */
+	if (*stringp && **stringp == '\0')
+		return NULL;
+
+	return strsep(stringp, "\n");
+}
+
 /* A list of all modules we processed */
 static struct module *modules;
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index bbaf5cc37bfb..dfadaa0c01ec 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -190,6 +190,8 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
+char *read_text_file(const char *filename);
+char *get_line(char **stringp);
 void *grab_file(const char *filename, unsigned long *size);
 char* get_next_line(unsigned long *pos, void *file, unsigned long size);
 void release_file(void *file, unsigned long size);
-- 
2.25.1

