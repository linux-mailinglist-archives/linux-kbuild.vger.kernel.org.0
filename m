Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F306066E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Oct 2022 19:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiJTRSJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Oct 2022 13:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiJTRSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2022 13:18:05 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1381DF416
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Oct 2022 10:18:03 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id v81so152035vkv.5
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Oct 2022 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPkOARXkk36a1GNQ0tcaZCsqdOtSfxsFDiomOIJSiDE=;
        b=NIaHWJPnJJvwbrKgiMnfBRgN5LiAOF4BPWlyhdQvKFOcw/ynBpwee3rU/p4cczy5NG
         c0JrlYhDkel67QRmanOX9TOhIJvYdCSTnJHfsUQsV9QYKyf0JpP8hbqmJQ74cCzU/I8Z
         H9Ev31Tl0r8FvO3nHAECW7qC4aZ0gKS1ag9kTjNhhFHePPtBpqZ6Z4WIE1rvfVnqRnmA
         Ob1mZUL6BlAsYv6gARARoHV5SM+KyQQ/SKISE5UOozpK+NmCKVFcXgTRLF6poB+E/gqy
         50Da6GOFgQYNaLBxWi0gZAGimcR1c2FTk/J8US+9RUvb4cRBPPvEFLx+OEa3661nMuXj
         tVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPkOARXkk36a1GNQ0tcaZCsqdOtSfxsFDiomOIJSiDE=;
        b=fiQ/TzRp5s1jgZKVJeZJF3qXY/ML7yYBPsGSNkc5nY3VV3c4H8uUczAvUOv/E6rIsq
         ThaylsZ0jibZPhZdZi6ScoO5fA1qviisGUO+e6cICMw+JktZkFt1YVHl+wOEQpZ5+UeZ
         jZJImNJkP8lUyj1m+WVep2XaeSf+R29mbXq235sEPEglUwWveTa94pFMdeGztAJRlsWy
         hDx4Ac7cXemMxzRoKM38UGgrCuS6eyRiK6XWYDY/MsFfSPM9mTW+QILBTkpgFxPlrXv5
         1Vr1SQzMnGVhdqQCkIbcWYZV17yk8r4YEnsB+Pc9OGfTsNLEryH0MhQ/rf+l4PfDKHj0
         fPQg==
X-Gm-Message-State: ACrzQf2MdX1FcPqDsSf/R1JWlwFAgRoGbrIrnyRYCb1MQCU2arfqCBjm
        gtCneBwsdPFbk11lubqBPFjKu13KGfR2JWj/r7kFbUZPvWeDtQ==
X-Google-Smtp-Source: AMsMyM68WHnV6hedCh3xTwPtn4V0VmmJy0co/i+uC31WecWZT6ZuFWMuERcG3kduMXWCOaY5zamvFPT4aTTZI2rUtVU=
X-Received: by 2002:a17:902:b218:b0:184:710c:8c52 with SMTP id
 t24-20020a170902b21800b00184710c8c52mr15016541plr.95.1666286271219; Thu, 20
 Oct 2022 10:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <DU0PR03MB8319B83F92372CA86A42C089F3289@DU0PR03MB8319.eurprd03.prod.outlook.com>
 <CABCJKue6M4cXyTP9wgaBx0oZ+5K7sQna9UQF88Pxcknv-kzcMg@mail.gmail.com>
 <DU0PR03MB83196C180979F74ABEEB0562F32A9@DU0PR03MB8319.eurprd03.prod.outlook.com>
 <CAKwvOdncRqrTNqmiDhtkj74V4eU03FBgDr25H4+npwHYgrYQRw@mail.gmail.com>
In-Reply-To: <CAKwvOdncRqrTNqmiDhtkj74V4eU03FBgDr25H4+npwHYgrYQRw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 20 Oct 2022 10:17:39 -0700
Message-ID: <CAKwvOd=7GZfdmtAG2W3Tjo1sPUA0eGnXFpUPWHp-3WJOgVpDEg@mail.gmail.com>
Subject: Re: Update15.x/kcfi to LLVM 15.0.3 (ZSTD + DWARFv5)
To:     "Sedat Dilek (DHL Supply Chain)" <sedat.dilek@dhl.com>,
        Fangrui Song <maskray@google.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 20, 2022 at 9:56 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Oct 19, 2022 at 10:44 PM Sedat Dilek (DHL Supply Chain)
> <sedat.dilek@dhl.com> wrote:
> >
> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: Sami Tolvanen <samitolvanen@google.com>
> > Gesendet: Dienstag, 18. Oktober 2022 18:00
> > An: Sedat Dilek (DHL Supply Chain) <sedat.dilek@dhl.com>
> > Betreff: Re: Update15.x/kcfi to LLVM 15.0.3
> >
> > On Tue, Oct 18, 2022 at 4:54 AM Sedat Dilek (DHL Supply Chain) <sedat.d=
ilek@dhl.com> wrote:
> > >
> > [ CC Nick + Fangrui ]
> >
> > You happen to know or use the ZSTD cmake-option (see [1] and [2]) - cam=
e in with changes post-15.0.2?
> >
> > AFAICS Fangrui Song had some patches to use ZSTD debug-compression with=
 DWARFv5.
> >
> > Unsure, if that combination is now possible in v15.0.3 or is a feature =
of LLVM-16.
> >
> > [3] says:
> >
> > [ lib/Kconfig.debug ]
> >
> > config DEBUG_INFO_COMPRESSED
> >         bool "Compressed debugging information"
> >         depends on $(cc-option,-gz=3Dzlib)
> >         depends on $(ld-option,--compress-debug-sections=3Dzlib)
> >         help
> >           Compress the debug information using zlib.  Requires GCC 5.0+=
 or Clang
> >           5.0+, binutils 2.26+, and zlib.
> >
> >           Users of dpkg-deb via scripts/package/builddeb may find an in=
crease in
> >           size of their debug .deb packages with this config set, due t=
o the
> >           debug info being compressed with zlib, then the object files =
being
> >           recompressed with a different compression scheme. But this is=
 still
> >           preferable to setting $KDEB_COMPRESS to "none" which would be=
 even
> >           larger.
> >
> > I am interested in the equivalent changes to cc-option/ld-option with Z=
STD (usable with DWARFv5).
>
> Good idea.  It looks like there's still a blocker to using -gz=3Dzstd wit=
h clang:
> $ clang -gz=3Dzstd -x c - < /dev/null
> clang-16: warning: cannot compress debug sections (zstd not enabled)
> [-Wdebug-compression-unavailable]

PEBKAC
$ sudo apt install libzstd-dev
<rebuild clang>

>
> https://github.com/facebook/zstd/issues/3271
>
> Attaching a WIP patch.
>
> >
> > Thanks.
> >
> > Best regards,
> > -Sedat-
> >
> > [1] https://github.com/llvm/llvm-project/commit/6fba7854a2f0b6b3899bb15=
6c1a0c4ae35c96e24
> > [2] https://github.com/llvm/llvm-project/commit/b4840279846e1eea44c3dca=
575395a90c9d77ca0
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/lib/Kconfig.debug#n315
> > [4] https://metadata.ftp-master.debian.org/changelogs//main/l/llvm-tool=
chain-15/llvm-toolchain-15_15.0.3-1~exp1_changelog
> >
> >
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
