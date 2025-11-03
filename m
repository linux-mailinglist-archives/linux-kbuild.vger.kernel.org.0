Return-Path: <linux-kbuild+bounces-9369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2EC2B94D
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 13:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 368334E05AD
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 12:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2B03093B8;
	Mon,  3 Nov 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ceNFHkBB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nB4LWXgE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ceNFHkBB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nB4LWXgE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05417083C
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172064; cv=none; b=ZHq9QFV7Nu7U9hNH4qAb6R9KM2ohpr0GMxpIfr0Z/7VvIou32EF27HaV0lgLpFwGPs5DV/l2NvGT4/avZgIQpk2kmSrUm5kg6bOz0PLv6bPxUYnFr3KeRXBBWRWT4w1t2M0Y2goaUYlL9OUVz25K0DD6ooaY+4PmTsC6/HvwMOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172064; c=relaxed/simple;
	bh=cKkMQvevQdOhaPRvM0MWUATjc8/anyMaXYdK1/2q2Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hgolzvzIpkSGMpbRHybEylEhJTU/3gUCwJlu7yVon8y/UkFNi1ce1kTfcwi3jvLorFE3mxRR22v78dyEOYwjZWVpL6nlqARgpLNgaK8Rc3NqMi3K9pAqrictxSvrnFfLrzKCt+HWOJPUv6Wkbttq0p0QLVdHnuIKiBhu088c3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ceNFHkBB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nB4LWXgE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ceNFHkBB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nB4LWXgE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F40B421C53;
	Mon,  3 Nov 2025 12:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762172061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lsBqLrWGBcsjzB8SKguNf1OVfqKhPz+trH3CmFSrnWI=;
	b=ceNFHkBBsb6JTtiueXdMG885nLekK7zBXOJE2WFnLsLRZaRp1nvektXgVDaYMHj2YLhn0U
	JogEJZD9B1X98PgcaGJrhsK8bL/320/eGezZ3RC5y2OuUOSjoHFT/cUStnCtc3MybfzA1W
	iWkebxVgVwixxy0Rv6ZZqfNGzv7wers=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762172061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lsBqLrWGBcsjzB8SKguNf1OVfqKhPz+trH3CmFSrnWI=;
	b=nB4LWXgEmdIqhsJZ36YyLzBsamw0MTUNJ6/bmtkNgdcfODe5y9QXNSZNS/ZLMSCAZWNT+W
	VJriS8iz3qhJ5ZBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ceNFHkBB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nB4LWXgE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762172061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lsBqLrWGBcsjzB8SKguNf1OVfqKhPz+trH3CmFSrnWI=;
	b=ceNFHkBBsb6JTtiueXdMG885nLekK7zBXOJE2WFnLsLRZaRp1nvektXgVDaYMHj2YLhn0U
	JogEJZD9B1X98PgcaGJrhsK8bL/320/eGezZ3RC5y2OuUOSjoHFT/cUStnCtc3MybfzA1W
	iWkebxVgVwixxy0Rv6ZZqfNGzv7wers=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762172061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lsBqLrWGBcsjzB8SKguNf1OVfqKhPz+trH3CmFSrnWI=;
	b=nB4LWXgEmdIqhsJZ36YyLzBsamw0MTUNJ6/bmtkNgdcfODe5y9QXNSZNS/ZLMSCAZWNT+W
	VJriS8iz3qhJ5ZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD74A1364F;
	Mon,  3 Nov 2025 12:14:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LHI9LJycCGm4TwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 03 Nov 2025 12:14:20 +0000
Date: Mon, 3 Nov 2025 13:14:19 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: [PATCH] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251103131419.5e504ae2@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F40B421C53
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 

It is possible to force a specific version of python to be used when
building the kernel by passing PYTHON3= on the make command line.
However kernel-doc.py is currently called with python3 hard-coded and
thus ignores this setting.

Use PYTHON3 to call kernel-doc.py so that the desired version of
python is used.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.17.orig/Makefile
+++ linux-6.17/Makefile
@@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
 
 # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
 # has a logic to call it
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+KERNELDOC       = $(PYTHON3) $(srctree)/scripts/kernel-doc.py
 export KERNELDOC
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \


-- 
Jean Delvare
SUSE L3 Support

