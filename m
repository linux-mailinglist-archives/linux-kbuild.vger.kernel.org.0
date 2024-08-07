Return-Path: <linux-kbuild+bounces-2898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A294AF16
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 19:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7721FB2550B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 17:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1E613DBB3;
	Wed,  7 Aug 2024 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMrKKNaC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE580BEC;
	Wed,  7 Aug 2024 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723052857; cv=none; b=giRYJ1VCXow2KiBJd49DUHbePBxo30iKDU7AQfMACwLP5qHvHYfduLOvuUN/DmO/g39cEXCANAg0w44Ns1F/Zos18ZSnaT4mPy7DoxubtK0Rsq6zrYw3QMNl7TSy3EjM6ca803IvoAtNzuuaATQt+fnGjVZ9XLjzxR+YD34ZKrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723052857; c=relaxed/simple;
	bh=I3dBEl7gZ6UF2jKD+4y9OTtPsx5fbU5DIZcAjt0Q+pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/kGY7ouDfxvp/Fnx2t8l9mFJWsUoECShwf+XEG+/8AGPG6Lau8jkYdOOYODuPp9b2q8lfN4b6S6/KrmI1zAZBtiT2u+1wZRmwnGYrdKqixU4St60Sk3K02PBRrOjHkCmXYKsrJgHf8gAwLB/T544p2T56MJrP1dAcHNC+gqpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMrKKNaC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D31C32781;
	Wed,  7 Aug 2024 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723052856;
	bh=I3dBEl7gZ6UF2jKD+4y9OTtPsx5fbU5DIZcAjt0Q+pQ=;
	h=From:To:Cc:Subject:Date:From;
	b=NMrKKNaCEVK5Djs3ir/G5ibpZK0WbOdn1per0Oh5BOgUbbnYqKwVdmAAE5C+xVABt
	 DyOrXtgIsofwNagQRXVGrohu6Jpd2rtx4iDeVaZKnK9V6Lu/K8uuZG/EXO4csgr2Zr
	 1abhw+XabvcyInDzB9EiNdIc6O0ROkGf2sh2KhB2vwi/nI0qbIFaRPlybvtDjmLiTi
	 E/2r/n0B/IIJO5nf7zwi1NfQ33MrS34xTWoZUIf7szCsONd8e9yE53a+aOYLZVsMMI
	 0uIdQ6hfa+X5nJ1+DEr2/ZxM75HWeE8tXlwTMYulEmkzCg5Lzk8hPxOJhdeAU+oFZV
	 StIzh/E0+m88w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] treewide: remove unnecessary <linux/version.h> inclusion
Date: Thu,  8 Aug 2024 02:47:28 +0900
Message-ID: <20240807174730.658429-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files do not use any macros defined in <linux/version.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/accessibility/speakup/genmap.c                | 1 -
 drivers/accessibility/speakup/makemapdata.c           | 1 -
 drivers/staging/media/atomisp/include/linux/atomisp.h | 1 -
 samples/trace_events/trace_custom_sched.c             | 1 -
 sound/soc/codecs/cs42l42.c                            | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/accessibility/speakup/genmap.c b/drivers/accessibility/speakup/genmap.c
index 0125000e00d9..0882bab10fb8 100644
--- a/drivers/accessibility/speakup/genmap.c
+++ b/drivers/accessibility/speakup/genmap.c
@@ -10,7 +10,6 @@
 #include <stdio.h>
 #include <libgen.h>
 #include <string.h>
-#include <linux/version.h>
 #include <ctype.h>
 #include "utils.h"
 
diff --git a/drivers/accessibility/speakup/makemapdata.c b/drivers/accessibility/speakup/makemapdata.c
index d7d41bb9b05f..55e4ef8a93dc 100644
--- a/drivers/accessibility/speakup/makemapdata.c
+++ b/drivers/accessibility/speakup/makemapdata.c
@@ -10,7 +10,6 @@
 #include <stdio.h>
 #include <libgen.h>
 #include <string.h>
-#include <linux/version.h>
 #include <ctype.h>
 #include "utils.h"
 
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 16c9da172c03..fefbe3cd08f3 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -20,7 +20,6 @@
 #define _ATOM_ISP_H
 
 #include <linux/types.h>
-#include <linux/version.h>
 
 /* struct media_device_info.hw_revision */
 #define ATOMISP_HW_REVISION_MASK	0x0000ff00
diff --git a/samples/trace_events/trace_custom_sched.c b/samples/trace_events/trace_custom_sched.c
index b99d9ab7db85..dd409b704b35 100644
--- a/samples/trace_events/trace_custom_sched.c
+++ b/samples/trace_events/trace_custom_sched.c
@@ -8,7 +8,6 @@
 #define pr_fmt(fmt) fmt
 
 #include <linux/trace_events.h>
-#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 60d366e53526..6400ac875e6f 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -11,7 +11,6 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/version.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-- 
2.43.0


