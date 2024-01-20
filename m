Return-Path: <linux-kbuild+bounces-604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19B83333A
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jan 2024 09:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FF1C1C21560
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jan 2024 08:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074E2108;
	Sat, 20 Jan 2024 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCWgHRmR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416375381;
	Sat, 20 Jan 2024 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705739054; cv=none; b=ESld8ZLaekrpREVKYd3VxqEuRaKobNMxoF9KY0m8hX7OXzooPunIwV4iytFhxB6t75Fw4ZmsgqsHzY5xOTaASRlBd0U0oJE66bp/Sy39j8U1+LsHZKemmu3SNlw1/dE/6kdGessE7cpoM7lYVfYA61lcXsANoXam8EgdpqDxWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705739054; c=relaxed/simple;
	bh=a4zHjI6JmpbaB9IIpoWRICsGD2huh9s7c3eFFOp4Tgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqTMrJP3f4HFoOSnCce9hUn6SV6qP3742FFZI33ssXJEnGg+lQH8tK68acwrdl8KJvdhI4niOHh84zoiGvI3ZYcvlE+B9yniYRNS/36UvkzOf6kDS5hBUAvH4TevAg7f7VaOD0Tba2Z68QlVR829WVIskyxJGwFlCefaurQqN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCWgHRmR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2193C433B1;
	Sat, 20 Jan 2024 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705739053;
	bh=a4zHjI6JmpbaB9IIpoWRICsGD2huh9s7c3eFFOp4Tgs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XCWgHRmR2yXlT0IONi7zCUfgbRkcG/UsKMI6guXniCxuuOdbyMPKFABrFY07IZ2TZ
	 loCyTgLjiv9Rt/zHozBHxL8lvMlAOGkAvXaZFzNdYcv6yMq8KuCzfSNWTgsjv2BY5I
	 GhCV54jjaJ16XO4EumYANPJ5MWDuELOYfbiFGRt9TavgR9XT/FD355g/VF+xV4zTQV
	 wb+HiwS5P2+9wQAzcJasEHb8gckDtNu+XUUEJMN1nhnP6snarQ2jtIdnfbua2R1EzX
	 8WpEHslawcNztKtlN5OEPaDWlv01LogrG5pLNjZuQq/7y+kJkH5yXlmL+jh7vugSsx
	 hJ1Xj0l2pLaeQ==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7833b6bb41bso131738185a.3;
        Sat, 20 Jan 2024 00:24:13 -0800 (PST)
X-Gm-Message-State: AOJu0YzYcKDoPqlTYpFo1CrD7p5H0hF8EoW4yhwy3hdLGTKs7ijYzLUx
	YFJpOqYe5uAUbdM31ARNGYdqQdRvg8787iivVyOtGpzt5wO7fHKwBU9zwxrvDfEHtc8ofSK568N
	jjwkdWYggJWsuHxaAQtFFWyfCGpQ=
X-Google-Smtp-Source: AGHT+IFa2CjtHDqMA1guasurLzWlIjtJOJG2XvZ04GpGjOMjVswuX4q1N+ePHArYqyM+/VZA14378HzSGfDZMgaBMZc=
X-Received: by 2002:a05:620a:c9a:b0:783:63c5:281e with SMTP id
 q26-20020a05620a0c9a00b0078363c5281emr1211199qki.145.1705739052667; Sat, 20
 Jan 2024 00:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112125830.3753464-1-vegard.nossum@oracle.com>
In-Reply-To: <20240112125830.3753464-1-vegard.nossum@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 20 Jan 2024 17:23:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPptZ-HQVFXamT--8jfWe54EDSR03-hGv0NJ7Aoy4tJA@mail.gmail.com>
Message-ID: <CAK7LNASPptZ-HQVFXamT--8jfWe54EDSR03-hGv0NJ7Aoy4tJA@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild/kconfig: reformat/cleanup
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 9:58=E2=80=AFPM Vegard Nossum <vegard.nossum@oracle=
.com> wrote:
>
> This document was using headings in an odd way, causing the sidebar to be
> quite messy. I've adding new headings and turned some of the old headings
> into description lists.
>
> The indentation was a mix of spaces and tabs; I've turned them all into
> 4 spaces so it always reads correctly regardless of tab settings.
>
> Also use ``...`` instead of `...`; the difference is that `` is meant
> for "inline literals" (and renders in a monospace font) while ` is for
> "interpreted text" (and renders with italics).
>
> Also changed the title of the document to be more descriptive.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>


Applied to linux-kbuild.
Thanks.


> ---
>  Documentation/kbuild/kconfig.rst | 363 ++++++++++++++-----------------
>  1 file changed, 166 insertions(+), 197 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kcon=
fig.rst
> index c946eb44bd13..fc4e845bc249 100644
> --- a/Documentation/kbuild/kconfig.rst
> +++ b/Documentation/kbuild/kconfig.rst
> @@ -1,10 +1,10 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Kconfig make config
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Configuration targets and editors
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -This file contains some assistance for using `make *config`.
> +This file contains some assistance for using ``make *config``.
>
> -Use "make help" to list all of the possible configuration targets.
> +Use ``make help`` to list all of the possible configuration targets.
>
>  The xconfig ('qconf'), menuconfig ('mconf'), and nconfig ('nconf')
>  programs also have embedded help text.  Be sure to check that for
> @@ -12,8 +12,9 @@ navigation, search, and other general help text.
>
>  The gconfig ('gconf') program has limited help text.
>
> +
>  General
> --------
> +=3D=3D=3D=3D=3D=3D=3D
>
>  New kernel releases often introduce new config symbols.  Often more
>  important, new kernel releases may rename config symbols.  When
> @@ -24,118 +25,102 @@ symbols have been introduced.
>
>  To see a list of new config symbols, use::
>
> -       cp user/some/old.config .config
> -       make listnewconfig
> +    cp user/some/old.config .config
> +    make listnewconfig
>
>  and the config program will list any new symbols, one per line.
>
>  Alternatively, you can use the brute force method::
>
> -       make oldconfig
> -       scripts/diffconfig .config.old .config | less
> -
> -----------------------------------------------------------------------
> -
> -Environment variables for `*config`
> +    make oldconfig
> +    scripts/diffconfig .config.old .config | less
>
> -KCONFIG_CONFIG
> ---------------
> -This environment variable can be used to specify a default kernel config
> -file name to override the default name of ".config".
>
> -KCONFIG_DEFCONFIG_LIST
> -----------------------
> +Environment variables
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -This environment variable specifies a list of config files which can be =
used
> -as a base configuration in case the .config does not exist yet. Entries =
in
> -the list are separated with whitespaces to each other, and the first one
> -that exists is used.
> +Environment variables for ``*config``:
>
> -KCONFIG_OVERWRITECONFIG
> ------------------------
> -If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
> -break symlinks when .config is a symlink to somewhere else.
> +``KCONFIG_CONFIG``
> +    This environment variable can be used to specify a default kernel co=
nfig
> +    file name to override the default name of ".config".
>
> -KCONFIG_WARN_UNKNOWN_SYMBOLS
> -----------------------------
> -This environment variable makes Kconfig warn about all unrecognized
> -symbols in the config input.
> +``KCONFIG_DEFCONFIG_LIST``
> +    This environment variable specifies a list of config files which can=
 be
> +    used as a base configuration in case the .config does not exist yet.
> +    Entries in the list are separated with whitespaces to each other, an=
d
> +    the first one that exists is used.
>
> -KCONFIG_WERROR
> ---------------
> -If set, Kconfig treats warnings as errors.
> +``KCONFIG_OVERWRITECONFIG``
> +    If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will =
not
> +    break symlinks when .config is a symlink to somewhere else.
>
> -`CONFIG_`
> ----------
> -If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
> -with its value when saving the configuration, instead of using the defau=
lt,
> -`CONFIG_`.
> +``KCONFIG_WARN_UNKNOWN_SYMBOLS``
> +    This environment variable makes Kconfig warn about all unrecognized
> +    symbols in the config input.
>
> -----------------------------------------------------------------------
> +``KCONFIG_WERROR``
> +    If set, Kconfig treats warnings as errors.
>
> -Environment variables for '{allyes/allmod/allno/rand}config'
> +``CONFIG_``
> +    If you set ``CONFIG_`` in the environment, Kconfig will prefix all s=
ymbols
> +    with its value when saving the configuration, instead of using the
> +    default, ``CONFIG_``.
>
> -KCONFIG_ALLCONFIG
> ------------------
> -(partially based on lkml email from/by Rob Landley, re: miniconfig)
> +Environment variables for ``{allyes/allmod/allno/rand}config``:
>
> ---------------------------------------------------
> +``KCONFIG_ALLCONFIG``
> +    The allyesconfig/allmodconfig/allnoconfig/randconfig variants can al=
so
> +    use the environment variable KCONFIG_ALLCONFIG as a flag or a filena=
me
> +    that contains config symbols that the user requires to be set to a
> +    specific value.  If KCONFIG_ALLCONFIG is used without a filename whe=
re
> +    KCONFIG_ALLCONFIG =3D=3D "" or KCONFIG_ALLCONFIG =3D=3D "1", ``make =
*config``
> +    checks for a file named "all{yes/mod/no/def/random}.config"
> +    (corresponding to the ``*config`` command that was used) for symbol =
values
> +    that are to be forced.  If this file is not found, it checks for a
> +    file named "all.config" to contain forced values.
>
> -The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
> -use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
> -that contains config symbols that the user requires to be set to a
> -specific value.  If KCONFIG_ALLCONFIG is used without a filename where
> -KCONFIG_ALLCONFIG =3D=3D "" or KCONFIG_ALLCONFIG =3D=3D "1", `make *conf=
ig`
> -checks for a file named "all{yes/mod/no/def/random}.config"
> -(corresponding to the `*config` command that was used) for symbol values
> -that are to be forced.  If this file is not found, it checks for a
> -file named "all.config" to contain forced values.
> +    This enables you to create "miniature" config (miniconfig) or custom
> +    config files containing just the config symbols that you are interes=
ted
> +    in.  Then the kernel config system generates the full .config file,
> +    including symbols of your miniconfig file.
>
> -This enables you to create "miniature" config (miniconfig) or custom
> -config files containing just the config symbols that you are interested
> -in.  Then the kernel config system generates the full .config file,
> -including symbols of your miniconfig file.
> -
> -This 'KCONFIG_ALLCONFIG' file is a config file which contains
> -(usually a subset of all) preset config symbols.  These variable
> -settings are still subject to normal dependency checks.
> -
> -Examples::
> +    This ``KCONFIG_ALLCONFIG`` file is a config file which contains
> +    (usually a subset of all) preset config symbols.  These variable
> +    settings are still subject to normal dependency checks.
>
> -       KCONFIG_ALLCONFIG=3Dcustom-notebook.config make allnoconfig
> +    Examples::
>
> -or::
> +        KCONFIG_ALLCONFIG=3Dcustom-notebook.config make allnoconfig
>
> -       KCONFIG_ALLCONFIG=3Dmini.config make allnoconfig
> +    or::
>
> -or::
> +        KCONFIG_ALLCONFIG=3Dmini.config make allnoconfig
>
> -       make KCONFIG_ALLCONFIG=3Dmini.config allnoconfig
> +    or::
>
> -These examples will disable most options (allnoconfig) but enable or
> -disable the options that are explicitly listed in the specified
> -mini-config files.
> +        make KCONFIG_ALLCONFIG=3Dmini.config allnoconfig
>
> -----------------------------------------------------------------------
> +    These examples will disable most options (allnoconfig) but enable or
> +    disable the options that are explicitly listed in the specified
> +    mini-config files.
>
> -Environment variables for 'randconfig'
> +Environment variables for ``randconfig``:
>
> -KCONFIG_SEED
> -------------
> -You can set this to the integer value used to seed the RNG, if you want
> -to somehow debug the behaviour of the kconfig parser/frontends.
> -If not set, the current time will be used.
> +``KCONFIG_SEED``
> +    You can set this to the integer value used to seed the RNG, if you w=
ant
> +    to somehow debug the behaviour of the kconfig parser/frontends.
> +    If not set, the current time will be used.
>
> -KCONFIG_PROBABILITY
> --------------------
> -This variable can be used to skew the probabilities. This variable can
> -be unset or empty, or set to three different formats:
> +``KCONFIG_PROBABILITY``
> +    This variable can be used to skew the probabilities. This variable c=
an
> +    be unset or empty, or set to three different formats:
>
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -       KCONFIG_PROBABILITY     y:n split           y:m:n split
> +    KCONFIG_PROBABILITY         y:n split           y:m:n split
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -       unset or empty          50  : 50            33  : 33  : 34
> -       N                        N  : 100-N         N/2 : N/2 : 100-N
> +    unset or empty              50  : 50            33  : 33  : 34
> +    N                            N  : 100-N         N/2 : N/2 : 100-N
>      [1] N:M                     N+M : 100-(N+M)      N  :  M  : 100-(N+M=
)
>      [2] N:M:L                    N  : 100-N          M  :  L  : 100-(M+L=
)
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -149,112 +134,98 @@ that:
>
>  Examples::
>
> -       KCONFIG_PROBABILITY=3D10
> -               10% of booleans will be set to 'y', 90% to 'n'
> -               5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
> -       KCONFIG_PROBABILITY=3D15:25
> -               40% of booleans will be set to 'y', 60% to 'n'
> -               15% of tristates will be set to 'y', 25% to 'm', 60% to '=
n'
> -       KCONFIG_PROBABILITY=3D10:15:15
> -               10% of booleans will be set to 'y', 90% to 'n'
> -               15% of tristates will be set to 'y', 15% to 'm', 70% to '=
n'
> +    KCONFIG_PROBABILITY=3D10
> +        10% of booleans will be set to 'y', 90% to 'n'
> +        5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
> +    KCONFIG_PROBABILITY=3D15:25
> +        40% of booleans will be set to 'y', 60% to 'n'
> +        15% of tristates will be set to 'y', 25% to 'm', 60% to 'n'
> +    KCONFIG_PROBABILITY=3D10:15:15
> +        10% of booleans will be set to 'y', 90% to 'n'
> +        15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
>
> -----------------------------------------------------------------------
> +Environment variables for ``syncconfig``:
>
> -Environment variables for 'syncconfig'
> +``KCONFIG_NOSILENTUPDATE``
> +    If this variable has a non-blank value, it prevents silent kernel
> +    config updates (requires explicit updates).
>
> -KCONFIG_NOSILENTUPDATE
> -----------------------
> -If this variable has a non-blank value, it prevents silent kernel
> -config updates (requires explicit updates).
> +``KCONFIG_AUTOCONFIG``
> +    This environment variable can be set to specify the path & name of t=
he
> +    "auto.conf" file.  Its default value is "include/config/auto.conf".
>
> -KCONFIG_AUTOCONFIG
> -------------------
> -This environment variable can be set to specify the path & name of the
> -"auto.conf" file.  Its default value is "include/config/auto.conf".
> +``KCONFIG_AUTOHEADER``
> +    This environment variable can be set to specify the path & name of t=
he
> +    "autoconf.h" (header) file.
> +    Its default value is "include/generated/autoconf.h".
>
> -KCONFIG_AUTOHEADER
> -------------------
> -This environment variable can be set to specify the path & name of the
> -"autoconf.h" (header) file.
> -Its default value is "include/generated/autoconf.h".
> -
> -
> -----------------------------------------------------------------------
>
>  menuconfig
> -----------
> -
> -SEARCHING for CONFIG symbols
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Searching in menuconfig:
>
> -       The Search function searches for kernel configuration symbol
> -       names, so you have to know something close to what you are
> -       looking for.
> +    The Search function searches for kernel configuration symbol
> +    names, so you have to know something close to what you are
> +    looking for.
>
> -       Example::
> +    Example::
>
> -               /hotplug
> -               This lists all config symbols that contain "hotplug",
> -               e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
> +        /hotplug
> +        This lists all config symbols that contain "hotplug",
> +        e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
>
> -       For search help, enter / followed by TAB-TAB (to highlight
> -       <Help>) and Enter.  This will tell you that you can also use
> -       regular expressions (regexes) in the search string, so if you
> -       are not interested in MEMORY_HOTPLUG, you could try::
> +    For search help, enter / followed by TAB-TAB (to highlight
> +    <Help>) and Enter.  This will tell you that you can also use
> +    regular expressions (regexes) in the search string, so if you
> +    are not interested in MEMORY_HOTPLUG, you could try::
>
> -               /^hotplug
> +        /^hotplug
>
> -       When searching, symbols are sorted thus:
> +    When searching, symbols are sorted thus:
>
> -         - first, exact matches, sorted alphabetically (an exact match
> -           is when the search matches the complete symbol name);
> -         - then, other matches, sorted alphabetically.
> +    - first, exact matches, sorted alphabetically (an exact match
> +      is when the search matches the complete symbol name);
> +    - then, other matches, sorted alphabetically.
>
> -       For example: ^ATH.K matches:
> +    For example, ^ATH.K matches:
>
> -           ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
> -           [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
> +        ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
> +        [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
>
> -       of which only ATH5K and ATH9K match exactly and so are sorted
> -       first (and in alphabetical order), then come all other symbols,
> -       sorted in alphabetical order.
> +    of which only ATH5K and ATH9K match exactly and so are sorted
> +    first (and in alphabetical order), then come all other symbols,
> +    sorted in alphabetical order.
>
> -       In this menu, pressing the key in the (#) prefix will jump
> -       directly to that location. You will be returned to the current
> -       search results after exiting this new menu.
> +    In this menu, pressing the key in the (#) prefix will jump
> +    directly to that location. You will be returned to the current
> +    search results after exiting this new menu.
>
> -----------------------------------------------------------------------
> +User interface options for 'menuconfig':
>
> -User interface options for 'menuconfig'
> +``MENUCONFIG_COLOR``
> +    It is possible to select different color themes using the variable
> +    MENUCONFIG_COLOR.  To select a theme use::
>
> -MENUCONFIG_COLOR
> -----------------
> -It is possible to select different color themes using the variable
> -MENUCONFIG_COLOR.  To select a theme use::
> +        make MENUCONFIG_COLOR=3D<theme> menuconfig
>
> -       make MENUCONFIG_COLOR=3D<theme> menuconfig
> +    Available themes are::
>
> -Available themes are::
> +      - mono       =3D> selects colors suitable for monochrome displays
> +      - blackbg    =3D> selects a color scheme with black background
> +      - classic    =3D> theme with blue background. The classic look
> +      - bluetitle  =3D> a LCD friendly version of classic. (default)
>
> -  - mono       =3D> selects colors suitable for monochrome displays
> -  - blackbg    =3D> selects a color scheme with black background
> -  - classic    =3D> theme with blue background. The classic look
> -  - bluetitle  =3D> a LCD friendly version of classic. (default)
> +``MENUCONFIG_MODE``
> +    This mode shows all sub-menus in one large tree.
>
> -MENUCONFIG_MODE
> ----------------
> -This mode shows all sub-menus in one large tree.
> +    Example::
>
> -Example::
> +        make MENUCONFIG_MODE=3Dsingle_menu menuconfig
>
> -       make MENUCONFIG_MODE=3Dsingle_menu menuconfig
> -
> -----------------------------------------------------------------------
>
>  nconfig
> --------
> +=3D=3D=3D=3D=3D=3D=3D
>
>  nconfig is an alternate text-based configurator.  It lists function
>  keys across the bottom of the terminal (window) that execute commands.
> @@ -266,61 +237,59 @@ Use F1 for Global help or F3 for the Short help men=
u.
>
>  Searching in nconfig:
>
> -       You can search either in the menu entry "prompt" strings
> -       or in the configuration symbols.
> +    You can search either in the menu entry "prompt" strings
> +    or in the configuration symbols.
> +
> +    Use / to begin a search through the menu entries.  This does
> +    not support regular expressions.  Use <Down> or <Up> for
> +    Next hit and Previous hit, respectively.  Use <Esc> to
> +    terminate the search mode.
>
> -       Use / to begin a search through the menu entries.  This does
> -       not support regular expressions.  Use <Down> or <Up> for
> -       Next hit and Previous hit, respectively.  Use <Esc> to
> -       terminate the search mode.
> +    F8 (SymSearch) searches the configuration symbols for the
> +    given string or regular expression (regex).
>
> -       F8 (SymSearch) searches the configuration symbols for the
> -       given string or regular expression (regex).
> +    In the SymSearch, pressing the key in the (#) prefix will
> +    jump directly to that location. You will be returned to the
> +    current search results after exiting this new menu.
>
> -       In the SymSearch, pressing the key in the (#) prefix will
> -       jump directly to that location. You will be returned to the
> -       current search results after exiting this new menu.
> +Environment variables:
>
> -NCONFIG_MODE
> -------------
> -This mode shows all sub-menus in one large tree.
> +``NCONFIG_MODE``
> +    This mode shows all sub-menus in one large tree.
>
> -Example::
> +    Example::
>
> -       make NCONFIG_MODE=3Dsingle_menu nconfig
> +        make NCONFIG_MODE=3Dsingle_menu nconfig
>
> -----------------------------------------------------------------------
>
>  xconfig
> --------
> +=3D=3D=3D=3D=3D=3D=3D
>
>  Searching in xconfig:
>
> -       The Search function searches for kernel configuration symbol
> -       names, so you have to know something close to what you are
> -       looking for.
> -
> -       Example::
> +    The Search function searches for kernel configuration symbol
> +    names, so you have to know something close to what you are
> +    looking for.
>
> -               Ctrl-F hotplug
> +    Example::
>
> -       or::
> +        Ctrl-F hotplug
>
> -               Menu: File, Search, hotplug
> +    or::
>
> -       lists all config symbol entries that contain "hotplug" in
> -       the symbol name.  In this Search dialog, you may change the
> -       config setting for any of the entries that are not grayed out.
> -       You can also enter a different search string without having
> -       to return to the main menu.
> +        Menu: File, Search, hotplug
>
> +    lists all config symbol entries that contain "hotplug" in
> +    the symbol name.  In this Search dialog, you may change the
> +    config setting for any of the entries that are not grayed out.
> +    You can also enter a different search string without having
> +    to return to the main menu.
>
> -----------------------------------------------------------------------
>
>  gconfig
> --------
> +=3D=3D=3D=3D=3D=3D=3D
>
>  Searching in gconfig:
>
> -       There is no search command in gconfig.  However, gconfig does
> -       have several different viewing choices, modes, and options.
> +    There is no search command in gconfig.  However, gconfig does
> +    have several different viewing choices, modes, and options.
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

