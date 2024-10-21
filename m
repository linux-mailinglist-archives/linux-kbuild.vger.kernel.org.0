Return-Path: <linux-kbuild+bounces-4221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF19A9194
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 22:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8FC31F233DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 20:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672641D3578;
	Mon, 21 Oct 2024 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="pQiAMAQS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004871FE115;
	Mon, 21 Oct 2024 20:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543762; cv=none; b=XK/R0ocmWmTF8jMzD1Qj9uFuFCj5+XFAcl6iFYgSNVkw2p/eqjUsFZcaoq04pT/aDH3ldgX6FlBxNOT3GBLs63VC6a5KftKZWKEXNS4m7Byr4L378HZCkLrZti9vbZ6sqV+/CLMoiHtKEtx5yJqzMa5EYk2sKPqypJmnec239Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543762; c=relaxed/simple;
	bh=Hd8sheoscKiXx8SxQ20/NJB/49Kl35Hx2hL2FSV3Y0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HEKlsPZ582K+1zVFDAo5xQfptXgIW3eqTOgstr5bZ8V7fMaeVZEXfyhTwRHu6zpqSe7ndjAVwTkvLEOi1SVmJkbOXhyy4u24x8N35tJOKzV6v8wqKjetUog8wVAPQDCVJjSwJiwbAhG2U3n+5CnWT2872VblMedrUyPAm3BULDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=pQiAMAQS; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost.localdomain (unknown [109.252.171.178])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2E0844076720;
	Mon, 21 Oct 2024 20:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2E0844076720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1729543153;
	bh=30p/HelcAi/TS+HoLBcHtGbCS61mwp3guEiaVTQg9vk=;
	h=From:To:Cc:Subject:Date:From;
	b=pQiAMAQSdCjuUaMfzpFAHJPZhSbvGyH4C3O+57MUw0kYZzgpoQsiGkhUICAakvZcm
	 FWtW53slfmtpwGKbJ1Ol0MOq31gJ0kJ/DUVAg1/2O/qSwdjFy9QkTa6p5AYVrNzSHQ
	 lVD0TJA31DznS4v0MMkjk1St1YUhb8lji6y3ehcE=
From: Elena Salomatkina <esalomatkina@ispras.ru>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Elena Salomatkina <esalomatkina@ispras.ru>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] sumversion: Fix a memory leak in get_src_version()
Date: Mon, 21 Oct 2024 23:38:46 +0300
Message-Id: <20241021203846.930-1-esalomatkina@ispras.ru>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strsep() modifies its first argument - buf.
If an error occurs in the parsing loop, an invalid pointer
will be passed to the free() function.
Make the pointer passed to free() match the return value of
read_text_file().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9413e7640564 ("kbuild: split the second line of *.mod into *.usyms")
Signed-off-by: Elena Salomatkina <esalomatkina@ispras.ru>
---
v2: Rename 'orig' to 'pos'

 scripts/mod/sumversion.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 6bf9caca0968..03774957d8b9 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -385,7 +385,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 /* Calc and record src checksum. */
 void get_src_version(const char *modname, char sum[], unsigned sumlen)
 {
-	char *buf;
+	char *buf, *pos;
 	struct md4_ctx md;
 	char *fname;
 	char filelist[PATH_MAX + 1];
@@ -393,7 +393,7 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%s.mod", modname);
 
-	buf = read_text_file(filelist);
+	pos = buf = read_text_file(filelist);
 
 	md4_init(&md);
 	while ((fname = strsep(&buf, "\n"))) {
@@ -406,5 +406,5 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 
 	md4_final_ascii(&md, sum, sumlen);
 free:
-	free(buf);
+	free(pos);
 }
-- 
2.33.0


