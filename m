Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1769373D74
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 16:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbhEEOSL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 10:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbhEEOSK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 10:18:10 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB3CC061574;
        Wed,  5 May 2021 07:17:14 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id v39so2871828ybd.4;
        Wed, 05 May 2021 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0MZWwVx6CisEz2eE08ghTwZ79068V2gxS+gjHmpRH7E=;
        b=mRm9xtQKqFvfgLDvdGr56YP9nVG0V+lQGp1hRm0be7DT5Sd6uKawyBAAtuxNqZtMU/
         OZPO+Oh6W1fWLOMWkZBB05JvQghgSxvz6OC93CtSDGkrAAI8z6ereEGPlgCUivg7e5bu
         y5rA1cdzsf0QcC3Z6WGH04xjzXPCJA3rBZUNRnX6lhSCasGYlyoQNkr6JWp5Dts62Mnk
         lZuRbSNntzikhR8uEupuOfSe478rzCN2RBhpLLGpIvvOJLme5dE5xej+Ltps/WyfCJZN
         k5xhRZ8OtiKELmKdCx4ai+JPQyzic2bvKk45aFqrWsidSBHupcl2tAP2LMrKymlk9pB8
         iF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0MZWwVx6CisEz2eE08ghTwZ79068V2gxS+gjHmpRH7E=;
        b=DBYOuiI4h3MjTroR2LrKUD/b5hJhY8ttfCDbeljJpA+AsM3Bq/6CJxHyall/ABXcFv
         8V3V7zuqHNfz5k8EwQgsELs783FDniE4/3OpNOOgCuLYuGNIY/EJej54gwV3gSCd42Id
         jqbu0sMZOhQXT+W47o22nHcVvy6o80x8yt/BbT5Gad9zOFfmOLuBhNS9RHKD1J+JYXMx
         nPypcTMLIa0njt9FZCBbGU4wIruUuSK4SImrcr76x9cfritwGL7B2gWLiyJE7qobD2r6
         ool/fCAMbh+JvV66lbibxS1qEVExG4ZG/88Tvf2KsvgFBKzKxmrFLG+9VfQosxMq5ein
         mT/Q==
X-Gm-Message-State: AOAM530GZhUVWPJnHCUTaYSpw2FstdBmfURKSmGyBBoIHvfUzinSSDu2
        UUwh9cg3QtMNiW3Uct1N7/4eNCogaFzGrjz0wWk=
X-Google-Smtp-Source: ABdhPJxI2fwhHm/Gjl8Ih8z5Vzfx9FY1aYDpPn3Trrt1dDcbqanyb5MLzCSQZkc55ut5L3KwM8lAj4AgfvzmWyi/jKk=
X-Received: by 2002:a25:a448:: with SMTP id f66mr21263132ybi.135.1620224233402;
 Wed, 05 May 2021 07:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
 <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
 <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com> <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com>
In-Reply-To: <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 5 May 2021 16:17:02 +0200
Message-ID: <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 5, 2021 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Right now it seems like those organizations and companies
> would be some academic institutions who like rust (because they
> study languages and compilers) and Google. But that is a

Note that there are quite a few major private players already
involved, not just Google! e.g.

  - The Rust Foundation has AWS, Facebook, Google, Huawei, Microsoft
and Mozilla: https://foundation.rust-lang.org/

  - AWS and Facebook using Rust for a few years now:
https://engineering.fb.com/2021/04/29/developer-tools/rust/ and
https://aws.amazon.com/blogs/opensource/how-our-aws-rust-team-will-contribute-to-rusts-future-successes/

  - Microsoft providing official Win32 bindings/docs for Rust:
https://github.com/microsoft/windows-rs and
https://docs.microsoft.com/en-us/windows/dev-environment/rust/overview

Of course, any major company uses most common languages at some point
or another, but their commitment looks significant now (and public).

Cheers,
Miguel
