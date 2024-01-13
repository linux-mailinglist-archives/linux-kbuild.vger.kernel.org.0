Return-Path: <linux-kbuild+bounces-537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7282C839
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jan 2024 01:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FA581C21669
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jan 2024 00:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BBE195;
	Sat, 13 Jan 2024 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="ojnNRvq4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00549364
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Jan 2024 00:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 36C9438A05A9;
	Sat, 13 Jan 2024 00:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1705104740; bh=+GG3kGm0PXszJ7xza3Atd9t1E+yImA2gKJufdKHgXtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojnNRvq4JAJ3tCyqrbcAQZfTgmic8iLGPSw8GmCKkCopHTDQyMf9JdQDgijF8N4z4
	 0BH+/yfRwcZlOSVATpXbfB9UPTqKxjmQQDwiTHduozku1pFEmxC0Em1/B80Qchilo6
	 XDSURoTuhsBQ2gRwie2fcWfVy38WlszKrC3kTYDP4zJ4cQIeEYjAjMkOD5etE+ulOw
	 6J6BK6A7QeEtMr51dL96JULkEtA5dVh8/zPZWKF2rZ3Q1y5IneZ8/Dk6EYqdQFxuZt
	 9YK8VMgGAASAOzNwQSAITa7ZTvoA56N5sfBJ26aodA+2w/oVgzGksUDQ89Vuq1iqCZ
	 m8q9CSP7pUYUkGzKNj9Oo2XysT1dH8MaELIsK1EMA6lZ3xx5DVCjFO4ckP1FXMeHlK
	 8A/YC1HXzU9digTMTwr5OSrQAtHNbvaAVCMF5r360aLTxOaDo7heIzvBhtjeX/1f6U
	 HqzpgzR0mIoXxL4NbfYqpSQR1DNVE9vnQNrBtOziLAJvxA13Ixu+HJB2jBSe6EzFij
	 loS1f+hpF3i2wm1KyPL6tUfYi1uhqh66jOw4RZOSsUqFW3fhbNnbMOPVG4XqkC9pzl
	 BP+1k4QUFWpBzOZhURcFBcu6zb9Lg3IFJGcyN24pYPqIdmmauT1O0cVLc1+j4vMMax
	 RPSZvCa6qXhIPshUNZFfHdpk=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 273w-0tggmX2; Sat, 13 Jan 2024 00:12:18 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 13 Jan 2024 00:12:18 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: linux-kbuild@vger.kernel.org
Cc: Zhang Bingwu <xtexchooser@duck.com>
Subject: [PATCH 1/1] kbuild: find kernel/configs for fragments in fragment merging
Date: Sat, 13 Jan 2024 08:11:35 +0800
Message-ID: <20240113001135.7781-2-xtex@envs.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113001135.7781-1-xtex@envs.net>
References: <20240113001135.7781-1-xtex@envs.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Bingwu <xtexchooser@duck.com>

Function merge_into_defconfig and merge_into_defconfig_override merge
a defconfig with several fragments, which should also be searched for
in kernel/configs/*.config.

This also switched ARCH to $(SRCARCH).
For some ARCH, SRCARCH is different from ARCH and arch/$(ARCH) does not
exist.

Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
---
 scripts/Makefile.defconf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index ab271b205..6e61c1784 100644
--- a/scripts/Makefile.defconf
+++ b/scripts/Makefile.defconf
@@ -10,7 +10,7 @@
 define merge_into_defconfig
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
 		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
+		$(foreach config,$(2),$(wildcard $(srctree)/kernel/configs/$(config).config $(srctree)/arch/$(SRCARCH)/configs/$(config).config))
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
 
@@ -24,6 +24,6 @@ endef
 define merge_into_defconfig_override
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
 		-Q -m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
+		$(foreach config,$(2),$(wildcard $(srctree)/kernel/configs/$(config).config $(srctree)/arch/$(SRCARCH)/configs/$(config).config))
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
-- 
2.43.0


