Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CBB264A13
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 18:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgIJQmu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 12:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgIJQmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 12:42:37 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B69C0617A9;
        Thu, 10 Sep 2020 09:33:16 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id f11so3655382qvw.3;
        Thu, 10 Sep 2020 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5drfFo8OrkBQsxieqqPtS/rD8KeOpzSM9Ivh40hvsKo=;
        b=lxUYh5StibOI5Wthhlt8onSp3iQb+ijRbirG/WudOb3SxD+8OzuvRMg2WV0VbAKqzg
         NW37Mm+qmEwjTkP/BHaOf0lkHVbbVjRtdwZgmwT8tNowpqHOE0+nAMKYwLt/mlub3v+t
         1q+q0cQIFTlozTAol+QIsI1PrSyG7925PH2TDrGZu5W8nFGrIsm1XMAsRUj57wnS41WY
         o8xJwnrYzNYymErHtnFSVR6a0vuKJ4Yq90jeI5/DzD2Asv92rzzsnQJ6P0LhR+bXWK3J
         2EDQIeZjn6Ok1zPDDcEarH/7K4XlO3FPmItNhsdH4/NYPe907vN9l9LJhQm7NxfzEUhJ
         lEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5drfFo8OrkBQsxieqqPtS/rD8KeOpzSM9Ivh40hvsKo=;
        b=Mjj6UxM80czZCF9VUawyc26wWux17mI1ftEeYzX7fv9GtSqsn0pnL1f8AM47v9fLPM
         /eWSHnvrc4RdZ/X70LZXKwPPAwGxC3A+F/7KnrZEQnNsW93PO+WSU1D7aynqvz51Klb4
         X2Sh9mk8dUdNhCOlnvxyUnh7KYb4/Za1jUF/CcynsdNddeIvZ6iu1fC+i6BrdekdqBxj
         Qbnq4FixSl024enKARpQuigCPBm80Qh1UtNaAznCGvkQHd4x7jujIZGbZmhSsvFlG47K
         76gYBUt5pd3qCc4KTExAq7O0hjXldg3KMDNQAVovGg+XvZg/MxaH8M8pVdQ4vMBTJ/MJ
         Nt2Q==
X-Gm-Message-State: AOAM531+ewlPdDHLPaS2l0yqQ3JwWHaKJXT12RX2vFhZDg81ijFdhGE7
        bXUyN5XkFy1jl0OAMxQF1xc=
X-Google-Smtp-Source: ABdhPJwCv5l1XZsU8An1+ZJmMH+zZxgFOCji1SsQ/G71VTT5iI4o7ua6rzn8tLgCcwJa3xzJCG3igw==
X-Received: by 2002:a05:6214:a8c:: with SMTP id ev12mr9114527qvb.95.1599755593799;
        Thu, 10 Sep 2020 09:33:13 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id e90sm7364097qtd.4.2020.09.10.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 09:33:13 -0700 (PDT)
Date:   Thu, 10 Sep 2020 09:33:11 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] kbuild: remove cc-option test of
 -fno-merge-all-constants
Message-ID: <20200910163311.GB3119896@ubuntu-n2-xlarge-x86>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
 <20200910135120.3527468-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910135120.3527468-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 10, 2020 at 10:51:18PM +0900, Masahiro Yamada wrote:
> The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> 
> Here is the godbolt:
> https://godbolt.org/z/8T4177
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

For what it's worth, the commit that introduced this block is going to
be reverted:

https://lore.kernel.org/mm-commits/20200903201518.JKrRS%25akpm@linux-foundation.org/

Regardless, it was introduced in LLVM 2.7.0 in commit
f9d41df0930986c52e198292cf875eb5d1761ece.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 059b36f2ea53..1b6abecc5cab 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -927,7 +927,7 @@ KBUILD_CFLAGS	+= -fno-strict-overflow
>  # clang sets -fmerge-all-constants by default as optimization, but this
>  # is non-conforming behavior for C and in fact breaks the kernel, so we
>  # need to disable it here generally.
> -KBUILD_CFLAGS	+= $(call cc-option,-fno-merge-all-constants)
> +KBUILD_CFLAGS	+= -fno-merge-all-constants
>  
>  # for gcc -fno-merge-all-constants disables everything, but it is fine
>  # to have actual conforming behavior enabled.
> -- 
> 2.25.1
> 
