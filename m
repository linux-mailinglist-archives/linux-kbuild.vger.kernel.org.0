Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68A624AD5C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 05:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgHTDdl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 23:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHTDdk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 23:33:40 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD8EC061757;
        Wed, 19 Aug 2020 20:33:40 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id t23so342799qto.3;
        Wed, 19 Aug 2020 20:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FUyxvy8wBj3gCStban8Enm6jAvRD/hlbx2oYRN0jKuw=;
        b=sxk8O+SbQsGNAB0F6wx1Lm8Incn6VQ7tRFJC7evKdhXKghxxCyhfXW/2I+YevvoHzG
         xQZNQkExHqfcnojLEWIkBhiN6RuBcW7IZ0Pfm7UM2LqDBgA0Dw0oIPrgs02L9LiKB4sv
         s9kEwCiGsxUXkgywFb38aibL7bAQHmKlvzDlAqFCvukkjzzT5MXwl1HdYHH21S1LNs0C
         E4ZZTKXZZbjKUmgRtSzwflxgOmeV5N9djAKZZ7bvxSFwTiDNyn/CAr8ycPRG1/V/YvHG
         x/5qZbjdn41r9gVaNIvwU/aKUdcC5d7m4h3SnZNTvsgYxAYkODL35hBZVDdJi0GbqbWu
         AEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FUyxvy8wBj3gCStban8Enm6jAvRD/hlbx2oYRN0jKuw=;
        b=m8eyt+AQnuJhM3G52MQAMtuteHcbKigsmMZQ8Z1qhMEcxzo5lpdrTmI07ORXuMLI2V
         vifKTbbA6t0KgswaJm5+jj5xkROK1XrL3zH03oFWXI6uq5/Avz1YYEjXm2YeSXq8pglF
         mCpR3T5uu+WjLQoGlhZ5t25xKg0eZkFbLc4vL7qFBBsB18j4b9YoaoOlFqjvTOrSJI1p
         VSSq5RZlcv3QZ/REJfB/HBtG5L4E/IvuDLBIYu8XmlTNNjac/KhymG6+qrjgG7f7nqzx
         1GaOY9gJLwWpQaqw4HShbe+lfPtMeOEsWt/5FrgBD7VZS9PCOqdJ7RNpo3hIGdMsXXCk
         l+4w==
X-Gm-Message-State: AOAM531/d593vGBbHaHi7fWvC+xzvvO80SU8vunC6lOZ+6sDZMquQ1aU
        TofQQS+bbD9mn1SOcTBAeGY=
X-Google-Smtp-Source: ABdhPJwx7osUMFolKgqu6fVNuEXRDngNIKRzqyDzx7X6cwjp6UFzxMNzecSfIPj3IWPEE13aiPosaw==
X-Received: by 2002:ac8:4e28:: with SMTP id d8mr1033215qtw.134.1597894419454;
        Wed, 19 Aug 2020 20:33:39 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id h81sm969802qke.76.2020.08.19.20.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 20:33:38 -0700 (PDT)
Date:   Wed, 19 Aug 2020 20:33:36 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?iso-8859-1?Q?D=E1vid_Bolvansk=FD?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Subject: Re: [PATCH v2 2/5] Makefile: add -fno-builtin-bcmp
Message-ID: <20200820033336.GB2167124@ubuntu-n2-xlarge-x86>
References: <20200819191654.1130563-1-ndesaulniers@google.com>
 <20200819191654.1130563-3-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819191654.1130563-3-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 19, 2020 at 12:16:51PM -0700, Nick Desaulniers wrote:
> The issue with using `-fno-builtin-*` flags was that they were not
> retained during an LTO link with LLVM.  This was fixed in clang-11 by
> https://reviews.llvm.org/D71193
> (0508c994f0b14144041f2cfd3ba9f9a80f03de08), which is also the minimum
> supported version of clang for LTO.  Use `-fno-builtin-bcmp` instead.
> 
> With this applid, we can cleanly revert
> commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index e523dc8d30e0..def590b743a9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -579,6 +579,7 @@ CLANG_FLAGS	+= -no-integrated-as
>  endif
>  CLANG_FLAGS	+= -Werror=unknown-warning-option
>  CLANG_FLAGS	+= -fno-builtin-stpcpy
> +CLANG_FLAGS	+= -fno-builtin-bcmp
>  KBUILD_CFLAGS	+= $(CLANG_FLAGS)
>  KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>  export CLANG_FLAGS
> -- 
> 2.28.0.297.g1956fa8f8d-goog
> 
