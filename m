Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECBD1E9DBB
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgFAF60 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:26 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40016 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM2023694;
        Mon, 1 Jun 2020 14:57:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM2023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991066;
        bh=AvQUsiRI7MJB3yiarf2NJzUVwoBoz3XsvXCX7iTbaYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M7I5cNXkA8ZKcfjqqYovO4aoe15SagFyU+3RaJ+dJDH6zR22yYJqHcAdCNNBxegwY
         3tFrR0An1AHY2UHl6ryHtev77LfGahCjt9M9pm0Yeaek5yhn+DvsAjsXw1w09jyYQs
         uwNVjbuWwpYh57SwLmsaFnSt1IpuMPD2aXjEt/e3U6qkIzSPtqN2IkBtPzo7x9QNSI
         gbPca8Q3rcomWmRt1ftW+rfDP3SO4vGipGM0r85WJHFLE381B+cuARySl0Q7AKWQOt
         R5/tBasG0rWwdeyadGDpqEIsGHe5VXbYc+Gz8iFMWtP65e1typO0YKuItwOG53cKXO
         JJZRPTsIz/ppg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 23/37] modpost: add read_text_file() and get_line() helpers
Date:   Mon,  1 Jun 2020 14:57:17 +0900
Message-Id: <20200601055731.3006266-23-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
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

 scripts/mod/modpost.c | 49 +++++++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.h |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a5da633af700..0a844902998e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -112,6 +112,55 @@ void *do_nofail(void *ptr, const char *expr)
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
+	if (fd < 0) {
+		perror(filename);
+		exit(1);
+	}
+
+	if (fstat(fd, &st) < 0) {
+		perror(filename);
+		exit(1);
+	}
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
+			perror(filename);
+			exit(1);
+		}
+
+		nbytes -= bytes_read;
+	}
+	buf[st.st_size] = '\0';
+
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
index f728e250b8d2..205afc90b08a 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -191,6 +191,8 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
+char *read_text_file(const char *filename);
+char *get_line(char **stringp);
 void *grab_file(const char *filename, unsigned long *size);
 char* get_next_line(unsigned long *pos, void *file, unsigned long size);
 void release_file(void *file, unsigned long size);
-- 
2.25.1

