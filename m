Return-Path: <linux-kbuild+bounces-5867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D39A41953
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 10:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA79D3AC085
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 09:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6499D12CDBE;
	Mon, 24 Feb 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b="Pxv15Mpw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lemon.tzafrir.org.il (lemon.tzafrir.org.il [95.142.162.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5798A24502A
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.142.162.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389911; cv=none; b=o2YDUGLawnzSihTGBFXSejyRHnGf8nwuTNQZ6Jawiza9x4LCC7OKy6QcfZCjoxFFMkzdQu0SVY6rbDnEb+omSuuJJsT1C9wP8SyWHXuIYgmWJWxjZErwzGHvIuh+Z1oQowi14kGKvUgek8/EcN+sGZih71HT6RqidgD3sAM1g0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389911; c=relaxed/simple;
	bh=WILyuv+duGpM++hT5o95aA9CchBzTIWjwb3ggo96JL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKGY4PUcGJtcl+efwS/TBqrx40cfxMRWFcbN6sDxiGNfOGCgwv7zFTiOQKt76KkeNyOIq0w/gsyZMYpsw4Om+Nz9khd/e567HMVThWb0epW0rCQSmBdXtJCXf8G/SSG7mXsevKry+VN9k0U9glSoMEsTJ454g58zDlCr/m043is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il; spf=pass smtp.mailfrom=cohens.org.il; dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b=Pxv15Mpw; arc=none smtp.client-ip=95.142.162.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cohens.org.il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cohens.org.il;
	s=default; t=1740389569;
	bh=WILyuv+duGpM++hT5o95aA9CchBzTIWjwb3ggo96JL4=;
	h=From:To:Cc:Subject:Date:From;
	b=Pxv15MpwaISqYufMuhE1YM0sqUTgplOyTaCmCtyYPNOKUOGlR2eOhZhsmNwCseDC9
	 L1+PvlpE3FhoBxzDwj7yDreDiKPmhD+xettJU3hOFlaZMK/ys/s35IvG+5KyV1s4me
	 hs1y5l5D+PMjFgA8ZfhRUOA70htMnbGeLgJYQV5CCE3P2ZhK/LF4xR2m75oimrP8Ie
	 Sy9kFQ/yMi/nRfdC+PR/lN4zp+7Nc3EOAAXppC+ylDjibfMaCjR8Y7tnXKNfab2ubP
	 fznInOOQ7i7nR0PR5sX6Dkf+QrpBKax1L+qCbl/2ylPFUmtdHVwAGBYXnKF559bOUQ
	 77h9+8wL+TDtw==
Received: from malaclypse.mth.mellanox.com (unknown [10.2.0.10])
	by lemon.tzafrir.org.il (Postfix) with ESMTPS id 4D45C8B8;
	Mon, 24 Feb 2025 10:32:49 +0100 (CET)
Received: by malaclypse.mth.mellanox.com (Postfix, from userid 1000)
	id 5866382B0CEE; Mon, 24 Feb 2025 11:32:48 +0200 (IST)
From: Tzafrir Cohen <nvidia@cohens.org.il>
To: linux-kbuild@vger.kernel.org
Cc: Tzafrir Cohen <nvidia@cohens.org.il>
Subject: [PATCH] rpm-pkg: Include symvers in kernel package
Date: Mon, 24 Feb 2025 11:31:50 +0200
Message-ID: <20250224093150.4040723-1-nvidia@cohens.org.il>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change adds an extra file to the generated kernel rpm package:
symvers.gz under the modules directory.

With that extra file, rpm-build on some systems (specifically many
systems based on Centos >= 8) can create better dependencies when
it builds binary modules packages using weak-modules.

Normally it creates dependencies of type:

  kmod(foo.ko)

but with the symver information available, it will create extra
dependencies of the sort of:

  kernel(foo_sym_bol) = 0x112233445566

And therefore if a binary kernel module was built with that specific
kernel, the package manager can check if another kernel provides
foo_sym_bol and of the same version. This is similar to the tests
that The weak-modules script runs at run time.

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
2.47.2


