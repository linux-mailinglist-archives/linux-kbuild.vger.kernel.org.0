Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3B13769EF
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 May 2021 20:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhEGSYz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 May 2021 14:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhEGSYz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 May 2021 14:24:55 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38675C061574;
        Fri,  7 May 2021 11:23:55 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id v188so13114135ybe.1;
        Fri, 07 May 2021 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQl3KwkW0S0op9RGJzgj75C3Xc1gHhg/kbxv4NJL6hU=;
        b=BLjEoo2bOaGm1oezp4g0stT4NXZFZYMgZShX3ZUoAfASJE+Vn5FqYKTHlRpKYRJjom
         8uxLJjZ/vo10ZPN1l3y/Bxz6VGVdJ0iCD4ziGDMtjkKTGktx/XM4i9twXYTxcp9NY4gD
         gDnTiCNRMvL2ZD3XX7yGJKF3gBFyEDupC/L9EC7BFNBBDvX7ya8kz5arIjbwv+/VuieW
         yPWIuPUQzcEBMxmrgPJFa2JHQcVCGL/XLr3eryev9qZDwhh0Lspk7b7R6rrzKuj9ltbo
         riNgs524FWof0SBOpUsDaRffEYFjEgcv1sPaUr4uhyN3ONSGzxb9myXu839Sg2zw2yAb
         24UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQl3KwkW0S0op9RGJzgj75C3Xc1gHhg/kbxv4NJL6hU=;
        b=X78ox/+q8qLAhfYJV7u7kk+6/6pnB8liWOvoxnBcZvxFmCb4y4mXxQN9TyMu0l8VtO
         0CwRbfztgOqLWlWjku00uiiUoVBdmc6HJoZCg4k2PEER4HBQlqV7pKNon7vjp/bJB5zk
         s1GKHB5LzjNZA0QRmRBaTFa7SH5854jHDts6+vzea1EppikGGL6k9e9ApOlhsZPTV9+6
         xp3zFOng4H5hOTD13trGY+GhYMMn2TBWrgJOZeIC7dC2Y2gdNhQRRQAGu2J+rakzzjK2
         2pg6s24pr0vrmf1erhSVm8abcFKDUYUXWM1uDzZM44vYCgc/cbd3RuC2aN/Wc4JQvHIW
         l+UQ==
X-Gm-Message-State: AOAM531/7AThXdpAn++G0VawDG39xXDgExlI8VZwHXCRzVzxMYBpF9LF
        cZixVMUunvyCCPqPlTBbGNwR5ea/2HXurlzOEsg=
X-Google-Smtp-Source: ABdhPJz2zQM9Cq/d1NG9Xbcput7Bzhx9cumExs2uctjgSfmYiPWMI4RU3fRlKAkXQU6A5I30/dCbOdlTpmWADwNOmik=
X-Received: by 2002:a25:442:: with SMTP id 63mr269510ybe.93.1620411834534;
 Fri, 07 May 2021 11:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
 <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
 <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
 <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com>
 <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com> <CACRpkdYpM=38K2WLS-+R2OhWweO8Q9SFndgGC2Py7uBjjxNdAA@mail.gmail.com>
In-Reply-To: <CACRpkdYpM=38K2WLS-+R2OhWweO8Q9SFndgGC2Py7uBjjxNdAA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 7 May 2021 20:23:43 +0200
Message-ID: <CANiq72mofJ4gR6kV3qeuRZO_CAkAYvwy616wuWkK5aD32ARnAg@mail.gmail.com>
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

On Thu, May 6, 2021 at 2:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I was referring to entities interested in using Rust for the
> Linux kernel. Not just "using rust". And that interest is coming
> from Google and a few academic institutions AFAICT.

There is interest from a handful of major companies in using Rust for
the Linux kernel. For instance, we had a few present in our latest
informal call.

I am also aware of at least two having or looking to
have someone working on testing the waters of what we have done so
far for their use cases.

Cheers,
Miguel
