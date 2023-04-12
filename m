Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9396DFD45
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Apr 2023 20:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjDLSOL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Apr 2023 14:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjDLSOK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Apr 2023 14:14:10 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3851C468E
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Apr 2023 11:14:06 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id y63so6226644pgd.13
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Apr 2023 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681323245; x=1683915245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ31eEt6ZYO43YiugcfpSmhC+pVuzGTb6Zz9KcAavfM=;
        b=vPofuZHIlhfX+z2SNgprxinQozpSZBivzLioAa02Vh4CbOQvKruyUSng5BJb3+2x6m
         BWgKaeoklbSElYf8aVzcH7T7XATjsnAnebZHGs/LbFWCIR0Cn6Cer0rm8FPFWEY660wa
         zuY0hdsRCAfsQ3DBNg3SgqDGqYOZn2LDXcS4sYotY+nLwd0en1CjaBkQZRzE4EsVQ52/
         ku3rYsbfzwFQRMl/tbpEszdHABMWHU9/JG11CZcpTeDUeijH7s4u0GC/FuD+2X8zJZcr
         j7PBAHmX0gHOCJXW85/xp9wxxzZTCJC7iFkrzB2JvrObM5tqpw06FagdVai3X2VRH/vZ
         dXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681323245; x=1683915245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQ31eEt6ZYO43YiugcfpSmhC+pVuzGTb6Zz9KcAavfM=;
        b=VIoOTCwETSIsZuz1Qi0IzClVcQb3sGzyd8njCKBJxLClGqyGgOpbah9e/+AgwKBq9P
         EiMc2m1wRWBu79F0xVjIxGerZZ4OXwZu7m5+n9UnPX09gJbITahIdtyHvUElw+MDktNf
         K4EHfLOhp0871dHdQ0nBwqUB5Je054qeeflbNPqyBuYgN0IpgWoFgkVk/BlN0/bbFs/U
         usCR9itW5sRYUoLptqeGGqa5+tNywZL8M1iuPdIkDepkmUR8RFKjBZ4oQzHkzY37Wyhy
         i0yFYBInfdUAQgHjm96y2fyaHF5LvMREUaZSVh1dcLfdusiYdyTeaDRqGgymm2wbE1MD
         vcJQ==
X-Gm-Message-State: AAQBX9e7MYryWZgQeDjSdR7+Oe0nGK5HOp+9IJQbBzSjy4BDL4OQTV1p
        5dUF/F4Ib/YbrzLUs3xeHXxCyF/bk/lTnwefyIi1Tw==
X-Google-Smtp-Source: AKy350YqdV99jeX0kMzDXAbWTGOCcv8Rkwt8IAeySrgHWgkIMB5tfHY8Z+rwpBHb+G4KrRxgFc7ThZ7IXuy2tQXa+ro=
X-Received: by 2002:a63:a47:0:b0:513:90eb:a37c with SMTP id
 z7-20020a630a47000000b0051390eba37cmr840341pgk.11.1681323245458; Wed, 12 Apr
 2023 11:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <20230407215824.GA1524475@dev-arch.thelio-3990X> <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
 <6436ca47.a70a0220.e83cf.adf4@mx.google.com>
In-Reply-To: <6436ca47.a70a0220.e83cf.adf4@mx.google.com>
From:   Fangrui Song <maskray@google.com>
Date:   Wed, 12 Apr 2023 11:13:53 -0700
Message-ID: <CAFP8O3K2c-7wCeDrxPaFpNe-yV9M1g0BPQw7qA6JdpUD74dC1w@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To:     Kees Cook <keescook@chromium.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-hardening@vger.kernel.org, Tom Rix <trix@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 12, 2023 at 8:12=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Tue, Apr 11, 2023 at 05:12:24PM -0700, Fangrui Song wrote:
> > On Fri, Apr 7, 2023 at 2:58=E2=80=AFPM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > >
> > > On Fri, Apr 07, 2023 at 02:54:06PM -0700, Nick Desaulniers wrote:
> > > > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1=
 and
> > > > Clang 3.2.  The minimum supported version of these according to
> > > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. D=
rop
> > > > this cc-option check.
> > > >
> > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > As an aside, we should really consider having some standard format of
> > > comment around cc-option checks so that we can easily remove them whe=
n
> > > they become stale...
> > >
> > > > ---
> > > > Masahiro, Kees: get_maintainer.pl leaves much to be desired for thi=
s
> > > > file. Can one of you please pick this up?
> > > >
> > > >  lib/Kconfig.ubsan | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > > > index fd15230a703b..0e7ad0782399 100644
> > > > --- a/lib/Kconfig.ubsan
> > > > +++ b/lib/Kconfig.ubsan
> > > > @@ -15,7 +15,6 @@ if UBSAN
> > > >  config UBSAN_TRAP
> > > >       bool "On Sanitizer warnings, abort the running kernel code"
> > > >       depends on !COMPILE_TEST
> > > > -     depends on $(cc-option, -fsanitize-undefined-trap-on-error)
> > > >       help
> > > >         Building kernels with Sanitizer features enabled tends to g=
row
> > > >         the kernel size by around 5%, due to adding all the debuggi=
ng
> > > > --
> > > > 2.40.0.577.gac1e443424-goog
> > > >
> > >
> >
> > -fsanitize-undefined-trap-on-error is a legacy option from 2013 when
> > -fcatch-undefined-behavior instead of -fsanitize=3Dundefined enabled
> > UBSan.
> > On the Clang side, http://reviews.llvm.org/D10464 added
> > -fsanitize-trap=3D in June 2015.
> > It's best to use -fsanitize-trap=3Dundefined and avoid uses of
> > -fsanitize-undefined-trap-on-error.
>
> But that's Clang-only. -fsanitize-undefined-trap-on-error works for both
> GCC and Clang.
>
> --
> Kees Cook

Just filed a -fsanitize-trap=3D feature request for GCC:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109489 :)

https://reviews.llvm.org/D10464 (2015) does mention the state of the
legacy option:

  // https://clang.llvm.org/docs/UsersManual.html#cmdoption-fsanitize-undef=
ined-trap-on-error
  -fsanitize-undefined-trap-on-error
  Deprecated alias for -fsanitize-trap=3Dundefined.





--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
