Return-Path: <linux-kbuild+bounces-5169-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD89F6341
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 11:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 279EF188062D
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158171552EE;
	Wed, 18 Dec 2024 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9uUScFZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109D50276;
	Wed, 18 Dec 2024 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518241; cv=none; b=NMk9QqL5GAblUBQSwnOLdyn0beeDumeE+5cGJna2sY9KYmZfGohARnzhEwmnm4rsL0i7g6VUjiWz1scOgdtaQglpavHueTH2bCtAm3Dh+n5oulfw84PciUxdkhtIj2hcIJBlbyU0zqjR/sJ+AXi29v+vgtkLHRZcr7L83HXc17U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518241; c=relaxed/simple;
	bh=YU5c6gwvgdr0VNrIgg0SvVhOcUnbXO4oTy6HqdAT8as=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTzhVEFkGvnhwaQ0UoWzzNPEYLQdvqvNOO8ioPknyA8lsR+AU14OxA39qvnXpJlC8zh+i0UmTMHhvnMPaJbeK4tlHPtTTP0bfl1Sj4QFBbUfY4a4HSVtTXGTYqGTpMpc1jNXuG2V9cp7nwq/UgHeLTVKLgvwuuKfa738PGMUAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9uUScFZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2A5C4CECE;
	Wed, 18 Dec 2024 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734518240;
	bh=YU5c6gwvgdr0VNrIgg0SvVhOcUnbXO4oTy6HqdAT8as=;
	h=From:To:Cc:Subject:Date:From;
	b=M9uUScFZKm/czI6oBqGJNhkogb5szbKH2iFIHfegrEVuvIYLql8SEbMq5OEI9QLAx
	 mB1Jilrz6sZ3IeYh+qSuBp3AAVxw9/dsOBgo7WbQlhltQihWZrnA/Z8e9VkJDyyXqa
	 ead6Na8xnUaoXCAHP1rGwx6Sl3+Xizl6heYq5Ryo9AJR4hNer/Un0wCC5NSff5TyNQ
	 /9djwhgd/UkzoV8UTnouXScCRook3U2YVHZUOnOrA3H5tEAOHql3D4CerLjJJ9drIi
	 cJ6EVMiNVvrm4fhI5GfZuCf5xxM7lAuxJajPXv/1KWjenUbihxWmTv2meRL4niK079
	 t0Q2PCKqGiDFg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/4] kheaders: exclude include/generated/utsversion.h from kheaders_data.tar.xz
Date: Wed, 18 Dec 2024 19:37:05 +0900
Message-ID: <20241218103716.137489-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_IKHEADERS has a reproducibility issue because the contents of
kernel/kheaders_data.tar.xz can vary depending on how you build the
kernel.

If you build the kernel with CONFIG_IKHEADERS enabled from a pristine
state, the tarball does not include include/generated/utsversion.h.

  $ make -s mrproper
  $ make -s defconfig
  $ scripts/config -e CONFIG_IKHEADERS
  $ tar Jtf kernel/kheaders_data.tar.xz | grep utsversion

However, if you build the kernel with CONFIG_IKHEADERS disabled first
and then enable it later, the tarball does include
include/generated/utsversion.h.

  $ make -s mrproper
  $ make -s defconfig
  $ make -s
  $ scripts/config -e CONFIG_IKHEADERS
  $ make -s
  $ tar Jtf kernel/kheaders_data.tar.xz | grep utsversion
  ./include/generated/utsversion.h

It is not predictable whether a stale include/generated/utsversion.h
remains when kheaders_data.tar.xz is generated.

For better reproducibility, include/generated/utsversions.h should
always be omitted. It is not necessary for the kheaders anyway.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/gen_kheaders.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 383fd43ac612..a0e3fbf4afa4 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -83,6 +83,10 @@ for f in $dir_list;
 	do find "$f" -name "*.h";
 done | cpio --quiet -pdu $cpio_dir >/dev/null 2>&1
 
+# Always exclude include/generated/utsversion.h
+# Otherwise, the contents of the tarball may vary depending on the build steps.
+rm -f "${cpio_dir}/include/generated/utsversion.h"
+
 # Remove comments except SDPX lines
 find $cpio_dir -type f -print0 |
 	xargs -0 -P8 -n1 perl -pi -e 'BEGIN {undef $/;}; s/\/\*((?!SPDX).)*?\*\///smg;'
-- 
2.43.0


