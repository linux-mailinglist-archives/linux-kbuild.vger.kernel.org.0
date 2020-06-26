Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4269020BA2D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 22:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgFZUVx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 16:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgFZUVx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:21:53 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE85C03E97A
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:21:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u185so3061881pfu.1
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mCCNxLWvOEPbR1jlpJw8AgOuTdUdrqJ6GuWfi7uxTow=;
        b=QypkpiSsx4NUwMWxcUn+8hePyF1+R2042GPj2XUDzNHJadpb6r+7aOaNBGB70MTNuG
         MLJtSscoNogqziRuqfrwx+9ELZoJAm3hPZrH7CiW+G/4HKkqtcUubzBzcLxs9Ny9D6yK
         UZOoZ/Iy2mRWZiJ2nV3raq74FOeM7j5zXApjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCCNxLWvOEPbR1jlpJw8AgOuTdUdrqJ6GuWfi7uxTow=;
        b=pEH1SBsO0r/RHstzF5W+P0iYzf0KeMHdPzG596KDiPTB62HBGyx0nP9pXAIm8Q2WcT
         TaiPMtba57LhZL+bdQWnSjNg0J3vUaa1qS0r7uVfWspwf6PBxhnvpR1YLiTBsVFgmhCd
         usE1tWhTT+Q8qiQSb7sA0yfk0VOz0p72FnbQR9Ptx6G6pMpAtH61Va4MAl351KbOiH94
         xhZJzRHgoRZfbZYez10KNC5xRd6EDa4Hmh/V6lDXrmWELUTy7J6XoM9ENmQHfUAvPGNj
         LZhq1yKEQMKIo0ku2LJbU8LH6dtlJ+NMOwVysK4wcYyS6YqeoXjssI3AP0lOHhY/yLE8
         gKmA==
X-Gm-Message-State: AOAM533wD+jiBpa8o2dWvhBeKcSqo7egQlQjWA2j6JkJXWN3+2y809nf
        wp8YLYz+Kg3WBW2DBlM2vLH36g==
X-Google-Smtp-Source: ABdhPJzzKO0Y6uxrVG0V0dlF6eO3WerWosOLQ/7tIGgWjqtKUKIB7ff57STce4b/Hd01Er7roSIa0Q==
X-Received: by 2002:a63:1910:: with SMTP id z16mr441252pgl.50.1593202912639;
        Fri, 26 Jun 2020 13:21:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o8sm15798576pgb.23.2020.06.26.13.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:21:51 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:21:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <202006261319.F130204@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
 <CAKwvOd=V_M43CP7G87K3TqSsxua2NcXPz6BnDt-z6167O2WAzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=V_M43CP7G87K3TqSsxua2NcXPz6BnDt-z6167O2WAzQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 01:13:20PM -0700, Nick Desaulniers wrote:
> On Fri, Jun 26, 2020 at 12:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > +++ b/Makefile
> > @@ -762,7 +762,7 @@ ifneq ($(CONFIG_FRAME_WARN),0)
> >  KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
> >  endif
> >
> > -stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> > +stackp-flags-y                                    := -fno-stack-protector
> >  stackp-flags-$(CONFIG_STACKPROTECTOR)             := -fstack-protector
> >  stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> 
> So it looks like the previous behavior always added
> `-fno-stack-protector` (since CONFIG_CC_HAS_STACKPROTECTOR_NONE was
> always true), but then we append either `-fstack-protector` or
> `-fstack-protector-strong` based on configs.  While that's ok, and you
> patch doesn't change that behavior, and it's good to be explicit to
> set the stack protector or not...it seems weird to have
> `-fno-stack-protector -fstack-protector` in the command line flags.  I
> would prefer if we checked for not having CONFIG_STACKPROTECTOR or
> CONFIG_STACKPROTECTOR_STRONG before adding `-fno-stack-protector`.
> That doesn't have to be done in this patch, per se.

No, it would add only what was latest and most selected. (They're all
":=" assignments.) If CONFIG_STACKPROTECTOR_STRONG, only
-fstack-protector-strong is set. If only CONFIG_STACKPROTECTOR, only
-fstack-protector is set. Otherwise -fno-stack-protector.

-- 
Kees Cook
