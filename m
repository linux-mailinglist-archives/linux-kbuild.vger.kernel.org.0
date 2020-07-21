Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1132273C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jul 2020 02:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgGUA1t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jul 2020 20:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgGUA1t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jul 2020 20:27:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAD4C061794
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 17:27:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so768491pjg.3
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 17:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eHMkd52N9iG/J38uCcPxIkcFupcNU7Z95N/n272nES4=;
        b=JnOQyrPOjp8U4Qxp718M6F2K1vYere++W78PpAQmkQTjjRuiCwTiRymUuMbyYp8x3z
         f0lOJ02SfXfK1BSYjBAUwcEG649O6miSZpI5TntWAIUUdpDilgvyXInWpT2hX/gKKQ29
         mRHbaGiBWO0Vwu70hG5X939xB2ivtYqIrdmIvo5uvx/+p90r8djVEwYGQH9lgJPC+Pp6
         fvS2jH8Mr3AGjtLPifJQLqmc6Qz86vN+uNXi77ECVDk6RuCCSJH9oCZ3vvCZgnHw+9uR
         rvDUJZmxAQTmYvHNO/gpNQzBYGuyszoYrOz+0cHubEDJLMFB6ZSm502ZRtDDjSO4DPbW
         R4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHMkd52N9iG/J38uCcPxIkcFupcNU7Z95N/n272nES4=;
        b=awo72EVzwZeLoEAPFUgwZSGwAGjaIiVxA/cU7kmWBSTV4Cyagvzgx9b5X8vwXCnSmQ
         hoNbcffUsIxZZpZUG6/mDWjLvwUkvRVpfgmMub9CdlsCxHNfZ/k3YOBOJg5NVwvB+Tz0
         TIvlJu7Abqja6PRPl4sGff2iZXMBsEDn2t1JI4XYWucN2InfKiQckofHHQIqxNqO4pWy
         aW84nx8fTSMY6q62ix3+HP85Lxq4lkH2BObNMe2sxAByJ13Gax6a+V/VdIZ2Ga4e8LW7
         ewyQeLNr/3DoJNfASwQhQzqlOJJoVSdkeU76AlbKLK/GBNKrr7w0SSAZ8mjGTIYR+hSs
         bf3Q==
X-Gm-Message-State: AOAM53385SKInyA3dmLCj0i9UaYziNELKt45Twqq5+iXlmCte6Spjmd2
        a2zIBgIZtCYatiQ6jx4fSA4sKd3TrFo=
X-Google-Smtp-Source: ABdhPJwMiVGdCJ/oTtHkqhLZ2OV8CS78/nFJcz+Jp2i9jIjwcpykNtgN/M4+Do/9zXTgCj7tEums/g==
X-Received: by 2002:a17:902:8d8b:: with SMTP id v11mr4583554plo.316.1595291268175;
        Mon, 20 Jul 2020 17:27:48 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:a6ae:11ff:fe11:4abb])
        by smtp.gmail.com with ESMTPSA id s89sm768445pjj.28.2020.07.20.17.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 17:27:47 -0700 (PDT)
Date:   Mon, 20 Jul 2020 17:27:44 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Manoj Gupta <manojgupta@google.com>,
        Jian Cai <jiancai@google.com>, Bill Wendling <morbo@google.com>
Subject: Re: [PATCH] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross
 compilation
Message-ID: <20200721002744.c5a4dj5t2hfac25o@google.com>
References: <20200720181237.3015826-1-maskray@google.com>
 <20200720181646.GA6160@ubuntu-n2-xlarge-x86>
 <CAKwvOd=tF7j-mTHMKvvmRkxjFZ-a2ah2+4zLY527WtebZzum8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOd=tF7j-mTHMKvvmRkxjFZ-a2ah2+4zLY527WtebZzum8Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-07-20, Nick Desaulniers wrote:
>On Mon, Jul 20, 2020 at 11:16 AM Nathan Chancellor
><natechancellor@gmail.com> wrote:
>>
>> On Mon, Jul 20, 2020 at 11:12:22AM -0700, Fangrui Song wrote:
>> > When CROSS_COMPILE is set (e.g. aarch64-linux-gnu-), if
>> > $(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-,
>> > GCC_TOOLCHAIN_DIR will be set to /usr/bin/.  --prefix= will be set to
>> > /usr/bin/ and Clang as of 11 will search for both
>> > $(prefix)aarch64-linux-gnu-$needle and $(prefix)$needle.
>> >
>> > GCC searchs for $(prefix)aarch64-linux-gnu/$version/$needle,
>> > $(prefix)aarch64-linux-gnu/$needle and $(prefix)$needle. In practice,
>> > $(prefix)aarch64-linux-gnu/$needle rarely contains executables.
>> >
>> > To better model how GCC's -B/--prefix takes in effect in practice, newer
>> > Clang only searches for $(prefix)$needle and for example it will find
>
>"newer Clang" requires the reader to recall that "Clang as of 11" was
>the previous frame of reference. I think it would be clearer to:
>1. call of clang-12 as having a difference in behavior.
>2. explicitly link to the commit, ie:
>Link: https://github.com/llvm/llvm-project/commit/3452a0d8c17f7166f479706b293caf6ac76ffd90
>
>> > /usr/bin/as instead of /usr/bin/aarch64-linux-gnu-as.
>
>That's a common source of pain (for example, when cross compiling
>without having the proper cross binutils installed, it's common to get
>spooky errors about unsupported configs or host binutils not
>recognizing flags specific to cross building).
>
>/usr/bin/as: unrecognized option '-EL'
>
>being the most common.  So in that case, I'm actually very happy with
>the llvm change if it solves that particularly common pain point.
>
>> >
>> > Set --prefix= to $(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
>> > (/usr/bin/aarch64-linux-gnu-) so that newer Clang can find the
>> > appropriate cross compiling GNU as (when -no-integrated-as is in
>> > effect).
>> >
>> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> > Signed-off-by: Fangrui Song <maskray@google.com>
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/1099
>>
>> Sorry that I did not pay attention before but this needs
>>
>> Cc: stable@vger.kernel.org
>
>Agreed.  This change to llvm will blow up all of our CI jobs that
>cross compile if not backported to stable.

Thanks. I did not know this.

>>
>> in the body so that it gets automatically backported into all of our
>> stable branches. I am not sure if Masahiro is okay with adding that
>> after the fact or if he will want a v2.
>>
>> I am fine with having my signed-off-by on the patch but I did not really
>> do much :) I am fine with having that downgraded to
>
>Not a big deal, but there's only really two cases I can think of where
>it's appropriate to attach someone else's "SOB" to a patch:
>1. It's their patch that you're resending on their behalf, possibly as
>part of a larger series.
>2. You're a maintainer, and...well I guess that's also case 1 above.
>
>Reported-by is more appropriate, and you can include the tags
>collected from this thread.  Please ping me internally for help
>sending a v2, if needed.

Nathan's draft patch on
https://github.com/ClangBuiltLinux/linux/issues/1099 actually works.
I removed the slash. The words are my own. Since Nathan explicitly
requested a downgrade of his tag, I'll do that for V2.

I'll do that anyway because I need to fix a typo in the description:

$(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-
$(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-elfedit

>>
>> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>
>I tested with this llvm pre- and post-
>https://github.com/llvm/llvm-project/commit/3452a0d8c17f7166f479706b293caf6ac76ffd90.
>I also tested downstream Android kernel builds with
>3452a0d8c17f7166f479706b293caf6ac76ffd90. Builds that don't make use
>of CROSS_COMPILE (native host targets) are obviously unaffected.  We
>might see this issue pop up a few more times internally if the patch
>isn't picked up by stable, or if those downstream kernel trees don't
>rebase on stable kernel trees as often as they refresh their
>toolchain.
>
>Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for offerring proofreading service! I'm working on the
description...

>>
>> if people find it odd.
>>
>> Thanks for sending this along!
>>
>> Cheers,
>> Nathan
>>
>> > ---
>> >  Makefile | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Makefile b/Makefile
>> > index 0b5f8538bde5..3ac83e375b61 100644
>> > --- a/Makefile
>> > +++ b/Makefile
>> > @@ -567,7 +567,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>> >  ifneq ($(CROSS_COMPILE),)
>> >  CLANG_FLAGS  += --target=$(notdir $(CROSS_COMPILE:%-=%))
>> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>> > -CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)
>> > +CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
>> >  GCC_TOOLCHAIN        := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>> >  endif
>> >  ifneq ($(GCC_TOOLCHAIN),)
>> > --
>> > 2.28.0.rc0.105.gf9edc3c819-goog
>> >
>>
>> --
>
>-- 
>Thanks,
>~Nick Desaulniers
