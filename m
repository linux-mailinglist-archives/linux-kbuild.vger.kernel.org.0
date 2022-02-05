Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6C04AA6F1
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Feb 2022 06:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239000AbiBEFp2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Feb 2022 00:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239126AbiBEFp2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Feb 2022 00:45:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D124DC061347
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Feb 2022 21:45:27 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id y15-20020a17090a474f00b001b88562650aso138018pjg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Feb 2022 21:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theiggy-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vbldjp/sI5U3L950Z1XBq3fWUGEWJU56GG4Y373Oc5Q=;
        b=4P5KsmOfmhYogvtJenyRt1sCEdivvG7L+mA9zBw5mnHNEZuSWMtmDWBD00x9gAkACZ
         Xw481Hbm66Hy4/VSK5aiKhPSputTo9XZK3GrHcSNt9R5/IYp2z+aM98N4megyPLvbdcW
         f2MiQG/tmh1VxqzoY7QScHXyFOwQuwr4mWxoTb6NZ4++WEXty8LaX2q44uKCJD0HeNJb
         YbrDeIGS3AvdjROLaEepr6i0TItPYimyjbMN1aJoOwcAdsuYKrYr8gtbPuV5ZmU3RXyi
         J5yx8TnDxBs/ZijLHuXm2+ViBFLLRe6FpEJKH8+DA6Hi7uZvpcMXwZKiQgYxI2ZA9Lfa
         YTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vbldjp/sI5U3L950Z1XBq3fWUGEWJU56GG4Y373Oc5Q=;
        b=D+FcWgfP1bD8/+EiIERz+kG0aLJVVcAa6rZzHDlwojqe8n1CfHXcxUI1n86hB27uYd
         aVvGPFgpz/RMT4cIBX7doe9+1aauWjCwK2SbwM8G2e7Rxq7lRDLvjjh4B7qOA5v5oTvC
         P1UjCyBkGPHzSSsKrAuYyhSi76+iXf6GGrPQBsjUfaXijXQnZGaS5VBhQDazSj+d3zm3
         CvvwnhzYbEekLdsTm0zj6yJFDmmmeMIcCyvTCLTKrRvMHAuMu2jBhy05kjl21ijD7AWT
         ndbDXjFrXWeVsV6OhvngutCbeq/JYtnIg30N20qe2o6QIeu8vKStiy3Ietl9/SVQi20p
         SmpA==
X-Gm-Message-State: AOAM533Wo+gbzZr/VCqEgOHK+Va7gJadxX5xRof96fw2XLTU3TaYuAw5
        1lR+cHov42X+wamBTFhAO2qKc2AjfPW2PA==
X-Google-Smtp-Source: ABdhPJwPkJms8hvIif2n23FNOaEOBVUxF0pFPuy/tguXR38i4ve7/U+H70Bksaq2z42XOomz3WnttA==
X-Received: by 2002:a17:90a:741:: with SMTP id s1mr7159410pje.161.1644039927062;
        Fri, 04 Feb 2022 21:45:27 -0800 (PST)
Received: from venkman.lab001.kws1.com (23-114-170-204.lightspeed.irvnca.sbcglobal.net. [23.114.170.204])
        by smtp.gmail.com with ESMTPSA id u16sm2926771pgh.54.2022.02.04.21.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 21:45:26 -0800 (PST)
From:   Iggy Jackson <iggy@theiggy.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Iggy Jackson <iggy@theiggy.com>
Subject: [PATCH 1/1] fix PVH bootable kernel on some compilers
Date:   Fri,  4 Feb 2022 21:45:18 -0800
Message-Id: <20220205054518.3863277-2-iggy@theiggy.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205054518.3863277-1-iggy@theiggy.com>
References: <20220205054518.3863277-1-iggy@theiggy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Certain compilers (I haven't quite tracked it down to if it's a certain
version or distro specific things) strip out some metadata that is
required for PVH bootable kernels to boot properly. They require a couple
extra CFLAGS to tell them to not.

I'm not sure this is the best way to fix this (in fact, I'm sure it's
not). I messed around with `call cc-option` a bit and couldn't get it to
work.

refs:
https://github.com/cloud-hypervisor/cloud-hypervisor/issues/3222

Signed-off-by: Iggy Jackson <iggy@theiggy.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 1fc349109..f681d0b41 100644
--- a/Makefile
+++ b/Makefile
@@ -978,6 +978,10 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
 endif
 
+ifdef CONFIG_PVH
+KBUILD_CFLAGS += -Wa,-mx86-used-note=no
+endif
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
-- 
2.34.1

