Return-Path: <linux-kbuild+bounces-8281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0EDB19670
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 23:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE3A63B7224
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 21:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6732215793;
	Sun,  3 Aug 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BrKh8E1s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1YkQ8lZZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ayTJIMjg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FqrQvn+g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059421C16E
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Aug 2025 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256335; cv=none; b=us2cHG/FXjDqy5XgWQOnKHDNkTd7aiMfupzD8LPIzIny3wuB6aBG34QDzoY7buMDe7MdRg9IbTzjF10jWweKyFlsVvrNGO+Q8609TiXXkYWJJumAfXv0qN3kgeX5lbGimTt6BjSerrBV2YXIqZ8n2FEtSHTRJC0QHkBemyAYHjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256335; c=relaxed/simple;
	bh=QU9IYvtyClNvkDM7FfPZhkXtR9pHxEh4I9mit5JFT7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSmpG1Afi1Yz6qci1B38/sfImBSyA0uuV+IRcQTI4kC+KwUalRq+XsEMs8Z6LiDJRRDF+5nGSjBtVWmQTJSwTADYOFZLVs27W9wMuSYYG9804degFeSKRQ4bvwshnJiS5Ar23w+PBLoYJ+Ag5g22q6TqG3uCZGxtcJEb7jMR+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BrKh8E1s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1YkQ8lZZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ayTJIMjg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FqrQvn+g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E603421BF2;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i63ktf387vkgpbn5EKYRwXKPOIILjnh7c68qmfJ2qD8=;
	b=BrKh8E1sJsLpMphILBD7PlpyqBuvs8DLSpFwnctfCGIp8YR5v8ODz2a1D/oaiXE/pSvngU
	m5nFImxpiAAlSn9L69BY+PX8eOBf8GDv0f/DIqUNCJKq14/MHE5Mv2W+DxjWqIUm/RUe0q
	GAJdaWx/u08e0jU3Ko+JSaBPFDeQYcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i63ktf387vkgpbn5EKYRwXKPOIILjnh7c68qmfJ2qD8=;
	b=1YkQ8lZZ8FV8YmMcqqOkGjKdHkIOz1L3XKAkFFEp+9ObRezt9fxA3fbLrbjAhjoi6uvZcv
	L0YJViqyXofENCDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ayTJIMjg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FqrQvn+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i63ktf387vkgpbn5EKYRwXKPOIILjnh7c68qmfJ2qD8=;
	b=ayTJIMjgklxxSZ+fPG374U92MquiUAtPcK80tD4ocKdcnH2fPq78v5AfVopHCTLI+Hc+fr
	7sveWUWIpopNlILplwWucHFZfB1iPWzU60qjHrSc3IwcCCDbx/bUCD5JKH7QMmRBVFoAfS
	RAWzhKPi8gBpaE7RZQ+cFOAOnM+W7RE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i63ktf387vkgpbn5EKYRwXKPOIILjnh7c68qmfJ2qD8=;
	b=FqrQvn+gDAGGMido9NFNObleX+OqXLx2t0sJy6EolzUkiHek81Yh5c0EV+3LXtGpv48kDV
	4eof8Ma980qC60BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C724D133D1;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4BBiL7vTj2iEQAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Sun, 03 Aug 2025 21:25:15 +0000
From: David Disseldorp <ddiss@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 4/5] gen_init_cpio: avoid duplicate strlen calls
Date: Mon,  4 Aug 2025 07:11:18 +1000
Message-ID: <20250803212457.2286-5-ddiss@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803212457.2286-1-ddiss@suse.de>
References: <20250803212457.2286-1-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E603421BF2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

We determine the filename length for the cpio header, so shouldn't
recalculate it when writing out the filename.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 usr/gen_init_cpio.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index c8edb512af215..5f86550268719 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -25,6 +25,7 @@
 #define str(s) xstr(s)
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 #define CPIO_HDR_LEN 110
+#define CPIO_TRAILER "TRAILER!!!"
 #define padlen(_off, _align) (((_align) - ((_off) & ((_align) - 1))) % (_align))
 
 static char padding[512];
@@ -40,9 +41,8 @@ struct file_handler {
 	int (*handler)(const char *line);
 };
 
-static int push_string(const char *name)
+static int push_buf(const char *name, size_t name_len)
 {
-	unsigned int name_len = strlen(name) + 1;
 	ssize_t l;
 
 	l = write(outfd, name, name_len);
@@ -69,9 +69,8 @@ static int push_pad(size_t padlen)
 	return 0;
 }
 
-static int push_rest(const char *name)
+static int push_rest(const char *name, size_t name_len)
 {
-	unsigned int name_len = strlen(name) + 1;
 	ssize_t l;
 
 	l = write(outfd, name, name_len);
@@ -85,8 +84,8 @@ static int push_rest(const char *name)
 
 static int cpio_trailer(void)
 {
-	const char name[] = "TRAILER!!!";
 	int l;
+	unsigned int namesize = sizeof(CPIO_TRAILER);
 
 	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
@@ -102,12 +101,12 @@ static int cpio_trailer(void)
 		0,			/* minor */
 		0,			/* rmajor */
 		0,			/* rminor */
-		(unsigned)strlen(name)+1, /* namesize */
+		namesize,		/* namesize */
 		0);			/* chksum */
 	offset += l;
 
 	if (l != CPIO_HDR_LEN
-	 || push_rest(name) < 0
+	 || push_rest(CPIO_TRAILER, namesize) < 0
 	 || push_pad(padlen(offset, 512)) < 0)
 		return -1;
 
@@ -118,9 +117,12 @@ static int cpio_mkslink(const char *name, const char *target,
 			 unsigned int mode, uid_t uid, gid_t gid)
 {
 	int l;
+	unsigned int namesize, targetsize = strlen(target) + 1;
 
 	if (name[0] == '/')
 		name++;
+	namesize = strlen(name) + 1;
+
 	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
@@ -130,19 +132,19 @@ static int cpio_mkslink(const char *name, const char *target,
 		(long) gid,		/* gid */
 		1,			/* nlink */
 		(long) default_mtime,	/* mtime */
-		(unsigned)strlen(target)+1, /* filesize */
+		targetsize,		/* filesize */
 		3,			/* major */
 		1,			/* minor */
 		0,			/* rmajor */
 		0,			/* rminor */
-		(unsigned)strlen(name) + 1,/* namesize */
+		namesize,		/* namesize */
 		0);			/* chksum */
 	offset += l;
 
 	if (l != CPIO_HDR_LEN
-	 || push_string(name) < 0
+	 || push_buf(name, namesize) < 0
 	 || push_pad(padlen(offset, 4)) < 0
-	 || push_string(target) < 0
+	 || push_buf(target, targetsize) < 0
 	 || push_pad(padlen(offset, 4)) < 0)
 		return -1;
 
@@ -172,9 +174,12 @@ static int cpio_mkgeneric(const char *name, unsigned int mode,
 		       uid_t uid, gid_t gid)
 {
 	int l;
+	unsigned int namesize;
 
 	if (name[0] == '/')
 		name++;
+	namesize = strlen(name) + 1;
+
 	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
@@ -189,12 +194,12 @@ static int cpio_mkgeneric(const char *name, unsigned int mode,
 		1,			/* minor */
 		0,			/* rmajor */
 		0,			/* rminor */
-		(unsigned)strlen(name) + 1,/* namesize */
+		namesize,		/* namesize */
 		0);			/* chksum */
 	offset += l;
 
 	if (l != CPIO_HDR_LEN
-	 || push_rest(name) < 0)
+	 || push_rest(name, namesize) < 0)
 		return -1;
 
 	return 0;
@@ -265,6 +270,7 @@ static int cpio_mknod(const char *name, unsigned int mode,
 		       unsigned int maj, unsigned int min)
 {
 	int l;
+	unsigned int namesize;
 
 	if (dev_type == 'b')
 		mode |= S_IFBLK;
@@ -273,6 +279,8 @@ static int cpio_mknod(const char *name, unsigned int mode,
 
 	if (name[0] == '/')
 		name++;
+	namesize = strlen(name) + 1;
+
 	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
@@ -287,12 +295,12 @@ static int cpio_mknod(const char *name, unsigned int mode,
 		1,			/* minor */
 		maj,			/* rmajor */
 		min,			/* rminor */
-		(unsigned)strlen(name) + 1,/* namesize */
+		namesize,		/* namesize */
 		0);			/* chksum */
 	offset += l;
 
 	if (l != CPIO_HDR_LEN
-	 || push_rest(name) < 0)
+	 || push_rest(name, namesize) < 0)
 		return -1;
 
 	return 0;
@@ -426,7 +434,7 @@ static int cpio_mkfile(const char *name, const char *location,
 		offset += l;
 
 		if (l != CPIO_HDR_LEN
-		 || push_string(name) < 0
+		 || push_buf(name, namesize) < 0
 		 || push_pad(padlen(offset, 4)) < 0)
 			goto error;
 
-- 
2.43.0


