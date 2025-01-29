Return-Path: <linux-kbuild+bounces-5565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41215A219DB
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2025 10:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD4818825A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2025 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5709F1A9B40;
	Wed, 29 Jan 2025 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b="Rep0z2+f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lemon.tzafrir.org.il (lemon.tzafrir.org.il [95.142.162.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977438462;
	Wed, 29 Jan 2025 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.142.162.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738142965; cv=none; b=Lu2vK18E1I+BivA9G+BZ+3PYTXRmNG3mDM1XxE8EsnAuWhbfOZ5HvkGd1P5huf6BeC6BSrMYI0PTzPdk9+IxL5kvsKhyjiAwFcL38U4SVWM92+ddsb3VPplepqxes+oqrOWtWhE6mDrZyWTbWvtexi/LobL1WoaHdwq7yox8TOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738142965; c=relaxed/simple;
	bh=Y2IAGmIOkGbJJ4sHjTuDoLB1h8Gmitahj3cG5jXpUcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4OnYDnUULpPd03rtzsFiiygUS9ON8tG9P+snJWKe3ESf/Y6R7rl3BGXgcHpPHOa2IRblCIxGF0w8wUey/7YQp+cU0fvvuUdWCu4XWbR2yieCwFh/P/Z8kuLJDYG2wkfcOZ1zsBfCjLIJlVTja2TK11yFPO7rVsCnuc0VoxaB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il; spf=pass smtp.mailfrom=cohens.org.il; dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b=Rep0z2+f; arc=none smtp.client-ip=95.142.162.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cohens.org.il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cohens.org.il;
	s=default; t=1738142581;
	bh=Y2IAGmIOkGbJJ4sHjTuDoLB1h8Gmitahj3cG5jXpUcE=;
	h=From:To:Cc:Subject:Date:From;
	b=Rep0z2+fVB7bylrCG3HN8wSh9gTCFZjWqgBU5EcBCsrxY6icxPRKKGdZW0XbbZfYQ
	 GxvsJ4KCQ08/7MPfePzUFmGsOjL7m2xQN05RNqQoPNYrleu2wOAdTTkS6w9qTjenzF
	 NhG9+QqzCFNKkVYu6tUd3G/IaNkIo+9fWk5lSNqx7P8LC+r8fKtjFX9dgf/2A2PkEg
	 rxWp9OaFCTCQBiKuQd+alnaprNx/a4c5/QidmJuPc9KtzvzZbj8CI0q0hctWd9H6J4
	 Pr5ZOJ2UY6OzhIaHQmaL6lTdKVAdfkpZYRcBbCBpWoMcskXLZBToiYCF9IUi2forUw
	 8WYVEzkzBWjug==
Received: from malaclypse.mth.mellanox.com (unknown [10.2.0.10])
	by lemon.tzafrir.org.il (Postfix) with ESMTPS id 36C4440CB;
	Wed, 29 Jan 2025 10:23:01 +0100 (CET)
Received: by malaclypse.mth.mellanox.com (Postfix, from userid 1000)
	id 6015E8EA8C27; Wed, 29 Jan 2025 11:23:00 +0200 (IST)
From: Tzafrir Cohen <nvidia@cohens.org.il>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Tzafrir Cohen <nvidia@cohens.org.il>
Subject: [PATCH] Include symvers in kernel package
Date: Wed, 29 Jan 2025 11:22:15 +0200
Message-ID: <20250129092214.323886-2-nvidia@cohens.org.il>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change would provie kernel rpm packages that provide better
dependencies to kernel module packages that use the weak-modules
mechanism to allow modules to be used on different (but similar).

Specifically, this is intended for use with Centos-based systems
(tested with Centos >= 8).

rpm on Centos-based distributions will generate extra Provides
headers for a kernel if it finds a cmpressed symvers file in it.
Not just dependencies of type:

  kmod(foo.ko)

but also dependencies of type:

  kernel(foo_sym_bol) = 0x112233445566

And therefore if a binary kernel module was built with that specific
kernel, the package manager can check if another kernel provides
foo_sym_bol and of the same version. This is similar to the tests
that The weak-modules script runs at run time.

This change installs the file to make the information available to rpm.

Using gzip explicitly as with Centos 8 only symvers.gz is tested for.
See /usr/lib/rpm/fileattrs/kabi.attr . Centos 9 and 10 also tests for
symvers.xz .

Signed-off-by: Tzafrir Cohen <nvidia@cohens.org.il>
---
 scripts/package/kernel.spec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index ac3e5ac01d8a..06a792731282 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -62,6 +62,7 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEAS
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
+%{__gzip} -n -9 <Module.symvers > %{buildroot}/lib/modules/%{KERNELRELEASE}/symvers.gz
 if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
 	%{make} %{makeflags} INSTALL_DTBS_PATH=%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb dtbs_install
 fi
-- 
2.45.2


