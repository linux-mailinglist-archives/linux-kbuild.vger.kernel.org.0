Return-Path: <linux-kbuild+bounces-11967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKsnJqY2uGkDagEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11967-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:58:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFD29DBEE
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D7F7312AAA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11163CF682;
	Mon, 16 Mar 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Tkv29Ver"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCC53CEB86;
	Mon, 16 Mar 2026 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679929; cv=none; b=rkEKDHT1IeoqSL1tnK+tLzwyc1+y9k5r4PpM6Mj9xMvl5DeEsHcEQLxK0lq2vHCGzIjsw4F++7mpG8cFsrnE2f1tzy5JoGiLyPDptPD1DRdPMf7grY0oCTjeGRA+7YHHv+3cC7EVTVNIkFQ1VGYSw3TynE3UBpTA/QI/2ZXVPJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679929; c=relaxed/simple;
	bh=KJB6ACbqbsbmqAxi4TNeW9jRlGOcSgydMfqFKK95WM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDJU1UNKdcVmrnffh/Pk8Eyv9t+wC66+sh2S96MBF8cVFWFMGf5/VDxEibwM4ZIPtQNN9wv5BU0KcEZEURBP/de2dgXiADfc35dh6nerOegGiuJdV2cVelWi0ehV83t+r5vZ4KeGpRo2z/4EJzxXX7aXaXBkUGVbc5O+qD0KTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Tkv29Ver; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773679918;
	bh=KJB6ACbqbsbmqAxi4TNeW9jRlGOcSgydMfqFKK95WM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tkv29VerNzJM2z4+etbifZRwjYB7nHEqIV3H1eSBwOhkJKHRO8GTCG+h0RYRiPhQu
	 3F2huUhuylpG9JYmdulttgKuL0GaXz41LEqcs5mRxM4h6nlFm7J5G8khXfJ0/9soFt
	 UyRaqHZfYe/KSV/TVYR6vrxYn0KJHU2KUD902vg4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Mar 2026 17:51:58 +0100
Subject: [PATCH v2 1/5] kbuild: uapi: move some compiler arguments out of
 the command definition
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-kbuild-uapi-c-v2-1-35d6d0ed863f@weissschuh.net>
References: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
In-Reply-To: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773679918; l=1303;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KJB6ACbqbsbmqAxi4TNeW9jRlGOcSgydMfqFKK95WM0=;
 b=xRx+cpWD98y2DtwtWIeIZxMbitA+oMdD9s5V8wsXoG30KJKodjJY1DSJy5ULwXM/k14WVJyMS
 zzgSl24fQBmDFkNkSr4qBC+36TxLckkD5D5kkDLMlJSDyDMnKPzo2T/
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11967-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Queue-Id: EABFD29DBEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify the definition of cmd_hdrtest by moving some of it to a new
variable. This will both enable the upcoming reuse of those flags
and also the extension of cmd_hdrtest.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 usr/include/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 845d06b63c2b..0b1c9a4b0477 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -140,11 +140,13 @@ always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/
 target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
 
+hdrtest-flags = -fsyntax-only -Werror \
+		-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include)
+
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
-		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
-			-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include) \
+		$(CC) $(c_flags) $(hdrtest-flags) -x c /dev/null \
 			$(if $(target-can-compile), -include $< -include $<); \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@

-- 
2.53.0


