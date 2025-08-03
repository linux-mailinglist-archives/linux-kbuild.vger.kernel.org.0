Return-Path: <linux-kbuild+bounces-8279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA81AB19672
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 23:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2672118852DE
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 21:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFD420F076;
	Sun,  3 Aug 2025 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LX27T5pM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxys8NUV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LX27T5pM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxys8NUV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64EE21C16E
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Aug 2025 21:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256329; cv=none; b=ci3NR9D0KYW9vqsKvWQWOyGmjXpLbivU0UtaopunjtoUbwJvEVKtVYYlHAiZp9eVW/GbC4Q0ZI8mxU80c8x+fvUEyFU3dw+9vpPRaCd7QNfYLulcaNPdSy52NKazryONtedHhMM7YNZ4qMWSbAl0PC8nBMa1Yt8LzqmScddY8pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256329; c=relaxed/simple;
	bh=FHHc09+MwefyAdOunrxen48Da0DXV7ICqHW5n04+Jac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ/VLQRUGrnLITNEa9IH7e65uv/PQhG1TvGbntKb86xWr4YbjFMeuTD229m9GA2IqnkRc4/zUCKwSDb/Iq+UfijKuQZYv8SowYKZORyoeNP0EH1xgscNYeQ3+AUcFLtxJ5WJddc8/fneZWgO46JWILoVtKaR+fJ0oq+7/t9dLQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LX27T5pM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxys8NUV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LX27T5pM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxys8NUV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1A2221BF1;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXwvwjoPCuzjvBpOcWZNQVOnXZuMOJGAaVt6NVyfRa4=;
	b=LX27T5pMA7CyI9/fD437xyKKIWdbo2lhYxGewqatV93XeV/KSD/4Wlu7jfcacLYLZOJ2Ib
	mcKlTtIWxY2jb21vL2Xxq2kbIC5DCsSO2iOaro/FkbBeGzVVHqgjP9UNJnpNSVINGv1/Sw
	5EPdCMqNSm6Ot/5/Tx5oPMqV1tWq63I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXwvwjoPCuzjvBpOcWZNQVOnXZuMOJGAaVt6NVyfRa4=;
	b=jxys8NUVWxCK8lQ39hleRqVNt9zW+AdnzjxUe/OOiHcRzCEusgssX3aa7hgOV+OdfUgA/9
	c+L2Sm6IbdBO03Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXwvwjoPCuzjvBpOcWZNQVOnXZuMOJGAaVt6NVyfRa4=;
	b=LX27T5pMA7CyI9/fD437xyKKIWdbo2lhYxGewqatV93XeV/KSD/4Wlu7jfcacLYLZOJ2Ib
	mcKlTtIWxY2jb21vL2Xxq2kbIC5DCsSO2iOaro/FkbBeGzVVHqgjP9UNJnpNSVINGv1/Sw
	5EPdCMqNSm6Ot/5/Tx5oPMqV1tWq63I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXwvwjoPCuzjvBpOcWZNQVOnXZuMOJGAaVt6NVyfRa4=;
	b=jxys8NUVWxCK8lQ39hleRqVNt9zW+AdnzjxUe/OOiHcRzCEusgssX3aa7hgOV+OdfUgA/9
	c+L2Sm6IbdBO03Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2A57139A2;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gEBpJrvTj2iEQAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Sun, 03 Aug 2025 21:25:15 +0000
From: David Disseldorp <ddiss@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 3/5] gen_init_cpio: attempt copy_file_range for file data
Date: Mon,  4 Aug 2025 07:11:17 +1000
Message-ID: <20250803212457.2286-4-ddiss@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The copy_file_range() syscall can improve copy performance by cloning
extents between cpio archive source and destination files.
Existing read / write based copy logic is retained for fallback in case
the copy_file_range() syscall is unsupported or unavailable due to
cross-filesystem EXDEV, etc.

Clone, as opposed to copy, of source file extents into the output cpio
archive may (e.g. on Btrfs) require alignment of the output to the
filesystem block size. This could be achieved by inserting padding
entries into the cpio archive manifest. In future it may be worth
zero-padding the filename field similar to dracut-cpio[1].

Link: https://github.com/dracutdevs/dracut/commit/300e4b116c624bca1b9e7251708b1ae656fe9157 [1]
Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 usr/gen_init_cpio.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 539b124d75416..c8edb512af215 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdint.h>
@@ -353,6 +354,7 @@ static int cpio_mkfile(const char *name, const char *location,
 	int namesize;
 	unsigned int i;
 	uint32_t csum = 0;
+	ssize_t this_read;
 
 	mode |= S_IFREG;
 
@@ -428,9 +430,17 @@ static int cpio_mkfile(const char *name, const char *location,
 		 || push_pad(padlen(offset, 4)) < 0)
 			goto error;
 
+		if (size) {
+			this_read = copy_file_range(file, NULL, outfd, NULL, size, 0);
+			if (this_read > 0 && this_read <= size) {
+				offset += this_read;
+				size -= this_read;
+			}
+			/* short or failed copy falls back to read/write... */
+		}
+
 		while (size) {
 			unsigned char filebuf[65536];
-			ssize_t this_read;
 			size_t this_size = MIN(size, sizeof(filebuf));
 
 			this_read = read(file, filebuf, this_size);
-- 
2.43.0


