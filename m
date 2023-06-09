Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3AB72A69F
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jun 2023 01:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjFIXNL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 19:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjFIXNK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 19:13:10 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593C12D52
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 16:13:09 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-43b87490a27so826476137.0
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jun 2023 16:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686352388; x=1688944388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUzQML1afrtwZrUohTSNvqOuPp9f8zXf4jgKClllZrc=;
        b=k7L1/hkWPVa5sXIMDFr5EwevWi4sCanPTdC9hM32/gUrfTN+WRC/0hqGMawZqIJbRA
         awZiMqQO7ekTwxDtlbkeyvRHkFDMMYVVKHqPXA8GBdpy5Scx0j8eNYLbF1oqJYnTfLuA
         q0+wl8RZpQ6Jg9/6yxwrI+Imbqjieov+1yyMVlz9KPo23iVp4YcJ3QFnibPE/hLmrmlY
         /+llYHfRMZGQokbVhA5Ln83o52b4i7s3KcuEHKCeNe2o5ml7yomZ7t1xKl++SuVvgswH
         k0zOuqnAdvAHvTKghNSbKu+kFNjXJjp9I1A7UN+HKUQF4wSY+IxvyGpSUC9wyIHsRKG7
         3Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686352388; x=1688944388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUzQML1afrtwZrUohTSNvqOuPp9f8zXf4jgKClllZrc=;
        b=bZ5YVn7PzVcc78U80PXQkk2nkFmSAdIraTJq6R+z7D5KbylvQnHFbNLbfd3czEdVzs
         lRs0MdM1mjF1kvCIKuoMGgtQ08rO4pDyfcNW04VV5+FvdPOQVRX0+e1nDZTvljS4u0TJ
         VfYlh9Dfjub/MAXM/eu+8ehzAfcpo3CK48Ky5vwM01UqTROJ/nJt+3+TyW4+nXX6F6f4
         bQ0RFcGcf4xTHY6/wtAzPeHJcj/G1tIVHC22QKnQkGURNUKpuL+WmUcjuU/cfNagNmSI
         gWJrLkTsuayesdB49zYK4sQzLtjQHkg7YZJbN98zFugxIkLw5ewG9oTtyyx8nJlGD4VG
         SFcQ==
X-Gm-Message-State: AC+VfDx87sOd3eyvfvSrHzubJ1MubJBX5ygxANN+/Fn0Hs6o3BvF7GWe
        WmAfjsZqLpJwS97pdMZXlORfxT03Pj/2YCK/wzbV6A==
X-Google-Smtp-Source: ACHHUZ7zN1tzJ2TovQ15lGLTtId9SFYpsY0VyLBX+41N3gKky2qYr23rHBMyigh7fL7w30TdDl7Gq6L46ZM0siXJZ2o=
X-Received: by 2002:a67:fe44:0:b0:43b:2c7a:7e73 with SMTP id
 m4-20020a67fe44000000b0043b2c7a7e73mr2298899vsr.14.1686352388309; Fri, 09 Jun
 2023 16:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <ZIOmUkXlegycIExQ@moria.home.lan> <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
In-Reply-To: <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Jun 2023 16:12:56 -0700
Message-ID: <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
Subject: Re: Specifying CFLAGS for a directory on the command line
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 9, 2023 at 4:11=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Jun 9, 2023 at 3:23=E2=80=AFPM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > Hello kbuild maintainers & list,
> >
> > Years ago I used to be able to specify additional CFLAGS for a specific
>
> Probably cause it's KCFLAGS ;)
>
> I used this yesterday, it works.
>
> > subdirectory on the command line, which I used for enabling gcov

Ah, for a specific subdir? No I've not seen that, at least from the
command line.  Such flags can be specified via Makefile
`subdir-ccflags-y`.

> > profiling without editing the subdirectory makefile, like so:
> >
> >   make GCOV_PROFILE_fs_bcachefs=3Dy
> >
> > But this stopped working ages ago, I believe in the 3.x era. Does anyon=
e
> > know if there's a more modern way to do this?
> >
> > Cheers,
> > Kent
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
