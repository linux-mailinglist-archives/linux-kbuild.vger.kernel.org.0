Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEDA69E913
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Feb 2023 21:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjBUUlu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Feb 2023 15:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjBUUlt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Feb 2023 15:41:49 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C422A6D9
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Feb 2023 12:41:49 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id b16so2353546iln.3
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Feb 2023 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysPH6WPpk5eU7Ka5J53d3h1W3zWHMXnSdV9y5Xs+C1E=;
        b=Nn9ZobLLbydXkfGjLJB+NFQlDhB969riVbUYWeDqDKElp4mXynQXXexrDy0ffT6YK4
         LoGUUYX6NNlTl09hrodIvLY7GmBIcceWjNAegEsFvcRev8u078caDhxO38Fv/L+i8x2/
         JxMK4Ejurbuu4JhDBKiHZwSf4SKsIORadTEsSRqgcjnMpdGc6Q/Jjy7qM6nM/Ysw9EuK
         qOOffUrokZsXg1SCsJ2XJoEfb3S1VJMvYvU5Nc60od4WmEBrUaleGdLosuUbv8ubAj4o
         yViwXi1+ssBG1sK8rmQ7/bbhoULipaDOkKvjSi4bVuiwjkgjVMNqJN6SmEmclDiUuHCq
         AV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysPH6WPpk5eU7Ka5J53d3h1W3zWHMXnSdV9y5Xs+C1E=;
        b=HNMPKfhnpTvY//1/s/bh7zgqWYkQ5ku7G+nkK2st1Nq/R+u8hwwAlz/NvY3WnRJMka
         1PRZbrr9CvHxfCZs3wqE7krDvtEEGWsSgVY7TWA6pxmZHziydHzYFSUPnedYfBmez/FL
         eSGoGpq7t+7uybsisJTk8XpgDSilFAXXiBDCxKuMApGL4Hr1pw/b6Z5jSfYKYQAsDr8C
         35hgrjq9gIHtcUBAe/gt7gWbTfsQ9YS2wSXuVqkQzLLEY9pZQDeBi9IQD4l9VqCtD1l9
         Dm1n27F8gDfrxIdymFzXjjz7eYSf0LjAribk3Evc7b3rb0E4TCz9btyKQP/YpNix0HUk
         QxUQ==
X-Gm-Message-State: AO0yUKUSV6a40mGneRaWrUtDXjz6peF2DF+TLSOMLfmOODqij5PyXo2X
        R97CVXmQH1hXN02v7SSd5CkRFQ==
X-Google-Smtp-Source: AK7set+m/ErfaYzUwjNelWdQ0lF2N37seZTfz5TRGJJBUqu3bDINdvRcHS7vIN3ei6Z6Q0u7jbbHlA==
X-Received: by 2002:a05:6e02:20e7:b0:316:d9fa:f4fe with SMTP id q7-20020a056e0220e700b00316d9faf4femr3001680ilv.24.1677012108470;
        Tue, 21 Feb 2023 12:41:48 -0800 (PST)
Received: from [172.16.32.78] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id d14-20020a02a48e000000b00375783003fcsm6303jam.136.2023.02.21.12.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 12:41:48 -0800 (PST)
Message-ID: <63c2936e-6bc7-67e3-eaf3-0123333381f8@landley.net>
Date:   Tue, 21 Feb 2023 14:55:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: [PATCH 1/5] try generic compiler name "cc" before falling back to
 "gcc".
Content-Language: en-US
From:   Rob Landley <rob@landley.net>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URI_DOTEDU
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Distros like debian install the generic "cc" name for both gcc and clang,
and the plumbing already does CC_VERSION_TEXT to include Makefile.clang.

Previously: https://lkml.iu.edu/hypermail/linux/kernel/2202.0/01505.html
Signed-off-by: Rob Landley <rob@landley.net>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3f6628780eb2..0ac57ae3b45f 100644
--- a/Makefile
+++ b/Makefile
@@ -456,7 +456,7 @@ endif
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
 HOSTCXX	= $(LLVM_PREFIX)clang++$(LLVM_SUFFIX)
 else
-HOSTCC	= gcc
+HOSTCC	:= $(shell cc --version >/dev/null 2>&1 && echo cc || echo gcc)
 HOSTCXX	= g++
 endif
 HOSTRUSTC = rustc
@@ -503,7 +503,8 @@ OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
 else
-CC		= $(CROSS_COMPILE)gcc
+CC		:= $(CROSS_COMPILE)$(shell $(CROSS_COMPILE)cc --version \
+			>/dev/null 2>&1 && echo cc || echo gcc)
 LD		= $(CROSS_COMPILE)ld
 AR		= $(CROSS_COMPILE)ar
 NM		= $(CROSS_COMPILE)nm
