Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DD72EBC1F
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Jan 2021 11:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbhAFKKj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jan 2021 05:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbhAFKKj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jan 2021 05:10:39 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166A2C061359
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jan 2021 02:09:59 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id j1so1322790pld.3
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2021 02:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vIPKS1Ft1bWawzU3/HUFP2aGC5QczgfahJgd1GFd2V8=;
        b=HuZzNThi4I4FEVGN1LjeeYcLmlyA9zRyzkYwh6z0pQArRBn5gQTFbX+zxOr8VvBrM8
         tsn37JvixzZWCFZ6cO4ed7m/5px53d3FYnYsKwx4nMSMfHTy2Z5jaCkjpa4kAsNvKzDu
         G4hLTWMJDkTJzQMp0Q8nCWlbDUTHHYyYA+0+ZpnfruNziicJZugML6UNlV99g0Ux35Fo
         JWV6Ad8/VnoGclUIIgQd8ILfQYekax5wabVOd/HOnbt/m00t7s2C4ABWcIBkspV/u0pj
         i4D3FH+qYUokDcg1ynW8EMcSthUeysVjdxl81fYvfcDXsRRqSbQ/rby4xgqsn39Wzlq5
         1AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIPKS1Ft1bWawzU3/HUFP2aGC5QczgfahJgd1GFd2V8=;
        b=oZvD38mJ+4nDEKCbZXbiztVyyYIRnKzqyO2/0arKXhIk0U3XP1nLprKhbCM0WAr2Li
         nyBf5ct6/a7ZSlzJ+JKENEIediUiuHHWbwSqcXOL1R9E4mW6xa2XxCpAMf4+PeeO7y6/
         dTxaH1bNpL6hyLQP6a9HJvGa1P1nzQOrNiGtqilF04RwkYp5A0AOXOb3oYyLNaHOO9IY
         lGwUWzNsirYeqWGFC7jOccU8ABgnhN0TW4oF+Db2lxHVzE2YMMN/q14O5Q2BxDk2MgQk
         5fyAhegDsbZBe0fG8YwAyjMF/CsMZny9iqXtk5uRHN5vF+y30K5QTmyDD3I8pg9UC21Q
         9bNQ==
X-Gm-Message-State: AOAM5338BCtUxWmnq5Um8LX5ucWZJEwsk4PS+f9aVwhpVfNWNMaP5b8P
        c/ztPnjN4vKNbG5A640/wVDK+w==
X-Google-Smtp-Source: ABdhPJzCRzLUZqQowponcfuqWMNEC5oXk04OGaRFuzNpwECNaByg+0Mo8ruXng9IX0iAez1tNxA5UQ==
X-Received: by 2002:a17:902:7887:b029:dc:20e:47ff with SMTP id q7-20020a1709027887b02900dc020e47ffmr3830047pll.65.1609927798615;
        Wed, 06 Jan 2021 02:09:58 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id j14sm1809400pjm.10.2021.01.06.02.09.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 02:09:57 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org
Subject: [PATCH] scripts: dtc: Start building fdtoverlay and fdtdump
Date:   Wed,  6 Jan 2021 15:39:31 +0530
Message-Id: <5a416b44155409e45b99c5624d66992a2138cd4c.1609927722.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
References: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We will start building overlays for platforms soon in the kernel and
would need these tools going forward. Lets fetch and build these.

Note that a copy of fdtdump.c was already copied back in the year 2012,
but it was never updated or built for some reason.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 scripts/dtc/Makefile             | 8 +++++++-
 scripts/dtc/update-dtc-source.sh | 6 +++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 4852bf44e913..c607980a5c17 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -1,12 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0
 # scripts/dtc makefile
 
-hostprogs-always-$(CONFIG_DTC)		+= dtc
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtdump fdtoverlay
 hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 		   srcpos.o checks.o util.o
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
+fdtdump-objs	:= fdtdump.o util.o
+
+libfdt_dir	= libfdt
+libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
+libfdt		= $(addprefix $(libfdt_dir)/,$(libfdt-objs))
+fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index bc704e2a6a4a..9bc4afb71415 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -31,9 +31,9 @@ set -ev
 DTC_UPSTREAM_PATH=`pwd`/../dtc
 DTC_LINUX_PATH=`pwd`/scripts/dtc
 
-DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
-		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
-		dtc-lexer.l dtc-parser.y"
+DTC_SOURCE="checks.c data.c dtc.c dtc.h fdtdump.c fdtoverlay.c flattree.c \
+		fstree.c livetree.c srcpos.c srcpos.h treesource.c util.c \
+		util.h version_gen.h yamltree.c dtc-lexer.l dtc-parser.y"
 LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
-- 
2.25.0.rc1.19.g042ed3e048af

