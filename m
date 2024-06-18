Return-Path: <linux-kbuild+bounces-2188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D6C90CA03
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EABAF1C23A2A
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9CB158D66;
	Tue, 18 Jun 2024 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxYmgOKs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16EC158A33;
	Tue, 18 Jun 2024 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708941; cv=none; b=gxB7fjRW9wG1Rp9Tfcar69Gk3dz+74n+5XVFcYaD8iNTG7A36Y35yw2s+iYi0uUYsPGlGeJ8XBbPjQclyb+E5AZjmLoiBKtPXx1d0R3rVch2R1qzZirENv0dH+vmIy/ck2FpUEsZQfTEZ+vvVHav8xSz++dcFHVFJZCcTupF8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708941; c=relaxed/simple;
	bh=ourcXE8gsxQXDPWP/FsjoEel445tJ1cvyruTWu93Hko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jaIYjb64xkdfSf1fgWqRggb64sa2potbDTuGEOgFtBQwVA/uPX/amUX8MFVjL4XjX9GBaM2hQ47+FmSUV/TGIAuVBQ9TfSUVtDG0qmlWGbfjXWTmAt69DcQrWBv1u5l2xMRmfzteJMeQgjhq5UYeI5gm+Qs5o7godmud0E5XH/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxYmgOKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45996C3277B;
	Tue, 18 Jun 2024 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718708940;
	bh=ourcXE8gsxQXDPWP/FsjoEel445tJ1cvyruTWu93Hko=;
	h=From:To:Cc:Subject:Date:From;
	b=hxYmgOKspZBTpPKaPNxKbPErTIbadnDNhAIoNyjcfXmRY70AXMtVT0rfxG/Kwezhu
	 oxw2MMQYyoxOu5gyfZ76sAlcP8tOuehF7anD9oYlxyoLLbEzTZH0Ra+HDc7Ni8SXyB
	 8r+4smbAWntIEgZk8h2zHWSJI3xeEyK5scEYTju4BoSlKKpLalV0U/zfaPd88O91/N
	 tHuwPvqd0rqWSFFIG0rEOZmLtvKN9V8zMKsqtt5SYNqCDvVlDK2TH8st8Mbiy7yi9T
	 I3K/TBBlQ/WwVgvwLLe8d7g/0WPv5AD1u5dCz2bGS9Sd60Bxfr/CsIm07+C08A/07A
	 ziCWIGIbnWDHg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] kbuild: rpm-pkg: fix build error with CONFIG_MODULES=n
Date: Tue, 18 Jun 2024 20:08:43 +0900
Message-ID: <20240618110850.3510697-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_MODULES is disabled, 'make (bin)rpm-pkg' fails:

  $ make allnoconfig binrpm-pkg
    [ snip ]
  error: File not found: .../linux/rpmbuild/BUILDROOT/kernel-6.10.0_rc3-1.i386/lib/modules/6.10.0-rc3/kernel
  error: File not found: .../linux/rpmbuild/BUILDROOT/kernel-6.10.0_rc3-1.i386/lib/modules/6.10.0-rc3/modules.order

Specify the directory path, /lib/modules/%{KERNELRELEASE}, instead of
individual files to make it work irrespective of CONFIG_MODULES.

However, doing so would cause new warnings:

  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.alias
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.alias.bin
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.builtin.alias.bin
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.builtin.bin
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.dep
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.dep.bin
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.devname
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.softdep
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.symbols
  warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.symbols.bin

These files exist in /lib/modules/%{KERNELRELEASE} and are also explicitly
marked as %ghost.

Suppress depmod because depmod-generated files are not packaged.

Fixes: 615b3a3d2d41 ("kbuild: rpm-pkg: do not include depmod-generated files")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Do not run depmod

 scripts/package/kernel.spec | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index e095eb1e290e..fffc8af8deb1 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -57,7 +57,8 @@ patch -p1 < %{SOURCE2}
 %install
 mkdir -p %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinuz
-%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} modules_install
+# DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
+%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} DEPMOD=true modules_install
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
@@ -70,10 +71,7 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 %endif
 
 {
-	for x in System.map config kernel modules.builtin \
-			modules.builtin.modinfo modules.order vmlinuz; do
-		echo "/lib/modules/%{KERNELRELEASE}/${x}"
-	done
+	echo "/lib/modules/%{KERNELRELEASE}"
 
 	for x in alias alias.bin builtin.alias.bin builtin.bin dep dep.bin \
 					devname softdep symbols symbols.bin; do
-- 
2.43.0


