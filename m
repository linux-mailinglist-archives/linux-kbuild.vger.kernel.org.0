Return-Path: <linux-kbuild+bounces-12314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AF3FmdBxmlRIAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12314-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:35:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1A341181
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8C1D307D6BD
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 08:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA333CEB5;
	Fri, 27 Mar 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="IvXB5NwT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qc/7UUME"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDAF372EE4;
	Fri, 27 Mar 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600236; cv=none; b=pLpAUgoFexm7bM3504XXuI+fWdbG1PnPpi5xOA8fUPsPHCtr5XqfY+bWRP4yBkMDW1fNzwk6VctSF6Pmz/Obeu5gLhHnAnAWD7gzOTrMmceAWS4tN7tm9++iIQvri0H3dyU6SLv3UlpXTg7eONhnyDHfw2B2jrKRxnuB2SB63/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600236; c=relaxed/simple;
	bh=N3CWqIr+H/5bpCg0yNtyZ3Pl3arkZH594k5xZqiRbi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O5MvxaAv/qs1h/SPGOvyvHO9wOtl+T/xBBPqCnHssIJnCUzpJlqnD/iGp9oOwd2YoL7OQ0KMCmRF5CORvGR2q4hpDd1N3tJyFpdYQeAkuJ75jqRxDlI+1DzshHq6CfbDvQxmktHguqq0uSD+rJ5ymI2V4mIZU9Pxe8uGOrJ1H14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=IvXB5NwT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qc/7UUME; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5800C1D0022E;
	Fri, 27 Mar 2026 04:30:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 27 Mar 2026 04:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774600232; x=1774686632; bh=Do
	ipKypdA5mG0i5AzZtRlEoooQf+DEP/m8Jnv7weVCI=; b=IvXB5NwTOeOqdBA2q3
	T5x1aSEtQ0EGnX1vX0IBRDAHqvclGqpY/3FPiS9kJeZBrp9hpQKz7a9dOt3KyFx2
	Wzh+QPtaztDy7Y6C2T+tvc2q+4ggIn31LHjpYXYxUwuJ/MMzuJwtI/MZ94vge6gQ
	sXbdCgcBZj0EemdOZ9/ujCtM77EH99eEn9/4GLKyaaYvoF6J5fwGMrk05gT1PlOC
	6ee8lrKwCJn7XtIguOqcUcISJ2CXjnU2vtpOda6X+D2b7vgSaINct/0X1RD5uUTx
	XBQZM+wsug7kpf3LovziG6aM6hs9+pnSOJGOREI7SKZ/liGR3a7sp/rvP4ztZoo/
	f6lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1774600232; x=1774686632; bh=DoipKypdA5mG0i5AzZtRlEoooQf+
	DEP/m8Jnv7weVCI=; b=qc/7UUME6xSAA2quXNX5gCvbDxbXPE2KVkFhKMr18cBJ
	Trg6VhHQbVQppkYlrT23S8guddxfMTtIKe8klPICzXCcSIazTS8bW/JIH/gpvNLY
	LHtyf07ASVps9GW6Xl5/E4BIBG3Y/Sj93Kr1c4dzzx2LQ/CzrwFMA3NzZH/Z8N7f
	hE2iPXebfYwbpaP2YzGla/+1EIv7iprhd90UyfDxJ2YM/wrioEYDQ4k2JsrNLTXV
	lIudt1MWoOLtz5b54/0Ovjsl1QzDzQBD/F0PdDAC/mdqzIIwUScdEVjwlwCTNQWU
	AJ/5h3mEhk/NHvtH7vDpRk5MiERus+6ZlnH7FCTZCw==
X-ME-Sender: <xms:J0DGaWvsHt2nQ2jj4xVstf2CUsEJR2n2zs5uBG8WtGVZxEmabK_d1g>
    <xme:J0DGaRdDOYS9k5jE0nEpTPHrt4QRhB34GyM5lPdEUlz3Vx0LzlTwN7gq5vaKZV03O
    Kj3fivJ2NOc5WhiGofMcRq_IGhTMckK3yDPF-4AHEJ8m-IxsfT06nU>
X-ME-Received: <xmr:J0DGacmjnB3DmIrtXSwxo-XO4vhlkzVLw3lyz26hjAWPBSDOWi5XNbsmy_CWev6IUZUxmmpyij4itDk6xOeceSn87w2RrgQYFzMn-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdelkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepkeeige
    ehuefguddvteellefgtefhteehgfeiuddugfeifffhvddtgfdvgfehveejnecuffhomhgr
    ihhnpehshihsthgvmhgurdhiohdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhjgh
    estghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthh
    homhgrshdrfigvihhsshhstghhuhhhsehlihhnuhhtrhhonhhigidruggvpdhrtghpthht
    ohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrfh
    grthhouhhmsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnh
    gruhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:J0DGaUBjlmTFlSE4v_hbD2bY_ag8-NzKE29jUe8RaPHYDakLU2fjCg>
    <xmx:J0DGaWOErnn8i58om-5sKCCx9dtJe_CbhFcPhs4l0-w2JwHeA7bBmw>
    <xmx:J0DGaTPW--EgZgvVBmYzhy3iMnad3D3knCBtUJzJpUzaxf1Ud7Wpzw>
    <xmx:J0DGaWlJ_iLF9chBVo1d0k2SKPk_iC1Tcwp9nW46W4Fqnl1gOryBHw>
    <xmx:KEDGabnlpWxM7Lm1gjB1Slt4Ry2u_fvfRKTPUh_iaAYMp_PIkZGcZdZQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 04:30:31 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 27 Mar 2026 09:30:29 +0100
Subject: [PATCH v3] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNQQ6CMBCF4auQrh1DByzoynsYF6UdpQKFtJRoC
 He3sNKdLv9J5nsz8+QMeXZKZuZoMt70Nka2S5iqpb0TGB2bYYoizTCFpgqm1dD1OrTkQQ2mh6G
 5Q/AOOnLxIUchZC5SLFGx6AyObua5bVyusWvjx969tsmJr9d/9IkDB0XEpeZVVajq/JDWyrC3N
 LKVn/CTPPxCYiSz7ChVWegSSX6Ry7K8AdOl9F0mAQAA
X-Change-ID: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3427; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=N3CWqIr+H/5bpCg0yNtyZ3Pl3arkZH594k5xZqiRbi8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxjDqqf/D+X2M0zv9Jqd0Uq4eUvdfWutst/VqQ7vzljH
 C/hb3qio5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEQMuxkZLpxqjdTKFHVJrTvX
 ydAUFavOeXyFxZJFy4ubajQFJz1cz/BXztdvcuLph96ufq+uL1azaVF6t3v2wf9NB3b966uItDn
 PAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-12314-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jannau.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,jannau.net:dkim,jannau.net:email,jannau.net:mid,systemd.io:url]
X-Rspamd-Queue-Id: 4BD1A341181
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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
Changes in v3:
- Drop comment added in v2, change is straight forward after dropping
  the repeated slash prevention
- collect Thomas' and Nathan's Rb:
- Link to v2: https://lore.kernel.org/r/20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net

Changes in v2:
- drop pointless avoidance of repeated slashes
- comment the changed Makefile rule
- break long modles-cpio-pkg help text to 2 lines
- imported Simon's Rb:
- add fixes tag for commit 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
- Link to v1: https://lore.kernel.org/r/20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net
---
 scripts/Makefile.package | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..6d36786ba31cefaf5ae2c6e2537d421b5bfb7a06 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -195,7 +195,7 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
 .tmp_modules_cpio: FORCE
 	$(Q)$(MAKE) -f $(srctree)/Makefile
 	$(Q)rm -rf $@
-	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
+	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@/$(INSTALL_MOD_PATH) modules_install
 
 quiet_cmd_cpio = CPIO    $@
       cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
@@ -264,6 +264,7 @@ help:
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


