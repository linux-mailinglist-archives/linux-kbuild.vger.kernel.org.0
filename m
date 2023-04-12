Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3916DE86A
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Apr 2023 02:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjDLAMl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Apr 2023 20:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjDLAMk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2023 20:12:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22F1468B
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2023 17:12:36 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso12796271pjm.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2023 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681258356; x=1683850356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUfNHvgbMHbCxR7Z5ej0J4OW6YiW5Ee09V0uQZNWLuA=;
        b=yRuWuTRhiWx3XwFpc57Ol2M1IPyVrYtxZC3LJYOl+z6YsIP1MVABRg2+I1SYgCvB5r
         9ma9A/JibUHa8FeY439yp5Z1o59QK0Jr36B5oqQWOJiPUjdfX83Yl8tuXtbQFh6gLWR8
         dwnI3QGeP/PgL/C7Bi7zDPqNmKSIwYahqjJxsklqdeVWzEfsf3VWL64TZmkx+pwkwv7a
         gY7m98i6jaFqo3atHGNZpP8nwW4Vil4325RnsXUn1l8VDrF2qkisVY/7Id5ooJQIC4gk
         6zn380pEKuZ0vlDDYZsLg2fIGhtIJ61YuSVuQnxwtUt/6ag6cQGbY825Ls8Jf7Edy4hD
         ff9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681258356; x=1683850356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUfNHvgbMHbCxR7Z5ej0J4OW6YiW5Ee09V0uQZNWLuA=;
        b=pPKEY3PXDl6mxmBKKZwPtaWo2RbmCi+KRcGNbYOjzbwSZPtdeaElpEkdkcYW2q0jkn
         EZIVubkC128/eg3VJTV+7vesxXoG1H/3s0nIMeFILD9YBqo6m4JWKG+fpkUNaZAWwg50
         e5xKyx/yotEsJ147efJrA6U3kNSU+ZW25obprKwe1cfP9BMjWOBrP9qg/P6a5OhMHhsl
         /B0vq9PEsBQnACBUGg3H7a6CJ4dDiwlhNnXCeBnDzIIh43OWxReq3stVkODaCSd7a31g
         U7VyjrzoCudApFHa+C2k9o73/dB19Ma+UPCKOQbGqidfIy8+glFawbGKXXoOuZzbAca/
         XJag==
X-Gm-Message-State: AAQBX9eAIfKCcB5Bzf97VqtTQbD9JCtyMSdnodsbbAyb00I2EMgCtpBS
        fpAGNzbtCMnA/q0pk5IArXB++7ReWmrUMGq7TJ02Tw==
X-Google-Smtp-Source: AKy350a6v0Bzy8uTYnPo43Z1a0p7U8LI2dM7an6ki1cKagG6JpglxhSHLcrBIVpCj5q+AYqQphGmoJQ/Nqm5Pnc108M=
X-Received: by 2002:a17:90b:3641:b0:244:987c:a873 with SMTP id
 nh1-20020a17090b364100b00244987ca873mr4635662pjb.7.1681258355815; Tue, 11 Apr
 2023 17:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com> <20230407215824.GA1524475@dev-arch.thelio-3990X>
In-Reply-To: <20230407215824.GA1524475@dev-arch.thelio-3990X>
From:   Fangrui Song <maskray@google.com>
Date:   Tue, 11 Apr 2023 17:12:24 -0700
Message-ID: <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 7, 2023 at 2:58=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Fri, Apr 07, 2023 at 02:54:06PM -0700, Nick Desaulniers wrote:
> > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> > Clang 3.2.  The minimum supported version of these according to
> > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> > this cc-option check.
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> As an aside, we should really consider having some standard format of
> comment around cc-option checks so that we can easily remove them when
> they become stale...
>
> > ---
> > Masahiro, Kees: get_maintainer.pl leaves much to be desired for this
> > file. Can one of you please pick this up?
> >
> >  lib/Kconfig.ubsan | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > index fd15230a703b..0e7ad0782399 100644
> > --- a/lib/Kconfig.ubsan
> > +++ b/lib/Kconfig.ubsan
> > @@ -15,7 +15,6 @@ if UBSAN
> >  config UBSAN_TRAP
> >       bool "On Sanitizer warnings, abort the running kernel code"
> >       depends on !COMPILE_TEST
> > -     depends on $(cc-option, -fsanitize-undefined-trap-on-error)
> >       help
> >         Building kernels with Sanitizer features enabled tends to grow
> >         the kernel size by around 5%, due to adding all the debugging
> > --
> > 2.40.0.577.gac1e443424-goog
> >
>

-fsanitize-undefined-trap-on-error is a legacy option from 2013 when
-fcatch-undefined-behavior instead of -fsanitize=3Dundefined enabled
UBSan.
On the Clang side, http://reviews.llvm.org/D10464 added
-fsanitize-trap=3D in June 2015.
It's best to use -fsanitize-trap=3Dundefined and avoid uses of
-fsanitize-undefined-trap-on-error.



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
