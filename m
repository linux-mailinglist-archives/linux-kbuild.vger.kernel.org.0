Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEFA9F34D
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2019 21:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbfH0T2Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Aug 2019 15:28:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33173 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbfH0T2P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 15:28:15 -0400
Received: by mail-wr1-f68.google.com with SMTP id u16so26526wrr.0;
        Tue, 27 Aug 2019 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SeFHORwP0KKGlcV55f8im298zyWvbw1KHenZzAs1bo8=;
        b=hq2tqphiTJC6saEWs4pfHw0h65iROisRo5ehuKqjVkIVGZoHaZbV6wdvFMMcEkSbw5
         gRJ2wnqKkSIuWCrSLiEdqqtuykt5lAzWloJ//lNP48SMDhwywPC1emuvwZoN2xkQR1vM
         ZzgsBCB+6jF+Dej9oXS2biJgzob2t8rUb1WNQ7gQUyEYLNEfvNOFbf4qUtq9+4cm1iH/
         +J+BkMIOvu5KTScPjONkExhKrElE+773XZPXGb+/92HldWLo/Q2PQeF/rO3R7ehv2jO5
         NO1Qwud9N1/DWG5hzVNWW++LZg7jsdERlrp1htad4e2ZyNR9nkwCAMew2oubUJ230UQg
         EF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SeFHORwP0KKGlcV55f8im298zyWvbw1KHenZzAs1bo8=;
        b=dq2thvnrsKwnIAe3c75umJnrXoBE37veqrosKDfM8M4UmzvGFYUb85v9HMyhcHpXMV
         02g1HOEEigxJgPW26chXCf3I6cOay2Zd+FOrkcpPfMG20TDA/hd+Lb1kU2LCPz4UKuOM
         a6UsB5Y0DzNRjs5+Z8LTMksoG90jYySYXVOpKNXe8TyFao/HhgS4pcjvTI65XoDe0+C9
         IyKbBOmE/BzQ+4ZfyREesli3XKY5g/kXjHwSJgnmQ5ZyJQH4FGXIbqElIQIzm/6BHy5i
         p0Kmc3u8If6ptsfG19eFEbRwZ3AEDAp5VFr8b2HemIKKK2Ijx1UO6VkOQ9kgZWBbE757
         MbAw==
X-Gm-Message-State: APjAAAUdRyG3jPBXpjAFpMIumllmpsRtJALRHu7uCfqgZh2qcOFlCrwv
        FBvC14voWXucQF7hU2Uuy3U=
X-Google-Smtp-Source: APXvYqyj0C+7XYoesvcSM7jqhXKXn5kF4uBVIiVOL4P29Y4sKLW3XxRVKGC/6UC6LMH0hwS23VDD4w==
X-Received: by 2002:a5d:4b8c:: with SMTP id b12mr33150527wrt.26.1566934093318;
        Tue, 27 Aug 2019 12:28:13 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id k9sm14405337wrq.15.2019.08.27.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 12:28:12 -0700 (PDT)
Date:   Tue, 27 Aug 2019 12:28:11 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
Message-ID: <20190827192811.GA24626@archlinux-threadripper>
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827103621.1073-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 07:36:21PM +0900, Masahiro Yamada wrote:
> GCC and Clang have different policy for -Wunused-function; GCC never
> reports unused-function warnings for 'static inline' functions whereas
> Clang reports them if they are defined in source files instead of
> included headers although it has been suppressed since commit
> abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
> inline functions").
> 
> We often miss to remove unused functions where 'static inline' is used
> in .c files since there is no tool to detect them. Unused code remains
> until somebody notices. For example, commit 075ddd75680f ("regulator:
> core: remove unused rdev_get_supply()").
> 
> Let's remove __maybe_unused from the inline macro to allow Clang to
> start finding unused static inline functions. As always, it is not a
> good idea to sprinkle warnings for the normal build, so I added
> -Wno-unsued-function for no W= build.
> 
> Per the documentation [1], -Wno-unused-function will also disable
> -Wunneeded-internal-declaration, which can help find bugs like
> commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> I added -Wunneeded-internal-declaration to address it.
> 
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions.
> 
> Some of them are false-positives because the call-sites are disabled
> by #ifdef. I do not like to abuse the inline keyword for suppressing
> unused-function warnings because it is intended to be a hint for the
> compiler's optimization. I prefer __maybe_unused or #ifdef around the
> definition.
> 
> [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

I am still not a big fan of this as I think it weakens clang as a
standalone compiler but the change itself looks good so if it is going
in anyways:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

I'm sure Nick would like to weigh in as well before this gets merged.
