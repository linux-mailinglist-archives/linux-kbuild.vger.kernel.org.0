Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FC929381B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Oct 2020 11:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392917AbgJTJfD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Oct 2020 05:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391777AbgJTJfC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Oct 2020 05:35:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F51C0613CE
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2020 02:35:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d81so1068664wmc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2020 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=LDEIxQHmlRFyeNn/Dg+zH74u2Y9CnY7RuAH4UtKO5gI=;
        b=FBZqWMYQKTRCFo2PtIPruHDM8hrX8qT450p+//uMSLxmvepalS86tOyvrOeM51YzA0
         H/NIZJOFymrdGU8Kg2AcM8aw1gty69FQnaQFnJwgF5wDDsTi0ImGJBmXT8ilNXshGRIR
         qpBsuj3bX1dwnOYc3xbCfKTSqIdXtJ2FjDhuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=LDEIxQHmlRFyeNn/Dg+zH74u2Y9CnY7RuAH4UtKO5gI=;
        b=U7aoE5rvZ10aFFfq7EegMAtjMSM2fIHl7A8osxb5dPFS/bHdAYtFnLR5gHyxvBP90a
         alFSbyx74WRB5gPgFtZzDO2FDm/8KKKNNg1f2wu4qSkH2a9jlTPkLFPUSSX2CNYZwUQk
         PvqZfonG1Sm+aABg5d09cMHNgkcEiK/vZNkd0pZzdNNo4UysIdFISq5LAx3BzbZOyk/7
         GiAKS66u0JxrtADX7XH+Awx3+RCBEx6EnIO+J4yckXeTGD6H1KjPipvNNjhrI2TM0IHM
         UN1HYid63INiJvekCGHNTF33GcWDSg7ljzL9yE8TmGrp/hHbkHVoIFuXGeHcbkYRusnK
         uFHQ==
X-Gm-Message-State: AOAM531gGzBpII5gzb3rKXYuWCTB4ak00vJgXATdzBq1AaM3ap7ukxuE
        1EqTy4fGeckTa64Q3UmpmmiedcRJu+RkDQNn
X-Google-Smtp-Source: ABdhPJydDrIW6/Z/Vy4J6TfqKgAnlB+CD7UGMxczOj1Tc+iplffCn9JQoFPiYxCB3trmT+ZZqcbOvQ==
X-Received: by 2002:a05:600c:2302:: with SMTP id 2mr1909157wmo.111.1603186500127;
        Tue, 20 Oct 2020 02:35:00 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:63de:dd93:20be:f460])
        by smtp.gmail.com with ESMTPSA id b15sm2024009wrm.65.2020.10.20.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 02:34:59 -0700 (PDT)
Date:   Tue, 20 Oct 2020 10:34:59 +0100
From:   Chris Down <chris@chrisdown.name>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: Use uname for LINUX_COMPILE_HOST detection
Message-ID: <20201020093459.GA48796@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

`hostname` may not be present on some systems as it's not mandated by
POSIX/SUSv4. This isn't just a theoretical problem: on Arch Linux,
`hostname` is provided by `inetutils`, which isn't part of the base
distribution.

    ./scripts/mkcompile_h: line 38: hostname: command not found

Use `uname -n` instead, which is more likely to be available (and
mandated by standards).

Signed-off-by: Chris Down <chris@chrisdown.name>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index baf3ab8d9d49..4ae735039daf 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -35,7 +35,7 @@ else
 	LINUX_COMPILE_BY=$KBUILD_BUILD_USER
 fi
 if test -z "$KBUILD_BUILD_HOST"; then
-	LINUX_COMPILE_HOST=`hostname`
+	LINUX_COMPILE_HOST=`uname -n`
 else
 	LINUX_COMPILE_HOST=$KBUILD_BUILD_HOST
 fi
-- 
2.28.0

