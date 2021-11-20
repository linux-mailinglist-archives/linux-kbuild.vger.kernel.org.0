Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410CF457F06
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Nov 2021 16:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhKTPpO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Nov 2021 10:45:14 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44548 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhKTPpO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Nov 2021 10:45:14 -0500
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1AKFfvLL005387;
        Sun, 21 Nov 2021 00:41:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1AKFfvLL005387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1637422917;
        bh=lgx7/B5LBDShU1ck6mKJVdFhxM5TLJnhbJF13VJy6SE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0/i4U0iK8PbxKP9vSiHGZ7iW1WXV2hy945MD6Qzw2hCSiJsL/PUH69EWt/1DiAJJJ
         vd5cRbNMMtt/xvYNabrUQGoEVH+UiWd2ECwgdbfGplunkDCpTMS9Xky6uw8/8+YZNc
         zYk4GdB8rcB8PMMkXD5qaYq0xbNwnfcOOmzz6OTCn1XD5T0Yn1XPT1InTPkdkRIIxi
         N9TXEXpsnvuy754hN43IuLKbm8shPKhePfVlHIiO5XlMQ/+aTPUCLpHse76v91YBW2
         yOvBh6gxtPbGmbO+PPDW3MEsenFr/UhxntTYZ2iYqctPwgVZyLnV6sdGIitMQbFYVf
         7VTaC3zRrljrQ==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id gb13-20020a17090b060d00b001a674e2c4a8so11326724pjb.4;
        Sat, 20 Nov 2021 07:41:57 -0800 (PST)
X-Gm-Message-State: AOAM532qqbR/LXj7brQvJ6BkY6SYQUdTnfp/cCgHcOzimobV8o+sxrcY
        1aUh/IHZxSQii6j+AvqPEzt0Rgo5CshstN4OWT0=
X-Google-Smtp-Source: ABdhPJwVUYeujMmnX3vjPno4Xgi8Jxp6tUOfjMgRLAWLiXFH1MTXk0VbQwM+FILOl+co3sAy7uFq3LI2d6oixqJRrpU=
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id
 bb5-20020a170902bc8500b00143954e8548mr85962221plb.82.1637422916723; Sat, 20
 Nov 2021 07:41:56 -0800 (PST)
MIME-Version: 1.0
References: <37c3a9d3d6fceba0f55d05e7558370e3f60b8bf0.1634492509.git.josh@joshtriplett.org>
 <20211117104553.765556-1-bjorn@kernel.org>
In-Reply-To: <20211117104553.765556-1-bjorn@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 21 Nov 2021 00:41:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATpRBm9jgDd2-2rOtAzHXprEQyUh0PoyicszEWJ97qM4w@mail.gmail.com>
Message-ID: <CAK7LNATpRBm9jgDd2-2rOtAzHXprEQyUh0PoyicszEWJ97qM4w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add `make mod2noconfig` to disable module options
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc:     Josh Triplett <josh@joshtriplett.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 17, 2021 at 7:46 PM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wr=
ote:
>
> Josh Triplett wrote:
> > When converting a modular kernel to a monolithic kernel, once the kerne=
l
> > works without loading any modules, this helps to quickly disable all th=
e
> > modules before turning off module support entirely.
> >
> > Refactor conf_rewrite_mod_or_yes to a more general
> > conf_rewrite_tristates that accepts an old and new state.
> >
> > Signed-off-by: Josh Triplett <josh@joshtriplett.org>
>
> Hmm, I don't think this was picked up yet?
>
> FWIW,
>
> Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>


Applied to linux-kbuild.
Thanks.

--=20
Best Regards
Masahiro Yamada
