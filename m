Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF659707665
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 May 2023 01:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjEQX2K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 19:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjEQX2J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 19:28:09 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3746B3A96
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 16:28:08 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5289ce6be53so443897a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684366088; x=1686958088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oq6EIfCd1DWK+kQqrlggmZL7rv0W2xtPvCE8aaDM25g=;
        b=bK1syOrg4KcHv1cZga7z9IDPfeKUE6G/ewfi3LivMauubHYbARj1WyhUjsicWFmkRy
         hhtxca52TtrJE/eSwQbcgFHNCIrfIYCKh83yABuDYaJGgPr2hG2mBtUAMDVlghPzW6eg
         vJwjLnEWD4nAFVGDe1eLssSGxm/wrIVH0vLjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684366088; x=1686958088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oq6EIfCd1DWK+kQqrlggmZL7rv0W2xtPvCE8aaDM25g=;
        b=TMhiJMe+dUhRrz0hXEdYI0exH7f585NFzQv/TDpSZRmdgkDJD6sXEpvTOKW1/4iqz0
         CoLB0dQ6wN7u8YptzALG4taHPdhc+1dGBA/tBNHCsHVm3GQDwaIxb3hoTL3NP2dzlHDi
         l4toMbKAXzgNwRPeLi+Pux+97a9gUr9o+Ss4Pfz0y8I2iLxVupbBXm/dtheqWvn6txO8
         1C+5AtqPQM4QD1W+JkpcOW86Vx5v9LlLVJzIz6H6PGjz0TkW14ZkDMRq7Lz1sVrjczvv
         7QTG1PEvVQgZZ/4tdXkGuECETMma3bNBzs5qq2OObRzhaqVtJvCS8e0EUWUew/7BcyVR
         ZFIw==
X-Gm-Message-State: AC+VfDzUM6WrzdYBRKsw0R9QQC44RhOZfwkoyVD8obo+qLM0XXXfd9Ck
        mhGZcQOmYhIGhQof8DtCL27Jug==
X-Google-Smtp-Source: ACHHUZ5BYM1yKZmIy2acx9+5IUvVjpdmJ82nLcBIjRHGBG5CWjjqKZj6aAsvfUBlpC70XaVi7ykIGw==
X-Received: by 2002:a17:902:e541:b0:1ac:86b5:70d9 with SMTP id n1-20020a170902e54100b001ac86b570d9mr244717plf.32.1684366087694;
        Wed, 17 May 2023 16:28:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090322d200b001a1a82fc6d3sm18084743plg.268.2023.05.17.16.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 16:28:06 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH] kbuild: Enable -fstrict-flex-arrays=3
Date:   Wed, 17 May 2023 16:28:04 -0700
Message-Id: <20230517232801.never.262-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019; h=from:subject:message-id; bh=LXhfRY7mXt3C0oCQx1LsfUvuZ3kBo2weV0EYgwDtdrM=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBkZWME6/e5JLOSrYTsK8DQdfEWyd+XRx8NCin2Eo8x rcYYPc6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZGVjBAAKCRCJcvTf3G3AJqnWD/ 0blEKbkGEGsVJr82Aj1sTDGDwQwhCnkOL6SaR6J/GLizMPxDgCPo/MHDt/3RIlbYyoS46MDraNN/4j feIxScKAO8NXrJj4rhwWmqTsObXrIQhDRpJjIr1LSdp+0hhBn1sMmSSn9jqKKydPaphiy2sdWVZRD6 l1MXwLcZ6hjs8waxUltfYzhrQjeS+2gNnwQ4rBPbEeeLL8HILPnoK1JhPA+lg95j6B4g37PBGtA8t8 QMBwuZ7F7dUQKBCd9/JO51T+fU1nnBgm3lLgQjt+Y877gkftne1GvXuzG1o/6AKa0gFYMtD3Ij/Stf oR4Loq6iuMD9tfG/VlLQr/YYQQdgUKZ33padjA4GAsO0lYj/ZTuKH35RoIKnD2rAmt5GuBdfVPGmdx vTmaWVBHVh+ejMuUVeCQ8XnnslFsdI7lCu/LsjCCQHLVXK8+XdleSp5+9l1BneC9pEBitwMEFM8ASE tItpFooXjaX8VTGo0VIA0nRK2PlXcE6M4L52iavhuWK51AlaDthO1JYTRejVGofjLJ258ginIx51X0 8tTvUDNkB80LBd25Bp8XeSUvy+/eG0cPbc2wpouBOEwYNiok0Yh1r60ugibumenEDbSVQf+iH0N780 qSlTA08gzonNqbnusp2SrjXLQO8tiDX+yY7qMWfCQwWwdyqwL8dQm3fW1Pwg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The -fstrict-flex-arrays=3 option is now available with the release
of GCC 13[1] and Clang 16[2]. This feature instructs the compiler to
treat only C99 flexible arrays as dynamically sized for the purposes of
object size calculations. In other words, the ancient practice of using
1-element arrays, or the GNU extension of using 0-sized arrays, as a
dynamically sized array is disabled. This allows CONFIG_UBSAN_BOUNDS,
CONFIG_FORTIFY_SOURCE, and other object-size aware features to behave
unambiguously in the face of trailing arrays: only C99 flexible arrays
are considered to be dynamically sized.

Enabling this will help track down any outstanding cases of fake
flexible arrays that need attention in kernel code.

[1] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html#index-fstrict-flex-arrays
[2] https://clang.llvm.org/docs/ClangCommandLineReference.html#cmdoption-clang-fstrict-flex-arrays

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index f836936fb4d8..07e5aec1daf5 100644
--- a/Makefile
+++ b/Makefile
@@ -1026,6 +1026,12 @@ KBUILD_CFLAGS += -Wno-pointer-sign
 # globally built with -Wcast-function-type.
 KBUILD_CFLAGS += $(call cc-option, -Wcast-function-type)
 
+# To gain proper coverage for CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE,
+# the kernel uses only C99 flexible arrays for dynamically sized trailing
+# arrays. Enforce this for everything that may examine structure sizes and
+# perform bounds checking.
+KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
+
 # disable stringop warnings in gcc 8+
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
-- 
2.34.1

