Return-Path: <linux-kbuild+bounces-2503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE74930998
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 12:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ACCE281EEF
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 10:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9283282FA;
	Sun, 14 Jul 2024 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqMARO1b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858EEDF6B;
	Sun, 14 Jul 2024 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720954733; cv=none; b=JWq5GLtoPZllz5V0xkHtfjxafbm4IFYiUS/c0uCMtXrpJnwSFcHL4mq2sdZS3cHGFg6v2TMCw7o97jyNxSQSx1zUFrA+3br1gW9/Fsfe1/mY9IktEomtVLq7coDYbIZ5jHKhRu1p/wiPw7RTBVPhUASwiRdwWWtWrJG+ned3RBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720954733; c=relaxed/simple;
	bh=uOJ+OtY00HuTMViIhxCbV5cuxb/lRfWu2i5PHKqD1r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJl07TIHfLL0flHZfwcxNukc7AyuYaIFAyTlipR8OwOlMqjU1QJADvrsnfWW/aozsDmjvGvT1gn85YFYVhAfrmLnf1Bi6kRZBugI4By4DZXptdvZd4Qaz97n4hgHsTPL/jNSgl2ls0PraUA9naVm+x1pbf8d01bjZ8AlyeeyUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqMARO1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC730C116B1;
	Sun, 14 Jul 2024 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720954733;
	bh=uOJ+OtY00HuTMViIhxCbV5cuxb/lRfWu2i5PHKqD1r0=;
	h=From:To:Cc:Subject:Date:From;
	b=pqMARO1blzm9SCWaeJfTbrTKImdo2vR7/55V3liFtoM1rXWFaeXGyQkwNVp7M/Q+g
	 R8h+UR4MhPmSGul2cVPmzkJx4ePBtPpAey5kgk7ftsVWQcrEIcEfkWG74uqR+W3CbU
	 2n7KPXaAD5L02OQQYlRh4BPhk4z4EkLK4GQ9SurpR4cv0GXj/Szl1pHgaK58B5Egg/
	 iXEzzvBNRqxIDN7sExl04Y8qS8ykpwpoKnIqyt62ZZaMyEiJpvf3hYHS9LqjAppJd5
	 BqzkHwkE9Co2gXv1T/vM7NHUoaZm1i2sYEd/70meJ7j1RgcOe6MCu1gOOXE02h3i5r
	 N/MENjufsidbA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
Date: Sun, 14 Jul 2024 19:58:46 +0900
Message-ID: <20240714105848.1844400-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The condition 'select HAVE_ARCH_KASAN' is always true because
there is 'select HAVE_ARCH_KASAN' statement above.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c87d16b12e9b..d37cbfc3031e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -167,9 +167,9 @@ config ARM64
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN
-	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
-	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
-	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
+	select HAVE_ARCH_KASAN_VMALLOC
+	select HAVE_ARCH_KASAN_SW_TAGS
+	select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
 	# Some instrumentation may be unsound, hence EXPERT
 	select HAVE_ARCH_KCSAN if EXPERT
 	select HAVE_ARCH_KFENCE
-- 
2.43.0


