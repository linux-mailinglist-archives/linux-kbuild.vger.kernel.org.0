Return-Path: <linux-kbuild+bounces-8282-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56CB19671
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 23:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 374553B7217
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 21:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DB521B9FD;
	Sun,  3 Aug 2025 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="09A4sNP4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ktipS1+m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="09A4sNP4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ktipS1+m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2661F55FA
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Aug 2025 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256336; cv=none; b=ivRfPa05XswcMmK3psLxJBrLwt/ihnOmU2K5/kSYAXWDqCJLguYHeRbMmZ0+9XKRoUNA3ENufpSSqufdBcsYjpu/ZECizx6KbZmSsxf1VRbxbdfUzxIJT/+Q03HWdABumozmNiO1jeMsPSKDQVwJM0tqk/+9+bKCGcKSFNpjP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256336; c=relaxed/simple;
	bh=pZ/gOI0k4sDj/lLAzb/QoiEwC4zgMq88cnBUTJoxozQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OH06U6gVWXQdAvGBm7iJX0pKlaRFzrPEbTBH+NDyt9M9PA9qaw6SVQSCee878PTNrjblApqI+dzz6/RIAbiIg9TqSWuwTplKTGsXzDXMnEnoEN1QUAPTILVEVr5EBu2klll5KG2z+HgMnWTWo/Mkzhobz25ziQ1jIN6+YACVxe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=09A4sNP4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ktipS1+m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=09A4sNP4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ktipS1+m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 197B61F397;
	Sun,  3 Aug 2025 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnh4KOoFyfui8L9tod3Xuqssl1j5kS74I0ySiKi//IU=;
	b=09A4sNP4FrfBUl6v1M+ZxrV2CBR4N/tYj0b0Tq7w1J7V6UWgu4V7RGDFUHDRMGAaWbj72H
	+/taliO96UmYLyzqyvbcOmYOQBrCtqKsHx9dnwHTz9h0AzEluNhkwASjN7gspcVQ6FGAoW
	dxg17v+O9eceEo+8/YphLY7imUB9buE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnh4KOoFyfui8L9tod3Xuqssl1j5kS74I0ySiKi//IU=;
	b=ktipS1+mZDNJDmxVZIUHEUf08XF6C7sfRnpuBVSeYBLat1m7OEqtFDFL2SZbuBnOGAoddx
	d6dcP5xIJxfkUCCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=09A4sNP4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ktipS1+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnh4KOoFyfui8L9tod3Xuqssl1j5kS74I0ySiKi//IU=;
	b=09A4sNP4FrfBUl6v1M+ZxrV2CBR4N/tYj0b0Tq7w1J7V6UWgu4V7RGDFUHDRMGAaWbj72H
	+/taliO96UmYLyzqyvbcOmYOQBrCtqKsHx9dnwHTz9h0AzEluNhkwASjN7gspcVQ6FGAoW
	dxg17v+O9eceEo+8/YphLY7imUB9buE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnh4KOoFyfui8L9tod3Xuqssl1j5kS74I0ySiKi//IU=;
	b=ktipS1+mZDNJDmxVZIUHEUf08XF6C7sfRnpuBVSeYBLat1m7OEqtFDFL2SZbuBnOGAoddx
	d6dcP5xIJxfkUCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBDCD139A2;
	Sun,  3 Aug 2025 21:25:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kMhVOLvTj2iEQAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Sun, 03 Aug 2025 21:25:15 +0000
From: David Disseldorp <ddiss@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 5/5] gen_initramfs.sh: use gen_init_cpio -o parameter
Date: Mon,  4 Aug 2025 07:11:19 +1000
Message-ID: <20250803212457.2286-6-ddiss@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 197B61F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

gen_init_cpio can now write to a file directly, so use it when
gen_initramfs.sh is called with -o (e.g. usr/Makefile invocation).

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 usr/gen_initramfs.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 14b5782f961a8..7eba2fddf0ef2 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -193,7 +193,8 @@ root_gid=0
 dep_list=
 timestamp=
 cpio_list=$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)
-output="/dev/stdout"
+# gen_init_cpio writes to stdout by default
+output=""
 
 trap "rm -f $cpio_list" EXIT
 
@@ -207,7 +208,7 @@ while [ $# -gt 0 ]; do
 			shift
 			;;
 		"-o")	# generate cpio image named $1
-			output="$1"
+			output="-o $1"
 			shift
 			;;
 		"-u")	# map $1 to uid=0 (root)
@@ -246,4 +247,4 @@ done
 
 # If output_file is set we will generate cpio archive
 # we are careful to delete tmp files
-usr/gen_init_cpio $timestamp $cpio_list > $output
+usr/gen_init_cpio $output $timestamp $cpio_list
-- 
2.43.0


