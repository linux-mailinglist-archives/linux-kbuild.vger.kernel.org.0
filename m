Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE3D37540C
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 May 2021 14:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhEFMsz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 May 2021 08:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhEFMsy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 May 2021 08:48:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EFAC061574
        for <linux-kbuild@vger.kernel.org>; Thu,  6 May 2021 05:47:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id c11so7578033lfi.9
        for <linux-kbuild@vger.kernel.org>; Thu, 06 May 2021 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QzEhbEsMPT0RAPd1e91T+mtb6uxkgCOagogsHHD+eZ8=;
        b=Ks4nME/nPDpiuCR59p2B2xWzX2AYOmCJzm4REQpSn4ozFkIMOPSUaWXVEwcPIc4xyQ
         /h/8FA83Pe63a9B4OsKLVtiF+oz11lDf0JTY0Nrd9qrebslmObz5Ypz0Gz1hTRDzKP2j
         VqxNzfQVUd8RPj/vo9zPpRYyZSk4aFNGAgziomJb2ZrXcFnaEFbVdi4BRH2/5cHXHWkt
         lp9+3khZACAlWA5W6hz3CYTVxwHDfHI9CGl1MoHyCeKD8UrE3WcIrz9uSDezslqePeqc
         wV081/jHVKrG2qYS+BZVI099G5yt3aR4TATmjDcF4wJ3EMrnwEPL5Emo1GkHIqM9iFxK
         zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QzEhbEsMPT0RAPd1e91T+mtb6uxkgCOagogsHHD+eZ8=;
        b=f8qHafGTduCvqMIh0F9KOP6NE+gJfWgLk0Yd7su8JyJUDhdCncfs1EadGMoDRjPeFx
         caWEMK2p1s2fPVBBcOeB77fnzVi+qexSu/4vTq8ouEJbFCwi9jbCZ0mF6uCEmbfot5w9
         Hl450XTMMmHwTy8X6s2K/SjEwdDlP8Y4+0OMQbAEcsfAX/RWHcNVAzeIQtAFXhF5QiYv
         CM7RR6feC8h/GktdnfnqFcuP3ZAewQFufdeRT8ILq81OQvO03LvP6I26fyA8E/eQoeCN
         /rxwHQa7fab6dAEd92TmBJY0KqrtV9f1wntQPcVin+H7tAUlAneHvV9zcp1fV4G7RGia
         Hz6g==
X-Gm-Message-State: AOAM532J8DMBVdyepoDUKtCHNGxoBqHGtYK1gorUA0qLA+U4FY6NgEM5
        3Bl3rod47o90n669lwJ63Q2HBUl/OneXk4ijpCxWbA==
X-Google-Smtp-Source: ABdhPJwJSNb8W1vk/3K2xi7xKhIaQoHWBzIq30udueCYblsY75ozgEgTP9kUERq+loNLHdEeI4qZI/JWoOzp/xuldN4=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr2712552lfn.465.1620305275123;
 Thu, 06 May 2021 05:47:55 -0700 (PDT)
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
 <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com> <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
In-Reply-To: <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 14:47:43 +0200
Message-ID: <CACRpkdYpM=38K2WLS-+R2OhWweO8Q9SFndgGC2Py7uBjjxNdAA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Wed, May 5, 2021 at 4:17 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, May 5, 2021 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Right now it seems like those organizations and companies
> > would be some academic institutions who like rust (because they
> > study languages and compilers) and Google. But that is a
>
> Note that there are quite a few major private players already
> involved, not just Google! e.g.

I was referring to entities interested in using Rust for the
Linux kernel. Not just "using rust". And that interest is coming
from Google and a few academic institutions AFAICT.

Yours,
Linus Walleij
