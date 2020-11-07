Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BFE2AA330
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Nov 2020 09:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgKGIHY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Nov 2020 03:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbgKGIHY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Nov 2020 03:07:24 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC08C0613CF;
        Sat,  7 Nov 2020 00:07:22 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id i193so3272603yba.1;
        Sat, 07 Nov 2020 00:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DgNGf+RA9SoGZaRjp5OXgwLSyznHa2UUlzJCET6v8AA=;
        b=O38GIhXcBf2HdGLhRLjlOOTeLDBwg+CNm39JWvLHSGPFLxyfghKE3bg0RPnafdb1Yk
         yK29hX3r3ShGcp9zVJm8wlfBWf8FKIk3m1/l+RYdmayMQx9Jhqc+mhvEayZQaeLZMm/H
         +oo68Rll9siX1nNpZosY01GO4naZ7WM/jQkOoLXzHRV8iwPw+8VylmfY4p84NQSMRoJx
         tFNX9QoU0ImQnRGFM5149VMbmVD0c1d+lFaA7xO/bU4AdDjte8ZBJueIvx35zUSuOjqd
         1WW98b+lVxS+OIlwuExZ4pqh+fh5/BQM1iSQwMnTHwI+48BYZfT/W6WIxgSTmaKHScmd
         Nrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgNGf+RA9SoGZaRjp5OXgwLSyznHa2UUlzJCET6v8AA=;
        b=co38XmTf7OemvM2YdelU5avN/FbYxjZDkdwUFRNYXoH8/3j0A8FjaRVILxuQJ3cyL8
         6Ij120Z1OelO7p/oPXUKwpT4Nsjb2HdKASpphqD+LDv8tPW+RGDBC1ycPPeBhHHSVFbL
         BQBT81TVVTQzx2n+N0mrDzX8Re89Wwcl7UFsV0i1NXbHOw7CquBlY1cXLxUva42X5Emx
         k8kDeTL1vG3knGvYbm3QymIaFFKt/ZUQ84Nfv69lwtMfX2q81JChJ/u2w4ja8Ubd7zIs
         qCDl1RssDNc10lV5At8vAx+DbhKCLJzI22DJAcAtsiYZ1WhT3MTz+O24flwpJXVYrCzd
         g++A==
X-Gm-Message-State: AOAM530rcfhNcoFfDWj5Rsa7QeIVOq9uFmav8J5TuJyPk4qjpcoqfZ5Q
        BFzsluSL+GDMkzLK0L3ctmUinKT+lh/ui6U/JeA=
X-Google-Smtp-Source: ABdhPJwAsD9KWEca2UFL/18r5E4q6yIHvHsu0rt6EpEN1hYYyqt5VRwKJqi4kSh/qVBMmst64BvDkhBxRY4MG/2dA/s=
X-Received: by 2002:a25:61c5:: with SMTP id v188mr2074359ybb.422.1604736442019;
 Sat, 07 Nov 2020 00:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20201107070744.1133811-1-ndesaulniers@google.com>
In-Reply-To: <20201107070744.1133811-1-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 7 Nov 2020 09:07:11 +0100
Message-ID: <CANiq72nPm5kXJVgA2HK8Uccp0ewhGUwWv-qoPaKb8sAC1ywhiA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: enable -Wfallthrough for clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Joe Perches <joe@perches.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 7, 2020 at 8:08 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Partial revert of commit e2079e93f562 ("kbuild: Do not enable
> -Wimplicit-fallthrough for clang for now")
>
> This has been fixed up over time thanks to the addition of "fallthrough"
> pseudo-keyword in
> commit 294f69e662d1 ("compiler_attributes.h: Add 'fallthrough' pseudo
> keyword for switch/case use")

I think the title is missing the "implicit"?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
