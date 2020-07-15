Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424DC220F30
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2020 16:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgGOO0j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jul 2020 10:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgGOO0j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jul 2020 10:26:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216C9C061755;
        Wed, 15 Jul 2020 07:26:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x8so2452353plm.10;
        Wed, 15 Jul 2020 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Cf7VzUGNcVW14TxQ7W+i6Ijja36UwcJjRErcM4N9znc=;
        b=LqWxujlr5FI8tOftLMXDC2FrO1bETiMZL5N/zvR32Cr+VM9Qa7FxhZ0D0v1C4gbMVt
         RALDAW9w8pHRhDIbqWX7d8HR3ArZPW9CObUh3arqYIGcOdYqK63kfiRLx8l6nj9b1Yi9
         MRkrKug2lXN4V/2r6Z8EYQFuzZGQz1KjVowvR/2YS62NiYpNlXINwvk6HPmHJol8do56
         vudp7YV+bgjbWgRKwxomyR4wc8ZSxBXvWfNM4gDdzs8vFX0SDeVRJr+JX7eVU85nBFnY
         SfWy3yDl+aHjP3ThhfYX6BLpo/r+4Yl1xh7A0YLjOkfj6FdjEDTe5w37Q4xqd6qlrdrC
         9biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Cf7VzUGNcVW14TxQ7W+i6Ijja36UwcJjRErcM4N9znc=;
        b=f4mQSu0jnkBm6IJKJAUN7pKs8q8z8lAyggP8psguxaCJril9Ssqhvul966eT5qrTl4
         HxhtVbmIujYj03iUpVNqwoJLXOAU0+/4B0DGHp5Z4TLH0Yjw+p5fSLj4xBacrrMeNaV7
         iA5aKizC6kLEmExK1uyncBSv0vQaxArkp9KNh0ie3l9DTTRmQu2EYacFsH/czQku0y+h
         t3TnrN8dxhdHbl0nFIgNrPaexq8BFwiF8MSoVlTHusePFWY2YbUrxhE3Nv2lpDshmTvY
         XritN7UacARTl2vSGDUUbziZC5uIoV8fC47m7wbYdNhrt7Cfm9tr6t45uvzYSnxTKKHm
         nmrQ==
X-Gm-Message-State: AOAM532tCsm/NRIkE2xwC+5o76maASWws+0HnA+g20lli9MGqT4QFcMo
        Io/vbE5eMr3UZKf63X+DBCc=
X-Google-Smtp-Source: ABdhPJxc+PcUyRXPFSiepL+frTS2yx9txd8EAmyAZUd70euDlFa2pRe1xLDwQfwe4R+3T7s6lvZg4g==
X-Received: by 2002:a17:90b:4910:: with SMTP id kr16mr10502482pjb.126.1594823198263;
        Wed, 15 Jul 2020 07:26:38 -0700 (PDT)
Received: from mritunjay-Lenovo-Yoga-S740-14IIL ([2405:201:6402:aeae:6d34:5d62:d650:d199])
        by smtp.gmail.com with ESMTPSA id q13sm2639207pfk.8.2020.07.15.07.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 07:26:37 -0700 (PDT)
Date:   Wed, 15 Jul 2020 19:56:31 +0530
From:   Mritunjay Sharma <mritunjaysharma394@gmail.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] Modified Makefile to print -eudyptula in the version string
Message-ID: <20200715142631.GA3721@mritunjay-Lenovo-Yoga-S740-14IIL>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Signed-off-by: Mritunjay Sharma <mritunjaysharma394@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0b5f8538bde5..d7897ce5ab23 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 5
 PATCHLEVEL = 8
 SUBLEVEL = 0
-EXTRAVERSION = -rc5
+EXTRAVERSION = -rc5-eudyptula
 NAME = Kleptomaniac Octopus
 
 # *DOCUMENTATION*
-- 
2.25.1

