Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90066C0A84
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 19:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfI0Rmq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 13:42:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36695 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfI0Rmq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 13:42:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id x80so2549346lff.3;
        Fri, 27 Sep 2019 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=R2dWFPB086+p8xJ/thjxb6g8VFmjwb9hHyVKeU6WZ/0=;
        b=Sy1Htyq5XwwO9o5yPUeSrTq7Dh7gibf4TrUuEOuXgqrIeKy/zx6N84M0Fl98VqBhE6
         724CVD4qRV7BymXYazp+pyZBZxXyyyKGWZvi8nRI2K8CC/ClKQvsD3WmOns1f/wsPx3K
         6Y7bSANa18K1yRjHsaZ/l/HPIpGdss2SAKj6UBf7phbE8uJMQsuL4A3B6sC6YEcD9vpO
         xmrl9MasDD+8SgnNaLuXe/HHQyGIF+u1wBGPKJ8lQHQHjRNzmw72qocRGWhlwKgJH6MV
         WQJ2Cdzz4p5aCc5XacVTjoT41/RJ8ud/YGTIbq7ZOu4Pfd2ri74EiHHpXasNWQhcZsGu
         jZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=R2dWFPB086+p8xJ/thjxb6g8VFmjwb9hHyVKeU6WZ/0=;
        b=Oh9gbse0Ah/jGVxEUyIELRqCRp56pO8DDRWd5jQXWGXMDy1gRZg4rGKDOO6KHh17oN
         iPjwOkp7uPLlc1IIBdeVrNXXSM9xdLEEIageynbPOtv8Hft6Vb0X7k55zYDsXip2W9T0
         XfpJozQNI2ckge5tlYITFPwCpz48Qin5ZfZYeY1hhEzTTeFQlSSCUgQcJ86QiPGS+sBI
         RRZQSENoVcaj+WraQozfCApFiVQrjDRtUYeaLB319ycIcE5U12LQiz12RkVx9k1iFXFH
         MZFyeWqBdBbZ6Dyax7d2qTmKDQ684onUTTSuS3P2WCqVMz3h8tzPF9MoKq1guAIs3Pje
         K7FA==
X-Gm-Message-State: APjAAAVQOmez5I7GBs5qY6sXXiqokqGfNAmo3kiX1/5mu+yux3bOVPVZ
        vTNFf7AZ2jJ25bJ0GDU/lX2ogoNdHQlQvA==
X-Google-Smtp-Source: APXvYqwGr8bV/GXzdC57sgkSs7LFXCZslMzPQlxL9Rrsc5AoXYXN3FwkcvWhOTriaNZpytJdaCRwiQ==
X-Received: by 2002:ac2:50c5:: with SMTP id h5mr3557274lfm.105.1569606162813;
        Fri, 27 Sep 2019 10:42:42 -0700 (PDT)
Received: from huvuddator (132-228.soderhamn.com. [80.245.228.132])
        by smtp.gmail.com with ESMTPSA id g27sm578026lja.33.2019.09.27.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 10:42:41 -0700 (PDT)
Date:   Fri, 27 Sep 2019 19:42:32 +0200
From:   Ulf Magnusson <ulfalizer@gmail.com>
To:     linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, noralf@tronnes.org,
        sam@ravnborg.org, david@lechnology.com, hdegoede@redhat.com,
        eric@anholt.net, tglx@linutronix.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
Message-ID: <20190927174218.GA32085@huvuddator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
option") changed the type of THERMAL from tristate to bool, so
THERMAL || !THERMAL is now always y. Remove the redundant dependency.

Discovered through Kconfiglib detecting a dependency loop. The C tools
simplify the expression to y before running dependency loop detection,
and so don't see it. Changing the type of THERMAL back to tristate makes
the C tools detect the same loop.

Not sure if running dep. loop detection after simplification can be
called a bug. Fixing this nit unbreaks Kconfiglib on the kernel at
least.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 504763423d46..a46ac284dd5e 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -63,7 +63,6 @@ config TINYDRM_REPAPER
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-	depends on THERMAL || !THERMAL
 	help
 	  DRM driver for the following Pervasive Displays panels:
 	  1.44" TFT EPD Panel (E1144CS021)
-- 
2.20.1

