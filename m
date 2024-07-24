Return-Path: <linux-kbuild+bounces-2642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717093B129
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 14:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B4A1C22729
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 12:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C0C158D8B;
	Wed, 24 Jul 2024 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cwwq3pxm";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cwwq3pxm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48D0158D72;
	Wed, 24 Jul 2024 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721825951; cv=none; b=BUZhDPySWkPSQvCO2/MoJNFyq5P3dDKgWhrusjv3cmrITolVNvpm6CeamhlFEHA/WAdIbBHNUMmjo4im4+0QZQcVNQyzFVd88dllCIktJhd9o+R8N++FV0yHuuh2WA3C1lfYip08BHP4kifF/s94Norx/zWZdt2zImpV5594pqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721825951; c=relaxed/simple;
	bh=RJxhyPTeupAYRevfTWFuKvCey2TNQ3Og8kM4E1+I8Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SszRCZmmrgGuqU5f0frbFizG6Ze16bqmGGMlaVJSd2jFiuuK6ROkMe5n81STVDdyr5/SJszvB9ZcLn/TbLcqNivhAkh7OAQ6xX0QZW/cBbezxpd+Ga7b0F0WcDkrgzm02CyZNtS/pam/viXD8oeBg7bwiO/tJ8zRkxy3lU05KTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cwwq3pxm; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cwwq3pxm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A2AB1F7A1;
	Wed, 24 Jul 2024 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721825947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2dN1+BHhncbcVzqlFwx/JUxVMERsakrMIKq5FWzvHq4=;
	b=cwwq3pxmiWKfRUDPXP6KHohWky6YrchPKoqzUNXNxOJmUhudQZIw4ChKGvGZEeDChtPVLR
	1gltru1adjR2rLhvQ+YhBw8ro5FzMgy34tkMPbYrg3tzktvBDNozEBST2thAS4+gStyAAO
	2nCCMkPx60mb9vsaaUd+MM/EvQqa/uA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=cwwq3pxm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721825947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2dN1+BHhncbcVzqlFwx/JUxVMERsakrMIKq5FWzvHq4=;
	b=cwwq3pxmiWKfRUDPXP6KHohWky6YrchPKoqzUNXNxOJmUhudQZIw4ChKGvGZEeDChtPVLR
	1gltru1adjR2rLhvQ+YhBw8ro5FzMgy34tkMPbYrg3tzktvBDNozEBST2thAS4+gStyAAO
	2nCCMkPx60mb9vsaaUd+MM/EvQqa/uA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 610DF1324F;
	Wed, 24 Jul 2024 12:59:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FHsfFpv6oGa2DgAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 24 Jul 2024 12:59:07 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: Fix broken "make binrpm-pkg"
Date: Wed, 24 Jul 2024 14:59:04 +0200
Message-ID: <20240724125904.15601-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9A2AB1F7A1
X-Spam-Score: -2.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]

Due to a typo "make binrpm-pkg" isn't working when using e.g. german
locale. rpmbuild will tell me:

  error: bad date in %changelog: Mi Jul 24 2024 Juergen Gross <jgross@suse.com>

Reason is that setting "LC_ALL=C" must not be followed by a semicolon
in order to affect the following "date" command.

Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 scripts/package/mkspec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ead54d67a024..4dc1466dfc81 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -50,6 +50,6 @@ fi
 cat << EOF
 
 %changelog
-* $(LC_ALL=C; date +'%a %b %d %Y') ${name} <${email}>
+* $(LC_ALL=C date +'%a %b %d %Y') ${name} <${email}>
 - Custom built Linux kernel.
 EOF
-- 
2.43.0


