Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FEA2D2E88
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 16:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgLHPoQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 10:44:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:45004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729558AbgLHPoP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 10:44:15 -0500
X-Gm-Message-State: AOAM531ePydIGX3u/l79lcDHPXGe2ebjwM8mBDMwtAOmeNCHZ+5rVJXC
        wgTLUupM6RsxyFX/lmFRQqhLT45Gm+w+WNokVNE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607442214;
        bh=CMD5T7V/62c2NnQS9oXG4hQMXT2TDFkAiLnMrvWU3sQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J03SUNfYv5x+fTGOfPb1fx9pwMURZwOlbbPcXpog1DBcQ1Cn01q4QUNQvl9/btRXU
         LR14nAH24FD7GEfKUmMIIir+nOlRM2JSCic3zOV9hQ5AFBnXWl0/rlNmMR45v1jtAn
         OLAp5aX5laP/Kac5bA3cbm4q3VwDaaEOR13xx6YT/OyyKQ1h8Rrdo8al9afu5nnKBB
         5CTCMPj7j+oeJF2vshdVDOKf1N41bEpg7CsAvb7J4QPoMlcxcfE3fPghlb7qp2cIMP
         d1DaLLeNvBZuyl48oxeKqK/lX41Cku6DhUDdQA9oV1y2iM7Ql8TN1npzBDh4wGEA5w
         N/0jUHErUu6rQ==
X-Google-Smtp-Source: ABdhPJycE/+6yXag4eshTTK2HeGTyUbW9jjdl41hbpcJXlRgcXfuaEBrRfaKcncE48q2eb+CZNOSa6sJ54aDoYuAAp0=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr17412967oth.210.1607442214097;
 Tue, 08 Dec 2020 07:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20201208152857.2162093-1-geert+renesas@glider.be> <20201208152857.2162093-3-geert+renesas@glider.be>
In-Reply-To: <20201208152857.2162093-3-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 8 Dec 2020 16:43:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2viBG-dVQQwRfc9aP=dbdyTypgMJycONu2g4jcnfuFKg@mail.gmail.com>
Message-ID: <CAK8P3a2viBG-dVQQwRfc9aP=dbdyTypgMJycONu2g4jcnfuFKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation/kbuild: Document platform dependency practises
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 8, 2020 at 4:28 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Document best practises for using architecture and platform dependencies.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/kbuild/kconfig-language.rst | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 2b746332d8aa6bce..87e9bbe14a21ce83 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -564,6 +564,30 @@ common system, and detect bugs that way.
>  Note that compile-tested code should avoid crashing when run on a system where
>  the dependency is not met.
>
> +Architecture and platform dependencies
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Due to the presence of stubs, most drivers can now be compiled on most
> +architectures.  However, this does not mean it makes sense to have all drivers
> +available everywhere, as the actual hardware may only exist on specific
> +architectures and platforms.  This is especially true for on-SoC IP cores,
> +which may be limited to a specific vendor or SoC family.
> +
> +To prevent asking the user about drivers that cannot be used on the system(s)
> +the user is compiling a kernel for, and if it makes sense, config symbols
> +controlling the compilation of a driver should contain proper dependencies,
> +limiting the visibility of the symbol to (a superset of) the platform(s) the
> +driver can be used on.  The dependency can be an architecture (e.g. ARM) or
> +platform (e.g. ARCH_OMAP4) dependency.  This makes life simpler not only for
> +distro config owners, but also for every single developer or user who
> +configures a kernel.
> +
> +Such a dependency can be relaxed by combining it with the compile-testing rule
> +above, leading to:
> +
> +  config FOO
> +       bool "Support for foo hardware"
> +       depends on ARCH_FOO_VENDOR || COMPILE_TEST
> +
>  Kconfig recursive dependency limitations
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The addition seems useful, but I wonder if we should mention more
patterns here.:

- Some drivers are turned on implicitly for a platform, like

 config FOO
       bool "Support for foo hardware"
       depends on ARCH_FOO_VENDOR || COMPILE_TEST
       default ARCH_FOO_VENDOR

- some drivers can use a feature that may be a loadable module
  itself, or can compile if that feature is disabled, but the driver
  itself must not be built-in if the feature is in a loadable module, e.g.

config FOO
        tristate "Foo device"
        depends on HWSPINLOCK || (COMPILE_TEST && !HWSPINLOCK)

       Arnd
