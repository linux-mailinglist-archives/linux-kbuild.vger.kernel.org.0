Return-Path: <linux-kbuild+bounces-11684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LBwNgHprWmb9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11684-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 892582324E4
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8657630164AF
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 21:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFF1358D37;
	Sun,  8 Mar 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sSkv6/je"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E934EEED;
	Sun,  8 Mar 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005049; cv=none; b=oQ+VsRQSLB4LAKaISw/uvXUFkm/thFK7+04YuIWg6pWz3YuBtJVjQdrbj0/SS5KJZrpjYWn2gOLn+Itl2XypK7dp/PauigoiDH4EybNKLqShVxD8cFpq9oBTgUS78hjwFDoXDRKZdNrQg1mnCUFNbKYlem3xpwXgReepkYPCxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005049; c=relaxed/simple;
	bh=9Ck8dKyO7rN5xpHErcHVSmjccYdqlZTzMQl/61jnnK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JpO3Ixfaulbs8U2tc3K1F1RTsfGiuOCkLYAe8CD4G/6Mg/RC+ioPVXa+kAxekGaJelvNCYwUR9e1Sq9DkuUE06e2PY6swmVWhHRf6ckgQ/jEVfWl0Tfmh7YGaT/FPU54tfCXmlv/l3hhibsUKu6yJyDQZxmCiGQwLqAoah54Wy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sSkv6/je; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773005046;
	bh=9Ck8dKyO7rN5xpHErcHVSmjccYdqlZTzMQl/61jnnK0=;
	h=From:Subject:Date:To:Cc:From;
	b=sSkv6/jeOfLs6ZZVSKzF3ynFBoGQm6Rz7svuVhj5GlWMhaOOlBwxL4ucVljvlaPp8
	 2O0sTgFQOcelMLlW19FTlr1/paT4jeTrLFglHrnnOQMPiOAp+sWqCAhUqKJj4B7D9n
	 qgeX02kbBpUUghAivQE3dfFvFUNiSThKucNy99hE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH RFC 0/5] kbuild: uapi: also test UAPI headers against C++
 compilers
Date: Sun, 08 Mar 2026 22:24:00 +0100
Message-Id: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3eyk0sycFN3SxIJM3WRdQwsDA6NkyxTz5ERjJaCegqLUtMwKsHn
 RSkFuzkqxtbUAQ+YbOGQAAAA=
X-Change-ID: 20260223-kbuild-uapi-c-18002c9d7ca3
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773005045; l=1377;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9Ck8dKyO7rN5xpHErcHVSmjccYdqlZTzMQl/61jnnK0=;
 b=BfRF2ak7oQAIdpnRDfBMFku8evXi1Dk1JvvgVI2uTjXZklTxlxARhkSLXmRL8qGliCnT0w4Rr
 yn7vxAOOH+7B2bVlJNvRbs8tYQAd9+1+XQ0F+CFuOLsQJ6CaUiWoO0O
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 892582324E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11684-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.940];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

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
base-commit: c14d8386b0a38d45a4345f556d6491be3594cf8e
change-id: 20260223-kbuild-uapi-c-18002c9d7ca3

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


