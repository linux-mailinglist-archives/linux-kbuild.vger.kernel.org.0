Return-Path: <linux-kbuild+bounces-55-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E57EFE67
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F5DCB209C9
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE2C23CA;
	Sat, 18 Nov 2023 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKXRv4Zt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5155320F7
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 07:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F603C433CA;
	Sat, 18 Nov 2023 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700294359;
	bh=7B9xzLj7sIaqmkQ1H5s+m9dY9DubmYm9c00xpE/4MPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nKXRv4Zt8qe0WCMduKIxPCC67/0jUCspqh1jRXrxruCDwXj1rPlOzGpHrKK393xgV
	 XTbNFN58g73dfeBmmoTv6FNn7csho25HIDWOeOi+JgP0pMzHqk7ConchAkFCgfuGjs
	 HHJw1tmEiM3RHF2DXXudpFiZzd2Vm61Nx++tNS7T/B1EbekHZ0OQOzgdQE3CPJt36k
	 xNkz32DDAi0EsbjFpix58JEKrDgUaMT0DPKBDoTxSwUS4eP2pt0kHq6H6PM9OVNoqm
	 dYGidN2bS39UrtgQq10pWPvs5mXvAKFXRouaC0ZZVjMZiNiqYLGBS6YdKI+eOcrC+U
	 zhRh0mjghKVPw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/6] kconfig: introduce getline_stripped() helper
Date: Sat, 18 Nov 2023 16:59:10 +0900
Message-Id: <20231118075912.1303509-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118075912.1303509-1-masahiroy@kernel.org>
References: <20231118075912.1303509-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, newline characters are stripped away in multiple places
on the caller.

Doing that in the callee is helpful for further cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 40 +++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index b6a90f6baea1..795ac6c9378f 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -337,12 +337,32 @@ static ssize_t compat_getline(char **lineptr, size_t *n, FILE *stream)
 	return -1;
 }
 
+/* like getline(), but the newline character is stripped away */
+static ssize_t getline_stripped(char **lineptr, size_t *n, FILE *stream)
+{
+	ssize_t len;
+
+	len = compat_getline(lineptr, n, stream);
+
+	if (len > 0 && (*lineptr)[len - 1] == '\n') {
+		len--;
+		(*lineptr)[len] = '\0';
+
+		if (len > 0 && (*lineptr)[len - 1] == '\r') {
+			len--;
+			(*lineptr)[len] = '\0';
+		}
+	}
+
+	return len;
+}
+
 int conf_read_simple(const char *name, int def)
 {
 	FILE *in = NULL;
 	char   *line = NULL;
 	size_t  line_asize = 0;
-	char *p, *p2, *val;
+	char *p, *val;
 	struct symbol *sym;
 	int i, def_flags;
 	const char *warn_unknown, *werror, *sym_name;
@@ -421,7 +441,7 @@ int conf_read_simple(const char *name, int def)
 		}
 	}
 
-	while (compat_getline(&line, &line_asize, in) != -1) {
+	while (getline_stripped(&line, &line_asize, in) != -1) {
 		conf_lineno++;
 		if (line[0] == '#') {
 			if (line[1] != ' ')
@@ -443,19 +463,11 @@ int conf_read_simple(const char *name, int def)
 			p = strchr(sym_name, '=');
 			if (!p)
 				continue;
-			*p++ = 0;
-			val = p;
-			p2 = strchr(p, '\n');
-			if (p2) {
-				*p2-- = 0;
-				if (*p2 == '\r')
-					*p2 = 0;
-			}
+			*p = 0;
+			val = p + 1;
 		} else {
-			if (line[0] != '\r' && line[0] != '\n')
-				conf_warning("unexpected data: %.*s",
-					     (int)strcspn(line, "\r\n"), line);
-
+			if (line[0] != '\0')
+				conf_warning("unexpected data: %s", line);
 			continue;
 		}
 
-- 
2.40.1


