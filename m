Return-Path: <linux-kbuild+bounces-6188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18979A634C7
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 10:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E7C3B0ECF
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 09:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB3119047A;
	Sun, 16 Mar 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b="OB9IafR/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lemon.tzafrir.org.il (lemon.tzafrir.org.il [95.142.162.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD89828F4
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.142.162.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742116906; cv=none; b=YuCjQv2lplagnu4s5npbO/cFZcbciJNDuUWTz/wdwb4THwxGVFSsyirv3pOjdThM3yJfYdGfIWV9el/LDzVXxfm3HELQCfLc0/0s5x4d4nW9AK/3aqFw1rOhs3J7FGE2VU0azBvaoP2ZMH69EQAqAx0/H43SL8qdJw/s+oljkbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742116906; c=relaxed/simple;
	bh=WILyuv+duGpM++hT5o95aA9CchBzTIWjwb3ggo96JL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTT7K+P8cezMxWoGm7TKuqbLQEVyIR/Hzn4XbOETb8dg4ZUsgdzPZL9Wr8MppNpJUzgEBFIi3Mc4O5noiIvHSqibUa2/D6RQVN8eKePO73aMsrAFLImZ17iTiq+XT/FuHXYXNnf56L3xwgIh/Gh1AHNVeUzrIVydmlrN1RqVC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il; spf=pass smtp.mailfrom=cohens.org.il; dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b=OB9IafR/; arc=none smtp.client-ip=95.142.162.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cohens.org.il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cohens.org.il;
	s=default; t=1742116299;
	bh=WILyuv+duGpM++hT5o95aA9CchBzTIWjwb3ggo96JL4=;
	h=From:To:Cc:Subject:Date:From;
	b=OB9IafR/LUL6YkD7VSUny4OiR1l9/5VNZkqaXmOhBEm2GFew2r16OSsqXpSr02sGN
	 dBH1yD5/2JHwN/gLqUc5Vy/sZED1HQX7B2lLO0+ilT4KlveyX6O/k2FnmgzofQmq5a
	 Y1mY+yHa2XTtWwO8+PQ7nUMJb+PWajL3vzPAcokO23RU60ITtBL1cu7lfPHtfOkZN+
	 34rUEi9FRmplEZBm4Ii7RDk0as+yg/d3sUMP4mhpWIEjhivvs5oRylm+1kMSwRLSHu
	 v0EVsGruUee5MOGUfCofW0AhQyT5CzN+H6SjwSkOmHNr8Eyt3W6dpNgUy2sonvWOoT
	 k970Rwxh+brHQ==
Received: from malaclypse.mth.mellanox.com (unknown [10.2.0.10])
	by lemon.tzafrir.org.il (Postfix) with ESMTPS id 513DD277E;
	Sun, 16 Mar 2025 10:11:39 +0100 (CET)
Received: by malaclypse.mth.mellanox.com (Postfix, from userid 1000)
	id 3F4A782B7331; Sun, 16 Mar 2025 11:11:38 +0200 (IST)
From: Tzafrir Cohen <nvidia@cohens.org.il>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Tzafrir Cohen <nvidia@cohens.org.il>
Subject: [PATCH] kbuild: rpm-pkg: Include symvers in kernel package
Date: Sun, 16 Mar 2025 11:11:10 +0200
Message-ID: <20250316091110.229931-1-nvidia@cohens.org.il>
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


