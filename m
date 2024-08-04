Return-Path: <linux-kbuild+bounces-2801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5E946C0E
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 05:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBCC51C210CC
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 03:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7D829A5;
	Sun,  4 Aug 2024 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxSIrgiF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343B23D2;
	Sun,  4 Aug 2024 03:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722742394; cv=none; b=NJlvqlkyGxrWgLDke1fh/owy5Cku8RS+G9Ij6vKgmFlRI2aW2/oz18+jTt91M5qQ6U0J8K0ps3p8yEj+yeXOlnki/4MPtVJhfOSYyx5lwNLXQICc0Fvcct3lOe0uAlMK9eCfTePZ9Gjuwd3b8I6Z5RISn2QkrnoqYUFa1x/0jf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722742394; c=relaxed/simple;
	bh=tG5F7G63lJm60LqxHyERkf+AVX+0ZwPG5mG0rZ7QYSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5PvNchHP1uSsxTVRv49Q/P/pGGyhm4uQrYNvJRej0FeCj3cxdDQXZbxYQzokbop0VSuYueS64reC3TT5kT42ajwltFIrCXzIPNh6lSnuA/Pl+c3ol98UFuP0OoBjDu9VYBpHHDreQ79hgAhVNnceY6jedbvmu6u4WNhAk+/M+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxSIrgiF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11706C32786;
	Sun,  4 Aug 2024 03:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722742393;
	bh=tG5F7G63lJm60LqxHyERkf+AVX+0ZwPG5mG0rZ7QYSw=;
	h=From:To:Cc:Subject:Date:From;
	b=HxSIrgiFg5/q1O5kX+AVD2I4oWfjV77W5WGjudx3/IhiPYhttG2qTbFUBpRKTxvhV
	 owUhubPaBT91c+b/iDk5SrSeoupeuh2ZL5G+Fy9CnmMhETQa6Znbp+trTqDGTH/3w6
	 aXkfL5Y5VkM0os8P2axKwWPXS8dA5ctKHEHaQ4IG4YQlKoQcp+1bq9cEaI7nbvA3jP
	 NLEiLq3AzAMr+qlLey/6vCyKDOkznag4S+JJSpCIUJ11PgYpOV1MgEgzuFgB8LjB8e
	 kNji7WxrHLx0Sjs1ERNn4IZweqdYQGoXtB2L2q4mCnuRY8aAOhDKev1+quacu22HX+
	 IYa4dJX+PZuCw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: modinst: remove the multithread option from zstd compression
Date: Sun,  4 Aug 2024 12:33:07 +0900
Message-ID: <20240804033309.890181-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parallel execution is supported by GNU Make:

  $ make -j<N> modules_install

It is questionable to enable multithreading within each zstd process
by default.

If you still want to do it, you can use the environment variable:

  $ ZSTD_NBTHREADS=<N> make modules_install

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..04f5229efa6b 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -146,7 +146,7 @@ quiet_cmd_gzip = GZIP    $@
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --check=crc32 --lzma2=dict=1MiB -f $<
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
+      cmd_zstd = $(ZSTD) --rm -f -q $<
 
 $(dst)/%.ko.gz: $(dst)/%.ko FORCE
 	$(call cmd,gzip)
-- 
2.43.0


