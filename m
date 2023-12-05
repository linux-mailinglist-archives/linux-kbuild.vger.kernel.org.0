Return-Path: <linux-kbuild+bounces-259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE98050FD
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 11:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3716C1C20B91
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 10:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E9F3FB3D;
	Tue,  5 Dec 2023 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Avzd5itI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D207113
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Dec 2023 02:46:10 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso38115671fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Dec 2023 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701773168; x=1702377968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izNq30yZOvNNZwGOaMHX1vwLLUveCfNwr6iLqBb8tH0=;
        b=Avzd5itIydUCHBi2+Qzh6VyaCQ1Nna3w5QzJELAJ5P2uIvjOUfivv8CV6lP6XdbcI3
         8y2y0W+Vts913ETpl2m2UfrIdtfBDFgtZHCGbBVOmaLTEWxs6U4bn94vKNv1diAM+4FT
         qwXlVGXbpTssS1Wdz0PlJLMCLb3PmF4XUZ61ixpzcHU7557YjHp4cjlbabwGY+vy9+in
         Okivo7iASIts+NVU5rftre+Di1l1erimrx199AIG7d10SXi37m5lLIRyFWLJpSIW3npO
         hXMBBO4q3zMv/Ne3Pfgcph0jVhI7LcQ5VqFxLXI4DOM/qa4djEBfQuNgR6DE4e2m7fhG
         k6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701773168; x=1702377968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izNq30yZOvNNZwGOaMHX1vwLLUveCfNwr6iLqBb8tH0=;
        b=fMAdcDS1HnMaG22XKMXdwshZeXmmkWG5qQWUv6jTChkbVA6VHPviVD/nN6otcvoxF8
         7xbFQPHABA/8Ys4QQxXNaN+W8sH9DXBD0njP7RyJeR42AUXGEOyAlKAMqq3v1bIHbF/g
         GFKpSPYaewqVDKDjYm9feFURkcyiZ9Ba3OyPz4814pZZTWdxWcBOWJDgTUh9yLY8/slc
         IVnYydwZjWLm1FStiaLx1uUaHXk3VxakIM2gdl2W9Ac3dt/ic4No0TYHrTP57bB9csLA
         /4ztgGshLzsMraPvk9xg90rjrMxMZunyq2tjmApZYCAB/f1NY764n1NiRI+SmUQtXiHP
         GYgw==
X-Gm-Message-State: AOJu0YxH7pFZd84gtOvI6HPA8Cru1jOBVDOal0hVRzaqiZvE5r48F5rs
	ErYxU9mFOrp1lFovfYJAsXQeFhn4nKIwWTJTu6Q=
X-Google-Smtp-Source: AGHT+IFO3X/tUoCunOv30KWUPHRPySrj5zZYCL+Fh3EBH/SWO0KG/fXGN1LnUai0yuUD+9nm7U7plQ==
X-Received: by 2002:a2e:82c3:0:b0:2c9:f7e9:6e96 with SMTP id n3-20020a2e82c3000000b002c9f7e96e96mr2189064ljh.17.1701773168241;
        Tue, 05 Dec 2023 02:46:08 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a246:821e:4988:9c5:5b9:1020])
        by smtp.gmail.com with ESMTPSA id m7-20020a1709062b8700b00a1aad4d92dbsm3813613ejg.123.2023.12.05.02.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:46:07 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] kconfig: Use KCONFIG_CONFIG instead of .config
Date: Tue,  5 Dec 2023 11:45:59 +0100
Message-ID: <20231205104559.2017320-1-msp@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using a custom location for kernel config files this merge config
command fails as it doesn't use the configuration set with
KCONFIG_CONFIG.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Hi,
    
    This patch helps me to merge_configs with config files that are not
    .config (set by using KCONFIG_CONFIG=<PATH>). I am not sure if I break
    something with that change.
    
    I didn't add any stable kernels as this is a kernel config issue and no
    bug in the kernel code itself.
    
    Best,
    Markus

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 4eee155121a8..106159e75d40 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -99,7 +99,7 @@ config-fragments = $(call configfiles,$@)
 
 %.config: $(obj)/conf
 	$(if $(config-fragments),, $(error $@ fragment does not exists on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(config-fragments)
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 PHONY += tinyconfig
-- 
2.43.0


