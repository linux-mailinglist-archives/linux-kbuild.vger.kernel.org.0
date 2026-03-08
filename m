Return-Path: <linux-kbuild+bounces-11686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GwKJArprWnG9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11686-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E68232501
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F91C301C95A
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 21:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4B335A38B;
	Sun,  8 Mar 2026 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gHUZLCcO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F88C293C42;
	Sun,  8 Mar 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005050; cv=none; b=NJl5Ef4BFDKoHp0L3zaJVurM4d0teQyHIzBK2BSxfdXttwJntz8m40D+vhlGYdhmLlMEZf2zDYvIW4f7UIr6bRNN/BNP+IF8CK0yWZExPeuQF62wIFw64td46ofK+bXPq7EUGVouK0FmnKOEC7GnqsK2FJXKnE2PGvEpqfXQCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005050; c=relaxed/simple;
	bh=XE7aQ63fDTs412GySTUGTx0WOylnFvUIjIK4NeXoh7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTtaQGKmYexb7Zm6aPo02fzJoRLWTu02n1H9tR1IT4F0uCsS0f/yLA8NUQDyZLuDhtl3oPvqfmP9eyYMq1k5mlJ2OTFG4eWehhWxyxPw5f+2TUEDySVGTbTofhe+G53yAJpLCBH+xAeHgiOepKXCGxzHPaz34Q2uuQEGYN4YRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gHUZLCcO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773005045;
	bh=XE7aQ63fDTs412GySTUGTx0WOylnFvUIjIK4NeXoh7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gHUZLCcOua6UDErCT7bhkhaI/2hF3ivIQbj9DGD/AGSeseb+jaiZnWCFfjNvXI09p
	 FDRDmio3loHaxCp6zil5yW+9qtU9sg7riJN8IpaYsb0dVIYg2JLfcwoPfvbWJYLv5z
	 2OJtVXl91IOHar4OFQ+zfLKX30sY/UhggnXXaXyw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Mar 2026 22:24:02 +0100
Subject: [PATCH RFC 2/5] kbuild: uapi: move all include path flags together
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-kbuild-uapi-c-v1-2-86aae09a7f1d@weissschuh.net>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
In-Reply-To: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773005045; l=1368;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=XE7aQ63fDTs412GySTUGTx0WOylnFvUIjIK4NeXoh7E=;
 b=ZO4Yq5LW0IBrj2Q+7Tw5mcg/rGyBZTalt6dR9AKpcsZq7I12x3JmNOzfSK3EKD6lkwVkBQ5gl
 kdvw+bXoZRGC0tFEzWzonH4Tizdz9OgT/1U71Agu4g5BW3kwW+PCF88
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 34E68232501
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11686-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.929];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

The argument to add the root of the UAPI header tree to the include path
is separated from the other arguments concerning the include path.

Move all include path arguments together for more consistency and
balanced line lengths.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 0b1c9a4b0477..74f5ba24bb29 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -8,7 +8,7 @@
 # We cannot go as far as adding -Wpedantic since it emits too many warnings.
 UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
 
-override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj)
+override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile)
 
 # The following are excluded for now because they fail to build.
 #
@@ -141,7 +141,7 @@ target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
 
 hdrtest-flags = -fsyntax-only -Werror \
-		-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include)
+		-nostdinc -I $(obj) $(if $(target-libc), -I $(srctree)/usr/dummy-include)
 
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<

-- 
2.53.0


