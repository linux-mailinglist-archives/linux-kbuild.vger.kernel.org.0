Return-Path: <linux-kbuild+bounces-3589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4A97B12F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB50A1F22F41
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F1517CA02;
	Tue, 17 Sep 2024 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6XnzA1K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC4317C9A7;
	Tue, 17 Sep 2024 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582656; cv=none; b=M5ozGpkalMn59j+0mPxYabqUNw0xmUJg9wtNlpD+/Zz2X8Kkd4sQp/nE+6wpyXLOXU2M6vhbVgBJ4Ik/gyL/Yo0ZXQiLTlw2QGR8wRfvaupPi3NtPj1rpo5iEgDY8elXuVQNANrQzhQiHzabTAp+4CyheSEqNYdBU0hhBs4exzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582656; c=relaxed/simple;
	bh=i2X5CGYdAQj7D1JJrAj+pHMkEjk/Y29Sea8SsHGcNkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3XTlbBtNvkqz9omgrvAI0nN5TmmSjBf+2xF9IqgnPysjWlCwBkbXIrPgs+RaPme8oSlmYmEQvoY6F5fCosOKBzKpIlEF1Uq1CyjVedUGTjCuNSkVhl8KorruTcee5UibwI7ezC0kVRjAttSrrPtL+FjV2aPSZvdWZ4LFxn1sow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6XnzA1K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B93C4CED5;
	Tue, 17 Sep 2024 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582655;
	bh=i2X5CGYdAQj7D1JJrAj+pHMkEjk/Y29Sea8SsHGcNkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m6XnzA1Kr+++5Y87VdLgXLoTj/dUyyCb+Zm9bmNchVmR+/82UL82qpdL9dbTc5NRs
	 QNKeS0/aHzdNNeaeq1tzedAlR3TuzR0ipNT4pe7xRUS/Iztm8Kyf9sypjgAkxGWRGL
	 Pc7sUqpk5LEprT9pLAXK7f4K8GMOgYKBShFzX8iYF+eZii1H5ATAryf0iDJffA8o+v
	 cRUMsx9koLMYfll6/9cEhBDmiokM9fzRXMw9BBKsYOofqW11cDct+fEVbvmczKIBe5
	 3SdCv6CiCu3zGpV0G0G46yxwTa7j0ZRrd//Z5uP/9ZgocUhyV/mQOLfNICinSXuP9G
	 R2wjU/pFdxgSQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/23] kbuild: doc: remove description about grepping CONFIG options
Date: Tue, 17 Sep 2024 23:16:30 +0900
Message-ID: <20240917141725.466514-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This description was added 20 years ago [1]. It does not convey any
useful information except for a feeling of nostalgia.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=65e433436b5794ae056d22ddba60fe9194bba007

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 1014a275a7e1..268ebbd2ab74 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -521,9 +521,3 @@ build.
 
 		ext2-y := balloc.o bitmap.o dir.o
 		ext2-$(CONFIG_EXT2_FS_XATTR) += xattr.o
-
-	External modules have traditionally used "grep" to check for
-	specific `CONFIG_` settings directly in .config. This usage is
-	broken. As introduced before, external modules should use
-	kbuild for building and can therefore use the same methods as
-	in-tree modules when testing for `CONFIG_` definitions.
-- 
2.43.0


