Return-Path: <linux-kbuild+bounces-11964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL5hJlg2uGkDagEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11964-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:56:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20729DBA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E9C3063290
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB703CEBAA;
	Mon, 16 Mar 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Yho4c+cS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B50332ED3;
	Mon, 16 Mar 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679928; cv=none; b=UFOzuvlkfWX/AgaXBMyfbY8reNZ6uW4NZ+Ne9e/M8kYveem+DBEqezGaJvPckLhjyoX1UI2FSWBkRwtLt16catRYOdkHLVPF7jVb6HQ0/XDKqPOOiIhAEKk4XT8roPsNSNJvuqOqZmSqhlpCcWY4gYZELkqMoVwo2vZnBZ3QK8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679928; c=relaxed/simple;
	bh=6JJMln4S7kuA+IUsHfl3Ca2P9IL0TMWoZ5Vr6CEjy74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E65e3nRY1Dw17nNPe/nPWiBVFa11Zap5fsXa0aomGNDsBEPyuX8gutdvKm7A6Rt9yKbd6uqvjw7mboraGLv6Nvna4OnNqVrLc+9+cd9LNkjb5I2i45go7SQXuDsPhN4lk/47OTibEjrGH+zhSq/gGFx3noekMQ10TXozM7XG+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Yho4c+cS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773679918;
	bh=6JJMln4S7kuA+IUsHfl3Ca2P9IL0TMWoZ5Vr6CEjy74=;
	h=From:Subject:Date:To:Cc:From;
	b=Yho4c+cSd1pMlRATkpP9K5Yd4ylHkD1iKYyeNwvByM9pWw3cPQJKaBOR3wSZmNQ9g
	 xc39jOzxE3igd8tZlZrDj+XlyMvmqrw9rrTLfLCF3nxK7PU45BFpGujpxmc2XyEO24
	 JvohArDgRnybSvYEuGGIzEfxqJw7UITsY1b82sKE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/5] kbuild: uapi: also test UAPI headers against C++
 compilers
Date: Mon, 16 Mar 2026 17:51:57 +0100
Message-Id: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Myw6CMBCF4Vchs3ZMWxIurnwPw6K2g51ogHQoa
 gjvbsWdy/8k51tBKDIJnIoVIi0sPA45zKEAF+xwI2SfG4wylTKmxPs18cNjshOjQ90oZVzra2d
 LyJ8pUs+v3bt0uQPLPMb3zi/6u/6kUjV/0qJRYVNZS6q1da/9+UksIi6kcBxohm7btg/DJ5Rhr
 wAAAA==
X-Change-ID: 20260223-kbuild-uapi-c-18002c9d7ca3
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773679918; l=1584;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6JJMln4S7kuA+IUsHfl3Ca2P9IL0TMWoZ5Vr6CEjy74=;
 b=35jZ5spAMsJixQcjhvzIrUZbmv3lWZkv/YEgL9bWZt32M2FsaNo+jaifg8zzzbIYYPYvjc7FP
 GmXg8fCt8sxB8iDCK2KSxGuVG5JOi55rCOPcTKtzzb+/C9y1/c50OY5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11964-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Queue-Id: 0E20729DBA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

C++ language requirements differ from those of C.

Also test the headers against C++ compilers to make sure no errors
creep in accidentally.

There was a previous attempt by David Howells[0], but today with the
existing UAPI testing infrastructure the implementation is a bit nicer.
This series does not derive from David's, as I found it only after
writing my patches.

[0] https://lore.kernel.org/lkml/nycvar.YFH.7.76.1809052120510.24932@n3.vanv.qr/

This depends on my other series "kbuild: uapi: remove usage of toolchain
headers", which is currently in kbuild-next-unstable.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase on kbuild-next.
- Pick up tags.
- Use $(CLANG_FLAGS) in cc-can-compile-cxx.
- Link to v1: https://patch.msgid.link/20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net

---
Thomas Weißschuh (5):
      kbuild: uapi: move some compiler arguments out of the command definition
      kbuild: uapi: move all include path flags together
      kbuild: uapi: handle UML in architecture-specific exclusion lists
      kbuild: uapi: provide a C++ compatible dummy definition of NULL
      kbuild: uapi: also test UAPI headers against C++ compilers

 usr/dummy-include/stddef.h |  5 +++++
 usr/include/Makefile       | 47 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 44 insertions(+), 8 deletions(-)
---
base-commit: 0d3fccf68d9873a3c824fb70be0dbb2c4642aa90
change-id: 20260223-kbuild-uapi-c-18002c9d7ca3

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


