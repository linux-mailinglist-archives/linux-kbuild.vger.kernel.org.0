Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CD72DE7B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 17:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbgLRQya (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 11:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730778AbgLRQy3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 11:54:29 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0699EC0617B0;
        Fri, 18 Dec 2020 08:53:49 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 3so3269031wmg.4;
        Fri, 18 Dec 2020 08:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oROkYWuGtdpchpUe6irTsyvytqP+YdMNpvBJ69Sb9Qg=;
        b=XKsvY3jgK8UqFvgNRP7TGzZ0E28+n//2IslLytTn0En2+F2q0goG1lKQJ57axKtFnw
         30j3IDmQrAjQgHLtoX74Q+RHgQeI6uJ/E0bHBPPsKOwQvgN6cPVZrt8cTiwVRTavAWM1
         d89Q3a72D1BILG5MvHIXCNAHL8d7KpoirTes81BfcjVaFwoKUmySKHr+xAQX40ozDL5J
         lmEbbMBVdS3I0kwAMG4/auIlTztdJyjmA/Vma3WJC5pvnP/0wWxB/lrDYj0hBkJSzFh1
         5UuoLFyq6qdcUb9rTCGQJUR5K9CIN795WjN0iYKOLGXNEFkJ4dn0pSiXQ4OMK7H77nuj
         96Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oROkYWuGtdpchpUe6irTsyvytqP+YdMNpvBJ69Sb9Qg=;
        b=SL6hej0ZVeARGnU3fyvdMlUp1iW2J6wzYlWYcz3Blz9gLDedfzPKxo68lXHlWe9i2Z
         AWmjboGF7I6Ruwhk/61FgSEdjAe5aecR+svs/3VBCM3rhLm+YXVtOxCsT0XGvdPpwn9i
         ZWZ9b/D6utOLuM0x50zjkSh04SqP+/0Mk1ZV3PQ3cD62OhBAiAvzFRSYal0hXzfLljoR
         QSTp1ZWQksizaDRHZO9MnibNyk/xOMBWVyB+uMDVuIE+2YPrGuEQx5LFoqcIalONBHWP
         tnFxrvlll23XxraICj2tzVUzYcCFrYgb69YutStkm6ippaCA65pkPJCl7foa2l6I6c86
         E+fQ==
X-Gm-Message-State: AOAM532tPtLjHz4S1IyMyIwLjkZjENBV3t2nLez6mCD/4OL0Jou0SmR9
        o191aa9xQEgAeDZSjNQ0T64=
X-Google-Smtp-Source: ABdhPJwFuJofB1jqnUAg4iEMJUFeE3ewU97yTH/1c7/wDbA4q5cI4qe4HtT7qg4D8L91nxVLVWUhug==
X-Received: by 2002:a1c:c287:: with SMTP id s129mr5070756wmf.79.1608310427074;
        Fri, 18 Dec 2020 08:53:47 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y68sm14120888wmc.0.2020.12.18.08.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 08:53:45 -0800 (PST)
Date:   Fri, 18 Dec 2020 17:53:43 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
Message-ID: <X9zel5Vz5cIx2crQ@ulmo>
References: <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
 <20201203125700.161354-1-masahiroy@kernel.org>
 <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
 <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
 <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
 <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
 <25030057-86b1-5619-25fd-acfa0728b850@samsung.com>
 <4ab4f62f-8b37-01e1-f81c-270155b13a51@nvidia.com>
 <7e691a61-bf4b-0594-8d6d-36d62a5def0b@nvidia.com>
 <CAK7LNAQ6pzMGm=L9389Xtfghjfjr_wDqRntZC2XqP3JDQuhLhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lwkOZ5gkRFq3fFGP"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ6pzMGm=L9389Xtfghjfjr_wDqRntZC2XqP3JDQuhLhQ@mail.gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--lwkOZ5gkRFq3fFGP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 12:42:51AM +0900, Masahiro Yamada wrote:
> On Sat, Dec 19, 2020 at 12:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> >
> >
> > On 18/12/2020 15:12, Jon Hunter wrote:
> > >
> > > On 18/12/2020 15:09, Marek Szyprowski wrote:
> > >>
> > >> On 18.12.2020 16:03, Jon Hunter wrote:
> > >>> On 18/12/2020 10:05, Marek Szyprowski wrote:
> > >>>> On 18.12.2020 10:43, Masahiro Yamada wrote:
> > >>>>> On Fri, Dec 18, 2020 at 4:58 PM Marek Szyprowski
> > >>>>> <m.szyprowski@samsung.com> wrote:
> > >>>>>> On 03.12.2020 13:57, Masahiro Yamada wrote:
> > >>>>>>> Linus pointed out a third of the time in the Kconfig parse stag=
e comes
> > >>>>>>> from the single invocation of cc1plus in scripts/gcc-plugin.sh =
[1],
> > >>>>>>> and directly testing plugin-version.h for existence cuts down t=
he
> > >>>>>>> overhead a lot. [2]
> > >>>>>>>
> > >>>>>>> This commit takes one step further to kill the build test entir=
ely.
> > >>>>>>>
> > >>>>>>> The small piece of code was probably intended to test the C++ d=
esignated
> > >>>>>>> initializer, which was not supported until C++20.
> > >>>>>>>
> > >>>>>>> In fact, with -pedantic option given, both GCC and Clang emit a=
 warning.
> > >>>>>>>
> > >>>>>>> $ echo 'class test { public: int test; } test =3D { .test =3D 1=
 };' | g++ -x c++ -pedantic - -fsyntax-only
> > >>>>>>> <stdin>:1:43: warning: C++ designated initializers only availab=
le with '-std=3Dc++2a' or '-std=3Dgnu++2a' [-Wpedantic]
> > >>>>>>> $ echo 'class test { public: int test; } test =3D { .test =3D 1=
 };' | clang++ -x c++ -pedantic - -fsyntax-only
> > >>>>>>> <stdin>:1:43: warning: designated initializers are a C++20 exte=
nsion [-Wc++20-designator]
> > >>>>>>> class test { public: int test; } test =3D { .test =3D 1 };
> > >>>>>>>                                              ^
> > >>>>>>> 1 warning generated.
> > >>>>>>>
> > >>>>>>> Otherwise, modern C++ compilers should be able to build the cod=
e, and
> > >>>>>>> hopefully skipping this test should not make any practical prob=
lem.
> > >>>>>>>
> > >>>>>>> Checking the existence of plugin-version.h is still needed to e=
nsure
> > >>>>>>> the plugin-dev package is installed. The test code is now small=
 enough
> > >>>>>>> to be embedded in scripts/gcc-plugins/Kconfig.
> > >>>>>>>
> > >>>>>>> [1] https://protect2.fireeye.com/v1/url?k=3D03db90e1-5c40a828-0=
3da1bae-0cc47a336fae-4cc36f5830aeb78d&q=3D1&e=3Ddfdc1cf9-82d6-4ca5-b35d-178=
2e918bde3&u=3Dhttps%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwjU4DCuwQ4pXsh=
RbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ%40mail.gmail.com%2F
> > >>>>>>> [2] https://protect2.fireeye.com/v1/url?k=3D965b670a-c9c05fc3-9=
65aec45-0cc47a336fae-e34339513ff747c0&q=3D1&e=3Ddfdc1cf9-82d6-4ca5-b35d-178=
2e918bde3&u=3Dhttps%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwhK0aQxs6Q5ijJ=
mYF1n2ch8cVFSUzU5yUM_HOjig%3D%2Bvnw%40mail.gmail.com%2F
> > >>>>>>>
> > >>>>>>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > >>>>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > >>>>>> This patch landed in linux next-20201217 as commit 1e860048c53e
> > >>>>>> ("gcc-plugins: simplify GCC plugin-dev capability test").
> > >>>>>>
> > >>>>>> It causes a build break with my tests setup, but I'm not sure we=
ather it
> > >>>>>> is really an issue of this commit or a toolchain I use. However =
I've
> > >>>>>> checked various versions of the gcc cross-compilers released by =
Linaro
> > >>>>>> at https://protect2.fireeye.com/v1/url?k=3D053727b6-5aac1f7f-053=
6acf9-0cc47a336fae-5bd799e7ce6b1b9b&q=3D1&e=3Ddfdc1cf9-82d6-4ca5-b35d-1782e=
918bde3&u=3Dhttps%3A%2F%2Freleases.linaro.org%2Fcomponents%2Ftoolchain%2Fbi=
naries%2F and all
> > >>>>>> fails with the same error:
> > >>>>>>
> > >>>>>> $ make ARCH=3Darm
> > >>>>>> CROSS_COMPILE=3D../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none=
-eabi/bin/arm-none-eabi-
> > >>>>>> zImage
> > >>>>>>      HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
> > >>>>>> In file included from
> > >>>>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-ea=
bi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
> > >>>>>>                     from scripts/gcc-plugins/gcc-common.h:7,
> > >>>>>>                     from scripts/gcc-plugins/arm_ssp_per_task_pl=
ugin.c:3:
> > >>>>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-ea=
bi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10:
> > >>>>>> fatal error: gmp.h: No such file or directory
> > >>>>>>     #include <gmp.h>
> > >>>>>>              ^~~~~~~
> > >>>>>> compilation terminated.
> > >>>>>> scripts/gcc-plugins/Makefile:47: recipe for target
> > >>>>>> 'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
> > >>>>>> make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Er=
ror 1
> > >>>>>> scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugi=
ns' failed
> > >>>>>> make[1]: *** [scripts/gcc-plugins] Error 2
> > >>>>>> Makefile:1190: recipe for target 'scripts' failed
> > >>>>>> make: *** [scripts] Error 2
> > >>>>>>
> > >>>>>> Compilation works if I use the cross-gcc provided by
> > >>>>>> gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, w=
hich is:
> > >>>>>>
> > >>>>>> $ arm-linux-gnueabi-gcc --version
> > >>>>>> arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
> > >>>>>>
> > >>>>> I can compile gcc-plugins with Linaro toolchians.
> > >>>>>
> > >>>>> The version of mine is this:
> > >>>>>
> > >>>>> masahiro@oscar:~/ref/linux-next$
> > >>>>> ~/tools/arm-linaro-7.5/bin/arm-linux-gnueabihf-gcc --version
> > >>>>> arm-linux-gnueabihf-gcc (Linaro GCC 7.5-2019.12) 7.5.0
> > >>>>> Copyright (C) 2017 Free Software Foundation, Inc.
> > >>>>> This is free software; see the source for copying conditions.  Th=
ere is NO
> > >>>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULA=
R PURPOSE.
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>> Maybe, it depends on the host environment?
> > >>>>>
> > >>>>>
> > >>>>> Please try this:
> > >>>>>
> > >>>>> $ sudo apt install libgmp-dev
> > >>>> Indeed, it was missing on my setup. Sorry for the noise.
> > >>>
> > >>> So this change also breaks the build on our farm build machines and
> > >>> while we can request that packages are installed on these machines,=
 it
> > >>> takes time. Is there anyway to avoid this?
> > >>
> > >> You can temporarily revert 1e860048c53e (this patch).
> > >
> > >
> > > Again that works locally, but these automated builders just pull the
> > > latest -next branch and build.
> >
> >
> > However, if you are saying that this is a problem/bug with our builders,
> > then of course we will have to get this fixed.
> >
>=20
>=20
> Yes, please do so.
>=20
>=20
> Kconfig evaluates $(CC) capabilities, and
> hides CONFIG options it cannot support.
>=20
>=20
> In contrast, we do not do that for $(HOSTCC)
> capabilities because it is just a matter of some
> missing packages.
>=20
>=20
> For example, if you enable CONFIG_SYSTEM_TRUSTED_KEYRING
> and fail to build scripts/extrace-cert.c
> due to missing <openssl/bio.h>,
> you need to install the openssl dev package.
>=20
> It is the same pattern.

I did notice that your patch changes the original check from using
$HOSTCC to try and build a test plugin using the gcc-plugin.h header
found using $CC to just determining the the existence of the
gcc-plugin.h header using $CC. So it's no longer trying to actually
use the gcc-plugin.h header.

I think that might be what's causing the builders to suddenly break.
Where previously the check would fail (presumably producing a similar
error to the one we're now seeing, i.e. $CC was built with plugins
support, but the installation was broken, so it can't actually build
plugins because some headers are missing) the same check now succeeds
(i.e. $CC was built with plugins support, but we no longer check if the
plugin support is also functional). That means after your change the
builders will now by default try to build the plugins and fail, whereas
previously they wouldn't attempt to do so because the dependency wasn't
met.

This is similar to what autotools does when it checks for headers. It
does one pass that just checks if a header is present and another pass
where it checks that the header can actually be used. Usually when the
first pass succeeds and the latter fails, it indicates that something is
wrong with your toolchain setup, or you didn't pass the proper arguments
in CFLAGS and friends.

So that makes the new check a bit less useful than the old one, because
rather than defaulting to "no" when GCC plugins can't be built, we now
default to "yes" when they should be able to get built but can't.

Anyway, it's probably reasonable to expect the installation to be good
and that plugins can be built if the gcc-plugin.h header can be found,
so I'm not objecting to this patch. However, I'm curious as to whether
installing libgmp-dev (and apparently libmpc-dev as well) is the right
thing to do here.

In case where CC !=3D HOSTCC, it's possible that CC was not built against
the same version of GMP/MPC as HOSTCC. And even HOSTCC might not
necessarily have been built against the versions provided by libgmp-dev
or libmpc-dev. I'm not overly familiar with GMP/MPC, so perhaps if these
headers are reasonably stable, this is not all that important. But if it
is, then which version of GMP/MPC do we need? The version that CC was
built against, or the version that HOSTCC was built against?

Thierry

--lwkOZ5gkRFq3fFGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/c3pQACgkQ3SOs138+
s6EoQw//TdKCyTvJRHifMDDg8NdlEybqBnlLd91J9Lwyqo0nlelVLcOLlxIGzu1h
Nop9DeXGooDdMRBjk5XBWkfhfYMvhOaddxNELOuc3yh/ETG1sCDfK67mvpoz2911
KCGg9WxUAWs4bYcyuKnlfnWKJwV1kvN7XzqJ7PPgdM9EXgr2CYeqyjH9S1p+XWHq
H8I6D/4Qz+oQeiJMx0AZIcEScFu5R6kFMWV8+0llVkIyJX8CBIVgnmz7iHjxbswV
RSS6z3XUgkTu41XuWVS/otlUMYN4ivTRT6yKZ0o0qmwi2DUCmNaZMJumB0Kek+6U
JtAqrw4x7+X2iz8p6j1EyUs0B4AivMN1V1IEXe6UPTye2uf6Bh9goKqmyRvp+aGQ
nyCSdlkP9FUDmbDb3tXIXplLRODZXsYLF9r8zxa9/Jlor+8x5t28TU4PAeiMBtp4
8rn/TA/a/TgDAk3sFjzp8vMSbSp41dYpkmOJuBUYbV9ea6YqJTpUNV8jCHAp+j0t
tCQZ1z3a+I+VpjV/WU/pL4M71CiM/t+WC3Kt5l6Ihx8bbtwhhAZbJY2e6QmXBGio
RHdywuK/Fotc9fmse/C24ZBNVwyNyDtPCpyiXHR+tKMNzYfffH1QqcPD59FNkqN5
Jne2EfrMDRoQ9AJ6aknFpRW6+L4j0sPWpnElKi1bRCc90CjHotg=
=dCOk
-----END PGP SIGNATURE-----

--lwkOZ5gkRFq3fFGP--
