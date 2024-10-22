Return-Path: <linux-kbuild+bounces-4239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFA9AB8ED
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 23:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD8BC1F23B95
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 21:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4946B1CDA35;
	Tue, 22 Oct 2024 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="BkKA804W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34B191F7B;
	Tue, 22 Oct 2024 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729633095; cv=none; b=IFDePQKFndV6ATmtp0K5xcTTX5wSB9QHC/brVsnkJkx6qxXyKHT44r8pXaZFSHpQQiCXbxXNSbEXz9R6wsbedt9329NT5LP6t+mSoF/mWw64qQ0Nla+Y6MCFeuJjAX99h6Z2EpKUREHuozTVx1ConG+kdJP/zYpS9Zeib8en43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729633095; c=relaxed/simple;
	bh=oKEAZy8pH9MLxhkgZX2yr6NrM/izHScqOuSNFWFNfz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gfwPpk6dGT47f9aElZAraMhZfyNc3pgYVNj5wgOBwnsTpzsoEGP1b5ILd/8nagB970Ei8ZjYN3gaC16tUK3tda7AUcoE38ira74Yt2BrdGbOXAJ+fGX07PyC6h6q1q+xo+z7vIciTcj/EtkHuO8Zw8zkCjkJUexII1YHu+OIExs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=BkKA804W; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost.localdomain (unknown [109.252.171.178])
	by mail.ispras.ru (Postfix) with ESMTPSA id 7D4A440B1E7E;
	Tue, 22 Oct 2024 21:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 7D4A440B1E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1729633083;
	bh=9hvtqdDh7svi4PCrMmYACsB1kH6QywwbN3dlGQAYtZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=BkKA804WwuPo0q+aJlXbhB6Z5D1uHiwl8b634AhOH7So+ZVB1YoEoxhcybYVp7WYB
	 hh6MDrGAZCoDrESOd1aTqk7r1vMfb3bEnvnyzEQioXz5pDOPPIw1KLclC5QjMQGOhC
	 oQs19mfJPOV6l78UaER/1IdZwTRA4UAYIUaBDkG8=
From: Elena Salomatkina <esalomatkina@ispras.ru>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Elena Salomatkina <esalomatkina@ispras.ru>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	lvc-project@linuxtesting.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] sumversion: Fix a memory leak in get_src_version()
Date: Wed, 23 Oct 2024 00:37:08 +0300
Message-Id: <20241022213708.2116-1-esalomatkina@ispras.ru>
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
v3: Use 'pos' as the moving pointer
v2: Rename 'orig' to 'pos'

 scripts/mod/sumversion.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 6bf9caca0968..9b552c6efb40 100644
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
@@ -394,9 +394,10 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	snprintf(filelist, sizeof(filelist), "%s.mod", modname);
 
 	buf = read_text_file(filelist);
-
+	pos = buf;
+
 	md4_init(&md);
-	while ((fname = strsep(&buf, "\n"))) {
+	while ((fname = strsep(&pos, "\n"))) {
 		if (!*fname)
 			continue;
 		if (!(is_static_library(fname)) &&
-- 
2.33.0


