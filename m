Return-Path: <linux-kbuild+bounces-8280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0375B1966F
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 23:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95094174B4F
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 21:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AF41EDA3A;
	Sun,  3 Aug 2025 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Teyd4Kaz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kuP8wZjX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Teyd4Kaz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kuP8wZjX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B27621B9FD
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Aug 2025 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256330; cv=none; b=TCw+IRMWdjKao1op13ZM6Thxm3/GcdzjEdLddp958zm7VjNLtJAOVKKpoEusaHjG9dGSwaTQHim5e30wopkE4te6vvTfw0WFznnLM7zTM8YIpN+3j0NN9/XURb4lkpG6lPGVVYHWnQAwOf+VsyuS3VJHjP5ws/K396/34Oxdqyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256330; c=relaxed/simple;
	bh=kIJvt+slihJg3GODzjOhvuYx+u+7xwGNoDrxb+dLVOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC3X81+aEJ9QgnlbNBgkoVflJOG8TtkuZa0MMP8YhgJB/ZbgSLLmqjxvUtSE/sRgsQgSppY4I/aW1OQOO5ECMAtEZHkIVrZwNlPLyuz00OdbJ1PqZYAXTQicGW+EON4UHsBrV5DU5ftiojC5Lgoa/6IdZnxioE/yd2o/1V0plkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Teyd4Kaz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kuP8wZjX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Teyd4Kaz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kuP8wZjX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C7391F391;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVq120waNpmoJTXKV8R2YoTtc0Hb8wOI/AHRTYE7syQ=;
	b=Teyd4Kaz654cNCE6otpzKYbaScqBVJlFXR456w16dznE5+H6lYG370B9ylR+7t7/BRCQ/Z
	9WoHjdzdg5vtKo75ORoIkaOlXaltB2tSBbqKbSccx4uRDipfN/82zFm9bPdlLxmb0+brQS
	wa2NNX9xcDFkHIWoRMs6TEeLng+NjH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVq120waNpmoJTXKV8R2YoTtc0Hb8wOI/AHRTYE7syQ=;
	b=kuP8wZjXTE1wQNlIOTwnkaFnPgRBkybzuG9uB2JC59tSWm5FnOaDgm8gan5bhWupT9CF4i
	HxlwXdd8GR68FLDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVq120waNpmoJTXKV8R2YoTtc0Hb8wOI/AHRTYE7syQ=;
	b=Teyd4Kaz654cNCE6otpzKYbaScqBVJlFXR456w16dznE5+H6lYG370B9ylR+7t7/BRCQ/Z
	9WoHjdzdg5vtKo75ORoIkaOlXaltB2tSBbqKbSccx4uRDipfN/82zFm9bPdlLxmb0+brQS
	wa2NNX9xcDFkHIWoRMs6TEeLng+NjH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVq120waNpmoJTXKV8R2YoTtc0Hb8wOI/AHRTYE7syQ=;
	b=kuP8wZjXTE1wQNlIOTwnkaFnPgRBkybzuG9uB2JC59tSWm5FnOaDgm8gan5bhWupT9CF4i
	HxlwXdd8GR68FLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DD63133D1;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KCd1HbvTj2iEQAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Sun, 03 Aug 2025 21:25:15 +0000
From: David Disseldorp <ddiss@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 2/5] gen_init_cpio: support -o <output_path> parameter
Date: Mon,  4 Aug 2025 07:11:16 +1000
Message-ID: <20250803212457.2286-3-ddiss@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

This is another preparatory change to allow for reflink-optimized
cpio archives with file data written / cloned via copy_file_range().
The output file is truncated prior to write, so that it maps to
usr/gen_initramfs.sh usage. It may make sense to offer an append option
in future, for easier archive concatenation.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 usr/gen_init_cpio.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 013f5668f33a8..539b124d75416 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -110,7 +110,7 @@ static int cpio_trailer(void)
 	 || push_pad(padlen(offset, 512)) < 0)
 		return -1;
 
-	return 0;
+	return fsync(outfd);
 }
 
 static int cpio_mkslink(const char *name, const char *target,
@@ -532,7 +532,7 @@ static int cpio_mkfile_line(const char *line)
 static void usage(const char *prog)
 {
 	fprintf(stderr, "Usage:\n"
-		"\t%s [-t <timestamp>] [-c] <cpio_list>\n"
+		"\t%s [-t <timestamp>] [-c] [-o <output_path>] <cpio_list>\n"
 		"\n"
 		"<cpio_list> is a file containing newline separated entries that\n"
 		"describe the files to be included in the initramfs archive:\n"
@@ -569,7 +569,8 @@ static void usage(const char *prog)
 		"as mtime for symlinks, directories, regular and special files.\n"
 		"The default is to use the current time for all files, but\n"
 		"preserve modification time for regular files.\n"
-		"-c: calculate and store 32-bit checksums for file data.\n",
+		"-c: calculate and store 32-bit checksums for file data.\n"
+		"<output_path>: write cpio to this file instead of stdout\n",
 		prog);
 }
 
@@ -611,7 +612,7 @@ int main (int argc, char *argv[])
 
 	default_mtime = time(NULL);
 	while (1) {
-		int opt = getopt(argc, argv, "t:ch");
+		int opt = getopt(argc, argv, "t:cho:");
 		char *invalid;
 
 		if (opt == -1)
@@ -630,6 +631,16 @@ int main (int argc, char *argv[])
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


