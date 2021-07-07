Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32483BE723
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 13:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhGGLbv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 07:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhGGLbv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 07:31:51 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9656C061574;
        Wed,  7 Jul 2021 04:29:10 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e13so2219347ilc.1;
        Wed, 07 Jul 2021 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hG9uJKp5/stxnkZVCr7jiYAGr6uBN3UcCDjdoVVp5Ps=;
        b=hbBP13JdYtMBhgxhCiJi69BQkvYHmbK0ISsRMPlXkpG+cwQUpC3Bmo8hzhTC63LX2J
         WE9TsmuHTUmDttgSd5WuNNPNhitP90eS2ehAyg8CBWz3r7N79f4G/LIK07YHQg5Qo8UD
         MgaJSJ9QmqplW1qhBlibG/aIaqdV/zgemwIh4CPuK/fdaM7IxFeHq9fFs2dK5gefquZX
         /v2xZ4+uza9u8GEd4l9KzGpZPh/ReuqkbM3udAX5RSTzk7KsQQ5o71G08XunI5leVq38
         Fmlvw3jvQJRgPw5r2A+0uFiYKGPS4Wfqf5s791E8mdRwd7jFjswiO69Z+FOWQDNnsUU5
         ZPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hG9uJKp5/stxnkZVCr7jiYAGr6uBN3UcCDjdoVVp5Ps=;
        b=FEXGaC31RPct5cU2sTl8Zjc1siihoBj8dA9sYwcvlyoP5rPxPojgjVgpHFyHTLzjcK
         MxUhooPeWNrbSYR8tgdsEbSn9kXfbweEKexFoHqrDV35opJqDN7KoTPZYwuQ7uoEtiiS
         686/khlbb81XroY+oLNVB5PmGpD0kRxuxO+BpVzefDDkGzOcTVdo7GOJGolGJuouk3Gh
         6WZ6juatt5BEVlBZNirFoYPUhZnJibOpN4R2oNMbTZMJ7HYeS/3oNFBjnBclk6aZ7Zze
         86XmD8KL7eYa3/CQCOqSKoosDzhB2pLbX3IzykRS9JgdL+QYqfjYYT3YX8gYQwvuGeNI
         SXxQ==
X-Gm-Message-State: AOAM533d6adOvQeCocChbJxbmR7mCQ6//OkGSJrg+o6rcwh7Vp/SElMc
        tOb4WNva7GAqXIVowJnODHkOfEim5vrtwkhVerJWQX62Kks=
X-Google-Smtp-Source: ABdhPJxwJ0aA91i6w5bdMXOLmVEg/RmFnn3c3XGDm70KMpSnJ1ANOwQXRt/32qQFXy6KKHOwfJtiNOAOkTlGTpDR48s=
X-Received: by 2002:a05:6e02:1d04:: with SMTP id i4mr17979177ila.149.1625657350061;
 Wed, 07 Jul 2021 04:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <YOWHIHcs5/sYr/Vr@elver.google.com>
In-Reply-To: <YOWHIHcs5/sYr/Vr@elver.google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 7 Jul 2021 13:28:59 +0200
Message-ID: <CANiq72=Q+024x_Bb__RRT9e30QmcTKhzBB2=CmfukJTCjXVY-A@mail.gmail.com>
Subject: Re: [PATCH 00/17] Rust support
To:     Marco Elver <elver@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 7, 2021 at 12:51 PM Marco Elver <elver@google.com> wrote:
>
> I think this patch never made it to the mailing list. b4 also doesn't
> find it:
>
>         ERROR: missing [7/17]

Yeah, thanks -- I mentioned in my reply above:

    https://lore.kernel.org/lkml/CANiq72nQq8Y8v9Pyf7JFq6Kf-+doNP+mHAFNzj_cSFBa3KwS5w@mail.gmail.com/

If you want to try the patches, you can pick them from this tree (the
one in linux-next):

    https://github.com/Rust-for-Linux/linux/tree/rust-next

Cheers,
Miguel
