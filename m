Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248DA6DF965
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Apr 2023 17:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjDLPMO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Apr 2023 11:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjDLPMN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Apr 2023 11:12:13 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817DC61B2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Apr 2023 08:12:08 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso14866975pjm.3
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Apr 2023 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681312328; x=1683904328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+2dE/XzSoYgXLKmNcRjV06GDc4+0/b0Vl1y/hE9n7M=;
        b=aeDFGpvbhptI26N7c0q6p8N0elzrhrH4jXsXeTNEjUyEmrYyXyguS0uqTeAQjP4Xiu
         qdW1W55Dxz+ZLoGpJW6kOy66QNh2ekD+py7oe7R6tIR1j5Y/Cvcgeo8T0l2JKRmHvNLJ
         j1WZnXp081ZVJbRr2ZvT1E4bX7MyYb2M8Ki3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681312328; x=1683904328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+2dE/XzSoYgXLKmNcRjV06GDc4+0/b0Vl1y/hE9n7M=;
        b=ixxm/etWgOxFORd/Ug+rF2t9ADz6z8nB07R5qVDSB+BhBVF9Y/dcI1Z99I1STd+aXn
         kp5q1a4y+js1cp1KXVK+i7MvEGPcxfnEguyZvUAfmuMz4dbUqZnGUs3rhppgIdZu/IJ0
         Th0lk22QnNBYG0z2oaR8bhf7mf+WC5RiURAfSngHOmRBnlWXFqfWDK99aeDaEPJ65V7s
         TzNq5ggB20DN+LpXNPjkFW60TkDbyjmVsF10nwczBr7mKJkEDLPDKczq2abaLD3+iO5Z
         337TuzdQo6elwW7Nqpuzy9Xd8IvKOlAJ2A9A/P+ah+ef6Xly8JMps8v7hrapqiorOTsO
         521A==
X-Gm-Message-State: AAQBX9d5TrSA3vQpur+tfoYa5PNpmR6X+lLDib7/H+l1LPoqaKyEnm9Y
        W4Ly1W3zx00O/V0jf+JRJyTjUA==
X-Google-Smtp-Source: AKy350YBEJPE8oxKW+WKrzBNuJQ82N/lSby57TJKNApeGFAafpixV3EqtqR6r0kXgUhHbCjyxU4xFA==
X-Received: by 2002:a05:6a20:b047:b0:db:6026:4393 with SMTP id dx7-20020a056a20b04700b000db60264393mr18616114pzb.59.1681312327946;
        Wed, 12 Apr 2023 08:12:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u20-20020aa78494000000b005a8bf239f5csm5518679pfn.193.2023.04.12.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 08:12:07 -0700 (PDT)
Message-ID: <6436ca47.a70a0220.e83cf.adf4@mx.google.com>
X-Google-Original-Message-ID: <202304120811.@keescook>
Date:   Wed, 12 Apr 2023 08:12:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Fangrui Song <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-hardening@vger.kernel.org, Tom Rix <trix@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <20230407215824.GA1524475@dev-arch.thelio-3990X>
 <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 11, 2023 at 05:12:24PM -0700, Fangrui Song wrote:
> On Fri, Apr 7, 2023 at 2:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Fri, Apr 07, 2023 at 02:54:06PM -0700, Nick Desaulniers wrote:
> > > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> > > Clang 3.2.  The minimum supported version of these according to
> > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> > > this cc-option check.
> > >
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > As an aside, we should really consider having some standard format of
> > comment around cc-option checks so that we can easily remove them when
> > they become stale...
> >
> > > ---
> > > Masahiro, Kees: get_maintainer.pl leaves much to be desired for this
> > > file. Can one of you please pick this up?
> > >
> > >  lib/Kconfig.ubsan | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > > index fd15230a703b..0e7ad0782399 100644
> > > --- a/lib/Kconfig.ubsan
> > > +++ b/lib/Kconfig.ubsan
> > > @@ -15,7 +15,6 @@ if UBSAN
> > >  config UBSAN_TRAP
> > >       bool "On Sanitizer warnings, abort the running kernel code"
> > >       depends on !COMPILE_TEST
> > > -     depends on $(cc-option, -fsanitize-undefined-trap-on-error)
> > >       help
> > >         Building kernels with Sanitizer features enabled tends to grow
> > >         the kernel size by around 5%, due to adding all the debugging
> > > --
> > > 2.40.0.577.gac1e443424-goog
> > >
> >
> 
> -fsanitize-undefined-trap-on-error is a legacy option from 2013 when
> -fcatch-undefined-behavior instead of -fsanitize=undefined enabled
> UBSan.
> On the Clang side, http://reviews.llvm.org/D10464 added
> -fsanitize-trap= in June 2015.
> It's best to use -fsanitize-trap=undefined and avoid uses of
> -fsanitize-undefined-trap-on-error.

But that's Clang-only. -fsanitize-undefined-trap-on-error works for both
GCC and Clang.

-- 
Kees Cook
