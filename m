Return-Path: <linux-kbuild+bounces-11709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOHDMsPvrmkWKQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11709-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:05:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69623C67D
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EB0C3092D48
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 15:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED233E0C5A;
	Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AXcToXOu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AE3DA7FD;
	Mon,  9 Mar 2026 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071899; cv=none; b=VC2VUXuGm5a5dhXti2QDGzzGnjF41kZnJDu5JTd8Ev4GFsqYuf8Nyz0+2gs5iNVd06OJzy/Aw16ZRLWINNjiYPTUyhTh+dwId7zEdBYyXrNqn9ixDumaiyFSpKrO1ROzT2kixb9VXRCp8/pZzcd/gh2Tfw4cXLQbieRm4QItKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071899; c=relaxed/simple;
	bh=U+5smVL/wbYmKd9t1E5k7w/AHjE+U7oHani9WoutarY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IEQ1077zZAK9iA4wk+dxFM6ewHoX3b1QxY+B454y0/4GKtt26MCKDE54ePIjeTGrPS1sIoq8o382Rbub2EdOnxdBanolDZVb56jEw9en5vzkHSxq9JwlaEX1Jdowu5LcRBOk+cHxAhqd7x6leA7YTaANQhAgCZqUpEtbHG63vSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AXcToXOu; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773071894;
	bh=U+5smVL/wbYmKd9t1E5k7w/AHjE+U7oHani9WoutarY=;
	h=From:Date:Subject:To:Cc:From;
	b=AXcToXOu9A7lCngPqjBEcdKfk3qH20nGxwnqdeccZU0BYRqlyZNoVFvsbD6HMs9S3
	 ynf/SbgDXpFFbKB3AfqQly1XAHSoYiLgFp/2fg6GAFkid6rU36op4BFNJs1r3is78/
	 i6OMEoanC5HafGFeULlnsOZtAYsTd+p1rsF97IOk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 09 Mar 2026 16:58:11 +0100
Subject: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMj3dLEgkzdxOLi1NyknEpdg6QkcyND4yQTwzRDJaCegqLUtMwKsHn
 RsbW1ANrPph5fAAAA
X-Change-ID: 20260302-uapi-assembly-0bb7213b41f1
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Nick Huang <sef1548@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773071894; l=1831;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=U+5smVL/wbYmKd9t1E5k7w/AHjE+U7oHani9WoutarY=;
 b=RisQhd4P8Zxn/1OzLNbDuXV43bksvz56GYITP5nh4iWVpX6gDmUANgcV+PM4BZos1tSzlGxJA
 /xTSfLfW68LDSnS+SSZwXt8neZgWX7b+DX+/za3j0mCANQJig946PJi
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 3C69623C67D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[orcam.me.uk,gmail.com,vger.kernel.org,weissschuh.net];
	TAGGED_FROM(0.00)[bounces-11709-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

There is an ongoing effort to replace the usage of __ASSEMBLER__ with
__ASSEMBLY__ throughout the kernel tree, see for example
commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
non-uapi headers"). The latter is automatically provided by all compilers
and preprocessors supported by the kernel, so the explicit definitions
of __ASSEMBLER__ can be removed.

However the UAPI headers might be used with older (< GCC 3.0) or
non-GCC-compatible compilers, which do not define __ASSEMBLY__
automatically. So this migration may brake users.
Also during the migration phase, the UAPI headers will use a mix of
*both* __ASSEMBLY__ and __ASSEMBLER__ at the same time, which is ugly.

For now make sure that the exported UAPI headers consistently use
__ASSEMBLER__ as before.

Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
This should go either through kbuild or asm-generic, I think.
---
 scripts/headers_install.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 9c15e748761c..2f1d1767ca26 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -36,6 +36,7 @@ sed -E -e '
 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
+	s/__ASSEMBLY__/__ASSEMBLER__/g
 ' $INFILE > $TMPFILE || exit 1
 
 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260302-uapi-assembly-0bb7213b41f1

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


