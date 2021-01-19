Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FEC2FC137
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 21:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbhASSvk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 13:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392086AbhASRzg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 12:55:36 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D00C061793;
        Tue, 19 Jan 2021 09:48:26 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id d14so22629164qkc.13;
        Tue, 19 Jan 2021 09:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f4E5ZdTb/c/05OV3aNGXqZyr3BVid89a31XNJo/J7Bs=;
        b=B8bu++PF7PnHYPfUMUd8fXSpBcwFZt4PIJSmxKCtkivGyFeZUSzGzJX8RuymkJB/gb
         fzbJeesBRuAacv3kFIZscSHswavMV/sVoWOcdPHv5BvPZM5oSRoMsCMJ91+jquM0atbd
         UzjpOp9hK65Ai2DqY/LxfaTNOKoc/8NwJAhsmzzI42OZr0kzrZgl44Q6m8STPkavVKRi
         /uu5KbbJZQueqYyuBAQjtOCtz5NRLvUEO5oxVGHDJT9R4UQQfNEYaS6xbccucFt3nDn7
         kpqTzzo+aGL9m/XeWkMDPfOddGvAi75m8bTt15d5kO/bwd9tfZdbXVR/D161pQp08rOd
         FXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f4E5ZdTb/c/05OV3aNGXqZyr3BVid89a31XNJo/J7Bs=;
        b=h3ivrifVVYroMaWQUqX5ig2i3x0Mi4oV+Q+sFDTnn7ouoLgdbvYmLVH6qwm/Wd9s4l
         GnyR1L/UZZXjw+IUp9tWa/FpWuMl23jipqU4ryHGUTIb2cek7McvdeWsQdzTSsYDJCC5
         WJRecDxAOgSIrLqKmw1pXUdupwYICzLsRGhhdWJX+Bl8aOiFaHaChIVl9jCFmmjXa1Ei
         RadYh42FVe7DfBnFApWYygVmAYL0h9G2V99uY2imVz4NX5Tq/3Gykp53rDh2S4vm3v8a
         6qhcXoUmqEcTJbTTcCQVcKcsZgvO2VjNIbpk2Lm5gH6vjExExxWegqcZX8Yqup35Lq04
         +K0Q==
X-Gm-Message-State: AOAM5317JNvbj5tbd/JgTloWZ2rRnvBeTHPaHVgeyaX3oHU/Hyuodv9m
        IrhLsp7SSsWSzcTqEQDlQxw=
X-Google-Smtp-Source: ABdhPJzw8/RPKTyYutvWvfbgQUaf6yTfXT1jpFSgNSofmVVW0znNTQ7HAicj2KhgFkPFPHoeHINwAg==
X-Received: by 2002:a37:9dd3:: with SMTP id g202mr5578423qke.488.1611078505338;
        Tue, 19 Jan 2021 09:48:25 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o5sm12769923qti.47.2021.01.19.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:48:23 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:48:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
Message-ID: <YAcbZRViwlAwl62q@ulmo>
References: <20201203125700.161354-1-masahiroy@kernel.org>
 <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
 <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
 <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
 <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
 <25030057-86b1-5619-25fd-acfa0728b850@samsung.com>
 <4ab4f62f-8b37-01e1-f81c-270155b13a51@nvidia.com>
 <7e691a61-bf4b-0594-8d6d-36d62a5def0b@nvidia.com>
 <CAHk-=wjjiYjCp61gdAMpDOsUBU-A2hFFKJoVx5VAC7yV4K6WYg@mail.gmail.com>
 <95ce88c6-59bd-55b9-9299-51fa20aeb95c@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7rm5qQeEd3jZvY1U"
Content-Disposition: inline
In-Reply-To: <95ce88c6-59bd-55b9-9299-51fa20aeb95c@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--7rm5qQeEd3jZvY1U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 08:33:37PM +0000, Jon Hunter wrote:
>=20
> On 18/12/2020 17:54, Linus Torvalds wrote:
> > On Fri, Dec 18, 2020 at 7:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >> However, if you are saying that this is a problem/bug with our builder=
s,
> >> then of course we will have to get this fixed.
> >=20
> > This seems to be a package dependency problem with the gcc plugins -
> > they clearly want libgmp, but apparently the package hasn't specified
> > that dependency.
> >=20
> > If this turns out to be a big problem, I guess we can't simplify the
> > plugin check after all.
> >=20
> > We historically just disabled gcc-plugins if that header didn't build,
> > which obviously meant that it "worked" for people, but it also means
> > that clearly the coverage can't have been as good as it could/should
> > be.
> >=20
> > So if it's as simple as just installing the GNU multiprecision
> > libraries ("gmp-devel" on most rpm-based systems, "libgmp-dev" on most
> > debian systems), then I think that's the right thing to do. You'll get
> > a working build again, and equally importantly, your build servers
> > will actually do a better job of covering the different build options.
>=20
>=20
> Thanks. I have reported this issue to the team that administers the
> builders. So hopefully, they will install the necessary packages for us
> now.

Just to close the loop on this, the builders now have libgmp-dev and
libmpc-dev packages installed and the builds are passing without the
workaround we had used.

Thierry

--7rm5qQeEd3jZvY1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHG2IACgkQ3SOs138+
s6Ht2xAAu0L1jit8d2ZxSzQyJH8jOz7gwm9N2twAnmXa51SkLH7/ZUnt7hkbnjcd
M3XS33eXTd60Aj0IFpMwhUfzDRWmXVlIbhTfotdWp6655KxbThC513SdvEMQiTlO
/bn97HxU/azt3xe7pGYEhyyx0UruX/jtYnC35gE5zqzujM3uVcvqh8q0O62dcKGM
gZi5U0OYYpMXRTJRIWKAD/+ytrfJyWNvFFcO8SVoLg+cKtZ0S6Q4Xt5wNgHGFemL
gRDqQZFrJDUCFBysQR1lN/9AUw/f0EmNmvqjc6HG3hTdwA18sOq0rpHdynaNa0RM
vjKI+qQ8kkCBhZl4ZqC9KD7GEwxuspESTInrD3YQx9fcZwhCq9JDjE6y9KHwalbW
C1JHgMr6ZL/vNC7/Q7CyALUzyaZBXU5eJgL9dN3SpCCjEzvUJmHaWaTe9CFGGYVx
D9QRNgjhpkBweaF2+J9K3infuyFEZmg8/7JyuYW2QbZ9/iS7/pzw9wzw8OEZiSin
txGU4UeWnSq7Fxmc5yaip4aTGGn8Rgv36MA8dQB8GQb2Ipvx5iJaBJuQGT5W4zPI
7gQkWpWk8QUuXBFng3cj0+5kCR6tZao7J/at06iOyAtbpIYPekA956dTBUysW/qM
108q895PsmRm7+jvd9ATrCUH7/sWlswwZOGHHjfM3tFNMg6GlUk=
=bF1k
-----END PGP SIGNATURE-----

--7rm5qQeEd3jZvY1U--
