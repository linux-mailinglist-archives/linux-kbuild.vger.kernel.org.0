Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7303DC17C
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jul 2021 01:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbhG3XNE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 19:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbhG3XND (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 19:13:03 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CBFC061765
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 16:12:58 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k1so12831337plt.12
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rF7mbISoz19dUz/oW6jxXI568yNQq5pNBLha/PiCGUk=;
        b=e40z75Cvx9jiXQ8fL+z9FrTa2M9GVFRD1AT1wCVful0LoFt40nDMQZHchxYNbkeCXs
         NiXt/boy+Q8vM38x+KjQiFGRpeCa2lYTKKAUpErF05alt9de90aNHs/fNGkYayptqS4c
         5vCWgySFChnhRhCz/Fb/1Y41TwMhcIYlE4yx8b7QsitBxth7mtSCmytJuTp5zBahDPnc
         QUlKICvBaJdh5VZGzvhSqxYjH07PLYyIoSwUMT9TPo8TWWQ93ii0i9osxu48rC0K+iGz
         9VswqTxdcLsHbAfWN12RfsxYBljwMd6VLV/hDk7vW+aPzz932ExF3mVjjH9mLljSMCMZ
         ZMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rF7mbISoz19dUz/oW6jxXI568yNQq5pNBLha/PiCGUk=;
        b=NKl7I+ho8NdaPUapC4R68iXAi0Td94N8GEEvtyOqtyAhjA2QV9lqO7PjcD/qqbUYdU
         5hTZF5s5G9R6Lxdd/KQ3y8T6HDA5yW9dUpqSMm24gsHiAamxsHatXFDoQzqZQ0axD8VU
         AVsWILCTqF5P3QlKd689UvKA321ClyX0nE7fiYwy0AMVq6dnuucTHjgCKwmWjE2Ia9QQ
         Qb8crRDfj87HjaBlsQwdxk+0fZVkfePlQiUSNzsr9dqorvhNpX0pOVURImotiX+eCwZB
         r+R6JBd/Cd2C+/kLcjqyM+XyoowHMabh9nYkRKAZ4Il/WVyZI/ZUMYImw9zUoBRESbRU
         Gu8g==
X-Gm-Message-State: AOAM532CSW5fxg39F7BdvftDlwgUDuX9fFAhnQf19LZuNQDT09jvtIcM
        Gv3/i6wJik2JpQyt2GzA9Cxlbg==
X-Google-Smtp-Source: ABdhPJxTPa3w3pVzlRJtexQCNQ7AQtdL/PoUa8qYm2V8jVpfzJrO/RfSBl7DGR6nHwzQFvvthQE1Pw==
X-Received: by 2002:a63:d757:: with SMTP id w23mr4312873pgi.434.1627686777969;
        Fri, 30 Jul 2021 16:12:57 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:160:995:7f22:dc59])
        by smtp.gmail.com with ESMTPSA id j15sm3487012pfh.194.2021.07.30.16.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 16:12:57 -0700 (PDT)
Date:   Fri, 30 Jul 2021 16:12:52 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 3/3] Documentation/llvm: update CROSS_COMPILE
 inferencing
Message-ID: <20210730231252.r6fi6c3i6obbcgfi@google.com>
References: <20210730215708.276437-1-ndesaulniers@google.com>
 <20210730215708.276437-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210730215708.276437-4-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-07-30, Nick Desaulniers wrote:
>As noted by Masahiro, document how we can generally infer CROSS_COMPILE
>(and the more specific details about --target and --prefix) based on
>ARCH.
>
>Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
>Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>---
> Documentation/kbuild/llvm.rst | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
>index b18401d2ba82..4292f0686316 100644
>--- a/Documentation/kbuild/llvm.rst
>+++ b/Documentation/kbuild/llvm.rst
>@@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
> Currently, the integrated assembler is disabled by default. You can pass
> ``LLVM_IAS=1`` to enable it.
>
>+Omitting CROSS_COMPILE
>+----------------------
>+
>+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
>+
>+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
>+``--prefix=<path>`` to search for the GNU assembler.

and the GNU linker.

Reviewed-by: Fangrui Song <maskray@google.com>

>+If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
>+from ``ARCH``.
>+
>+That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
>+
>+For example, to cross-compile the arm64 kernel::
>+
>+	ARCH=arm64 make LLVM=1 LLVM_IAS=1

Is  ARCH=arm64 make LLVM=1 LLVM_IAS=1

preferred over

   make ARCH=arm64 LLVM=1 LLVM_IAS=1

?

> Supported Architectures
> -----------------------
>
>-- 
>2.32.0.554.ge1b32706d8-goog
>
