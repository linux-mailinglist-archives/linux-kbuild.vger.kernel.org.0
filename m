Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78915727AFE
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jun 2023 11:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235124AbjFHJPj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jun 2023 05:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbjFHJPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jun 2023 05:15:39 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49394E46
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jun 2023 02:15:37 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso2063475e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jun 2023 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686215736; x=1688807736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcEISIDNto7bVB3X4uewYDXy4Y2gVCqbmdu4ZLZezEY=;
        b=yGnq8ftGesQWNAnnk6kFmQScY6bmN/aZzan9A1PY6jRYtaYT/ZytO29S37reDaPbuh
         hDRm157Qvw8g3ohSUDZmE4bGwZQ+5sHLo6yimfNYQevzbeQBZZbPF/ND6HNS3zSDXx1U
         90kHHHns1cf2PIpDAsZr9t3C9X3Guy0GFVFq89zPBUB4NC3t8kC0my27FvUQXT67uyIo
         m0cxDG8yW0Y1NwArq4Nt9LHaA+rWo6ccFWfH+bUxYRpJJ3LP5nS9C27WVwjX1ybsdiDp
         +Sa04NXDHcOq90LxaHtCUVZMIhyT27vD2xfkqL1svxUM9Yey1QAiIZ7xgHg1lIxXu2Rz
         LS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686215736; x=1688807736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcEISIDNto7bVB3X4uewYDXy4Y2gVCqbmdu4ZLZezEY=;
        b=B2JwU4fJoppgUUl86n9bSUUx8nSDl6PAd3J/DV6nr/IVq0Vjge1WpqALhVtkCxRHDQ
         3+FDefmOtJWcW6nngvWUSzqurkYjY08cMFlZOYVWIA8WR+oakD9Tk5/BEWMgXv+YzP7O
         Ct0G3KHmdwGk7v+QO2mBgZIGOxmBkFknhigFjNxPiHWUEZxnZa9tvUE0lfZ6eTvJYexF
         dfJRXMgFN0oSAqVo9EzwpNQz3LKMjcRPQ9VKO+ccNdEVMADVUvDcMdoMQzhpqiCyvVso
         t+xBOArZv0TTL33SZ5qv/k6HJLByES3WSBycU1/uuiIg/L2O4n1upquI5LklIsh+6qlY
         F50A==
X-Gm-Message-State: AC+VfDxJ3TQwu7SLWbc8WA5tfODSApfnvQbRblB55nV8qvyA9JFP9ZsT
        XpGIdn1VEFmYiGxh1jw+iPvRXQ==
X-Google-Smtp-Source: ACHHUZ684p2cvPfl7jo1XVe+oO2AU0Brj8qUl1HKEa+c4vNwYuLVVz5CkBN3R0mQZGRJ5nBuPk5MZg==
X-Received: by 2002:a7b:ce16:0:b0:3f6:3da:1603 with SMTP id m22-20020a7bce16000000b003f603da1603mr920932wmc.26.1686215735734;
        Thu, 08 Jun 2023 02:15:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c23-20020a7bc017000000b003f1958eeadcsm4599680wmb.17.2023.06.08.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:15:34 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:23:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Rusty Russell <rusty@rustcorp.com.au>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] modpost: fix off by one in is_executable_section()
Message-ID: <9ef94ec4-bbb0-43e6-866f-40f68128cd78@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The > comparison should be >= to prevent an out of bounds array
access.

Fixes: 52dc0595d540 ("modpost: handle relocations mismatch in __ex_table.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d10f5bdcb753..c3cb69c276ae 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1139,7 +1139,7 @@ static Elf_Sym *find_tosym(struct elf_info *elf, Elf_Addr addr, Elf_Sym *sym)
 
 static bool is_executable_section(struct elf_info *elf, unsigned int secndx)
 {
-	if (secndx > elf->num_sections)
+	if (secndx >= elf->num_sections)
 		return false;
 
 	return (elf->sechdrs[secndx].sh_flags & SHF_EXECINSTR) != 0;
-- 
2.39.2

