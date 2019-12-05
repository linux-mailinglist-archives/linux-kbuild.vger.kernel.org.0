Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0273113B1C
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 06:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfLEFQM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Dec 2019 00:16:12 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:42553 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfLEFQL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 00:16:11 -0500
Received: by mail-pj1-f67.google.com with SMTP id o11so780201pjp.9;
        Wed, 04 Dec 2019 21:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ww1S/rh1zvVSbDB8LGNfJmI8PQTr/arnIocKw0gWGl8=;
        b=Y04NfUREjbe3zdo7X89e/wfYGWmcqr39cyvuNQ16XNypEpakmwIkNsHRhcBlF2g8ec
         +mVDHwjug7tCWWkldbb1wtrYNwIKTiYH8yftPw1wcsTrZFpqV3JRjJjCteCv7DmOsjqM
         eomg07ry4ngm+jPJ8logCCgmukHoctYXc9I21Koxz1Lg8VN5z0Db16YXMuXIWxrqypoS
         kSwihR/jeB1aP4sXM24i6mhvdsKfYWTg/BiH11iK7w6RPp8eEBdIEB6doFP/2DVhdYDd
         juAd1HR8IUaBgcgEOL5XZzgbLUpk0JB3UkZm+LrfOpG3rphUGyGcOaIVikeXOV0YM6ov
         g0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ww1S/rh1zvVSbDB8LGNfJmI8PQTr/arnIocKw0gWGl8=;
        b=eoSp4X+WnZ2kYOl0MGnoyPdA5MCDMzJlFVtMYMFwXvb4hIKZxaLk724CFi30U2Qt68
         LwVrEGkGIcCfKoDNIpimDw+twpemFbDKWG4qeM9wqye3jASbArLYJACkOC1uM8Wo3bTz
         tcTOJzCjm++9BlYVjyPED030o76VLpP8+5etS16ZS3v1yrI8/RU+u4hLj3HQODYrh9n7
         RJVyDffr0uXsQhQ5e8aP2fmVvxonrTmJ7Xbo1T2se2201t4yFxaRczvxzh/1T3zpD8P6
         0Z5No4Kmp+vnNM/r84nU64qGKcVivyNpt3WCjCcOohI9Sg2qpBhGhfd7IzzZIru+fzqX
         PZ/Q==
X-Gm-Message-State: APjAAAVszZHoEDxjltscD0nkKt8SFH+r5oEuEwiNBjYeVkjjOMmJUfOf
        fSUAH7/fPJ3ob6M0r16molU=
X-Google-Smtp-Source: APXvYqyYK+vX3i6kTCy8SGVG3+K3wCBVDFA5GE7Lqx89mGyYYlX6hB4yuOs5p+fVjtX3k2uqJe6y6g==
X-Received: by 2002:a17:90a:b906:: with SMTP id p6mr270229pjr.81.1575522971353;
        Wed, 04 Dec 2019 21:16:11 -0800 (PST)
Received: from Slackware.localdomain ([103.231.91.38])
        by smtp.gmail.com with ESMTPSA id c2sm9860569pfn.55.2019.12.04.21.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 21:16:10 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rdunlap@infradead.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] :scripts:kernel_modules_info.sh Removed unnecessary headers information 
Date:   Thu,  5 Dec 2019 10:45:50 +0530
Message-Id: <20191205051550.22927-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Strips off the unnecessary details from the header information as Randy
pointed out.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kernel_modules_info.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
index b74203322157..c1fe7fae9228 100755
--- a/scripts/kernel_modules_info.sh
+++ b/scripts/kernel_modules_info.sh
@@ -2,8 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #===============================================================================
 #
-#          FILE: kernel_modules_info.sh
-# 
 #         USAGE: ./kernel_modules_info.sh 
 # 
 #   DESCRIPTION:  Running kernel modules information.
-- 
2.24.0

