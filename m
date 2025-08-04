Return-Path: <linux-kbuild+bounces-8283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915CB1A479
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 16:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6C517E3FF
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 14:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E88026FA57;
	Mon,  4 Aug 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oP+nNv0M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A66026B77D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754317228; cv=none; b=KzEGYCZ5aVBgXgOMTGpI1RP6YVZtD5BMdQOm5SK7glpii9X0VNhr6EHg/VGiihh9VUYeDWtUAMW62+zYmmdfW/hY2qpaUg8E967m64t6eL8qsGrPWBqbP9XWPA53Q2J+5wpXPZvrxzN5ZiGSIUHJ8d4FWGEczyf9tUx6S+ACRZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754317228; c=relaxed/simple;
	bh=LYnlNYESOsCzrryaITLezUf8Iw6CcuykLnbpYkC0+pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SyjeIBksXBz12MK6/w9m2q9BwVQVjAxhNcPo0AcdWI3BWJyjqXHtnsNdWofg6/JZf6r86Xt/y2cr/RRYC7ehfjZch/OWjM5wFXSJNx8yER7tVmSYFhKDXcsv2W359SSZlaIIOqMxCkKDEyMJnwZZha9Xpb6FU2LyHv+El/I7skE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oP+nNv0M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4E4C4CEE7;
	Mon,  4 Aug 2025 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317227;
	bh=LYnlNYESOsCzrryaITLezUf8Iw6CcuykLnbpYkC0+pE=;
	h=From:To:Cc:Subject:Date:From;
	b=oP+nNv0MXWXFDkVlPb9t7L0HhsKf3i9LjBjjWCyKMUWf7PBztoVQm0EwebbNhKuzN
	 neHmAY9XThKjLVcOLwt9k+mcSDG2wXOQRGft1AvB7bFhxr2cCBj+/EfvC5TwhKFhWm
	 cdoBnSQDAQtHYLd2if7Xio5aE8fEpfcTiuHqgmd/JKhWJRpPzHeTwVj5Gh8w/UtwPF
	 mhLqvRgUk/dULCxlPVf2q5YMx8tIJ6Izqk2hLsxp1hVJNZbSCe90QeYL5OBcY8WYwR
	 TZGJHWj8gIb/uwxLmZsRbwuj1mmEew8uqnZuWYsuMBwJS60sgmgv8r1ADHyOzGXsOd
	 AmE2FoDwP1k5A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] MAINTAINERS: hand over Kbuild maintenance
Date: Mon,  4 Aug 2025 23:20:07 +0900
Message-ID: <20250804142007.776418-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm stepping down as the maintainer of Kbuild/Kconfig.
It was enjoyable to refactor and improve the kernel build system,
but due to personal reasons, I believe it's difficult for me to
continue in this role any further.

I discussed this off-list with Nathan and Nicolas, and they have
kindly agreed to take over the maintenance of Kbuild with Odd Fixes.
I'm grateful to them for stepping in.

As for Kconfig, there are currently no designated reviewers, so the
maintainer position will remain vacant for now. I hope someone will
step up to take on the role.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Nicolas Schier <nicolas@fjasle.eu>
---

More context.

I am having a health issue. I've been pushing myself, telling myself
'just a little more,' but feel that it's no longer sustainable for me
to carry this responsibility long-term. I decided to dump the maintenance
burden and have more restful time with my family.


 CREDITS     |  6 ++++++
 MAINTAINERS | 13 +++++--------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/CREDITS b/CREDITS
index 45446ae322ec..d134a8a63fa4 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4369,6 +4369,12 @@ S: 542 West 112th Street, 5N
 S: New York, New York 10025
 S: USA
 
+N: Masahiro Yamada
+E: masahiroy@kernel.org
+D: Kbuild Maintainer 2017-2025
+D: Kconfig Maintainer 2018-2025
+S: Japan
+
 N: Li Yang
 E: leoli@freescale.com
 D: Freescale Highspeed USB device driver
diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..af3c328bf33a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12987,11 +12987,9 @@ F:	mm/kasan/
 F:	scripts/Makefile.kasan
 
 KCONFIG
-M:	Masahiro Yamada <masahiroy@kernel.org>
 L:	linux-kbuild@vger.kernel.org
-S:	Maintained
+S:	Orphan
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
 F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
@@ -13056,13 +13054,12 @@ S:	Maintained
 F:	fs/autofs/
 
 KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
-M:	Masahiro Yamada <masahiroy@kernel.org>
-R:	Nathan Chancellor <nathan@kernel.org>
-R:	Nicolas Schier <nicolas@fjasle.eu>
+M:	Nathan Chancellor <nathan@kernel.org>
+M:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
-S:	Maintained
+S:	Odd Fixes
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
 F:	Documentation/kbuild/
 F:	Makefile
 F:	scripts/*vmlinux*
-- 
2.43.0


