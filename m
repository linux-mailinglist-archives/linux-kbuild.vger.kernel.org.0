Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98E1E9DC3
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgFAF61 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:27 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40025 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM6023694;
        Mon, 1 Jun 2020 14:57:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM6023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991068;
        bh=IE3dCzGw0wBYOJQFUIJyhMWn7v6kWwb0YRHV/C0pXQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qELjpyptFMUHIQRRtzYaet5668rMbmn9wGCPRlTzKIzVoVCDAW2b1jIANN7zQrwLX
         ZSW3jTy3KptaoczTPl/ExDrNXFjNnLDTYPMKk0CVq0egRQKo4AIhcZ2hjfhbeWExB3
         45PQZf2JUbMHBRVghFnWcGTJoqC0r/0leA4NYApqd4Rq2O+pnFbZBACwfncIwa5Y3z
         ErSgQYNbRMArhAb20WxG7rRXT/WqNnuxf8YeKGrqLz6BI3fYiL9ykq1PXr1tvs0xfx
         FCIDIiuxbjvht0/R3XlaLiNsMG3b9sD0xs38d4zjjAzprz2Vj29BsZIEAGXIGlTH9I
         E4ExxDPnmKXwg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 27/37] modpost: remove get_next_text() and make {grab,release_}file static
Date:   Mon,  1 Jun 2020 14:57:21 +0900
Message-Id: <20200601055731.3006266-27-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

get_next_line() is no longer used. Remove.

grab_file() and release_file() are only used in modpost.c. Make them
static.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 38 ++------------------------------------
 scripts/mod/modpost.h |  3 ---
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4fdf992e9729..93019349f022 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -463,7 +463,7 @@ static void sym_set_crc(const char *name, unsigned int crc)
 	s->crc_valid = 1;
 }
 
-void *grab_file(const char *filename, unsigned long *size)
+static void *grab_file(const char *filename, unsigned long *size)
 {
 	struct stat st;
 	void *map = MAP_FAILED;
@@ -485,41 +485,7 @@ void *grab_file(const char *filename, unsigned long *size)
 	return map;
 }
 
-/**
-  * Return a copy of the next line in a mmap'ed file.
-  * spaces in the beginning of the line is trimmed away.
-  * Return a pointer to a static buffer.
-  **/
-char *get_next_line(unsigned long *pos, void *file, unsigned long size)
-{
-	static char line[4096];
-	int skip = 1;
-	size_t len = 0;
-	signed char *p = (signed char *)file + *pos;
-	char *s = line;
-
-	for (; *pos < size ; (*pos)++) {
-		if (skip && isspace(*p)) {
-			p++;
-			continue;
-		}
-		skip = 0;
-		if (*p != '\n' && (*pos < size)) {
-			len++;
-			*s++ = *p++;
-			if (len > 4095)
-				break; /* Too long, stop */
-		} else {
-			/* End of string */
-			*s = '\0';
-			return line;
-		}
-	}
-	/* End of buffer */
-	return NULL;
-}
-
-void release_file(void *file, unsigned long size)
+static void release_file(void *file, unsigned long size)
 {
 	munmap(file, size);
 }
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 205afc90b08a..aaf3c4ad5d60 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -193,9 +193,6 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen);
 /* from modpost.c */
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
-void *grab_file(const char *filename, unsigned long *size);
-char* get_next_line(unsigned long *pos, void *file, unsigned long size);
-void release_file(void *file, unsigned long size);
 
 enum loglevel {
 	LOG_WARN,
-- 
2.25.1

