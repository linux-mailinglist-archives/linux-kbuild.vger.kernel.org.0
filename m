Return-Path: <linux-kbuild+bounces-11461-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD0OO5u6oGnClwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11461-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:26:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170C1AFC0F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A26530D2D56
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EC9439000;
	Thu, 26 Feb 2026 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gtY88Zhf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584E352F8E;
	Thu, 26 Feb 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772141044; cv=none; b=FU0vddmWyu+3/cauWY+nlKkSOwG8aaQ4ertgtKZuJPy/SgbshLCFBopc+LGZeInQ/VXa/Slulh4868AifWoWCVEzaYTF+sWZQ+blTr53kocdvgXKKjK9hVBNYA/Ve5sZg1La57EcFx7k5CbVivsSXRzSlYtJPe8iIKk2Zu+bSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772141044; c=relaxed/simple;
	bh=7nhCbx+WxSIG5JM5HldR/pn6Ks+0+YiL2SV34Hb71V4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=avBFygk53jw9H57gu6WSV7+ZIog9A5BLxhOSIpfwq1Vbro/VZFLyqW1YrKa3neFeLzKkNAp3GtJxwZifAJiR5pjO7wJSPGpqC/oKu/WeDNQ2oTTiBlxPMB4GIYyz56a2fg71kvO/1ncNUFTMmYB0BLdSYLZElBidDz00OkDVBlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gtY88Zhf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772141040;
	bh=7nhCbx+WxSIG5JM5HldR/pn6Ks+0+YiL2SV34Hb71V4=;
	h=From:Subject:Date:To:Cc:From;
	b=gtY88Zhf1c8aiotvJlH70tuyuLY/Ogp7n3FD4p7CLyjDf7MENIRzfrME0uFvMiKtp
	 M74F7ELqPLkLzoQLjhHHYlw1KMcT5o6Ve4ecPhOTgmFLna408SfHKXZGQiCQ+2GK/e
	 EZTZ4VD4jwtEFfF8+PBI+0NugGc7k7RlF4wfzGww=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] kbuild: Follow-up to "Reject unexpected values for
 LLVM="
Date: Thu, 26 Feb 2026 22:23:56 +0100
Message-Id: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMz3eyk0sycFN2cnLJc3bT8nJz88tICXdPEFDMjU+M0C9NkCyWg1oK
 i1LTMCrCx0bG1tQBVIDTNZgAAAA==
X-Change-ID: 20260226-kbuild-llvm-followup-5ad6253f85c8
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772141039; l=523;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=7nhCbx+WxSIG5JM5HldR/pn6Ks+0+YiL2SV34Hb71V4=;
 b=3gnlGhkBt8C4AftkLHwcRAgB1Uyr9vEV8IkDayElDp8Hv0SbjrKUV4scML3fjavguFXaJwWxt
 BEr3FFREeJPBD3o74UhnJiabR1HtSkoFkN0A0i26x6iQKwbXLTTYcMi
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11461-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5170C1AFC0F
X-Rspamd-Action: no action

Some cleanups.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      Documentation/llvm: drop note about LLVM=0
      tools/build: Reject unexpected values for LLVM=

 Documentation/kbuild/llvm.rst  | 4 ----
 tools/scripts/Makefile.include | 2 ++
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-kbuild-llvm-followup-5ad6253f85c8

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


