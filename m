Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC07330B95
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 11:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhCHKpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 05:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhCHKpV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 05:45:21 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A616BC06175F
        for <linux-kbuild@vger.kernel.org>; Mon,  8 Mar 2021 02:45:21 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2884546pjv.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Mar 2021 02:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ytsa4rIqavqUhXAymwknqeK3kfGDpJGQeD+ydMOvdY=;
        b=eElyYqyS8jnS6dRnd0aRHWZ1IVq//9XTvPxukYdRNXhxi8cNJLKpFVNHZFroLpcFdi
         ebYXhRBAFneRz2Sv0WCpsk90A+mFxTLc4jCpCPdRD7s3BRr9H9kWyGXu2YXlWow6+AVu
         ot1V3fHmVY2JhU+mSOFTy6eN/ZhEvfHxyce2TEUDX7MuHk+bO3mu97ZqgM54EJ6N0gOx
         37rx1mvGHKMXJcOFd91omK9JL1a4bwkYl334iXyXDWepEjFVn43gVhkcUmn15cnOtvv3
         I+2Mb91eHNav7jda5p5gcUpCfXKyV51WHXuopKT0kEsAHTu0x+wZJySppPr6054hctG3
         UACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ytsa4rIqavqUhXAymwknqeK3kfGDpJGQeD+ydMOvdY=;
        b=GQriIrrJL8GsGeA6ThoJBdbFVpqMIQjqAo4zlVbTsPFwzno4SWtm+hSQddwmnaFBM3
         kJ9KO+I5EvClG3xMs9+xO4bBDcn5JLTJ3vrWEPVev2FzztO2I6BkP5dw+GxtZYJbRVTJ
         TSqpir5zB9ptfHBofnRKD+FKy4i8Ce2Q2id31ZTSktsmKTTzUw+FfbNPhx+/4PVYBfSa
         c25OXnwhoBiphZJln8swiSDaLDE54DHv+t0/mrV7eW7DMe9eDGKjfLvBHIj/KJ6vcg8/
         dwZMp6oVhWh/jQePNOj3nryAHyKoZ8TFT1CgdhKFQ9p9W+LLEjnNX1Bt7gwdebje5o0/
         hmIw==
X-Gm-Message-State: AOAM530Kppd8DZHQvM67N0l/PvOV2H4J7qWVU+ZwMX9kuIKg/xNn4uSt
        OrP4Wassz8rMEQly3QItVL6f2Q==
X-Google-Smtp-Source: ABdhPJxIKQt2W43ppv6RO4tVI+nDaBDDSHLJ2VDS3w82ZWEXONSXzbp8pBoa3p2j19j63Ag0cqiiGA==
X-Received: by 2002:a17:902:8ec9:b029:e6:c5e:cf18 with SMTP id x9-20020a1709028ec9b02900e60c5ecf18mr8610316plo.47.1615200321254;
        Mon, 08 Mar 2021 02:45:21 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id g6sm10160628pfi.15.2021.03.08.02.45.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 02:45:20 -0800 (PST)
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
Subject: [PATCH V10 1/5] kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
Date:   Mon,  8 Mar 2021 16:15:06 +0530
Message-Id: <7fe7e5ef6ed75450ddf6c224b8adb53059e504e2.1615199908.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1615199908.git.viresh.kumar@linaro.org>
References: <cover.1615199908.git.viresh.kumar@linaro.org>
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

