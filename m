Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97413C91D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbhGNULd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243378AbhGNUKh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:10:37 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7431C06178A;
        Wed, 14 Jul 2021 12:55:13 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id u7so3633391ion.3;
        Wed, 14 Jul 2021 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=81Xn7aVQAFz+p6d+JyITwXRpGql/VdikGqozJiC/tJs=;
        b=t5x7ODRrA/ceqZsP4VNa2SNq+2LDN93Db6Ve0FDPkOeuMPze+NJDeNWK1Nm2LBYL9g
         BvyPrMGVcXGQOqS1elAbPrdeYVW8jMoXnUBVL4PRpAYsMgweLp2pgwe11tMbOYlipIrk
         5zGhGRvQesXwoQjdMMMRJSuLMVXgQB9IXAAInvNJg51Hp/KhWMR1oD65W3BaAfjwDGdv
         Qev+HIfTCAgADzg8k4/1N8/zIHXv1LEFvOwT9OWdtkItr2j1O+lDRtusu28BqV07GVaE
         Si/czf4PfHNqwrMxkiKcq2f2tdPYmQm7jhC3qaQqzdwXJQc5xQV+2CPPD+INvjbUx4Ok
         CUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81Xn7aVQAFz+p6d+JyITwXRpGql/VdikGqozJiC/tJs=;
        b=Gps3uAQmlxLJhY/hWBg9dVzMCUBMq22MhAD2HnQPyxwyZlUSTR6Mb0GJhnaPHbJVFV
         /63OwK3INzl0RUTn0ZLlzmxcfbZrM8kat/aGOyzJVHyy/Vb7BlKFE23Ml5IpAOqnuq/e
         eOgHvbAgy/RZNqiQ1CgNDw1QsW5zqRRziY8H/R2Ib4EuXkoGffp5Dp2PW6Ils4YpOnLA
         FOorXsLZmUV3ipEMjFYd2lNK2rCZyjnOkfAUL7JWcfxIIB3a5NDM81MZPBMDts8skdzg
         WWpdHNgUqLkc4cuNUkCox1MlFwpJXE5dlh96i7vXRzf7AatHqQd2+t7pEkz0OKCLJVVh
         +kBg==
X-Gm-Message-State: AOAM532pZ/GWRp2eJhCu4Lx7rNXZXAy8J+e+7pmV051TBAmHOEYEyQw2
        TbREJDlJ07RfkIUaTve4oVO4FcrAMRvOnbCgBfY=
X-Google-Smtp-Source: ABdhPJy7s1FWtjcDbt1WZptWWTerendzo7qMJ2RFFE/1/yyFxth6o722NYYwGX8poWisp3GQOdsl83BTAdjnhbu+X7c=
X-Received: by 2002:a6b:6412:: with SMTP id t18mr689657iog.64.1626292513301;
 Wed, 14 Jul 2021 12:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-14-ojeda@kernel.org>
 <CAKwvOdmei2Ckfk5xgkvo8wEXEFK=Yv5-yjKhHoi_bmVr4MiEnw@mail.gmail.com>
In-Reply-To: <CAKwvOdmei2Ckfk5xgkvo8wEXEFK=Yv5-yjKhHoi_bmVr4MiEnw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Jul 2021 21:55:02 +0200
Message-ID: <CANiq72m9WdbRjNS7CUecmwVkefPQPUS+hi-f+gPZg1yKJPObtg@mail.gmail.com>
Subject: Re: [PATCH 13/17] docs: add Rust documentation
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 8:38 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Is rust-analyzer necessary to talk about? I think most kernel
> developers aren't using LSP clients, so it doesn't seem necessary to
> talk about for kernel development IMO.  If a developer would like to
> use an LSP client, they should refer to the documentation of their LSP
> client.

I think it is fair to advertise it given we have support for
generating its configuration.

Otherwise, people might miss the script and spend time generating a
configuration by hand (which takes quite some time and would not carry
the `CONFIG_*` settings etc.).

And they may start using it if they did not hear about it! :)

> Should Documentation/process/changes.rst be updated to note which
> versions of all of these tools are currently supported?

For the ones required for building, they are already there (i.e.
`rustc` and `bindgen`).

For the rest, most come with the Rust toolchain, so I think there is
no need to list them explicitly. For `rust-analyzer`, it is "rolling",
so it does not make much sense to put it in any case.

> For the compat table, for 32b ARM, why is v6 supported but not v7? Why
> only when optimizations are enabled?

For arch support, we only have a few fixed Rust target files for the
moment as examples (thus we picked v6) -- we will generate those with
a script later on.

For particular restrictions (such as the optimization level), we will
look into solving those bits later on. In any case, it is not a
priority, since less than `-O2` is intended only for kernel hacking.

> Doesn't this also depend on rustc having support for a given target
> triple? Just because LLVM has a backend for a given architecture
> doesn't mean rustc can target it, right?

No -- currently we use custom target files instead of particular
triples (see previous point), which are basically the settings `rustc`
forwards to LLVM for codegen.

Cheers,
Miguel
