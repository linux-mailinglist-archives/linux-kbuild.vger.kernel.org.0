Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9EB055CDC3
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 15:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345701AbiF1M2D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Jun 2022 08:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345706AbiF1M16 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jun 2022 08:27:58 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAB82A73C
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jun 2022 05:27:51 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r20so17486513wra.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jun 2022 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tb0t65jsbHJl74LbXn7xY7xw4eMs9qTMATyi3JCBvfo=;
        b=U9my8jxUxg/O9/IM764HdUfoUJ1/0PxPY/DxLNTodgfsYi3V5aQYKxoNv4C8F0QnMb
         AhZ4UNDxOAr9aFw2ia2bXMBqXD85gflBsiu+PE4A7D1Yl8/7m6U/b8wd6mtPzKHEvjpP
         JNGgiB6zkj9JfswjNmwlMy16fZOMMXkDPvR+YoeWvU/+mi0Rja8j49tv6IvZlswnd9IU
         GxAJfsKibmF1vZSMv3bZ2vpXH7t9fsE7zFlWLU7ESHp1kscg46v70TFaeElCNQC0KJaH
         ZlC4LPGJ3u1HrhVgY28KdpW99YFobfyYkFRPzK/O2BlOlQ2IWB1QZSuGhLak8iosgf0V
         wG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tb0t65jsbHJl74LbXn7xY7xw4eMs9qTMATyi3JCBvfo=;
        b=vdQ4MIo4GvDH+pgo5viQEC8PNCZsBSWtZ3c4IqZWm1kEdP97XjjvgMXqqo8Jr1doib
         zZxQ0WSHHlZqeH7RbLsieMvUKpOOgKXW7XXSoyrM9Zinf2sHQ7gDfVYTthFu2nvSdiAa
         DP1WbNNqT9ujsYmFTtMZVllCrZby6sGgGugMaboGKNJdjtHJMTgE5gZXzJr+/jMQ3fD8
         61bhYTVKJilwnANc8HUfqdJja72Njh5UByDd5EmaZB+K0wcIqOeJZzWzJeQpedA9y2j+
         nCRDn7GRmWPywUXTma5700VhA8U5Q4bTO3gX16imPRl9O/f75pH7Cx/vMhTA3e66llXd
         JGhg==
X-Gm-Message-State: AJIora+j5e0JlPd36nK0h1kDtwXLTfTP6U/NgbAaC75QZPq+6DF3+9o9
        gDWPaFlpiHTz9ODj9a2vXEepZw==
X-Google-Smtp-Source: AGRyM1sEgEQCWJLYG0thDMOLQ9G5zPwdAxURojB8U7z+FJm4KwwTAVmermo6VcLaUomfdQ3hiIRTgQ==
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id s17-20020a5d4251000000b0021b885b2fccmr17944898wrr.52.1656419270152;
        Tue, 28 Jun 2022 05:27:50 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0039746638d6esm17184212wmb.33.2022.06.28.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:27:49 -0700 (PDT)
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Makefile: Enable clang-tidy and clang-analyzer for gcc builds
Date:   Tue, 28 Jun 2022 13:27:40 +0100
Message-Id: <20220628122741.93641-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628122741.93641-1-daniel.thompson@linaro.org>
References: <20220628122741.93641-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is now possible use clang-tidy and clang-analyzer even if your primary
compiler is gcc. Remove the checks that prevent gcc builds from using
these tools.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Makefile b/Makefile
index 9ea6867aaf9c..0afef56d8203 100644
--- a/Makefile
+++ b/Makefile
@@ -1901,17 +1901,11 @@ targets += $(extmod_prefix)compile_commands.json
 
 PHONY += clang-tidy clang-analyzer
 
-ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
 clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
 	$(call cmd,clang_tools)
-else
-clang-tidy clang-analyzer:
-	@echo "$@ requires CC=clang" >&2
-	@false
-endif
 
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
-- 
2.35.1

