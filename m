Return-Path: <linux-kbuild+bounces-12258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGl0Evz7w2k/vQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12258-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 16:15:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF64C327AA5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 16:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 220C130185ED
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDDD3F54BB;
	Wed, 25 Mar 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="KhSIP6Q0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ixOuxX03"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0213F27702D;
	Wed, 25 Mar 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450650; cv=none; b=YQVLPnkmdj1ZZZeISNGduKgmmUKt+96Z6Te389/9sSZCLGOfuiFqsFzktNSBqI0EOpsqbwF3nK0cvp7nhXA5GLEIzeNVsDNK6N5g1X3yhhyqN9zGyagKUxdgIGICZhMeC6RbtLdgTZFUKULctJ9Xz75NiOOlB2F4KfeHWU3zB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450650; c=relaxed/simple;
	bh=ttO5AMEAYh/Sdd9vgNGtHMrfAZFeabvd3Zj4pgA3fUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bn+nFug8o6grxJgKUP0qkq3p5J4fHd22IFRcFRjY+6/yLmQAQg0lrpVCimOFxXmznMduUrWa51OCMnsjP1g4xMXTsp7TvbBDpG/+3RPYrBl+nwy7wjkzVA6b2uVlRXlDKgMB4W19nJhMHeXvvQ/+s+IkIq4NCSpnRZOxcsuCQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=KhSIP6Q0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ixOuxX03; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 2EF47EC0274;
	Wed, 25 Mar 2026 10:57:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 25 Mar 2026 10:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774450647; x=1774537047; bh=EM
	sfC+C8hkjlML1/d6QGXe1eGqdhJRkZw8/j30OlXS0=; b=KhSIP6Q0YowfzwKXHV
	8A9C2InD+dT1JPQocDyEdPlCjkeW1DRju6WNlL89aV8Mx/H8XVKg9tnT1pYEEsmh
	MOxH7e8aGrbjFbqc/GGDTEoQPsewZr7D2ilPvvaXNUWlV+3H6vnwRq+CcsEWKW2/
	Q1uXPj3eCa8MdsWhBJtMR4+1PbuKpnLGy4i8Rl+mPvcP7z2UfQAlxiP3L2R09+va
	oH+KApIA9YtnC4st+gCryz38t/cNc9GXgvNQ4TVMzW5srKc1N9j+EZWTHY8yFbuY
	MrqxPZ3o+HcMEFFfTbcgyVKjrQpVa48kJgNhNmjwRgFY170s0ett9gGVGhtMamf+
	btYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1774450647; x=1774537047; bh=EMsfC+C8hkjlML1/d6QGXe1eGqdh
	JRkZw8/j30OlXS0=; b=ixOuxX03SCwXdw8aNLNR+yo7cTNavMD4G30+1Zz9ueJH
	WEAUR6DqJgMQcjWSzi4HvaL4DBw7cQ9pw2MMt22esMG6+GTA3Mo/9TlXTmTgZTpp
	Uwi7etGq39tUUzBSNCTIQoy6XItWYagARKfRLzKEI0bXeG9avGQjutLbT7s+o90J
	prBgiBazyViiabxnTl6NZ+pQLJ1LXGvN8yNhxrGjp03YT0dqbFoN+3V8xxkbrpl2
	esTssYaWe/hWQlBljrf0jA+oo0Fyogm58PBS+VSrav1Z1372YvhKm2pw8zHPm5kM
	1wfjn0yZlE3QTi4fs0/ADT/c9lsSObv0pvVSK/CEDQ==
X-ME-Sender: <xms:1vfDade9mXiXBpB76t6UDd6BjH1jirocOkdKVx4xO_u-AMp1RDpwGw>
    <xme:1vfDaRN2O8f0VxtobVOT9VfB1-4auNtFRQr7y1Or0du8ELne93uTplpU495rJI1yL
    aPHzlFn_yhpwuRTqrI-nwH8LTuDlRVANoIABI-n7eANxmFJ5IBN0eW3>
X-ME-Received: <xmr:1vfDaRXBqif8gAbdjj40ClKINnrXJufaTgU3fIgXSqLHb0E-6_A_PzWca-lIEl0vZSHRbUq0aN2SiKuCP8icY3_AEJhXaF1mgMmGFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepueehve
    ehveeugfettedufeegveejjedvgfdugffhgfdtveduhfevueevtdejheeinecuffhomhgr
    ihhnpehshihsthgvmhgurdhiohdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhoh
    hmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrrdhfrghtohhumhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhj
    ghestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvg
    hrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhksghuihhl
    ugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1vfDaZwk-0RLkBl8EreqRhRE6_V2LZG8hKBqTgPHU5AftMQR_Ohd_A>
    <xmx:1vfDaY-AHZPhW8WkyETTPPVCMsknn1fS3bj19oBuOW-uOOdRELuL8w>
    <xmx:1vfDae-8XA2ya3knQfYo1ONUGbD1Aj7OJMmUBQoLou9Bb-cptUHPMQ>
    <xmx:1vfDaXVv3WfPSNoDhxPiNUSDZZ35ZEP-keiMPDZfWym7HSH_Nn_YbQ>
    <xmx:1_fDaf5ZOS6o5saKIrUFu_Zj-zoGhZseKAduAkJ4browV1Dc5df1j0-F>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 10:57:26 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 25 Mar 2026 15:57:25 +0100
Subject: [PATCH v2] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNSw6CMBRFt0I69pm2kmocuQ/CoJ8nPIGWtJRoC
 Hu3sgOH5yb3nI0ljISJ3auNRVwpUfAF5Klitte+QyBXmEkuFb9IDoPJNDqYgssjJrAzBZiHDnK
 KMGEsh1oqpWvF5U1aVjxzxCe9j0bTFu4pLSF+juQqfus/9lWAAIsotBPGXK15vLT3Op89Lqzd9
 /0L+PsQw9MAAAA=
X-Change-ID: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=ttO5AMEAYh/Sdd9vgNGtHMrfAZFeabvd3Zj4pgA3fUQ=;
 b=kA0DAAoWoRs8240vZWYByyZiAGnD99WiYfXbqNmx/kD64PcdtXeEfKHXzrtyLm2i1oevz5DFf
 4h1BAAWCgAdFiEEYivpiACrfCFcfeBWoRs8240vZWYFAmnD99UACgkQoRs8240vZWZd7gEAkDF0
 5w+nizOVQKx5rvo/bCG3tCjVNcEUELPDeQTYLOsBAODgBkXdRdGFAYHEiB1eNHmWnm7zfhS6iHg
 8MGghHwEP
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-12258-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jannau.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim,systemd.io:url,chromium.org:email]
X-Rspamd-Queue-Id: DF64C327AA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
target to build a cpio containing modules") is incompatible with
initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
be a link and directory at the same time.
Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
module install location as `make INSTALL_MOD_PATH=/usr modules_install`.

Tested with Fedora distribution initramfs produced by dracut.

Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
Fixes: 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
Cc: stable@vger.kernel.org
Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
Hej,

this patch allows to produce modules-cpio initramfs which are compatible
with initramfs with merged /lib and /usr/lib (/lib as symlink to
/usr/lib). I expect initramfs of distributions with merged /usr to have
a merged /usr as well. This is at least true for Fedora initramfs built
with dracut.

Janne
---
Changes in v2:
- drop pointless avoidance of repeated slashes
- comment the changed Makefile rule
- break long modles-cpio-pkg help text to 2 lines
- imported Simon's Rb:
- add fixes tag for commit 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
- Link to v1: https://lore.kernel.org/r/20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net
---
 scripts/Makefile.package | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..c19b88b346d0632cc99e74617d79b07d81d48635 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -195,7 +195,8 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
 .tmp_modules_cpio: FORCE
 	$(Q)$(MAKE) -f $(srctree)/Makefile
 	$(Q)rm -rf $@
-	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
+	# Prepend INSTALL_MOD_PATH inside the staging dir
+	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@/$(INSTALL_MOD_PATH) modules_install
 
 quiet_cmd_cpio = CPIO    $@
       cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
@@ -264,6 +265,7 @@ help:
 	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
 	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
 	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
+	@echo '                        (uses INSTALL_MOD_PATH inside the archive)'
 	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
 	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
 	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c

Best regards,
-- 
Janne Grunau <j@jannau.net>


