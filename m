Return-Path: <linux-kbuild+bounces-7074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B7AB266A
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 05:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5F9860184
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 03:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4903D16DC28;
	Sun, 11 May 2025 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YU7nUwig"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B32F2E;
	Sun, 11 May 2025 03:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935733; cv=none; b=a4yW1KJZPdAB6EZhcOTCFioONOnSAU68YtrKfdYPSkmFpnTbtIFTqXFlWLOQEMyafqTat1KaMKXCe38x/ZGpgxOiZPApY3nRnarepr/Ntj4fysE+TZ3abOZ8ETRnopWGl59NjHzdjzUsxo4/AzAj9e59X67idZ2xT4BAVrVkvFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935733; c=relaxed/simple;
	bh=SQ4F6Ml3a0lz5ZvN0drFvwi1BQZ3/FVB4vwPb0hxBgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E47x4N9l3b7gEFEA0f2fa6lSmcpkWFSrKOFSn8MpbSjyGEZx2fHObX6Pi4H7rVYE8JPOx/lVeIjGlNfo/1CCK3AKN+pvZO8ka76NYaeVZc2z7b/5Cw4g+DdtQjqI4VDU0PtvyixwdnYCcZ12ktUKegNjEKzOTF6LuSBEk2ogg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YU7nUwig; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA50C4CEE4;
	Sun, 11 May 2025 03:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746935732;
	bh=SQ4F6Ml3a0lz5ZvN0drFvwi1BQZ3/FVB4vwPb0hxBgg=;
	h=From:To:Cc:Subject:Date:From;
	b=YU7nUwig3ncfr1W28EQKoyvtSXqelqNil7RJOZEEua7sjnHFaV7lhIpVYAcvUPF7G
	 GEEhT8go5w05NefskNEuoduDDuerDaNstjPtoXvZp1PzFiAuk506Xh3Up3HsXcOqK/
	 vrOgUGyS9Af80H5pgtt36t1ZN6C8s2C5ttb7GJ7b+vJPXP4osUoGkQ52pIjdMV4o6h
	 QvZ24zy0UOKXWXRv233rfTZn0jrlluK3LIYbs0o9iW4WqK1hVdTQMilYMd46/diXkK
	 7PwhTyeA/iUFZZ2AJ4qMitUM6Kk8tehRpQZw/eDy+2IshZSGiVWfzXh6IrQVlVtn4M
	 kDdjTP64PeaGw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH] kbuild: fix dependency on sorttable
Date: Sun, 11 May 2025 12:55:19 +0900
Message-ID: <20250511035522.62273-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ac4f06789b4f ("kbuild: Create intermediate vmlinux build with
relocations preserved") missed replacing one occurrence of "vmlinux"
that was added during the same development cycle.

Fixes: ac4f06789b4f ("kbuild: Create intermediate vmlinux build with relocations preserved")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.vmlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b0a6cd5b818c..d14ab3409da6 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -94,7 +94,7 @@ $(vmlinux-final): $(RESOLVE_BTFIDS)
 endif
 
 ifdef CONFIG_BUILDTIME_TABLE_SORT
-vmlinux: scripts/sorttable
+$(vmlinux-final): scripts/sorttable
 endif
 
 # module.builtin.ranges
-- 
2.43.0


