Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B28121F8E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 20:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgGNSPo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 14:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgGNSPn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 14:15:43 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13EEC061755
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 11:15:43 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id e18so14993880ilr.7
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 11:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=BdLRQ1/A/2xd0TWX5TvM/JDnvLZLQOyOrvO8XxIamrI=;
        b=AlzixjjrKAh6eqxeCQIELtwjerr7eEdRBvtIBlHA/CUZWx6hpoT31BYWWAw0DMQTfg
         A7FxblMY9kiiExa6a8Z0m1urdxAgCBb/1vNjZPJJ7qeprBp/zKVmd5WjPg2f7trRoe9/
         pDLn+y+Uq6l/ZbVx6/7Q2OfBwVFVKKelxoFLwlITU7fuykM0ywN2w9lX1ow3NH3vWHnP
         pFfgj5WDYcRIR312ajvM44h7IcTlFQyTkprAbISOnYl4RvFfB0sugoo1z9BPYVzBxQZv
         92Zjf9QbeLrIddW16mTY+v4U/kRz3Quy7n6TrAJc3TY+HdhZBKBeqTYwzx4BPapiYBpK
         V1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=BdLRQ1/A/2xd0TWX5TvM/JDnvLZLQOyOrvO8XxIamrI=;
        b=VjCAxhsXYezhzV2imjdQhIKDS0Wl0ndVepGciWTLWfJ1Usv5JJJLmi8uSVQPpu5174
         DmQDlpTd+aT9+Qjp2g/XMLv0WlsG8sXuAlsdOoQ4UqUFPhR0y/K8S/8UxvylomH06hgk
         C8PH6P/Dn2y4GLvxuv1OIJj28lYp/MUMiMtUk02VhG2lrYDrVPcCJTuVg+4mrPwhpYd8
         KEh6zWCiQ2hSdsy1BMbGlB/zl6f73djm/1vWxYZ715um+QQV9gBaeZsP1k3lxLN8sRhy
         Hyl9Py7gqWw/b891iMcF5SVUK/Jia3pPzTGTCicxtQ7g9TWBzIpVyTLQO371Tb83Cpvl
         wN8w==
X-Gm-Message-State: AOAM531dz+BFL9uX71fNaIPAL4mLW1N4HgRhZ4h9UTS15lZmqCh9R0Nd
        lsvaE1YVmTxavVLpBjfZNuFysnZfCH8hzqMD5jc=
X-Google-Smtp-Source: ABdhPJzqTMdKOMbCHHB7KYkQUxS0Qj61mKKvmwViqitux6BDIGKVpkDY2GJSFCoqge3a2WIKbvmOaQ+qy/h5OvJ9pJ4=
X-Received: by 2002:a92:8b11:: with SMTP id i17mr5905445ild.212.1594750543142;
 Tue, 14 Jul 2020 11:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+9pxg99bT-njDG1rCVZtZGe--k8=7t6CfEnCnCwxaMA@mail.gmail.com>
 <CAK7LNAQiVZeiA31QOJkGtnzb7gk1h4QYtGAUjZd2dNf4ngEJng@mail.gmail.com>
In-Reply-To: <CAK7LNAQiVZeiA31QOJkGtnzb7gk1h4QYtGAUjZd2dNf4ngEJng@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 14 Jul 2020 20:15:31 +0200
Message-ID: <CA+icZUWzxMvpGJqfrgV0+gm21CE6rii6ErLHQ=uh2jfGepmhkA@mail.gmail.com>
Subject: Re: Building stuff only in arch/x86/boot/compressed
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 14, 2020 at 4:51 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
>
> On Tue, Jul 14, 2020 at 10:28 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > I wanted to test the patch-series "x86/boot: Remove runtime
> > relocations from compressed kernel" version 4 against Linux v5.8-rc5.
> >
> > This modifies/touches stuff in arch/x86/boot/compressed.
> >
> > How can I just test the series the fast way?
> >
> > I tried...
> >
> > make $make_opts vmlinux
>
> This does not build
> under arch/x86/boot/compressed/.
>
>
>
> >
> > That takes far too long - unsure it does what I want.
>
>
> bzImage wrapps vmlinux.
> (setup + self-extracting-vmlinux)
>
> So, you cannot build the decompressor only.
>
> See this dependency:
> https://github.com/torvalds/linux/blob/v5.7/arch/x86/Makefile#L259
>
>
>
> > Thanks in advance.
>
>
> $ make bzImage
>
> ... is the best I can suggest.
>
>
> As I said above, Kbuild must build
> vmlinux before bzImage
> (so it takes far too long)
> but you can skip building modules.
>
>
>
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=23508
>

Thanks Masahiro,

I remembered you said just look at "make help".

So, I tried "make bzImage".
After 15mins I stopped the build and did a full new kernel build which
unfortunately failed on the last minutes when doing the
arch/x86/boot/compressed stuff.

- Sedat -
