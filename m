Return-Path: <linux-kbuild+bounces-4842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B89D800B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 10:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA5A4164C73
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 09:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4723F188010;
	Mon, 25 Nov 2024 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lqfkUNSF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F56A18F2DF;
	Mon, 25 Nov 2024 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525387; cv=none; b=YX8iB5mhcLRkIq/1dWGkP9bimu4bankvcAVeYkhfyGrpIsC2yfb5fHdJyu0GrWa94l3HS/XXmUqVeTcrNd4P03LNfg09dc5CD1GPBPt32T2rRbiZH3lw3nIgylHCl7NjuM1mrmexGLeiUkxYOrbaYYrS+E4wOdLzFRYbqAWcdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525387; c=relaxed/simple;
	bh=FtcHvy4eh1fzXJp7OYWZy+CdwG5iaYo+EmDgfdxyMt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L7OcxnrUCpS+30eabvCTLHX6NKnUjV3J/ERzF+lS36AmocfEFaXQd0lwYNHiiy0zrg/uH/cRUaP7SwMm/KAqrO0qjERiUgwMOCEVCtatsgmoa7Mrp6sTIv9Vp08Q+5PYJKxAdDx645XgUtnmEJcLi5lgE1cqvFn6RpJ+FZgaBoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lqfkUNSF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1732525383;
	bh=FtcHvy4eh1fzXJp7OYWZy+CdwG5iaYo+EmDgfdxyMt4=;
	h=From:Date:Subject:To:Cc:From;
	b=lqfkUNSFFU8W36b8yih1wdYjh9T7rW0RUdbbKd56UmXdeciZqNjnACRoNW+/kZZgg
	 IcowDf8IMQHxn4Q2aj+XquSeebz+EcfjNYL3Z3tXZku6qm/BrcNPlDLiWq3wOQHvIK
	 pYstFao8mkUpUEsvr7gpvpSk8i84Y5bCXlit2ReA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 25 Nov 2024 10:03:00 +0100
Subject: [PATCH RFC] kbuild: disable -Wc23-extensions from clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-kbuild-c23-extensions-v1-1-b4263b795fc8@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAEM9RGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0ML3eyk0sycFN1kI2Pd1IqS1DyQhmJdI1MzgxRDE4OUVGMzJaDegqL
 UtMwKsLnRSkFuzkqxtbUAANZwtGwAAAA=
X-Change-ID: 20241118-kbuild-c23-extensions-2560d140de36
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732525382; l=1363;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=FtcHvy4eh1fzXJp7OYWZy+CdwG5iaYo+EmDgfdxyMt4=;
 b=ZgZhHCaX4YC9i37LJTKNCixuLqFy5qCikihrY1TMrPdJpp81oEUHf+qw6TPjcgcqPzU4ItKSR
 WasImsY8gvwB2VqBMasu9NGrsfIat3JmOaEzuPFQ8cYvoUTWXXikH0l
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Some of the C23 extensions are also GNU extensions, which are allowed.
Examples are declarations after labels or function definitions with
omitted parameter names.

Also with the switch to C23 at some point in the future all those
warnings will be resolved automatically anyways.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
I had some patches failing the CI only with clang.
And it feels like unnecessary busywork to fix these warnings.
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc7808610e635ddc03476cf92b3a8c1..0da75c9d84da4daf6936495a5ab96df75658da4f 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -31,6 +31,8 @@ KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 ifdef CONFIG_CC_IS_CLANG
 # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
+# Some allowed GNU extensions are also C23 extensions
+KBUILD_CFLAGS += $(call cc-disable-warning, c23-extensions)
 else
 
 # gcc inanely warns about local variables called 'main'

---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241118-kbuild-c23-extensions-2560d140de36

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


