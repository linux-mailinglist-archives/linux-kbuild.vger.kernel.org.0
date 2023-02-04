Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D0368ABD2
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 19:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjBDSZ1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 13:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBDSZ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 13:25:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C7C305C3;
        Sat,  4 Feb 2023 10:25:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E28D609AE;
        Sat,  4 Feb 2023 18:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10DEC433D2;
        Sat,  4 Feb 2023 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675535123;
        bh=N8roeXWnM/eeizc489BhkIffJ5ixyf05op+P5YeaGJ8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i3+hlJqPfPmMNnkNlFOfQaGM8t2DLONvb9iSYrbf6jTLM0IqKAwyq6fDDZ8UQ4+1o
         E9MwZNtDVaRdVPvVCmTLclTsyJr06xMltziw+GpVYSmaeRgTzXU/R+7s0h7wJbTl6X
         antDnAUkMapDu4iQzDLvuOX/+X8RPOzhvA4kKrfhnFgquaH76kf2qtR/nMw9JC+Pc8
         3h16QXPcvvC4wUI29T2NLrOAfzDvEztzQYoOgOKfHOl/bs5PfGXSm14cU0IiRmwqh1
         FpNd/8X2F0o+yG9flPk6wCUW1N5CHxermaeTCksrJftLkU2dUzGesJof1US7fDqC/f
         LP5jeCdv2EjmQ==
Received: by mail-oi1-f182.google.com with SMTP id r9so6766063oig.12;
        Sat, 04 Feb 2023 10:25:23 -0800 (PST)
X-Gm-Message-State: AO0yUKX3Q2asTXxMiko8vLWoB7pIohvfnTQQ04GG13LiYiBjrgXGeyfy
        5USvOll8RGNurrL1kWwYmr0D5wNJQ839f/Rf9F4=
X-Google-Smtp-Source: AK7set/mCm+KQOz3GIME+rlAulvvjVrCj+EC8VfAchYK2hZ1skC8Z8/u2ohORkJSjeQdznKwpXjGQLtKp8fUHsTkcTs=
X-Received: by 2002:a05:6808:16a3:b0:377:f944:a8b7 with SMTP id
 bb35-20020a05680816a300b00377f944a8b7mr483870oib.194.1675535123026; Sat, 04
 Feb 2023 10:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20230203173704.108942-1-mcanal@igalia.com> <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
 <CAK7LNATqPK+weiRwjKzQazQ7usu+GXbx4tz7q10Yaajn+6=dDg@mail.gmail.com> <CANiq72k1b6xmeS=9bkcSuoPuPXmdEgzjpNCKxaj=fZKUzfxQVw@mail.gmail.com>
In-Reply-To: <CANiq72k1b6xmeS=9bkcSuoPuPXmdEgzjpNCKxaj=fZKUzfxQVw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 5 Feb 2023 03:24:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdtC86XHEw6BUGoErCGEevvmvQXM9DRf5fiDwCcYuD=Q@mail.gmail.com>
Message-ID: <CAK7LNASdtC86XHEw6BUGoErCGEevvmvQXM9DRf5fiDwCcYuD=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 5, 2023 at 3:04 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Feb 4, 2023 at 6:59 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Miguel,
> >
> > Are you applying this to your tree,
> > or do you want me to pick this up?
> >
> > For the former case,
> >
> > Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks! I was about to apply it, but let me know if you prefer otherwise.
>
> Cheers,
> Miguel

Please go ahead.



-- 
Best Regards
Masahiro Yamada
