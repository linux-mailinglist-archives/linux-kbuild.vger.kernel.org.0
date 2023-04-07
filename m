Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9966DB4A8
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjDGUFU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDGUFT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:05:19 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231A4B443
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 13:05:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id u38so27013388pfg.10
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680897917; x=1683489917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdCXGzVGpQlfAukY4hF5kEd5gLRY5hPyCWsVGlyaVT4=;
        b=bwYz6WQu+3CDeyg+SifIEaFQBntjRYmHYdIC1HofzV+goe/tHp5sWvdCfeGZsZ7piN
         N1FsO7VE6dLPXKlSQnQmaITOXYIWZ6VFsn9VcTe2K7icNX7w+c+cN787cHrHryXhO4dK
         sELbD+qVeqs7HWelUIfL7SSA7Y+8Tvv+uJkxqiamcm3hDNcHTHhoF5G7bCAop0dadhw2
         UiJCEqgrC8abVItNLXwBakL7uFAE9srNakmnzka1+iT1a0CAztceb2Q0SNqXFeT48wvS
         TZxLbIONSFV0gZHF1Z6W2TXc8/BAkGmA/JY4TSbvl48Bkw8f6QSHCggxKDXh9cLX+M/R
         TNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897917; x=1683489917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdCXGzVGpQlfAukY4hF5kEd5gLRY5hPyCWsVGlyaVT4=;
        b=dOWAOOU7kvDPU0vi6lJOYOcB+pJ0jS29dpL5aYOxtuM86gB7NaM3zn/3fxHGF87IBQ
         3E/AdcEooaeYzZs1ERq+3XsgPncZHCYzWNGwqNP2tmlz+z99uFPQHg2phQwj4sE9GKio
         c8Zr1cunA2b6Qcu1UxuA+Mjw8h4VxCichVRjtYgC3tBDiwNgpKZVhUR1VTuQ4pD1PcLQ
         uMMtxt/0OyqGYjuQb97QnEVfmxO90CifRbk1/2/C8pkf9v/vmerIgbxqD/EOqhdS4JP+
         lgPkqOwz2i07QaThy5VIT87WyOt9h+cygBezbESt2NnooP7fTH0NOz8DOMFHdJbR1E21
         KRbA==
X-Gm-Message-State: AAQBX9euof1xRPSLu/pXT4L2Ubg+JYm054+Wg8Ehq18SLOeJFny54gbc
        aU2ZxNiJbjeWP+JP01VtmWggqcYOqCdstJ34i2qnvA==
X-Google-Smtp-Source: AKy350bz7+45zvC9ZJN7sODXWkAUgHOWaxCkTpaRsVir3WWnsa1RP/CqiiXRch7jQzDzDvuwIeqbnlQD07DwH3Vojo0=
X-Received: by 2002:a65:4903:0:b0:503:7be2:19a7 with SMTP id
 p3-20020a654903000000b005037be219a7mr724077pgs.1.1680897917336; Fri, 07 Apr
 2023 13:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org>
 <CAGG=3QX65iJEtvMiSD2Ju18f0KfHsi2zPXAQDSh0ScqbCLv=Cg@mail.gmail.com> <20230405205126.GA3280774@dev-arch.thelio-3990X>
In-Reply-To: <20230405205126.GA3280774@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 13:05:06 -0700
Message-ID: <CAKwvOdmG4j4u2Uw3arpkkO4FHQMvWV_MiCiXNpOV3GQqq_5ofg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a note about prebuilt kernel.org toolchains
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Bill Wendling <morbo@google.com>, masahiroy@kernel.org,
        corbet@lwn.net, arnd@arndb.de, keescook@chromium.org,
        trix@redhat.com, nicolas@fjasle.eu, llvm@lists.linux.dev,
        patches@lists.linux.dev, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 5, 2023 at 1:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Apr 05, 2023 at 01:47:44PM -0700, Bill Wendling wrote:
> > On Wed, Apr 5, 2023 at 1:44=E2=80=AFPM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > >
> > > I recently started uploading prebuilt stable versions of LLVM to
> > > kernel.org, which should make building the kernel with LLVM more
> > > accessible to maintainers and developers. Link them in the LLVM
> > > documentation to make this more visible.
> > >
> > > Link: https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-=
3990X/
> > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >  Documentation/kbuild/llvm.rst | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llv=
m.rst
> > > index bfb51685073c..3e1f67b05ca6 100644
> > > --- a/Documentation/kbuild/llvm.rst
> > > +++ b/Documentation/kbuild/llvm.rst
> > > @@ -171,6 +171,10 @@ Getting Help
> > >  Getting LLVM
> > >  -------------
> > >
> > > +We provide prebuilt stable versions of LLVM on `kernel.org <https://=
kernel.org/pub/tools/llvm/>`_.
> > > +Below are links that may be useful for building LLVM from source or =
procurring
> >
> > s/procurring/procuring/
>
> Leave it to me to forget to use ':set spell' :( sometimes I think that
> people would have a hard time guessing I am a native English speaker :^)

https://www.adamalbrecht.com/blog/2019/10/21/spell-check-in-vim-for-markdow=
n-and-git-commit-messages/

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> > Otherwise:
> >
> > Reviewed-by: Bill Wendling <morbo@google.com>
>
> Thanks for the quick review! I will send a v2 once others have had a
> chance to chime in (unless the person applying this does not mind fixing
> it up at that time).
>
> > -bw
> >
> > > +it through a distribution's package manager.
> > > +
> > >  - https://releases.llvm.org/download.html
> > >  - https://github.com/llvm/llvm-project
> > >  - https://llvm.org/docs/GettingStarted.html
> > >
> > > ---
> > > base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
> > > change-id: 20230405-korg-llvm-tc-docs-84304e881bc5
> > >
> > > Best regards,
> > > --
> > > Nathan Chancellor <nathan@kernel.org>
> > >
> > >



--=20
Thanks,
~Nick Desaulniers
