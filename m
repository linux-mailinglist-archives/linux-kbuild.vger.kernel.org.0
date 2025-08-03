Return-Path: <linux-kbuild+bounces-8277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81FB1966C
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 23:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EAB174ACF
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 21:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A727E20F063;
	Sun,  3 Aug 2025 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e8o3bx0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ACmQptgu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e8o3bx0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ACmQptgu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF22CCC0
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Aug 2025 21:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256323; cv=none; b=QB6dC/TyRg6L1XpaYZs+OeRmiu5Xvd74lRlpFZemVyUqQyhp9OI2gyHjzxCzbeJN15gcRFkThd3GMs+pYzJ2/lOAet3FKfKCDb5BADBQDXPUpKGmfBS50gQfEYbbKUbEjz42mhvfk5KM/z+CKnNdbfem4M1lbyHPBpk/m2i2nG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256323; c=relaxed/simple;
	bh=73ghhIO8IN6/4qn1xOaPA4AmJCZ9JK4SM8IuQyTAEB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9YhX+E8c9CvfnoHf588O8okYHpj6vsDs1o/myfB4fLzvZbFgCtn6UytEubjaQTlFfpXXp/Sui2wugaR0e523SX6EkSn5BmjPMs8h7nrQEnMd1xv++rtjJzReWkKWAEzLwDjEf6FTQ+8febnJJhuDElVN11gZarZH+VkX/OJMGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e8o3bx0Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ACmQptgu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e8o3bx0Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ACmQptgu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 276B321BF0;
	Sun,  3 Aug 2025 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gr5aZv9DLzEmG30v3xEwDzcmj1CgrYahDGAo9ULHUf8=;
	b=e8o3bx0YQ6rlOIYThpwNw+XTvUKJmIWywp4skFj4QfZRWg2ANgBepbB1QLSziAmisk267t
	pyPUORDR+XIQTeKwIFvlzuo5/Id/VbPYLCHKuMINOMApAzMQnQc94rhD34mUxTBQHtYn5o
	4sLwvLddVdjJe5zBO53pU7hMkh52Rdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gr5aZv9DLzEmG30v3xEwDzcmj1CgrYahDGAo9ULHUf8=;
	b=ACmQptguCeXFufRh2FN9jWLBgB92hnupmZzSJdZOvSk4hPiJ5srxPRpu+c9mtJ70DoXbHu
	NgNvWyarBrOygkBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e8o3bx0Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ACmQptgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gr5aZv9DLzEmG30v3xEwDzcmj1CgrYahDGAo9ULHUf8=;
	b=e8o3bx0YQ6rlOIYThpwNw+XTvUKJmIWywp4skFj4QfZRWg2ANgBepbB1QLSziAmisk267t
	pyPUORDR+XIQTeKwIFvlzuo5/Id/VbPYLCHKuMINOMApAzMQnQc94rhD34mUxTBQHtYn5o
	4sLwvLddVdjJe5zBO53pU7hMkh52Rdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gr5aZv9DLzEmG30v3xEwDzcmj1CgrYahDGAo9ULHUf8=;
	b=ACmQptguCeXFufRh2FN9jWLBgB92hnupmZzSJdZOvSk4hPiJ5srxPRpu+c9mtJ70DoXbHu
	NgNvWyarBrOygkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08BFA133D1;
	Sun,  3 Aug 2025 21:25:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iPDqALnTj2iEQAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Sun, 03 Aug 2025 21:25:13 +0000
From: David Disseldorp <ddiss@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 1/5] gen_init_cpio: write to fd instead of stdout stream
Date: Mon,  4 Aug 2025 07:11:15 +1000
Message-ID: <20250803212457.2286-2-ddiss@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 276B321BF0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

In preparation for more efficient archiving using copy_file_range(),
switch from writing archive data to stdout to using STDOUT_FILENO and
I/O via write(), dprintf(), etc.
Basic I/O error handling is added to cover cases such as ENOSPC. Partial
writes are treated as errors.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 usr/gen_init_cpio.c | 139 ++++++++++++++++++++++++++------------------
 1 file changed, 81 insertions(+), 58 deletions(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index edcdb8abfa31c..013f5668f33a8 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -23,64 +23,71 @@
 #define xstr(s) #s
 #define str(s) xstr(s)
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
+#define CPIO_HDR_LEN 110
+#define padlen(_off, _align) (((_align) - ((_off) & ((_align) - 1))) % (_align))
 
+static char padding[512];
 static unsigned int offset;
 static unsigned int ino = 721;
 static time_t default_mtime;
 static bool do_file_mtime;
 static bool do_csum = false;
+static int outfd = STDOUT_FILENO;
 
 struct file_handler {
 	const char *type;
 	int (*handler)(const char *line);
 };
 
-static void push_string(const char *name)
+static int push_string(const char *name)
 {
 	unsigned int name_len = strlen(name) + 1;
+	ssize_t l;
+
+	l = write(outfd, name, name_len);
+	if (l != name_len)
+		return -1;
 
-	fputs(name, stdout);
-	putchar(0);
 	offset += name_len;
+	return 0;
 }
 
-static void push_pad (void)
+static int push_pad(size_t padlen)
 {
-	while (offset & 3) {
-		putchar(0);
-		offset++;
-	}
+	ssize_t l = 0;
+
+	if (!padlen)
+		return 0;
+
+	if (padlen < sizeof(padding))
+		l = write(outfd, padding, padlen);
+	if (l != padlen)
+		return -1;
+
+	offset += padlen;
+	return 0;
 }
 
-static void push_rest(const char *name)
+static int push_rest(const char *name)
 {
 	unsigned int name_len = strlen(name) + 1;
-	unsigned int tmp_ofs;
+	ssize_t l;
 
-	fputs(name, stdout);
-	putchar(0);
-	offset += name_len;
+	l = write(outfd, name, name_len);
+	if (l != name_len)
+		return -1;
 
-	tmp_ofs = name_len + 110;
-	while (tmp_ofs & 3) {
-		putchar(0);
-		offset++;
-		tmp_ofs++;
-	}
-}
+	offset += name_len;
 
-static void push_hdr(const char *s)
-{
-	fputs(s, stdout);
-	offset += 110;
+	return push_pad(padlen(name_len + CPIO_HDR_LEN, 4));
 }
 
-static void cpio_trailer(void)
+static int cpio_trailer(void)
 {
-	char s[256];
 	const char name[] = "TRAILER!!!";
+	int l;
 
-	sprintf(s, "%s%08X%08X%08lX%08lX%08X%08lX"
+	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
 		0,			/* ino */
@@ -96,23 +103,24 @@ static void cpio_trailer(void)
 		0,			/* rminor */
 		(unsigned)strlen(name)+1, /* namesize */
 		0);			/* chksum */
-	push_hdr(s);
-	push_rest(name);
+	offset += l;
 
-	while (offset % 512) {
-		putchar(0);
-		offset++;
-	}
+	if (l != CPIO_HDR_LEN
+	 || push_rest(name) < 0
+	 || push_pad(padlen(offset, 512)) < 0)
+		return -1;
+
+	return 0;
 }
 
 static int cpio_mkslink(const char *name, const char *target,
 			 unsigned int mode, uid_t uid, gid_t gid)
 {
-	char s[256];
+	int l;
 
 	if (name[0] == '/')
 		name++;
-	sprintf(s,"%s%08X%08X%08lX%08lX%08X%08lX"
+	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
 		ino++,			/* ino */
@@ -128,12 +136,17 @@ static int cpio_mkslink(const char *name, const char *target,
 		0,			/* rminor */
 		(unsigned)strlen(name) + 1,/* namesize */
 		0);			/* chksum */
-	push_hdr(s);
-	push_string(name);
-	push_pad();
-	push_string(target);
-	push_pad();
+	offset += l;
+
+	if (l != CPIO_HDR_LEN
+	 || push_string(name) < 0
+	 || push_pad(padlen(offset, 4)) < 0
+	 || push_string(target) < 0
+	 || push_pad(padlen(offset, 4)) < 0)
+		return -1;
+
 	return 0;
+
 }
 
 static int cpio_mkslink_line(const char *line)
@@ -157,11 +170,11 @@ static int cpio_mkslink_line(const char *line)
 static int cpio_mkgeneric(const char *name, unsigned int mode,
 		       uid_t uid, gid_t gid)
 {
-	char s[256];
+	int l;
 
 	if (name[0] == '/')
 		name++;
-	sprintf(s,"%s%08X%08X%08lX%08lX%08X%08lX"
+	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
 		ino++,			/* ino */
@@ -177,8 +190,12 @@ static int cpio_mkgeneric(const char *name, unsigned int mode,
 		0,			/* rminor */
 		(unsigned)strlen(name) + 1,/* namesize */
 		0);			/* chksum */
-	push_hdr(s);
-	push_rest(name);
+	offset += l;
+
+	if (l != CPIO_HDR_LEN
+	 || push_rest(name) < 0)
+		return -1;
+
 	return 0;
 }
 
@@ -246,7 +263,7 @@ static int cpio_mknod(const char *name, unsigned int mode,
 		       uid_t uid, gid_t gid, char dev_type,
 		       unsigned int maj, unsigned int min)
 {
-	char s[256];
+	int l;
 
 	if (dev_type == 'b')
 		mode |= S_IFBLK;
@@ -255,7 +272,7 @@ static int cpio_mknod(const char *name, unsigned int mode,
 
 	if (name[0] == '/')
 		name++;
-	sprintf(s,"%s%08X%08X%08lX%08lX%08X%08lX"
+	l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 	       "%08X%08X%08X%08X%08X%08X%08X",
 		do_csum ? "070702" : "070701", /* magic */
 		ino++,			/* ino */
@@ -271,8 +288,12 @@ static int cpio_mknod(const char *name, unsigned int mode,
 		min,			/* rminor */
 		(unsigned)strlen(name) + 1,/* namesize */
 		0);			/* chksum */
-	push_hdr(s);
-	push_rest(name);
+	offset += l;
+
+	if (l != CPIO_HDR_LEN
+	 || push_rest(name) < 0)
+		return -1;
+
 	return 0;
 }
 
@@ -324,11 +345,9 @@ static int cpio_mkfile(const char *name, const char *location,
 			unsigned int mode, uid_t uid, gid_t gid,
 			unsigned int nlinks)
 {
-	char s[256];
 	struct stat buf;
 	unsigned long size;
-	int file;
-	int retval;
+	int file, retval, l;
 	int rc = -1;
 	time_t mtime;
 	int namesize;
@@ -386,7 +405,7 @@ static int cpio_mkfile(const char *name, const char *location,
 		if (name[0] == '/')
 			name++;
 		namesize = strlen(name) + 1;
-		sprintf(s,"%s%08X%08X%08lX%08lX%08X%08lX"
+		l = dprintf(outfd, "%s%08X%08X%08lX%08lX%08X%08lX"
 		       "%08lX%08X%08X%08X%08X%08X%08X",
 			do_csum ? "070702" : "070701", /* magic */
 			ino,			/* ino */
@@ -402,9 +421,12 @@ static int cpio_mkfile(const char *name, const char *location,
 			0,			/* rminor */
 			namesize,		/* namesize */
 			size ? csum : 0);	/* chksum */
-		push_hdr(s);
-		push_string(name);
-		push_pad();
+		offset += l;
+
+		if (l != CPIO_HDR_LEN
+		 || push_string(name) < 0
+		 || push_pad(padlen(offset, 4)) < 0)
+			goto error;
 
 		while (size) {
 			unsigned char filebuf[65536];
@@ -417,14 +439,15 @@ static int cpio_mkfile(const char *name, const char *location,
 				goto error;
 			}
 
-			if (fwrite(filebuf, this_read, 1, stdout) != 1) {
+			if (write(outfd, filebuf, this_read) != this_read) {
 				fprintf(stderr, "writing filebuf failed\n");
 				goto error;
 			}
 			offset += this_read;
 			size -= this_read;
 		}
-		push_pad();
+		if (push_pad(padlen(offset, 4)) < 0)
+			goto error;
 
 		name += namesize;
 	}
@@ -691,7 +714,7 @@ int main (int argc, char *argv[])
 		}
 	}
 	if (ec == 0)
-		cpio_trailer();
+		ec = cpio_trailer();
 
 	exit(ec);
 }
-- 
2.43.0


