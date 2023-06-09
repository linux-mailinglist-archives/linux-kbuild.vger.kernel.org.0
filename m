Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6773772A697
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jun 2023 01:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjFIXLj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 19:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjFIXLi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 19:11:38 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D622D52
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 16:11:37 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-43b4c99e90bso777734137.2
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jun 2023 16:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686352296; x=1688944296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ/1HgyyA454JKaBKTbO5tqzwVnMFB7ZMiwJOANBGbU=;
        b=YMqNmWJw0+TjXfQo6mhykWwAeRKAlXVMvBLsKEeGLVEnsUyhPdt565dnObhRcj5gw7
         72t7tiqIhN/b9O4632ubjg+f22D4VYYdPsahLgao+1xBEcM82FFQ5VbCrJmvmpUDN621
         T6EE82f/lSGhBr3LHR3ZBP1XfZU8KGCVVAgQQaAUcoeKPrPcjqWrev17XUo1tidVQx0h
         8mEmcOpLYsLJaPXFgbwy2f1x7gbApfYAbgYlJbEZpPzmZ8OKULkKuz17ERh516oJFj1Q
         Mwcz6K2V9H2qa9F1GpWqrMVvwm1WOomAyjFO/ZLqCZuC9z3uuEj5FTprVOm+frmO44lP
         dx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686352296; x=1688944296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ/1HgyyA454JKaBKTbO5tqzwVnMFB7ZMiwJOANBGbU=;
        b=f2tIFggjZBitc75eJ8IboEJAjSaMnB3nv6L1I2Ig+hVl1Y6+oRnUX7yXPaqo7fAfvj
         jc6rbdgKAfGFPMesEx4rxvXIm8MaHSjOHc84WJ+fKPZB42b/CwCE1AR2f834Hp8njAiF
         MIG769mKfzb/bu8G7Jbs0TLSacPM//XslRH6qvfBv3nLhR2XUzwF2oXtMSsbrj3EsPdJ
         S3vhwemSGOkrXkVwULTO65rr+Nytt6AnVJ7QsP8XgA4eMU1wa/Whc2RfaEOSuD5eRKyr
         C6dD7WZEbbMWEASMAO7FdimSK9mMJHw02EWjxcOX/2LBy+rMNICHkXg9+pAvWq9A3rR5
         zNbw==
X-Gm-Message-State: AC+VfDx3kZjNU8Qpr3GIAd/P5mb9V6CB7W17pICbK4wcd7zLh1CPg4gw
        VjZtB/5Y2/hDczJwvscqhL++mkv3YNePjl5LrM1qfXmj6MA1HH/pfNQ=
X-Google-Smtp-Source: ACHHUZ7I9f/XLHcSl2bnL/Rj9aLNuyWZR5s51pQo6ZAc+/WmPMd8mr+BnBR6UDlh11F6lcT75t5+20uCJfOCkxf28do=
X-Received: by 2002:a67:ba0f:0:b0:43b:5646:6ebc with SMTP id
 l15-20020a67ba0f000000b0043b56466ebcmr2047715vsn.33.1686352296529; Fri, 09
 Jun 2023 16:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <ZIOmUkXlegycIExQ@moria.home.lan>
In-Reply-To: <ZIOmUkXlegycIExQ@moria.home.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Jun 2023 16:11:24 -0700
Message-ID: <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
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

On Fri, Jun 9, 2023 at 3:23=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> Hello kbuild maintainers & list,
>
> Years ago I used to be able to specify additional CFLAGS for a specific

Probably cause it's KCFLAGS ;)

I used this yesterday, it works.

> subdirectory on the command line, which I used for enabling gcov
> profiling without editing the subdirectory makefile, like so:
>
>   make GCOV_PROFILE_fs_bcachefs=3Dy
>
> But this stopped working ages ago, I believe in the 3.x era. Does anyone
> know if there's a more modern way to do this?
>
> Cheers,
> Kent



--=20
Thanks,
~Nick Desaulniers
