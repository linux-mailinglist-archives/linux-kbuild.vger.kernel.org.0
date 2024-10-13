Return-Path: <linux-kbuild+bounces-4076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B907099B986
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Oct 2024 15:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8C21C20B56
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Oct 2024 13:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C841A143C5D;
	Sun, 13 Oct 2024 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="iF7/eDwF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C913E022;
	Sun, 13 Oct 2024 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728825083; cv=none; b=KzC0+FLi4a13z7d24N9KvMmK7bqd20+zUT2Ai9eaAD8qbiJ4si0qE4dpZmObgF8POcOI+Cc/1UHJUERAzDyC/CtNA/2Cm+56zI9PHlBqEk4bTleRMrr+Zi5qcegeRaon2gdjY+iujYKbzKph6QXkTFUfzY6RGp5ye/4msvIHtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728825083; c=relaxed/simple;
	bh=FJnB74YNd70k5I0I4591s8SC3qgq1A0F6QgQW4slz90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sIzU0GvLWBuS978iOt2gljkrr6caRXlKEG+FjfbqkDg6CUNfNA1emnhl1lC6pHVYjb7CSVrVaeQGvY32IS66NXmd79aMxv01L4YyXG5ePXDIHamUp2MOFpsrxa7fkCx16M04BUke8ZjTOuPczYFQZhj94j5u7RTryXZ6oCe7Aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=iF7/eDwF; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost.localdomain (unknown [109.252.171.178])
	by mail.ispras.ru (Postfix) with ESMTPSA id D1F154078507;
	Sun, 13 Oct 2024 13:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru D1F154078507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1728825079;
	bh=apdW1IHRxXcQQlc//Jca9OjYBJD1RCHBWzrhI8ujOGQ=;
	h=From:To:Cc:Subject:Date:From;
	b=iF7/eDwFZQWvUM1VV3ogO0Lq0ao91zQVONydxAwVEWIaNzEfr+Lu0OdUrzMQth6rQ
	 f/c7cQ4slXaoFOtJXhYSWo7pJk4FI2A2qpT3tSnjdMUFejbdBUGtN93djMsqHi/WDz
	 q7tbEQPBd6vADGOPgD77rvYJlXbRUpxwAR234pPA=
From: Elena Salomatkina <esalomatkina@ispras.ru>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Elena Salomatkina <esalomatkina@ispras.ru>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] sumversion: Fix a memory leak in get_src_version()
Date: Sun, 13 Oct 2024 16:11:10 +0300
Message-Id: <20241013131110.1706-1-esalomatkina@ispras.ru>
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
+	char *buf, *orig;
 	struct md4_ctx md;
 	char *fname;
 	char filelist[PATH_MAX + 1];
@@ -393,7 +393,7 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%s.mod", modname);
 
-	buf = read_text_file(filelist);
+	orig = buf = read_text_file(filelist);
 
 	md4_init(&md);
 	while ((fname = strsep(&buf, "\n"))) {
@@ -406,5 +406,5 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 
 	md4_final_ascii(&md, sum, sumlen);
 free:
-	free(buf);
+	free(orig);
 }
-- 
2.33.0


