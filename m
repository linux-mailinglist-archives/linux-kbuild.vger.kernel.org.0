Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1335724A61
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 19:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbjFFRg2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 13:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237936AbjFFRgB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 13:36:01 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811A010F8
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 10:36:00 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9741caaf9d4so943536166b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jun 2023 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686072959; x=1688664959;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gdp4S+eQxFiKfHwPNqSR2VRP1nv6P0cgdm1YgiXygNM=;
        b=qv3VIrKhNKnucoSAPFfAY4WLFvoX/zmB8m5YAtYgIqiMEARlXzH0vymd3w5taAOkq+
         DJOjFLm+pejV48XapvBeVsWRTXiYjrqWgTA7cKIvZF/A5mEihzkmT76NUh7lYiaCMi44
         3Y2CK1C1R3wInwkt9549rDlm5Wzw0AKCA42jnPrldNTtCI+e6iAfYfWBQE6Hla2+ri06
         mN/98oyNQJxaHGVlN8ajpAacok/RfWzk5XRElQaGw/r2RXpvVPBC9PWWxU9kSh9PkpZe
         r5Td6BNj2F79nF1Q/rzA3A6PQlYKCLUT+nWB9zFdIaamnrGh5QMIbYDNKQDgIaZ12VCx
         H63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686072959; x=1688664959;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gdp4S+eQxFiKfHwPNqSR2VRP1nv6P0cgdm1YgiXygNM=;
        b=G2qPIcRRcvl3hE2CZR2sN90S9Syz+G/NNCendNiC7/LsrT1UUVU8/OEGUyLjhXL4Hk
         eUdYTRqYC4epJVZsEZw63o5zQWW4u3RR+LbM+aDfOLr6YLmfrOJ/XFDfcUAScGWRVdu5
         Ai3yFVN2aDmk9QUZlefheAAPLvJY3p2mbKr+JunYjSQeKXv1Vy1rrPC5p5VUXdYnpxzY
         JBsyU3DUu64hFFQcOL3YMeyxKqo2RPxJVmcDqSi9tCJmj5AkE4CVfcxyVJ57OqF4P0ZH
         jyI9Uaw2Ajt1fTkyekxk9JmtctgpW1myWcWYYsykom1KHRv/ZQWue8xfWIOCBkHc+SlK
         aLpg==
X-Gm-Message-State: AC+VfDzYIZIV1vjVX9xJc/Nk+y902ir6IEsEfYfHMb4CWfPM8s8PaXv8
        IxUGHTih0i3rcWMRKHgoMxFDNnsDd6VEPDqYjtke3g==
X-Google-Smtp-Source: ACHHUZ7vstHVKqnFMMNz3kMOqA1kekutTy0W0KKYUfBfFo6ZAN1i4100uVJ9oGNA1xTiupBy8ntWSw==
X-Received: by 2002:a17:907:1606:b0:973:ff4d:d01e with SMTP id hb6-20020a170907160600b00973ff4dd01emr4238978ejc.31.1686072958732;
        Tue, 06 Jun 2023 10:35:58 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id rl15-20020a170907216f00b00974638e4a98sm5685962ejb.24.2023.06.06.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 10:35:58 -0700 (PDT)
Date:   Tue, 6 Jun 2023 17:35:53 +0000
From:   =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, ptosi@google.com
Subject: [PATCH] scripts/mksysmap: Fix badly escaped '$'
Message-ID: <20230606173553.v7lckyxrcsotanm5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The backslash characters escaping '$' in the command to sed (intended to
prevent it from interpreting '$' as "end-of-line") are currently being
consumed by the Shell (where they mean that sh should not evaluate what
follows '$' as a variable name). This means that

    sed -e "/ \$/d"

executes the script

    / $/d

instead of the intended

    / \$/d

So escape twice in mksysmap any '$' that actually needs to reach sed
escaped so that the backslash survives the Shell.

Fixes: c4802044a0a7 ("scripts/mksysmap: use sed with in-line comments")
Fixes: 320e7c9d4494 ("scripts/kallsyms: move compiler-generated symbol patterns to mksysmap")
Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 scripts/mksysmap | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index cb3b1fff3eee..ec3338526102 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -32,7 +32,7 @@ ${NM} -n ${1} | sed >${2} -e "
 #  (do not forget a space before each pattern)
 
 # local symbols for ARM, MIPS, etc.
-/ \$/d
+/ \\$/d
 
 # local labels, .LBB, .Ltmpxxx, .L__unnamed_xx, .LASANPC, etc.
 / \.L/d
@@ -41,7 +41,7 @@ ${NM} -n ${1} | sed >${2} -e "
 / __efistub_/d
 
 # arm64 local symbols in non-VHE KVM namespace
-/ __kvm_nvhe_\$/d
+/ __kvm_nvhe_\\$/d
 / __kvm_nvhe_\.L/d
 
 # arm64 lld
-- 
2.41.0.rc0.172.g3f132b7071-goog


-- 
Pierre
