Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2E36A478E
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Feb 2023 18:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjB0RI3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Feb 2023 12:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjB0RI1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Feb 2023 12:08:27 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EFFE05F
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 09:08:26 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id f13so28656186edz.6
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 09:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG2dCG5VjzwJXlSLZ64Dbgc8VngmhFVRh2OluQvog4s=;
        b=YGTBfrQFZkvkmE0fqI4ZuNrqfRLMOv1cg6pBWgKiFyztuGZkGGabgGss0CW0s7pa65
         iwG4pPftXbHk9bYUQuDdlu6qMuXpTsTW9jtvDvJTYBEiW9bET+bEvGRH2pdNMy0v1YRv
         m33lJiRluAMnuDx9J3qAtPCPlXSr1ypMzyIJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG2dCG5VjzwJXlSLZ64Dbgc8VngmhFVRh2OluQvog4s=;
        b=U/cz/4mE9L2B6Eg2/+X5W+aAJBRlJHaWFK8gajv7KHGXIiUdSrmdKwHc9MDdENQ085
         SkGP+LBMs/BiV8S0Pmb60pcu35w1U1T4yWPVsoQryetr1+s2Y2aB590VPL2Yo00L5xAG
         CdAGvdRLupHWN4MT8dwqsVzDOm88hRBh3OgmLOQd7lSNVS03uzeXn/BT76hf0xfL/kiP
         Dq15pu581p6zu+vgnjp3iBfqgBpAl/wk3GrZK9P8QglIhA3jukiGkvxKvtKLtuqMn6VO
         gcVK4hJowDialgk3xgYzsnTTt9hn7UHoduvepeGrUOWG0qZhUWixhVlcCyJdHwHPfEmI
         eEPg==
X-Gm-Message-State: AO0yUKWUfUha6OpPkhrHcBNV5iVdCu4wnvMWySFuUMmsvaumEeWDIE7m
        Qz+xqCiusA0wOqjs9tjiti+001U2BFE5vBy164k=
X-Google-Smtp-Source: AK7set+v6uaFZDFnVvDDs3R23fx9U8loo9OnwZ1EbMmp7Uk9r7wCiEUtL8UMbmX80iYSn3cO/PNQnQ==
X-Received: by 2002:a17:906:805a:b0:8b2:7534:265e with SMTP id x26-20020a170906805a00b008b27534265emr35857832ejw.58.1677517704653;
        Mon, 27 Feb 2023 09:08:24 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709064acb00b008f767c69421sm3381856ejt.44.2023.02.27.09.08.23
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 09:08:23 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id ee7so28766144edb.2
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 09:08:23 -0800 (PST)
X-Received: by 2002:a17:906:1707:b0:8f1:4c6a:e72 with SMTP id
 c7-20020a170906170700b008f14c6a0e72mr6291052eje.0.1677517703498; Mon, 27 Feb
 2023 09:08:23 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com>
 <CAHk-=wi49sMaC7vY1yMagk7eqLK=1jHeHQ=yZ_k45P=xBccnmA@mail.gmail.com> <CAK7LNAR40OOCJhz2oNF4FXWeyF=MOQPwfojHCU=XZ0jHcuSP5g@mail.gmail.com>
In-Reply-To: <CAK7LNAR40OOCJhz2oNF4FXWeyF=MOQPwfojHCU=XZ0jHcuSP5g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 27 Feb 2023 09:08:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh5AixGsLeT0qH2oZHKq0FLUTbyTw4qY921L=PwYgoGVw@mail.gmail.com>
Message-ID: <CAHk-=wh5AixGsLeT0qH2oZHKq0FLUTbyTw4qY921L=PwYgoGVw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.3-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 27, 2023 at 2:10=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> If tar's --exclude-vcs-ignores option had worked correctly,
> I would not have written such a gitignore parser by myself.

But that thing is *WRONG*.

Seriously. It's fundamentally wrong.

The thing is, you don't even seem to understand how gitignores work.

A gitignore pattern doesn't actually mean "this path does not exist in the =
VCS".

It means "git will ignore this path for unknown files".

And that's a *big* difference.

That "for unknown files" means that *known* files can still match the patte=
rn.

And that is actually a perfectly valid pattern, and is very much by
design. You can say "ignore unknown *.o files", but still actually add
one explicitly to a git repository, if there is some special case.
There's nothing wrong with it.

But the way you have done things, it now is actively wrong.

We are *not* adding complexity for no good reason, particularly when
said complexity is fundamentally *broken*.

Yes, we export the kernel as a tar-file. But that's for people who
just don't want to deal with the full deal, and even that is partly
for legacy reasons that aren't necessarily all that true any more.

I suspect that by now, there are probably _more_ people used to git
than there are people who are still used to the "tar-files and
patches" workflow.

So here's the simple rule: if the packaging people can't be bothered
to use "gti archive" to make their packages, then they had better just
do a "make clean" first (or, better yet, do "git clean -dqfx" to
really clean up, because "make clean" isn't 100% reliable either).

We don't add more broken infrastructure to deal with broken workflows.
Just do the right thing.

Or if package managers want to do their own thing, then they can damn
well do it in their own broken systems, not adding a completely broken
script to the kernel.

                Linus
