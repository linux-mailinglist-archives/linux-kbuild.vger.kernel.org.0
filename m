Return-Path: <linux-kbuild+bounces-11963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCfIEVk1uGnXaQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11963-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:52:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2C29DAB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5625B300D0DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B963CEB9D;
	Mon, 16 Mar 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="omkWFqnb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C36339872;
	Mon, 16 Mar 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679928; cv=none; b=YdwV6ImcUvup1bMeSyov7O9DJhKMFJrTPHJh6kjxqRZhaA08rjaWw+KFp2eznDsrNURyETgG8IvXDhpSNBaELR7d0En0ldP/pokgvhJIrgo1+5p1wuaThhNVM3a2db6PHH3+U8a//TD5DLfRvrheZOuVRDNgtaGQ8pminj3XLHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679928; c=relaxed/simple;
	bh=fXZsbxaGn7gXyBNn9a1815Xva7zjv/XPM15Bx/AZ+u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjlgswWr3HKC1wl0lRinZKAZfF9Nq6J+zU54YMEJiIcw3QXHTZEMFuKnzRHhLc9zBzaHtdbHTYbvobsko4SK9kBC8UnB1HaASo/IPRSlY862psPlKJoTZzvmwNVKs51lGyBsT2Fh+babbYVQ8DFnHUbWIaBAwxYCDMqBZx4IdUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=omkWFqnb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773679918;
	bh=fXZsbxaGn7gXyBNn9a1815Xva7zjv/XPM15Bx/AZ+u4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=omkWFqnb9oJVDsoh8uowWc6yiDRijjWldhocf/CFQDWuVmH1gn06GI4DwkpKSrkmM
	 hhD09c4ziXrEYiBxx8GWAD89nb6E5et+WMBPfyNE+iNGMRzIDUE4oLl3IDsRk9hjyD
	 WA8NK92E+w146iusW6Ysyg0A/88WcrrvRNcZeRG0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Mar 2026 17:52:01 +0100
Subject: [PATCH v2 4/5] kbuild: uapi: provide a C++ compatible dummy
 definition of NULL
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-kbuild-uapi-c-v2-4-35d6d0ed863f@weissschuh.net>
References: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
In-Reply-To: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773679918; l=774;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=fXZsbxaGn7gXyBNn9a1815Xva7zjv/XPM15Bx/AZ+u4=;
 b=WaOLXlWcq3BVZytcn52ZchCb+6Bx+FXm69Jws2mFBXzP2O0eLk7t7uZD4C3OCLwlMeWsHBeWD
 e2h3UpXL/dsBM+Cuj/xK3Sr6Ox+IziPnsAiyXexo6eSZBKg7BXK3PcB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11963-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79F2C29DAB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NULL works differently in C++ compared to C.

To allow testing the UAPI headers against C++ compilers, provide
a variant of NULL which works with those.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 usr/dummy-include/stddef.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/usr/dummy-include/stddef.h b/usr/dummy-include/stddef.h
index a61703d1c896..525489daffe2 100644
--- a/usr/dummy-include/stddef.h
+++ b/usr/dummy-include/stddef.h
@@ -3,6 +3,11 @@
 #define _DUMMY_STDDEF_H
 
 #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
+
+#ifdef __cplusplus
+#define NULL 0
+#else
 #define NULL ((void *)0)
+#endif
 
 #endif /* _DUMMY_STDDEF_H */

-- 
2.53.0


