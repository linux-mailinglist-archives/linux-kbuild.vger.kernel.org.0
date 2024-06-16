Return-Path: <linux-kbuild+bounces-2141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195A5909EA7
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 19:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD08F281466
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 17:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CEF1B27D;
	Sun, 16 Jun 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwsLoI1f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24A417C6C;
	Sun, 16 Jun 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718557523; cv=none; b=WYE7Tl8hf8pyVk9zHAcQ52cD4JFqDmLrsX/qPbCwbvQASdfWlahbm0Sug+aDr/++64TaqhYq2VQcVYuWp/8e5LaOQFZwJBgDg42HUh8nGwC3jjcwwzZbWHdUhXQTYejpSdWaz1rG/KE0YRyPA+DMwzzbBFDTxIW7r8Hm8x3WllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718557523; c=relaxed/simple;
	bh=AvVFXBmaRKZ3IkMR6+O46wT55Rea5v5gMREnmMLSW8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aedJ/BArGzW+19YNM86pJu8EX7yu2sFobpFtFfWNxugi2XKeJhSaLqHu0t8TtVHD2DfYuoFFECmfcvzJgbYdCOi7/ZkcEKlUYES/degxa9/ywe1NIBbx8P0ONaLV3YqXJuhEIuA7UFB2fKARt30hGdQxX44nVOP5mUHsBuIhuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwsLoI1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBC4C2BBFC;
	Sun, 16 Jun 2024 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718557523;
	bh=AvVFXBmaRKZ3IkMR6+O46wT55Rea5v5gMREnmMLSW8c=;
	h=From:To:Cc:Subject:Date:From;
	b=nwsLoI1f25BiMZmUstc7WSHWdzuqCqBaTaWxXPLKsURHoNubxYB0PkjpBPIXAz//X
	 /7gzdHo/W+g7ULlWpcsaEXttmJ49w+rb856oBKOpaZ/dfO+RQvImY7ikSogiTltboD
	 Mzk+iiOk1pvI3GoivDZSASHk+g2WnV2bCrwBGI3nIH+9stpo8eKds0OEl3O3TNxjWQ
	 Yq8wV+zt2dYSJudUEpw9PPsgvzElLHyqpyKGpLmGVZnIFLABVk9Un9ZHi2itopJwzu
	 pAeH9VttWwN/wN4ZBkAxtaT7Nu2c2J8uWb3b2/zWxpD05KqT+vk+rBSci/7Ds4//ew
	 8Uty1eLYs4Udw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: rpm-pkg: fix build error with CONFIG_MODULES=n
Date: Mon, 17 Jun 2024 02:05:13 +0900
Message-ID: <20240616170516.502261-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_MODULES is disabled, 'make (bin)rpm-pkg' fails.

  $ make allnoconfig binrpm-pkg
    [ snip ]
  error: File not found: .../linux/rpmbuild/BUILDROOT/kernel-6.10.0_rc3-1.i386/lib/modules/6.10.0-rc3/kernel
  error: File not found: .../linux/rpmbuild/BUILDROOT/kernel-6.10.0_rc3-1.i386/lib/modules/6.10.0-rc3/modules.order

Fixes: 615b3a3d2d41 ("kbuild: rpm-pkg: do not include depmod-generated files")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/kernel.spec | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 19e458341f45..f1c7a5ea338f 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -70,13 +70,11 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 %endif
 
 {
-	for x in System.map config kernel modules.builtin \
-			modules.builtin.modinfo modules.order vmlinuz; do
-		echo "/lib/modules/%{KERNELRELEASE}/${x}"
-	done
+	echo "/lib/modules/%{KERNELRELEASE}"
 
 	for x in alias alias.bin builtin.alias.bin builtin.bin dep dep.bin \
 					devname softdep symbols symbols.bin; do
+		rm -f "%{buildroot}/lib/modules/%{KERNELRELEASE}/modules.${x}"
 		echo "%ghost /lib/modules/%{KERNELRELEASE}/modules.${x}"
 	done
 
-- 
2.43.0


