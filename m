Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC23228FBD
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jul 2020 07:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgGVFeg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 01:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgGVFee (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 01:34:34 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A3BC061794;
        Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id j20so581277pfe.5;
        Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KPdtIeRiCWto7/r2HlIJUB1ELu9p8kFXxKGN0Kv2RV8=;
        b=RK6y0inkf644bH7HMH3f/Y3S/+Xz7UIkD7tQsi3+aNhRQ84SHE7xF9nBpzfxSMlD3p
         OC+DYYoDu5CUgzP3mqX9ER/P9Wswja7uydNhG7vnkpBlQRBd6Pz0Bq79Sunex+DwwPtj
         VhOYnXD8+pBRtUKs0US5PEKDkrGa0qbsxn+YtVn7ljszUtg0wjUrdK1c0NJGKM62Gp9c
         pXFXpIhhE+3J05/bDZP4HQjN/GLchnqv6XxMBJA0/hEcoJR9ANdW3H3tY+P0jfpWg/lW
         5sPf7zGNvB021voSG5oHznkTTM+rO7ceybTn7MWkWsFsde3/hGDjWzYbosDNvIfeUUqk
         vC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KPdtIeRiCWto7/r2HlIJUB1ELu9p8kFXxKGN0Kv2RV8=;
        b=m6vpA4uwuX/xMySYXuKGRvqV5sz4K3LKmIkqpf246s/8KhkL7aw8YArnfOg5rMhWAt
         wEHdENGFoQQkhSlMUs8ZMAYSQ9+OtgA2Q9p6Qd9UR7KoIkC0x6PRQYDtyo/yfXXn8Qjo
         X1K+qKTdfQlfNsfIIkhzWoEvaTXOD5JL6Xc8HLPiQI+Ju24sd3kweh5rMW/Aebu0RkHR
         untnJPM8MATt/siF9cNK/aPHhHqpDF0pXR3DeVPQcTQeKs0NGqVsb+/uLPHx3+Tat7X7
         hrrhmInffTX5Y1MVveNli8RfcZk8FvvXQ+J9RKnFOZIABUbjh5jE89XwgbstM3Ki49jc
         j66A==
X-Gm-Message-State: AOAM533Mtma9acbRGgadpITuwStkvohaMQyo/BGFoUmszCU9PfJpvJIM
        lgmdWM7Xf3qtB3mL6DW9aL0=
X-Google-Smtp-Source: ABdhPJzEnds+PLkKN8eDNmkYK4uD6SHGLPBFNNcLnzAPmEtZz/Xo2QR9+lBpb5bJda5G1L3k/3hTBw==
X-Received: by 2002:a63:e057:: with SMTP id n23mr24950973pgj.368.1595396073565;
        Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
        by smtp.gmail.com with ESMTPSA id q5sm22536608pfc.130.2020.07.21.22.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
From:   Max Filippov <jcmvbkbc@gmail.com>
To:     linux-xtensa@linux-xtensa.org
Cc:     Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 2/2] xtensa: add uImage and xipImage to targets
Date:   Tue, 21 Jul 2020 22:34:17 -0700
Message-Id: <20200722053417.5915-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722053417.5915-1-jcmvbkbc@gmail.com>
References: <20200722053417.5915-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

uImage and xipImage are always rebuilt in the xtensa kernel build
process. Add them to 'targets' to avoid that.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
index 801fe30b4dfe..f6bb352f94b4 100644
--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -18,6 +18,7 @@ export BIG_ENDIAN
 
 subdir-y	:= lib
 targets		+= vmlinux.bin vmlinux.bin.gz
+targets		+= uImage xipImage
 
 # Subdirs for the boot loader(s)
 
-- 
2.20.1

