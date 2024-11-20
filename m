Return-Path: <linux-kbuild+bounces-4756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 958929D4306
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BF4EB2520B
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 20:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40911B0105;
	Wed, 20 Nov 2024 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dPoSXrYI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="unhRWPNv";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dPoSXrYI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="unhRWPNv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B771145B18;
	Wed, 20 Nov 2024 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732134412; cv=none; b=eVwmDte1Xp40q4Ago5xBpsGnVr/gE+Jgwd7/8RA7x8jZMLoaYR9Nzv6ADDmxg0pCcBEHYmwIiN+9oH4sjiKZ5i13p/PkX3IYn7mVzYWCYpxd+i5R7VW4N5uSv4kaFIl2xCteyKo8nnXgoJ1ZvZeCg8A6GMlYv/BCRd66owvG40U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732134412; c=relaxed/simple;
	bh=tjssbdR3Q74xEHjxG6bARxfye4U8htp7tS0uw3JI8hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9FAL0s336Sf3KMTjVLEiCElspO2GFrC88n5fL8K5fCRAAhhV0Y+gcuB4yQ1n2vn65+5JzfUDiyC8WeS6wzcibbIc9Lg2Plc4qq3AIvnwMniW6bPQCq4/5yL7AFfDoULSDl6DJxAfuFEP8xUlB0YAjEqAngdiCQY/6XLB3Mk1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dPoSXrYI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=unhRWPNv; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dPoSXrYI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=unhRWPNv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90F2C219CB;
	Wed, 20 Nov 2024 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732134408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lWKxn6YYrH8ADhYXO5pSCPxJ57gaDH6AnkCltdC0Tio=;
	b=dPoSXrYIQxAzq7XQRISRF9ZA4FWRVGH7MoTDkFoFSe7O9uCDUb60H3gI7LdbSIgD7cDLUy
	7kSJi2jArLkaeGQkkoReKwNQVq3ZQFARfuLCzbkJ326/FH1ZpQt4z5IKyxJxbDgZdxwxGr
	Jp/yQF0J5J3S0Pycq3LT3+T6WmotBxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732134408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lWKxn6YYrH8ADhYXO5pSCPxJ57gaDH6AnkCltdC0Tio=;
	b=unhRWPNvi1PqYkt5DLnoWOmv5AeH/YnepygTQAcpj1KhmslLjYhVh4NAEDUZl1ag3HJZc3
	Ew/Jo1avWSja1XAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=dPoSXrYI;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=unhRWPNv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732134408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lWKxn6YYrH8ADhYXO5pSCPxJ57gaDH6AnkCltdC0Tio=;
	b=dPoSXrYIQxAzq7XQRISRF9ZA4FWRVGH7MoTDkFoFSe7O9uCDUb60H3gI7LdbSIgD7cDLUy
	7kSJi2jArLkaeGQkkoReKwNQVq3ZQFARfuLCzbkJ326/FH1ZpQt4z5IKyxJxbDgZdxwxGr
	Jp/yQF0J5J3S0Pycq3LT3+T6WmotBxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732134408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lWKxn6YYrH8ADhYXO5pSCPxJ57gaDH6AnkCltdC0Tio=;
	b=unhRWPNvi1PqYkt5DLnoWOmv5AeH/YnepygTQAcpj1KhmslLjYhVh4NAEDUZl1ag3HJZc3
	Ew/Jo1avWSja1XAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F18BE137CF;
	Wed, 20 Nov 2024 20:26:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z/NkOAdGPmfIFwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:26:47 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 1/2] init/Kconfig: add python3 availability check
Date: Wed, 20 Nov 2024 21:26:39 +0100
Message-ID: <20241120202640.49703-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 90F2C219CB
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,linaro.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

It will be used in the next commit for DRM_MSM.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
The same as in v2.

 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index fbd0cb06a50a..2561eaebd1d3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -262,6 +262,9 @@ config HAVE_KERNEL_ZSTD
 config HAVE_KERNEL_UNCOMPRESSED
 	bool
 
+config HAVE_PYTHON3
+	def_bool $(success,$(PYTHON3) -V)
+
 choice
 	prompt "Kernel compression mode"
 	default KERNEL_GZIP
-- 
2.45.2


