Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7511D6700
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgEQJtv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:49:51 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38327 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727814AbgEQJth (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:37 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4L0018560;
        Sun, 17 May 2020 18:49:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4L0018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708947;
        bh=ibb66H/JCMPnh041HwrGfYVbBcz1hL248mIHX+8vOjY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CZfhOX1z+ALUcwN6Vl5i+inuYyak49dlDdYH+DZgAtzWkNZre+zSNDUn+DaPL5tdv
         OYVfMyQ4/Oy/oixAATxIKDsyqJ70ErdygaSJ3rRJlj2xo3e6VicK61hH0p6cgre90E
         o4hy/+tcDbIBsWy/CgWLLyYkjlpZOoXh9fQsy9Vy/2AGdhIE3+p+9t7XW+MRjiMHQ1
         UkYk7tvOR3SiaxM6l1DFNmgNzW4XoH3HX+y7A5rBjcwvZSUZXmsjkc8QENmXy+ZItx
         214HAPqcj8so/ssL6zlj+pubEazgd2Qd9y1BOzZVyVtIBMqTIXk//2bj1MvvktegVn
         vyWONmslV0yfg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/29] modpost: add read_text_file() and get_line() helpers
Date:   Sun, 17 May 2020 18:48:33 +0900
Message-Id: <20200517094859.2376211-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

modpost uses grab_file() to open a file, but it is not suitable for
a text file because the mmaped file is not terminated by null byte.
Actually, I see some issues for the use of grab_file().

The new helper, read_text_file() loads the whole file content into a
malloc'ed buffer, and appends a null byte. Then, get_line() reads
each line.

To handle text files, I intend to replace as follows:

 grab_file()    -> read_text_file()
 get_new_line() -> get_line()

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 36 ++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index af098d7efc22..2c6319f0ce19 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -112,6 +112,42 @@ void *do_nofail(void *ptr, const char *expr)
 	return ptr;
 }
 
+char *read_text_file(const char *filename)
+{
+	struct stat st;
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
+	if (read(fd, buf, st.st_size) != st.st_size) {
+		free(buf);
+		buf = NULL;
+		goto close;
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

