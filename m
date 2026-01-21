Return-Path: <linux-kbuild+bounces-10769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACY/LHracGnCaQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10769-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 14:54:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53057FD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 14:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A94215EDFCA
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDD93D411D;
	Wed, 21 Jan 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CGFFbmgU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673043DA7E5;
	Wed, 21 Jan 2026 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002966; cv=none; b=QEOiaUYsEMNnfl3yzsMn78LWgYjwXwQp2tp6a0Ib/KpjZxvR7aWsj9rmM4NkgFaFe7rD2ySwcJ7V5WecbYkfeWTLgnBHzrDktpKUl26vWhbVTgffFsuj4Yol870iKVjUXXMWmtH6R6XOdCzGmMHZfIe7cSk5zVHi3PTL5GMcgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002966; c=relaxed/simple;
	bh=gPstXtrqLOwaNXn1bt9eP52YKrRB6hPcSsL3lxmJpRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I6fLEa675S7tF2EkggYLNFUJO2ALNQcKOf3PtnfeyStxDAMu2sAjwxY0Whr7RUImI7q0pnLdYP1UuY2eYn9rLPGQij5+Ha8S6dx4kN/nXYRnd+riuPXnXXsZpfhy4rlYPEzfMPBcSQLDaVPWbprNGwzgBvumzlNUTmOR5Q0pu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CGFFbmgU; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1769002960;
	bh=gPstXtrqLOwaNXn1bt9eP52YKrRB6hPcSsL3lxmJpRM=;
	h=From:Date:Subject:To:Cc:From;
	b=CGFFbmgUTAusyeZor63tKF4CWVhTCsOyIMGaA4WItm+OTgBCet2NfzcdqmIypw0UU
	 zf78y4fQAxlX07bIVYBV5UcZgy7AA5TLpXZ3BlinrFHxLBcnHdYTogOkN1odO7gW8d
	 CGpODFzHA42/JGtOC/0EL4aqo3jQOiIaVcpa/Bn4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 21 Jan 2026 14:42:39 +0100
Subject: [PATCH v2] kbuild: Reject unexpected values for LLVM=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0Jm7RhaCIor72FYtDDQiQikA1VDu
 LuVxJXL95L//gpCnkngkqzgKbDwOETQhwRqZ4aOkJvIoFNdpEopvNuF+wb7PjzQ+A7rU5YXJm+
 1zQzE1eSp5ddevFWRHcs8+vd+ENTX/lr6rxUUKjxTaW1jqCyL9vokFpHaLe440AzVtm0fvfnsF
 bMAAAA=
X-Change-ID: 20260111-kbuild-llvm-arg-c7346a4f2b3a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, WangYuli <wangyuli@aosc.io>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769002960; l=1313;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gPstXtrqLOwaNXn1bt9eP52YKrRB6hPcSsL3lxmJpRM=;
 b=ZOrmwtufQ+1GC53Tz48yZVF0XhBQARpEEiWZc0gowySmvGOl7W1oZLoz1NBdEauL4VwXi5qYP
 sxflnwUyVuyBy4A3nlII8hbVSDHGwIQbvBBUTDAh9FE63z+Blv/GRy0
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10769-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com];
	DMARC_POLICY_ALLOW(0.00)[weissschuh.net,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,weissschuh.net:email,weissschuh.net:dkim,weissschuh.net:mid,msgid.link:url]
X-Rspamd-Queue-Id: 2F53057FD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LLVM argument is documented to accept one of three forms:
* a literal '1' to use the default 'clang',
* a toolchain prefix path, ending in a trailing '/',
* a version suffix.

All other values are silently treated as '1'. If for example
the user accidentally forgets the trailing '/' of a toolchain prefix,
kbuild will unexpectedly and silently fall back to the system toolchain.

Instead report an error if the user specified an invalid value for LLVM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Add pointer to the documentation.
- Link to v1: https://patch.msgid.link/20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index e404e4767944..4cf187f70171 100644
--- a/Makefile
+++ b/Makefile
@@ -447,6 +447,8 @@ ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
 else ifneq ($(filter -%,$(LLVM)),)
 LLVM_SUFFIX := $(LLVM)
+else ifneq ($(LLVM),1)
+$(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
 endif
 
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-kbuild-llvm-arg-c7346a4f2b3a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


