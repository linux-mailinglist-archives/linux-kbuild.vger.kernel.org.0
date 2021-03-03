Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC85132C1D0
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351194AbhCCT2E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352978AbhCCEjf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 23:39:35 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC30CC06121E
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Mar 2021 20:36:36 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id o6so3535919pjf.5
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Mar 2021 20:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+bJi6OUgTmh44e3E0TKjOdFxIRwo0wMVFFd/ZGVA7Is=;
        b=Y1cX3RaJF0EVz0AoYsEE1Ui4hsu1mxMLfP4zCWjQ1lP81wPn7Qj9uNcZtOm3+nm1SB
         OXZvW0YQb2E76wTab+30S8T/wI9fQqaIUpretbrGvuRdKp3wbhiauwSuq7MfufvYIM3u
         IP9/Uk3JOreBZUXAlF8+H3EOQtZtBAvNOoBcetLp0Jh3iBLeqVXhXUC6g+cyN7QIEhdN
         mLUTDNT8TAIJWh2ukDU/CkGt+4TRCOXF/6K4PqcUZBQlwGSgYPUsvigpz8WXJ3JonWZ/
         lhkzOChEN1UyEa0gUE0WQE5bfNop6d5xKi6cXRBlBAYA8ZCwvvlignAtlFh7A8H/kZmM
         qsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+bJi6OUgTmh44e3E0TKjOdFxIRwo0wMVFFd/ZGVA7Is=;
        b=Q1QqIwqZPI//o3sPeLP5kYTIm2Hcyw0UA2J3jceP69j5vEMIDjcbD3uV5pMH2TIE31
         z1QctGjBMIl93LzXm99JEiKtUC7IZTnroq7u1is60sDFy0OLje3L8yLfx0Cfg5I3qpMm
         3wEs3NAPLxw5YeO4lcmL+LjeeP1phE5hbovKXHeAcW2THQrZ2ndtFvkYGV1yPGGoihNB
         lTeQmcNKsCsa9YMdtrKMysyrsJ4pIKERWGTaIY7E/IxRCIdckLsggWu7bscRRXL/U/hF
         E300EyxQtxsX2j5p73+Mp3DnNPRfFd5v0I1sGYOynrtu1io5gnJngBZvI1Q0+GWhp5PF
         oOPQ==
X-Gm-Message-State: AOAM530SauieUFMxoctCzKNfqXBFsJXJ516kQisH3Oy3yyKWWXyKhfEW
        ePKTL4RDEjYYMQslVw4lTyo2Rg==
X-Google-Smtp-Source: ABdhPJw62yd7vvVYT8V0FTS8QPr7mKkOP/WiFEcG9DpSsEAs7UCNyn/VPe/QM85Vg8ZNhaJb2EsRdQ==
X-Received: by 2002:a17:90a:f986:: with SMTP id cq6mr7841888pjb.175.1614746196313;
        Tue, 02 Mar 2021 20:36:36 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id y23sm22356761pfo.50.2021.03.02.20.36.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 20:36:35 -0800 (PST)
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
Subject: [PATCH V9 1/4] kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
Date:   Wed,  3 Mar 2021 10:06:17 +0530
Message-Id: <8e500ee41a7c3aac31920fbc5183d9f6e5a83260.1614745266.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1614745266.git.viresh.kumar@linaro.org>
References: <cover.1614745266.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We update 'extra-y' based on CONFIG_OF_ALL_DTBS three times. It would be
far more straight forward if we rather update dtb-y to include all .dtb
files if CONFIG_OF_ALL_DTBS is enabled.

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

