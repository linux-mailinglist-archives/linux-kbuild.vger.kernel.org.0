Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84BACB02BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 19:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbfIKRf1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 13:35:27 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46171 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfIKRf1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 13:35:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id v11so26187544qto.13
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2019 10:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJD6iQtvN/UCjy4Ek8D93A8B4R/KlP3wDuq4/HX54Nk=;
        b=ESsau/uU7KkgWzaER4y2/52TBwwEMzglevQZgPhz8mpsh/psDnnwjhgCfMZx2xn7RO
         pTQMc4weP+eRGMm7La/QZypjUcjwfXOSY31sJWbO9DllIrfBVvcSDUt15jbMJJ5IQnkr
         fNnSmRkOk62gX4p8GqROfsCMVJkvswWy3bjYmTudOEQNz3hvX2e1t+Df2R313l4H0CQ7
         xDhRgrN7QroVOiWA7CvNIccCpQ6PsgEbUr3mVULnSlr7MoIuZxR5jpA5CMZYoQMPR7xY
         CTfHGHAhQCmh+Th+AdcgeGVctHvcOXk7cadtaOtxfl2XVnRMAexGlG1idU8BFky60sgz
         u38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJD6iQtvN/UCjy4Ek8D93A8B4R/KlP3wDuq4/HX54Nk=;
        b=GKTGgc8dfjLaXaV0SEPItkkHO9lgI5UXuip5oLtAKu/dk/YlEot4i85fS+0JbwHSd/
         FHOadpiiPoELGXnE38P9IL1+PV+alf8jxUNFJ+7B6b3XMARbusRNXF1NkdxP1/3ksaf0
         xm7ZrgvPOXuv1HFSzcTl0ps1eSfeejR2JzDzH3Rwd32C4kO6cxoIikHCSn2gUZjC9z1m
         nhRZ/RBMF6lFZbcinHwakE9rcoaaqBe4r3BCVpYT6qgkP8xUjDP2EPV0I5HKk4+Fly95
         rJNlH8H0WsV9iHAry7IL1AZbdJaDEp6t/mHfmJOFtixBglyGfp+qSjFceokjUyDaXlUh
         wJ5Q==
X-Gm-Message-State: APjAAAXQcfTUM5phWCaafnH5a7UUhDUQFnNbDg+PPkDHZWTvw4zpzjXl
        1f3tEm4shEK2ML9N0E32x+29gQ==
X-Google-Smtp-Source: APXvYqwcOywenx8LVLVD6JO3ednMqGYhwk73RQ5i92GZvWMV25FAZF2IFj/VjnedRzlUY75Dl91o7g==
X-Received: by 2002:aed:22cc:: with SMTP id q12mr37648607qtc.232.1568223320208;
        Wed, 11 Sep 2019 10:35:20 -0700 (PDT)
Received: from ovpn-125-217.rdu2.redhat.com (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id c204sm850853qkb.90.2019.09.11.10.35.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 11 Sep 2019 10:35:19 -0700 (PDT)
From:   Qian Cai <cai@lca.pw>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, emil.l.velikov@gmail.com,
        dri-devel@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>
Subject: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
Date:   Wed, 11 Sep 2019 13:34:53 -0400
Message-Id: <20190911173453.958-1-cai@lca.pw>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=y
to always compiling drm/. This restores the behavior, so people don't
need to waste time compiling stuff they don't need.

Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future proof.")
---
 drivers/gpu/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index f17d01f076c7..a793b9ace34b 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -3,5 +3,6 @@
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
 obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
-obj-y			+= drm/ vga/
+obj-$(CONFIG_DRM)		+= drm/
+obj-y				+= vga/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
-- 
2.20.1 (Apple Git-117)

