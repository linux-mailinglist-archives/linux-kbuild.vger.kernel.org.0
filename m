Return-Path: <linux-kbuild+bounces-9053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F1BC6D01
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 00:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B6E19E2F01
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 22:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFAD2C21F8;
	Wed,  8 Oct 2025 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kba3TNbh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BA2C21F5;
	Wed,  8 Oct 2025 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759963625; cv=none; b=TkLApCV25En5PF05MKjTf/Y7UuVh+PtBtXMCWZ5+n8qePzMXOpLhag+pT9/gzBEfP4FKRkwLa10eNjf7H+R2NiqKEMWr7B+/PS5ySOCEFKEWf4ESU6OQpWtxcKiMDpzkyEN1cSIfBpHYkGNKp0Zgxy96mo6w9YF14Fgwg1GE0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759963625; c=relaxed/simple;
	bh=mw64TwJd2BQdFxVSO/KZsV1CoCKO+1PhICHSYCmN1dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQSg8XHQfZJ085oj+/M4K8HU1Cuq14CF5eSP/MEvRzewRhXVQeIBSxzKj8Kb1XRMlJBHMifQIOR1y8EBL+AJx3XOkQ69b806mNqw7U4EO+zmB8uydd7tJsbPDaV/1kSIP5mGH+VfdYIpiomwtkdXjmcJZ7BTIP+PBmzBz2/M0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kba3TNbh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74ADEC4CEF8;
	Wed,  8 Oct 2025 22:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759963625;
	bh=mw64TwJd2BQdFxVSO/KZsV1CoCKO+1PhICHSYCmN1dc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kba3TNbhJlx+vlaSdPPb0r9ERKRCnSRMu31MAFZb+1scifn2kCRf49BBWxOxWbuEv
	 GccUwhDt0EU8QxMfJm4ZSkdm7kOERZFB36ljnpevQ4Y5inRu5sGPVs0CvagDTlSoSD
	 EUxxBPScah6vygn984ALmxorAiKRVw/+B1Yua6/ups+Ph/t7nXtSTfurHDHCbU27c3
	 bOALhnMkK4Qtafoqa9eBRShcL2PLrpMPujYcjOD82dZlJ2twGHJRhUO0o6nC6wuXkF
	 1o25As2+GAB8u4zt1+j2bfPCwLZk9oFHj3GKuFGKFy++9NI4eq5qBKJjWgXCRCKXME
	 +B2uNAFixD6Kg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 08 Oct 2025 15:46:44 -0700
Subject: [PATCH 1/3] kbuild: Restore pattern to avoid stripping .rela.dyn
 from vmlinux
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-kbuild-fix-modinfo-regressions-v1-1-9fc776c5887c@kernel.org>
References: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
In-Reply-To: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=nathan@kernel.org;
 h=from:subject:message-id; bh=mw64TwJd2BQdFxVSO/KZsV1CoCKO+1PhICHSYCmN1dc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnPXj6OrPyvJsT6srRn6a/u1GXXXpbwzpR6lHHlT7Xnt
 ScLoyuDO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE/DgY/pdK7/Jb9q7hv1Wi
 tPIP8SjvnVyb5H89k77BPVs8IePeDRWGf0Z6ut518RIlMWpzPzmVdru++ylVfHQv42Pt+PkvGAt
 nsAAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit 0ce5139fd96e ("kbuild: always create intermediate
vmlinux.unstripped") removed the pattern to avoid stripping .rela.dyn
sections added by commit e9d86b8e17e7 ("scripts: Do not strip .rela.dyn
section"). Restore it so that .rela.dyn sections remain in the final
vmlinux.

Fixes: 0ce5139fd96e ("kbuild: always create intermediate vmlinux.unstripped")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 scripts/Makefile.vmlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 7c6ae9886f8f..a62639982be5 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -82,7 +82,7 @@ endif
 # ---------------------------------------------------------------------------
 
 remove-section-y                                   := .modinfo
-remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
+remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
 
 remove-symbols := -w --strip-symbol='__mod_device_table__*'
 

-- 
2.51.0


