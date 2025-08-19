Return-Path: <linux-kbuild+bounces-8528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F3B2B804
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 05:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02A73BEF11
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 03:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689E626B0B3;
	Tue, 19 Aug 2025 03:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cs7oUNmJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RzOLnld6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GLmX3MXi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BAQBTJer"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E51E0DE8
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Aug 2025 03:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575435; cv=none; b=SKEhbVP3JtnHonRxFVBExapmdGcVaJ5Rb9+HdEXUZw+cH5G8LYmtt8ElwCAWtevOtHpoQISszNBQHGLjoBZif0Sa0s5kvdSLNAQ+G3mFfmmm3tcb2WjGwAZ/T2KNKuJuJOvLP4yqEJHrn79+mh51U38O7brmQop5m2IHKdJfsgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575435; c=relaxed/simple;
	bh=hXoB7GmVZpn4tMp37B23utkqv43799NuXOGFPP9u6nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulyJqsyTYfDQauVm1qDJSI0iHE/fHnv9pXlxfMW2fBKZSNpds9ru+U6uXdtvtQn3pTHZlKY4Ax6L8fCHtRnjVDQo20YZile/cnL9uEj9LLwHUv7dOoz3ZSJddrr3+CPajT9YVmoBEkQV14httCJ2vLTmpEVN5hdLYlnND1IWGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cs7oUNmJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RzOLnld6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GLmX3MXi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BAQBTJer; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDE5C1F74B;
	Tue, 19 Aug 2025 03:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755575403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1MnjWRU7mEh3MvUfwYg4+nchvMUDQhi2ouK8qmvnrI=;
	b=Cs7oUNmJOCkavCsBO+7WHHpJeRDOMbUINl8eGFdZCrUdfpYzXC6XSvSdhCsU3ATY9fdCM1
	yYVdSiFytmiyYCk1mE8L8kM9BZkNYYkgqc5Rop20MqxGxyiGXvcJkatw4NlyXcvZf6UN3B
	aIDlbE8KhAv4Pqt9wwPz74u4c+wO1Oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755575403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1MnjWRU7mEh3MvUfwYg4+nchvMUDQhi2ouK8qmvnrI=;
	b=RzOLnld6zrQprwkNX0U06JpmFHA/j44zak1IDL5qr0TDPkPsSy3t+4F92JZU8rLFsHyes3
	kKMhC+DPVHCEAnAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GLmX3MXi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BAQBTJer
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755575402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1MnjWRU7mEh3MvUfwYg4+nchvMUDQhi2ouK8qmvnrI=;
	b=GLmX3MXiWormiOg8EcbZfQjggS1cBoIINwZ3Pu6iMClTO7CqF6KmmFFHtth/BZtK+7y1kS
	eA0dtrUsmdToDHEdxz4EA4xYEdsdu1o3QX6u9qPkJcMK6zycz9WhXSinkVuSDtF4r/8Uti
	vUv8exXI04hcFuitVSGLYM4QxiKYTYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755575402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1MnjWRU7mEh3MvUfwYg4+nchvMUDQhi2ouK8qmvnrI=;
	b=BAQBTJerLrn8JWlsb0QZLdQMfFUdt/rWuYXn9khKJ9SX3RvOscsCRgJLdfzOVZdBOWYsrr
	nFdT442XbzSRg1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0DF513686;
	Tue, 19 Aug 2025 03:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CECcJWj0o2gJawAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 19 Aug 2025 03:50:00 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: linux-next@vger.kernel.org,
	ddiss@suse.de,
	nsc@kernel.org
Subject: [PATCH v3 2/8] gen_init_cpio: support -o <output_file> parameter
Date: Tue, 19 Aug 2025 13:05:45 +1000
Message-ID: <20250819032607.28727-3-ddiss@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819032607.28727-1-ddiss@suse.de>
References: <20250819032607.28727-1-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: EDE5C1F74B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This is another preparatory change to allow for reflink-optimized
cpio archives with file data written / cloned via copy_file_range().
The output file is truncated prior to write, so that it maps to
usr/gen_initramfs.sh usage. It may make sense to offer an append option
in future, for easier archive concatenation.

Signed-off-by: David Disseldorp <ddiss@suse.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 usr/gen_init_cpio.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 235bfc574e6b1..ea4b9b5fed014 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdint.h>
@@ -110,7 +111,7 @@ static int cpio_trailer(void)
 	    push_pad(padlen(offset, 512)) < 0)
 		return -1;
 
-	return 0;
+	return fsync(outfd);
 }
 
 static int cpio_mkslink(const char *name, const char *target,
@@ -532,7 +533,7 @@ static int cpio_mkfile_line(const char *line)
 static void usage(const char *prog)
 {
 	fprintf(stderr, "Usage:\n"
-		"\t%s [-t <timestamp>] [-c] <cpio_list>\n"
+		"\t%s [-t <timestamp>] [-c] [-o <output_file>] <cpio_list>\n"
 		"\n"
 		"<cpio_list> is a file containing newline separated entries that\n"
 		"describe the files to be included in the initramfs archive:\n"
@@ -569,7 +570,8 @@ static void usage(const char *prog)
 		"as mtime for symlinks, directories, regular and special files.\n"
 		"The default is to use the current time for all files, but\n"
 		"preserve modification time for regular files.\n"
-		"-c: calculate and store 32-bit checksums for file data.\n",
+		"-c: calculate and store 32-bit checksums for file data.\n"
+		"<output_file>: write cpio to this file instead of stdout\n",
 		prog);
 }
 
@@ -611,7 +613,7 @@ int main (int argc, char *argv[])
 
 	default_mtime = time(NULL);
 	while (1) {
-		int opt = getopt(argc, argv, "t:ch");
+		int opt = getopt(argc, argv, "t:cho:");
 		char *invalid;
 
 		if (opt == -1)
@@ -630,6 +632,16 @@ int main (int argc, char *argv[])
 		case 'c':
 			do_csum = true;
 			break;
+		case 'o':
+			outfd = open(optarg,
+				     O_WRONLY | O_CREAT | O_LARGEFILE | O_TRUNC,
+				     0600);
+			if (outfd < 0) {
+				fprintf(stderr, "failed to open %s\n", optarg);
+				usage(argv[0]);
+				exit(1);
+			}
+			break;
 		case 'h':
 		case '?':
 			usage(argv[0]);
-- 
2.43.0


