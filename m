Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D713E2A2A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Aug 2021 13:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbhHFL4r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Aug 2021 07:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhHFL4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Aug 2021 07:56:46 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5399FC061798;
        Fri,  6 Aug 2021 04:56:29 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so5727632wms.0;
        Fri, 06 Aug 2021 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xxcVP1unxQRf/ma4cBAw6r/5ynUOn9I8kcb6t03qdg8=;
        b=KmpYP3BE+cpz+pElv0OWJBLzo3/xIuvq6uh/veRCW2SSq0AcAWTQVgRa9UU3JVcDpo
         KPP9//VsYE8H7VHboJOQ6KzAVunWP8/1tGbsWCSk5v0IOl0Yy2lWfp+/y4PdkrYrGO04
         PCUpVVNBag26yTzqCaIRcMjafZS5PtD/2WIJahUaewAf5Uu/OeAGdpGlXvTTSrmhc0SB
         Vg7a29cY5yIVTqtwxWKveg/UrfoUVsZjvz2p1kf0ITrj4Z9Dgo/5cIkw7uIDGUYgfuFb
         M/X9acr4R2leiRKc9InK6ryWne5pZyghXK0ehd0nBd8iTeHk9Ad7oj40MIvIabLmwa0E
         0pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xxcVP1unxQRf/ma4cBAw6r/5ynUOn9I8kcb6t03qdg8=;
        b=i4gnRwoXDhyzH0U80UGsQ5HSheqIwJ7mxCRmty9uJTXGHWrqxQjlhMVUYr3fF2KxNc
         H/4FOnhSzuhJASUmrR21wPZDLWkvXAztDY24vN/ppyFa5qPMCn2Jpa82af/W4VJxflpx
         yops00GV8QbT+r3P2qEHFAHiS00qr7Qpzqwd0YuxB7/CaGw6r7z+K0rnZ8aQ6+MXz2Yz
         XJWIIE18b1ZpfPe6Q5wRtT0pzFURwR6mj9k23/GGRvWtkt4mJjSnEV+hsXJT93BJ8yCG
         R0mePq/pXFeQQXOYot/Yfw6DWt5e4GXUay+j2UIt+zrIAJHm3Y0S0/VNMlPXUMDVVUn0
         y+Cg==
X-Gm-Message-State: AOAM531nUPC99plZggKSZx4refxeVnDkVk7oMxb9xvQQ1R96Psm3xnwP
        W4uhTKRx/XMtow2xjzt9/h7M1kJPPQc=
X-Google-Smtp-Source: ABdhPJz3R2vkklO+frfNX6r8aHKE/hIze3yPOvVFk5GPsQnq76HPSuv7pbeeg5nYhh+efbUjTnfXOA==
X-Received: by 2002:a05:600c:4f49:: with SMTP id m9mr17814809wmq.82.1628250987602;
        Fri, 06 Aug 2021 04:56:27 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dc9:8d00:2198:3536:ca51:cd82])
        by smtp.gmail.com with ESMTPSA id b20sm9195179wmj.48.2021.08.06.04.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 04:56:27 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Nicholas Piggin <npiggin@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Babu Moger <babu.moger@oracle.com>,
        Don Zickus <dzickus@redhat.com>, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] Kconfig.debug: drop selecting non-existing HARDLOCKUP_DETECTOR_ARCH
Date:   Fri,  6 Aug 2021 13:56:18 +0200
Message-Id: <20210806115618.22088-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 05a4a9527931 ("kernel/watchdog: split up config options") adds a
new config HARDLOCKUP_DETECTOR, which selects the non-existing config
HARDLOCKUP_DETECTOR_ARCH.

Hence, ./scripts/checkkconfigsymbols.py warns:

HARDLOCKUP_DETECTOR_ARCH
Referencing files: lib/Kconfig.debug

Simply drop selecting the non-existing HARDLOCKUP_DETECTOR_ARCH.

Fixes: 05a4a9527931 ("kernel/watchdog: split up config options")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Nicholas, please review and ack.

Andrew, please pick this quick cleanup once Nicholas has acked it.

 lib/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 090fb54ecff1..b6b951b0ed46 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1061,7 +1061,6 @@ config HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select LOCKUP_DETECTOR
 	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF
-	select HARDLOCKUP_DETECTOR_ARCH if HAVE_HARDLOCKUP_DETECTOR_ARCH
 	help
 	  Say Y here to enable the kernel to act as a watchdog to detect
 	  hard lockups.
-- 
2.17.1

