Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C17E33356C
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 06:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbhCJFgB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 00:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbhCJFfl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 00:35:41 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C44EC061761
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Mar 2021 21:35:41 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id s21so340965pfm.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 21:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ytsa4rIqavqUhXAymwknqeK3kfGDpJGQeD+ydMOvdY=;
        b=g0rKxWyt10Nb8Yf5moCRmtkakuJre+hGBK8zSsgFlnwpT/SDXCRA7cj8nwgOKm4PjA
         LEuUcfyHj0w7NymRmOtoXCAVQYfR5vEGMyEcgtbbqXpyu1avHm1eCGtC5/7WtNazpOzG
         hRW4673Is/JxXI1myT2cjoXON3zldFvdA6pPzFHACnAONr5KMbwpbK9uJP4zmzXOzDWO
         F2bvEOU8tpwPUT6rS8ZwVKOI+jQ9sX6728BCLKP0yl6eAXdbnSuvBR2Kz2wToEe7Ogbm
         tWul1oscqRh+GOlUWsWff2q0e3oguGzMNwgN1GTqzGikcEgebT3SZmRZFT5a3hZC9WQf
         ZxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ytsa4rIqavqUhXAymwknqeK3kfGDpJGQeD+ydMOvdY=;
        b=bvB8v+JfZ7YALpbjcVAyHTIarVOCBzqRIXOIdQ44gBiEnpHVoms7OCs0gAo6cOZM9C
         R59+qkTnVnwjgBgW3KEmNP4lm7JGgHDKd+mRIN23FGOk6//psCIeM1j3dOHTXvW3+JQm
         ST1XSaI/NFiznt0ShSRMPdxN7AUH2YSDkVjugRbLe4lCToO5z1FLjF4cVQjgMMYC5QbM
         66wcXVahdYdedSzWN0IP9RUPc7ZmOG7O6kzujXJI6/1zihUWmn26q5j+pnQ0hAKOHT7M
         VWR9G7uCr6thC9/JFvqw4twlQD8NTHHlQs+q0jhpxSHUvuAYpR9F0Kx/y6EwkVYXLusR
         J5hA==
X-Gm-Message-State: AOAM533yqRJqO2EYm240HhThiJ8Ecs38aN5lY4LeMjr4V0qdfNyBx2FN
        cAJ/5OwAGnuwozv3P3S6ZGpilSKv402Avw==
X-Google-Smtp-Source: ABdhPJykuA54kpJZQ+CD5wvTuaBPXzmJ798JdL3cRLc5YGbrBZC4a6EUVtlJBYVqlYEVDvOjGM77vA==
X-Received: by 2002:a63:ef53:: with SMTP id c19mr1367313pgk.78.1615354540860;
        Tue, 09 Mar 2021 21:35:40 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id e11sm7918581pfm.24.2021.03.09.21.35.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 21:35:40 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V11 1/5] kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
Date:   Wed, 10 Mar 2021 11:05:29 +0530
Message-Id: <7fe7e5ef6ed75450ddf6c224b8adb53059e504e2.1615354376.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1615354376.git.viresh.kumar@linaro.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We update 'extra-y' based on CONFIG_OF_ALL_DTBS three times. It would be
far more straight forward if we rather update dtb-y to include all .dtb
files if CONFIG_OF_ALL_DTBS is enabled.

Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 scripts/Makefile.lib | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index eee59184de64..a2658242d956 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -73,14 +73,13 @@ always-y += $(userprogs-always-y) $(userprogs-always-m)
 
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
+dtb-$(CONFIG_OF_ALL_DTBS)       += $(dtb-)
+
 always-y			+= $(dtb-y)
-always-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
 
 ifneq ($(CHECK_DTBS),)
 always-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
 always-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
-always-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
-always-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
 endif
 
 # Add subdir path
-- 
2.25.0.rc1.19.g042ed3e048af

