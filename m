Return-Path: <linux-kbuild+bounces-12855-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM+UEfbk6GkHRQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12855-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 17:10:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60E447B81
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 17:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E2AF300406B
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EBB2980A8;
	Wed, 22 Apr 2026 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CAy89srL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB111624D5;
	Wed, 22 Apr 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870638; cv=none; b=GNEDLRegSewBl3xgAG4RyTElUHzd6Hw+AJx1MxwmZF0Xbqw5bBKrTEHGoiWmWOVi4V4h6PasNoBHaG/ArUyvp0DHu7J9bKUwyYkxp8ULf4Hb0RLtxSMFd2Re2QRnksZ5pjgOGXe7rCwROuLaEx2VQaS5APz5yUpOQTDIAeza9Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870638; c=relaxed/simple;
	bh=AmGMe/pXW3SGIY3ADKg2VFd+NcqB/0MaX6KOojj3T1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=beArRWQHAB5/Vi7bGbBjIdfqGOluL9PLe3Bn2YUrN+qoOcx45MSlROQhocvLiDCYo/2layrd14L4+0Q8rvJ6u1b5VbFealLCgPmkztWNF9Bm4jZKtwyjwNVxQchq3Tk4ef95ZII/oHggDb5da5hurBa3vHe0gCVn5sCHs1SI8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CAy89srL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1776870634;
	bh=AmGMe/pXW3SGIY3ADKg2VFd+NcqB/0MaX6KOojj3T1E=;
	h=From:Date:Subject:To:Cc:From;
	b=CAy89srLvLJpXDl+A5Hv5sHJEXQp9aiQktEIe7o8YEC0IACuH+VtIgltIPvYST3St
	 s6+5HUAXkfY7OINgs2NP0qAWB942mpyBQ0SbXiNYQYsvPYZ6HkZMvUHRwp3dAX+iwi
	 ZLUfyv/B40wW8EtJQf4rKgbvBWg+VcG8ph3KpVpw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 22 Apr 2026 17:10:27 +0200
Subject: [PATCH] kbuild: Never respect CONFIG_WERROR / W=e to fixdep
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-kbuild-scripts-basic-werror-v1-1-8c6912ff22e0@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAwAwK+Qnm2CqwH1K4YDW1qsGiAtqAnh7
 y5wnMvM4GzKDrdsBuOPuvZdwvGQAT3qrmXUJhlCHor8HAK+4qTvBp1Mh9Ex1q6EXzbrDeUiZRQ
 6XUkI0jAYi/62/V7t9ik+mca1hGX5A0p9fpR/AAAA
X-Change-ID: 20260422-kbuild-scripts-basic-werror-f8f7bfc39cfc
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776870634; l=1685;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=AmGMe/pXW3SGIY3ADKg2VFd+NcqB/0MaX6KOojj3T1E=;
 b=Eqi97WheWDfXGfj5Mb7bdG41WKER10CwA587Y5fcBVHSqgSppM82+Lc37ifirV0CtvFIcKzTd
 l+dKzc+wKaoArNhfXHP4RR+3Ye0ZU4bAlLq9B9o8aEomC1gPd7GOJq8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12855-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D60E447B81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fixdep hostprog may be built multiple times during a single build.
Once during the configuration phase and later during the regular phase.
As only the regular build phase respects CONFIG_WERROR / W=e, the
compiler flags might change between the phases, leading to rebuilds.

Example, the rebuilds will happen twice on each invocation of the build:

  $ make allyesconfig prepare
  make[1]: Entering directory '/tmp/deleteme'
    HOSTCC  scripts/basic/fixdep
  #
  # No change to .config
  #
    HOSTCC  scripts/basic/fixdep
    DESCEND objtool
    INSTALL libsubcmd_headers
  make[1]: Leaving directory '/tmp/deleteme'

Fix the compilation flags used for scripts/basic/ before
scripts/Makefile.warn is evaluated to stop CONFIG_WERROR / W=e
influencing the fixdep build to avoid the spurious rebuilds.

Fixes: 7ded7d37e5f5 ("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e for hostprogs")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 54e1ae602000..6c8a1b2e7c8a 100644
--- a/Makefile
+++ b/Makefile
@@ -657,6 +657,8 @@ export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
 
 # Basic helpers built in scripts/basic/
 PHONY += scripts_basic
+scripts_basic: KBUILD_HOSTCFLAGS := $(KBUILD_HOSTCFLAGS)
+scripts_basic: KBUILD_HOSTLDFLAGS := $(KBUILD_HOSTLDFLAGS)
 scripts_basic:
 	$(Q)$(MAKE) $(build)=scripts/basic
 

---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260422-kbuild-scripts-basic-werror-f8f7bfc39cfc

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


