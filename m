Return-Path: <linux-kbuild+bounces-9054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D403BC6D07
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 00:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A285834DB6D
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 22:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3DF2C2369;
	Wed,  8 Oct 2025 22:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4cbxvcV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AF2C3257;
	Wed,  8 Oct 2025 22:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759963627; cv=none; b=GJJlBfm2pHlHdXUh8Q9y5PD66vVikdQJVBzqFVV1EhyOfBpBfwZFpR+q3lzKPsfLTzQLSqBABKVVajdDhUvhvhoT51fUXWI74Zx1edM8WGKYKYfSUkI0k5c96pgYCw9w1A5YOhewErOmNc5DjKnh+01VZi7dOWbvmJUB3PEGSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759963627; c=relaxed/simple;
	bh=Miox2e7D4Y8F1UCWvEmLj46ApSv2AyJ67frrLhbvL+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lomhR6v/mUw8320rQqJWKoge/vMU+Ed48VNoNVZ4RtGlMeI1fu+vcuwQhv7VjI8kWj9C5IL9mRx2s3GhexkomscYKv6koPI20TF04RqX55z44kmfUBosejQ6a67qdrTN73twIzDLLUw/b6fXKLabOChNuGaTZStd79o3hllM2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4cbxvcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7081BC4CEFE;
	Wed,  8 Oct 2025 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759963627;
	bh=Miox2e7D4Y8F1UCWvEmLj46ApSv2AyJ67frrLhbvL+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r4cbxvcVji4gTBzQZXb4gKR1iVu60nWpXmuefZ11V/AUdvP7Fwhq99K9bAU7UIz8T
	 dJmRJ3Xtq6xGCQxFaFp4zguGgF7Tk+CPSMvHc/3aDEY40uHiR4ESXtPvaNAQ8znKPC
	 NtU7QapmoeaBTxNuym+MQ/6Kmep/dRGk0FIMwWi1+xn9Vl/kwfe1/IKQ/CFCeFtdm9
	 1uy2Mz58LWkONN5vWdGnARVwcVF0UEl9kzzRGSUhy1Ej6Nbj32X8wIAMMtdcYPWupG
	 lYhzch529K5874MZrCUGtKAL5w8xt1ljlYljvy+Rlv6EgbNl78tsWx5YE+W7RuqeG+
	 SsQ8DawCp50Xg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 08 Oct 2025 15:46:45 -0700
Subject: [PATCH 2/3] kbuild: Add '.rel.*' strip pattern for vmlinux
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-kbuild-fix-modinfo-regressions-v1-2-9fc776c5887c@kernel.org>
References: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
In-Reply-To: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2054; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Miox2e7D4Y8F1UCWvEmLj46ApSv2AyJ67frrLhbvL+s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnPXj4+UyjfJLjNhGfPuvRjqsL7dR7qZ//xNG6Qkl796
 2TEb2eBjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRNG6G/8m6x2QT1FL5L0dY
 HbvmfeH8ayGj64923pzx1//aHKbpOrMZGZ54Pf/y8cSjC4rK/TYXj4d9VuO7sHnBtbp53Bl+lc1
 rbnEBAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Prior to binutils commit c12d9fa2afe ("Support objcopy
--remove-section=.relaFOO") [1] in 2.32, stripping relocation sections
required the trailing period (i.e., '.rel.*') to work properly.

After commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
vmlinux.unstripped"), there is an error with binutils 2.31.1 or earlier
because these sections are not properly removed:

  s390-linux-objcopy: st6tO8Ev: symbol `.modinfo' required but not present
  s390-linux-objcopy:st6tO8Ev: no symbols

Add the old pattern to resolve this issue (along with a comment to allow
cleaning this when binutils 2.32 or newer is the minimum supported
version). While the aforementioned kbuild change exposes this, the
pattern was originally changed by commit 71d815bf5dfd ("kbuild: Strip
runtime const RELA sections correctly"), where it would still be
incorrect with binutils older than 2.32.

Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7 [1]
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYvVktRhFtZXdNgVOL8j+ArsJDpvMLgCitaQvQmCx=hwOQ@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/Makefile.vmlinux | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index a62639982be5..c02f85c2e241 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -83,6 +83,9 @@ endif
 
 remove-section-y                                   := .modinfo
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
+# for compatibility with binutils < 2.32
+# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
+remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
 
 remove-symbols := -w --strip-symbol='__mod_device_table__*'
 

-- 
2.51.0


