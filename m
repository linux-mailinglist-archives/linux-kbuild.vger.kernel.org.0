Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A0D1D66F1
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgEQJtf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38297 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgEQJte (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:34 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4L3018560;
        Sun, 17 May 2020 18:49:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4L3018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708949;
        bh=6K+D+dSB42US8DS1uSVG3jkfdReISGQFxEdCh46Tq6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vtai4x/0IIFFPfNt2tFcvRyuKZcTw+ZU791TbffSIbXEe5tILl7D+NiqimWFgKURA
         dc4wsPAL7hu9J/yojn10Int8ahOvOXoXbudXmWoXQHH72XMSZ6mgLsBHWdekhcQbdl
         6PRsBaSF0gQ5eiLhx1qeTte3QjMw5leAlxds3Gbt29p+QTkWeijaRRGa3EqcCEAkzF
         Pvi/0g5/KtV8YXaY2V3S0fbAMsBAu3NkJEHiXx1c1sNawvB+v+fQjKXkADjKJKwXkA
         1VL8DUsSWHNPMzREs4nQiEA56Z1Eb91l53dlrosOExeTj085JZ9kyaJ983nJgxCxbg
         aWAYVg8mmS2Jw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/29] modpost: avoid false-positive file open error
Date:   Sun, 17 May 2020 18:48:36 +0900
Message-Id: <20200517094859.2376211-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

One problem of grab_file() is that it cannot distinguish the following
two cases:

 - I cannot read the file (the file does not exist, or read permission
   is not set)

 - It can read the file, but the file size is zero

This is because grab_file() calls mmap(), which requires the mapped
length is greater than 0. Hence, grab_file() fails for both cases.

If an empty header file were included from a module that requires checksum
calculation, the following warning would be printed:

  WARNING: modpost: could not open ...: Invalid argument

An empty file is a valid source file, so it should not fail.

Use read_text_file() instead. It can read a zero-length file.
Then, parse_file() will succeed with doing nothing.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f9df0b1863f1..a1c7b0f4cd5a 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -258,10 +258,12 @@ static int parse_file(const char *fname, struct md4_ctx *md)
 	char *file;
 	unsigned long i, len;
 
-	file = grab_file(fname, &len);
+	file = read_text_file(fname);
 	if (!file)
 		return 0;
 
+	len = strlen(file);
+
 	for (i = 0; i < len; i++) {
 		/* Collapse and ignore \ and CR. */
 		if (file[i] == '\\' && (i+1 < len) && file[i+1] == '\n') {
@@ -287,7 +289,7 @@ static int parse_file(const char *fname, struct md4_ctx *md)
 
 		add_char(file[i], md);
 	}
-	release_file(file, len);
+	free(file);
 	return 1;
 }
 /* Check whether the file is a static library or not */
-- 
2.25.1

