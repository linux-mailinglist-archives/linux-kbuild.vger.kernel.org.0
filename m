Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926BF724B15
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 20:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237800AbjFFST4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 14:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238363AbjFFSTt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 14:19:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954E6170D
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 11:19:48 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977cf86aae5so475697866b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jun 2023 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686075587; x=1688667587;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfDJR/t/R8v+kkq6WSypx/pjYRl69eWZm/SAQbjXXU4=;
        b=tCGwhphy/iL586tvvdr7tBjj5PiLyKE7zGdomHcNIFJcO6bAr+FrY17Ud+Pd+ggpMx
         Dwv+cE4fUILAMwIOXrbefjafY6rnXvjx0dDmOKShX7qqEyKIp4V4IIcLvldh52lUtF9+
         OV1zDLsNzggeAIjnZQgOvfV3C6Xdipe4NuleBY3KJXaAet1f0hokDYksfMFWiDUF6ynG
         /2oRX4sBem2HJs/vL9J0g/Bgmw6JcqNIZUdcsckTs4KVYQaFjjpv5zUQYDeCdTGGHtD5
         RPOa3Xb6z+u27Ao3iurhzrejU1Dziti6vA6t7NQEpLcLQb+Hh1R5dOakR22W7Vunssip
         BblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686075587; x=1688667587;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfDJR/t/R8v+kkq6WSypx/pjYRl69eWZm/SAQbjXXU4=;
        b=IcWxulYQrf6V1r7CX6jSGO13gV2MggtQf/OxpJRKUamPYMoVdK//A3fLciIRSFvvLh
         yaG06LzsHIc4sfuSahCjFhlhWuf6QwpZcrE1i/JJlWAvBWu/t3qZQ/dmjYyC8qz4W5F1
         BXnoQ/zA2fUFLYIw+IHPqrDEl4rr9r7mO5sSzQMYNoEbL7nZLSofPVzGgL5B7vW8UNkg
         tWiSY1YM8puWBojpakRZi3zYwKxQwE5xGFl+X/J3sIHKcuuGRl2m3zcANe+alVYoVzq0
         mGApKY/HPuoSYW2Z9MJ12jFbIsXk8Mt9L7iN0EvAaQFDv2kD4K1N+Cqa9t3RKZFwoCbN
         TJdQ==
X-Gm-Message-State: AC+VfDzfxWR9S10d4J3l9Yi9TjGXStz1WJH3aIOC1skFUuaClqdYrBaA
        OoxmVgrBzFfVjM8oU+D9dF0Vm4MnltuEGGZXXKEBfw==
X-Google-Smtp-Source: ACHHUZ48hurD1DPvN9c+UL4txduO2qoXItoLN23OiU7ZmofnPwHx+qUsorqgTFkIQynRs15Np3WEuA==
X-Received: by 2002:a17:907:934b:b0:973:946d:96ba with SMTP id bv11-20020a170907934b00b00973946d96bamr3453149ejc.69.1686075586657;
        Tue, 06 Jun 2023 11:19:46 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id rh19-20020a17090720f300b0094edbe5c7ddsm5938856ejb.38.2023.06.06.11.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:19:45 -0700 (PDT)
Date:   Tue, 6 Jun 2023 18:19:36 +0000
From:   =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ard Biesheuvel <ardb@kernel.org>, ptosi@google.com
Subject: [PATCH] scripts/mksysmap: Ignore __pi_ local arm64 symbols
Message-ID: <20230606181936.bw62oyqswo7jomra@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Similarly to "__kvm_nvhe_", filter out any local symbol that was
prefixed with "__pi_" (generated when CONFIG_RANDOMIZE_BASE=y) when
compiling System.map and in kallsyms.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 scripts/mksysmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index cb3b1fff3eee..a7de0f637cc7 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -40,6 +40,10 @@ ${NM} -n ${1} | sed >${2} -e "
 # arm64 EFI stub namespace
 / __efistub_/d
 
+# arm64 local symbols in PIE namespace
+/ __pi_\\$/d
+/ __pi_\.L/d
+
 # arm64 local symbols in non-VHE KVM namespace
 / __kvm_nvhe_\$/d
 / __kvm_nvhe_\.L/d
-- 
2.41.0.rc0.172.g3f132b7071-goog


-- 
Pierre
