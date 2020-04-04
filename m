Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88BA319E2F0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Apr 2020 06:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgDDEvx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Apr 2020 00:51:53 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32940 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgDDEvx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Apr 2020 00:51:53 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay1so3649677plb.0
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2020 21:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VtnwtgiEvNaRy9Qnd0vNktO6BIuGes3v4sHlRKc0K68=;
        b=CBqdE1a0bFq2j4uwHqNbXQoeHno/z1H39dYGxSKI8UfnLBq+xXaKHCrO+ydqqf2xqC
         orL5mq9dZcF5EvxGKVwk2SWK3neKuXXFsoDtGakEetvK/IhmdSC+yBorFYxU0iNhZMfo
         e+GGP86L/6gDYPBM5e0gPu4fX0MCZKl6kXKwzsH1TMLAEQSpvp19SazdEQmJ7aakIa34
         JVDzIqTCMxHhtGQyUIAreDcIA3WvrCNT02KtFW3A08a+0xCtUSm6ZopDu9DWjL9dwF51
         t3vXzDKY79mrKvv4YIEXbgMoBb6lXt8yLPynA8EIp1SzhNRBI+0xYnlR+v53buQ8pysn
         y3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VtnwtgiEvNaRy9Qnd0vNktO6BIuGes3v4sHlRKc0K68=;
        b=g0TMYoMUPSPP3RdlxhDck2Zw81WbzZKkezaTFp6HFri/WO0+yPIfbhdAgm+V867/Aw
         rBMDREfVh6OvUCuTeueX9cNts1JECAIwoR3VwRMx1gGKS9qYoCmanRBV4d/oLmgYIhkz
         b9QkGLMhsI8dR9hBEji/RUP9grtihH0zcULXcvqAsZeyHY2GVUk9KctKYjhPAZAk8CMi
         Ej+lYR25zWn185Pse/JXXy2ltaTrRjGKaNzPinUvl1KW2uZCCmbUao+b49kv0491tYC/
         3sB2lobEiOmKiXDQw714PQKhiLglzACkWdsdV18P/ptS2e7TwprTpHZ25XUL1FBO4UEB
         Epug==
X-Gm-Message-State: AGi0PubB5NLaGZ6BhO1upM3Tamh5yEQZDO+QoyecHUfELk/qmWofOTCt
        B0sOOlwIM7r4rozEGbQpDQlg+g==
X-Google-Smtp-Source: APiQypJZTcuOltwGMD3uc8rx+ZllhMqM10gylCbIh72vhT54Kd0crfqfhxZ9wvYwfd71IYsigKRXqQ==
X-Received: by 2002:a17:90a:ba93:: with SMTP id t19mr13501086pjr.67.1585975912420;
        Fri, 03 Apr 2020 21:51:52 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id e126sm6773681pfa.122.2020.04.03.21.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 21:51:51 -0700 (PDT)
Date:   Fri, 3 Apr 2020 21:51:49 -0700
From:   Fangrui Song <maskray@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <20200404045149.ot22fmotljg7aim4@google.com>
References: <202004020117.6E434C035@keescook>
 <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
 <CAKwvOdnO_-jiQzCmy7pQNMGmZsgD9J=PYXVzOQ1NF1+u44MsOA@mail.gmail.com>
 <202004021129.F688E2D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202004021129.F688E2D@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-04-02, Kees Cook wrote:
>On Thu, Apr 02, 2020 at 11:22:02AM -0700, Nick Desaulniers wrote:
>> With Kees patch + Masahiro's diff applied:
>> $ cat /proc/version
>> Linux version 5.6.0-rc7-next-20200330+ (ndesaulniers@<hostname
>> scrubbed>) (clang version 11.0.0 (git@github.com:llvm/llvm-project.git
>> 6d71daed03ced011cd25f4e4f4122a368fdc757d), LLD 11.0.0
>> (git@github.com:llvm/llvm-project.git
>> 6d71daed03ced011cd25f4e4f4122a368fdc757d)) #167 SMP Thu Apr 2 11:17:36
>> PDT 2020
>>
>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
>Awesome! Thanks for testing. :)
>
>> We could actually use this in Android for a VTS test I've, uh, been
>> meaning to write.  Also, LOL at scrubbing the "compatible with" part,
>> reminds me of user agent strings in the browser, which are god awful.
>
>Heh, yeah. That's there because (actually, I think _you_ told me this
>when I asked during the ClangBuiltLinux summit) other tools scanned the
>LD version string for the binutils-specific bits. For this, since it's
>newly added to the kernel /proc/version, nothing is already expecting to
>find an LD string, and it looked super weird in there if I left it
>as-is. Hence, scrub!
>
>-Kees

Thanks for the patch! This is a great idea. The linker version may be
more useful if link-time optimizations or future post link-time
optimizations are enabled. The linker will do code generation just like
the compiler and there will be lots of variety. The LD version can
become more useful in the future.

> +  LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \

This User-Agent style hack reminds me of https://reviews.llvm.org/D31199
... Looks like nobody had posted patch to teach libtool about LLD yet!
So, I just posted a patch. It should appear on
https://lists.gnu.org/archive/html/libtool-patches/2020-04/index.html in
less than 15 minutes.


As what Nathan has just said

> With this patch + Masahiro's fold in:

Reviewed-by: Fangrui Song <maskray@google.com>
