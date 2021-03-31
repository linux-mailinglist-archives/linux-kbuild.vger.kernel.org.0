Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE1F350761
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 21:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235953AbhCaTad (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 15:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235876AbhCaTa0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 15:30:26 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674DDC06174A
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 12:30:26 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id w10so26378pgh.5
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 12:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w3ch1ntrOHueZWUkcKNLTeORdSBJtecK/4DUp+1n9aE=;
        b=E3OLd99VpT4u9uxlgAdY8lp+qB3qAeNVbSXAbBIesm40tpDnv0YsgA1kLrgnXR1vYf
         LATRcE3Z9N5RL+x+ZPnGkC6Q3ph+DVjxsFm8+9qGK3XA4QipYg9biR49RE+y5WosO5hC
         R3/Xrb9xzjVIzdHZIssuqJ5siiMYMz16XEDN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w3ch1ntrOHueZWUkcKNLTeORdSBJtecK/4DUp+1n9aE=;
        b=VLtUGzWLCouYt2YY3M+Nbk3aj0Zwq7LUI8fTyrFOJv6mjmvazkxcFUyeqUFEfZHA+y
         Zdu7x1lvx0YP5WgQCkPStFjiiGwnyK06RLz0SBcGVALve/WbjHD1uhlh+pLw+isG/4cj
         kTshJ0K/c1XyVULo7tle7b0k9bSphr6jCiTHMyWKJEKCPssCyi2pYzgI7j0gmrtK0ffb
         tJMy7NFqvlRXtoXuUO/IX7ASk38hYfjMdzPBtpcAlfM73K1PJ3muL0oOqdJurEXKMail
         XQheVDeXrdjrceYk8waCREeAfMnhhwgj7f72wafsPMMtcUBjop8fjKGog7DYi1M9VAcu
         u3ZA==
X-Gm-Message-State: AOAM531fWLPinVcDCU+2rHgMvXXNrNkmOWdtF+CbSVSVnUTguHkUUAwz
        XVKvbXycqgh+c2dunaX70IewDw==
X-Google-Smtp-Source: ABdhPJyzFBVCThCNfq8Hn6/CzwwhqkWlUSNYPyroZXPxrTF/w1dzSr3rvrDj7ocbfB7nuoUukiUXng==
X-Received: by 2002:a62:1c8f:0:b029:209:7eb2:748f with SMTP id c137-20020a621c8f0000b02902097eb2748fmr4444943pfc.79.1617219025781;
        Wed, 31 Mar 2021 12:30:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r9sm3302345pgg.12.2021.03.31.12.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 12:30:25 -0700 (PDT)
Date:   Wed, 31 Mar 2021 12:30:24 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] kbuild: Merge module sections if and only if
 CONFIG_LTO_CLANG is enabled
Message-ID: <202103311228.D42822B@keescook>
References: <20210322234438.502582-1-seanjc@google.com>
 <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
 <YFoZBY1SqilWAmx4@google.com>
 <CABCJKucYHQ893LS1iCHXivPS05RMDN2BpDFou306jOEbWnt1Dg@mail.gmail.com>
 <YFvBEIkuFY2ajNlG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFvBEIkuFY2ajNlG@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 24, 2021 at 10:45:36PM +0000, Sean Christopherson wrote:
> On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > On Tue, Mar 23, 2021 at 9:36 AM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > > > On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
> > > > >
> > > > > Merge module sections only when using Clang LTO.  With gcc-10, merging
> > > > > sections does not appear to update the symbol tables for the module,
> > > > > e.g. 'readelf -s' shows the value that a symbol would have had, if
> > > > > sections were not merged.
> > > >
> > > > I'm fine with limiting this to LTO only, but it would be helpful to
> > > > understand which sections are actually getting merged here.
> > >
> > > It doesn't appear to matter which sections get merged, the tables only show the
> > > correct data if there is no merging whatsoever, e.g. allowing merging for any
> > > one of the four types (.bss, .data, .rodata and .text) results in breakage.
> > > AFAICT, merging any sections causes the layout to change and throw off the
> > > symbol tables.
> > 
> > Thanks for the clarification. I can reproduce this issue with gcc +
> > bfd if any of the sections are merged, but gcc + lld produces valid
> > symbol tables.
> 
> FWIW, clang + bfd also produces mangled tables, so it does appear to be bfd
> specific.

Are you able to open a bug against bfd for this?

> > Perhaps someone more familiar with bfd can comment on whether this is
> > a bug or a feature, and if there's a flag we can pass to bfd that
> > would fix the issue. In the meanwhile, this patch looks like a
> > reasonable workaround to me.
> > 
> > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > Tested-by: Sami Tolvanen <samitolvanen@google.com>

Thanks, I'll get this sent to Linus.

-- 
Kees Cook
