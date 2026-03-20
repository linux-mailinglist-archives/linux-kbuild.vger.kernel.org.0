Return-Path: <linux-kbuild+bounces-12091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMDJLhhavWkA9QIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12091-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 15:30:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10A2DBD15
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 15:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C01E0300C3A7
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 14:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59013783CB;
	Fri, 20 Mar 2026 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="bHouhGx9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t2LG8ZLL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8652D3739;
	Fri, 20 Mar 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017042; cv=none; b=F5UKmjIkEbXAIWdE0MG5z+TwrkefjnKTdc9n5epT4RB/UM3k4+AkRMniCKTcjcXl5TqFSYw3Sx99QHoCUk+/MRinBTe6+l54S4ARnmaSxC6BRx6TOchgtiz0HU2kbdMdJzuf/N7vqxhox42kMeuMImX0OQTi0niVlOEhBxGpHmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017042; c=relaxed/simple;
	bh=th7jiaWJogm/ZnIOT5IKTJwCuvSQKxIp+ESdiDiJTGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SRnvMKpsiaonexLFRmaSAe6cohF04f62wcm28wGlMFjbaDvsXBzcK1i+YWJwqRLwna7D/lGYYFa/j/aY8a3Yr/EtaG8VPVuF5E0xCBXGi3Ue7fcoPFuuAa9rqkphIY+ShzUVmV4m+AUv6yLeIE8TGmkfatINZ891sD2MT5IqBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=bHouhGx9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t2LG8ZLL; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B8AC5EC01E5;
	Fri, 20 Mar 2026 10:30:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 20 Mar 2026 10:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1774017039; x=1774103439; bh=e0
	RQhll4GKDFFZjpQ5q/z8fBbw0Yxn1Jjye5KE0zrvE=; b=bHouhGx9FarP2GUjbo
	UaVFNZzUwLcOl1HtEnT/rKu0EZPEh+/cTlJ8kOZSHUoldolpFSYvMSAhVcNnBS2x
	uuw4gX2Fn6Abc6lZgcQdz5bD9H2XNcLU12mRA+ZlsXYrQyo1OgsNX7DIppooUpXn
	yktT0xCra/ALU+ne2irggSZF4pGGqd9Tp+ZdqRuj/5les5dsm4gOMzqE3u8OSiT3
	uaZfYex2NVFfUoI5a0ATOq0LBZ0MhYN/0ntfqjBx0p0Hvoid8HhwLc1BZmivC3gN
	Z0oweWEERpqcjnA8UYklVKRGa5VwWBUkrKZYzERtnZl2bp/yjPMo63lxxERzYxHE
	733A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1774017039; x=1774103439; bh=e0RQhll4GKDFFZjpQ5q/z8fBbw0Y
	xn1Jjye5KE0zrvE=; b=t2LG8ZLLW7fXErWKx+kcp9xO9+jQIL6BnhjrTKwztDEz
	kiZ4HnXH8QB1lMUXJm/6G3ARFIfQmuocdPx1biszCYr/9VnbtKJujJkYgYIApt7B
	Qs69+i4EB0OhwPOvyBKAuPOflOwfONs+Z7eJa5FUkV5S/hBAWCg2yrb4wSimwFYX
	xhitUkPJ5Z9QWc76MiIfuZgRqUDYFmZkzkSfh9nEPpt0y64XB2BTCYHU++84jCOl
	k11CdXUB7RByxDz8LGF2oTAotE3PIJk2BBV55Tyl8Pa7nQhTCKPIYUJs3Nq+yGDk
	1F7Q7eP4xjuWMKDJ0717gB6kSXVvIp1xWQN4UGjxTg==
X-ME-Sender: <xms:D1q9aTlT0UF-bU6MMRcgvy19wNxoRxD7qEpzBI9Uh2LTVDH5FiC-QA>
    <xme:D1q9abxa_koN6IiYa47ssZE_P1yCK58Be2hrtWKAhuc-bUkEZKAgkEXttPO2RLz9j
    FVn2FF9iQ_aYxyjM0C9BqasG2c58mz29HWDzMlNIEIfZupWJZMfgug>
X-ME-Received: <xmr:D1q9ad65oaITboor3zsEqG5yhjpxNhuYpo06QuGYjpR6q4zdpLvQ1A5UhzVfnvueYHK3VZIGsHywwJNYBcvJyLnOnvjaATuFIBMbIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddtudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepvedvhe
    eujeehvdduueejudelvddvgfelveekjeehgfdtjeetheetueeftdektdegnecuffhomhgr
    ihhnpehshihsthgvmhgurdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrg
    huvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhksghu
    ihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhfrghtohhumh
    esphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhjghestghhrhhomhhiuhhm
    rdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuth
    hrohhnihigrdguvgdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:D1q9abVNI3q5eU-WF_8-AuEaGOPCBXIce5w0T5T7qzh_0JWyDhkBVw>
    <xmx:D1q9aVKwuxqVaekJQyTzfEtJRrZ_u1h2LoF2LfyBswyKlFfkwAwoDQ>
    <xmx:D1q9adultyHILyj1T8d5PRe9tZMag9xbvgG78BsNKqbd0bJQMgBgHg>
    <xmx:D1q9aSKZvp1OU2b6-LODtTgy8krk16prXmfc1Q8TgAn1IPeYMx2viA>
    <xmx:D1q9adOpglCrNiSocXhtd7fnVYI9Sma6zZ78-QlHQH5-m4uRpWlU9PZ1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 10:30:38 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 15:30:32 +0100
Subject: [PATCH] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAdavWkC/x2NywqDMBAAf0X27EK6lVD6K8WDTVZdfCTsklIQ/
 93gcQ4zc4CxChu8mwOUf2KS9gqPtoEwD/vEKLEykCPvnuRw+RZZI24plpUNQ5aEeZmwmOLGWoW
 OvB867+hFAWonK4/yvx+f/jwv0k6nBHMAAAA=
X-Change-ID: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=th7jiaWJogm/ZnIOT5IKTJwCuvSQKxIp+ESdiDiJTGw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9UTxHrgWoMT5onMC6RbmTK0ng2YRND57Wid4p4LKWF
 JNqvZTUUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCJJKowMX//lna+11bnbudHi
 l8K03vzY+1UV7X5p91kEWyrvf5W2Zfgfe/dhnNiaBfuNZiksUZB6WvrM5E2h+H37LWduFbk7CaX
 wAAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-12091-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jannau.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jannau.net:dkim,jannau.net:email,jannau.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE10A2DBD15
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
Signed-off-by: Janne Grunau <j@jannau.net>
---
Hej,

this patch allows to produce modules-cpio initramfs which are compatible
with initramfs with merged /lib and /usr/lib (/lib as symlink to
/usr/lib). I expect initramfs of distributions with merged /usr to have
a merged /usr as well. This is at least true for Fedora initramfs built
with dracut.

I'm not sure whether the trickery to avoid repeated '/' is justified. It
is necessary to add a slash between "$@" and a non empty
$(INSTALL_MOD_PATH) to avoid make failures due to non existing
.tmp_modules_cpio when INSTALL_MOD_PATH without leading slash is used.
modules-cpio-pkg`.

Better or shorter ways to document this not completely obvious behavior
would be appreciated.

Janne
---
 scripts/Makefile.package | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..ab18cf81622ae319380528c401f9aeb6d32070c6 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -195,7 +195,9 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
 .tmp_modules_cpio: FORCE
 	$(Q)$(MAKE) -f $(srctree)/Makefile
 	$(Q)rm -rf $@
-	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
+	$(Q)$(MAKE) -f $(srctree)/Makefile \
+		INSTALL_MOD_PATH=$@$(if $(INSTALL_MOD_PATH),/$(INSTALL_MOD_PATH:/%=%)) \
+		modules_install
 
 quiet_cmd_cpio = CPIO    $@
       cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
@@ -263,7 +265,7 @@ help:
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
 	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
 	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
-	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
+	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive (modules installed in INSTALL_MOD_PATH (default: /))'
 	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
 	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
 	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c

Best regards,
-- 
Janne Grunau <j@jannau.net>


