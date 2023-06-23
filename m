Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C5473B967
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 16:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjFWOIv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 10:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjFWOIu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 10:08:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3C32699
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 07:08:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51bdc87feb1so734606a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687529328; x=1690121328;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njjfvefyXl0rnY0RAkLd20voYLpqh/jD7Q3os+mFqdA=;
        b=6y/QLhoGn/ykHna+8EqMxl4FS1s982IyymkIvtMTvL7pat2ZOMQEtTIWDiOLoya5w/
         OTqxJMOCDu8s2jcDidAehXgT1LQXAXgyL4aIzo2rIvxCGTmVfPNbbUaV8lK0Y+F/YuDS
         vEt2GoOdZQODTm6yMBGu07PNcaRDp9k9QhYqSwqGiJKwEsfBNCAggo/4slCz9jvjwSmF
         NYtQoH2j0hyB54iCd8SlTvKzpiT4aXCFw/rsX5ovohp5h3CwCDG3YZQHy1araWm/veJF
         Yl77338Tz5DC/9nHyy5tmDXdlWUXtwtCx5IR9RyH7g3TnFQLX5vQKLhfBHILSUFFnQrd
         V3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687529328; x=1690121328;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njjfvefyXl0rnY0RAkLd20voYLpqh/jD7Q3os+mFqdA=;
        b=AR3ynt4habLabhruL6+piNErOr+1NzzRuMwVAf8mkyH8k74HmyooQxhWraiZOrDN0M
         eEqBMi3NB42efgRMHa69m0imw5r4wHCaaAuYm8+WMFJWHVO/9RkB7v3tVrfgKc6CgiHW
         /uulbJfSX2MRlOBnt6rK5aCm9ruUthra+ZnZQD1l5lLEs07i6wy6GzeW60/Y139R2Ol4
         TUJfHGEcgwUlU5jGfKs4/n1HT+LiBzR+2FuTKEUDEIkbaudWkWtMdvuWorJDMwPORljS
         3eRBxKGcg99KysBxT0u5oETIFEVRGDZdqBNkEhWIU83cm8ZPe1NQLzgFK1S61zuBu0gm
         uMcg==
X-Gm-Message-State: AC+VfDwnkXbAIns53zc5pVPCEJOWxYuPSWMqU3H1AR1MzW6f5lfUlM5T
        VShkXGP5/KzCWk0A9WdXJr5dwC32G0qGaZ0VdmI8BQ==
X-Google-Smtp-Source: ACHHUZ4qrH0HkiE4wX27Ol2ygS/npZ0VOcheERNEqtXxBqQ2ndWMYVlQQbBrG1FI5S1aSlQEc93nVA==
X-Received: by 2002:aa7:c6c2:0:b0:514:9e61:e7b8 with SMTP id b2-20020aa7c6c2000000b005149e61e7b8mr14022797eds.40.1687529327950;
        Fri, 23 Jun 2023 07:08:47 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402050600b0051849ba515esm5249877edv.13.2023.06.23.07.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:08:46 -0700 (PDT)
Date:   Fri, 23 Jun 2023 14:08:25 +0000
From:   =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH] scripts/mksysmap: Ignore prefixed KCFI symbols
Message-ID: <20230623140825.ehqk5ndl7uftstwy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The (relatively) new KCFI feature in LLVM/Clang encodes type information
for C functions by generating symbols named __kcfi_typeid_<fname>, which
can then be referenced from assembly. However, some custom build rules
(e.g. EFI, nVHE, or early PIE on arm64) use objcopy to add a prefix to
all the symbols in their object files, making mksysmap's ignore filter
miss those KCFI symbols.

Therefore, explicitly list those twice-prefixed KCFI symbols as ignored.

Alternatively, this could also be achieved in a less verbose way by
ignoring any symbol containing the string "__kcfi_typeid_". However,
listing the combined prefixes explicitly saves us from running the small
risk of ignoring symbols that should be kept.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 scripts/mksysmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index 26f39772f7a5..17cf4292e26b 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -61,7 +61,10 @@ ${NM} -n ${1} | sed >${2} -e "
 / __microLA25Thunk_/d
 
 # CFI type identifiers
+/ __efistub___kcfi_typeid_/d
 / __kcfi_typeid_/d
+/ __kvm_nvhe___kcfi_typeid_/d
+/ __pi___kcfi_typeid_/d
 
 # CRC from modversions
 / __crc_/d
-- 
2.41.0.162.gfafddb0af9-goog


-- 
Pierre
