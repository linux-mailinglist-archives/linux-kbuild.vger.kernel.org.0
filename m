Return-Path: <linux-kbuild+bounces-4833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C398B9D7595
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Nov 2024 16:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46FA9166CB1
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Nov 2024 15:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CDF186E59;
	Sun, 24 Nov 2024 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PjwAJVAH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44B186E27;
	Sun, 24 Nov 2024 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732463955; cv=none; b=otn5QugSQAmhrCD4v7/UjmUyWrej6AG2aCY8YVk5jAwnvjmITiJJLv+T3Bj8W8UCKjk4zqQz6K0Bk1R1UQkzmbFAo6IAAlxmhDBK1u2/LRgUPub+7AO5fm67iLtcyo97BnhtcScYQ5a5hH2cSq+hV0uEEN+Y+xFMmZgQrhAfOmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732463955; c=relaxed/simple;
	bh=4w8HlmIoy2WtB+YbTtKCdX2a1oD12zK0Q2sU2umMiew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dV6tES5Kzva1QpgZZz1akHSTYh/lN9YrDydqxNc6dWRk53TRhBlmLCt/pR+MK1itz6u8bS3e+H9m6p7vXcB94R0wGZRBzfbhsOnuvsP5jOJEDEhk9BaN/5Z7m/XpV/V/WxB5MmKkPc8qjDGE8DaZU/E70AfYC0Fw266Hec1xp2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PjwAJVAH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1732463941;
	bh=4w8HlmIoy2WtB+YbTtKCdX2a1oD12zK0Q2sU2umMiew=;
	h=From:Date:Subject:To:Cc:From;
	b=PjwAJVAHf7BNBZlXvihySaYikMHa5t1dvWJ3X4Nhx7s8te+e0vwWOQiFhqV9FLSAR
	 XY8cIi3RhTfw49fl9qFBp5fyAjCYOph+A5mB7c+pwEP9nW/PvRiIucC+fgkEKcIZh9
	 LTIDNTbMO/YVE7FhzK+NaDcTDz5bpA6Jqkuqe2Z8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 Nov 2024 16:58:04 +0100
Subject: [PATCH] kconfig: prefer toolchain default for debug information
 choice
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAtNQ2cC/x3MQQqAIBAAwK/EnhNSrKivRITmakuioRRB9Pek4
 1zmgYyJMMNYPZDwokwxFPC6gnVTwSEjUwyiEZJzIdmuT/KGKe/XGCy5xaA+3ULBRmZ7KQeteKu
 xgzIcCS3d/z7N7/sBfIeB8W0AAAA=
X-Change-ID: 20241124-kbuild-allconfig_debug_info-f7449ba15be6
To: Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732463940; l=1374;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=4w8HlmIoy2WtB+YbTtKCdX2a1oD12zK0Q2sU2umMiew=;
 b=j2KA7ysOF3fTSzZ0FC2ksKF8XUeletFAme4jxEagaMOl8mkyU43106vnUeneExDRcgI4GmYhv
 ozhWQc81ClRCcpDDrAJtl2dRWeIS37ZonTluMIwtiVdleFOKyumRRzq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Kconfig by default chooses the first entry of a choice setting.
For the "debug information" choice this is DEBUG_INFO_NONE which
disables debug information completely.

The kconfig choice itself recommends to use "Toolchain default":

	Choose which version of DWARF debug info to emit. If unsure,
	select "Toolchain default".

Align the actual configuration with the recommendation by providing an
explicit default.

This also enables more codepaths from allmodconfig/allyesconfig which
depend on debug information being available.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 lib/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5d9eca035d470f7ba0c5ff932c37fd5869174269..0aefcd103d9012cd8067e5594404358b0e977644 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -240,6 +240,7 @@ config AS_HAS_NON_CONST_ULEB128
 choice
 	prompt "Debug information"
 	depends on DEBUG_KERNEL
+	default DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 	help
 	  Selecting something other than "None" results in a kernel image
 	  that will include debugging info resulting in a larger kernel image.

---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-kbuild-allconfig_debug_info-f7449ba15be6

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


