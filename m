Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD682EC9E7
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 06:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbhAGFQH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 00:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbhAGFQH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 00:16:07 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA01C0612F3
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jan 2021 21:15:27 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n7so4065920pgg.2
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2021 21:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QrVR8HrI6fCDnvS29akD+JwZDL2psh/KfBG4Bf4pDa0=;
        b=Wf+24L0IT9UHUeT09QDwDD7oc2wA5g4dXjH/S1mEj2unyVAdbxP7dTp7FfqsgKxQ41
         3CM3LRfVS/sNbg2Caxhi5appIi0Ua5MplMVfz4tqTyqh3aXQGHMz0TMTVjvIq6obngU9
         04dLHj7erJsLtMa8krTcRDokQYeLGkMun7FNvn/qLuo6AXSPc87sM4H4jOiUmiTQJFTL
         uXxzKfzdTpQ2iW6M9YjvEOyRT8ytPk/IOKYgYt0OjQZgD2acc7svIiBzSEprUvRmcg0u
         7R/AJGvEStDMm0be3IXtrYLm/LjNzGJJfJEb5jFP0f1dnNPllwxdHblCCFBIt7OnVl3c
         PiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QrVR8HrI6fCDnvS29akD+JwZDL2psh/KfBG4Bf4pDa0=;
        b=adVfDliAFo8z9fw+Im4HIZkd+aPtMUTc8/jrIrvvt8W8gH278le/xxnAMUQkZ/I1go
         SCsGSuh89LX/rF2x8TN1ClHX+DeXMsDdYjrzzCxwSHtTy70SPTdHIeDdjJcgZf9DjgF6
         gPvLchsIxRmh1yelsC1ZPetaa7wpkYudslT7+GKPMJr1VfDivEsW0DNW3Aq+I7sAWZ52
         IZ2uQm84x2svXWQaQX8JN7NojbZ8IE/6VXmUuoVG889c8Fkr21sWN+LBmNZJl2iwFF8Y
         GvNzRmKR2OdPto4NJKLORxz1g5wPmlg/ijldWWPuS3ZgeOKYziowy4d3DdId5Z8NP7IE
         EPNQ==
X-Gm-Message-State: AOAM530SPKbCBzXQuv4F+krlaBaJt2tKK8VF4Ujito05/EjUHRBAg/Rp
        7jY9bCOm+gpizD2L0RTK1W/2hg==
X-Google-Smtp-Source: ABdhPJyuhdozZ+SaDR8TYXsWTOQye8KRK3yrj49NREqdmFPZsv2+9J/gk4oLkatYwFaeu7aE3cqmdA==
X-Received: by 2002:a62:6c2:0:b029:19e:b63a:91e9 with SMTP id 185-20020a6206c20000b029019eb63a91e9mr590211pfg.79.1609996526613;
        Wed, 06 Jan 2021 21:15:26 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id a29sm4158602pfr.73.2021.01.06.21.15.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 21:15:25 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org
Subject: [PATCH V2 1/2] scripts: dtc: Add fdtoverlay.c and fdtdump.c to DTC_SOURCE
Date:   Thu,  7 Jan 2021 10:45:19 +0530
Message-Id: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We will start building overlays for platforms soon in the kernel and
would need these tools going forward. Lets start fetching them.

Note that a copy of fdtdump.c was already copied back in the year 2012,
but was never updated or built for some reason.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Separate out this change from Makefile one.

This needs to be followed by invocation of the ./update-dtc-source.sh
script so the relevant files can be copied before the Makefile is
updated in the next patch.

 scripts/dtc/update-dtc-source.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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

