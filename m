Return-Path: <linux-kbuild+bounces-7082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE18AB32D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 11:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4ADE173F10
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 09:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DEA25A64E;
	Mon, 12 May 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxApOAvI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC33019E82A;
	Mon, 12 May 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041273; cv=none; b=WYQhdHY8fipo7vcumC+AK3aevtKwjGPfduyQrNckCgnz+g1s+PBE5wTHjTQccGnUh0cUQydoOU7muHrnrU3pQnj8dJqt3X1RfulgFKBb01Tt/52vkBNSk2Y8w58aunha0De5fOyjCtfKcVFxsHs3S/+aXX1CFMH6X5ktdDFbRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041273; c=relaxed/simple;
	bh=HgA23X09EOQHUFdqhgBCZBj6qKS3pvzLCSZC53aWWgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syBb6RsRtIw5lF8VPL19+FgtKTSwT60BuaEOxs7CGqrTQ+rkjl7qWTZ8L3Mz5hltfVZ/jnFiEZeN7fHYPPl1vN12d4h0BG9XypvAQ7195zFLfT5zsfKRksqKmNWTqmEzZ31/fp3LbPNjmnfmzbpd7cXOH6Vl7zjbA3NbJCYUEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxApOAvI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B42CC4CEF3;
	Mon, 12 May 2025 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747041273;
	bh=HgA23X09EOQHUFdqhgBCZBj6qKS3pvzLCSZC53aWWgQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WxApOAvI5khzXSx79Zsp5Hahc/Z6tpb2T/q5qG4jaPyzbkjEGiU6jYZzQw+cy7FYB
	 merz+lo5ZejorU9fQWuEsMvsGx6qsAC91DHkpSc9R2kUIbUdqxbDKbMDtVcQqSt0kO
	 dY2xTRqejucrFyZ/VJ8uaj/6oH3Bltczpui7AmYboiNVTgGYI0eAFIC52RxdGWHFec
	 BdGyTstPpAEqrk02K9rN6wU4qtL77DwhWX+EdUpo1elZJKBN75Pm8h2obpm8W/vT7v
	 wWxE5Ydqo0pc+9VCNeOgenxnEv7j/ZiH67qKxh0/lGpbicV31UWhGmCVxQd1JNoExV
	 su9zR7u5i0uOg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30effbfaf61so51316831fa.0;
        Mon, 12 May 2025 02:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRvEW0NyObkeqjnL2756mmdPG1v32/TYdBo0nPNI0nqz+157+GFk4rnMq9rIQTAOlmnoBsXorNZ7umrGsGIoI=@vger.kernel.org, AJvYcCW1CP66mtNkX2uKERhM3dBpnUvxuiK3MjSDH8D6Wj5WXrebqwtOkpYY9vRSVXSCl+lR5vqXh8d/1rqkM+m4@vger.kernel.org, AJvYcCWkiiikO9Jlgh0vBz014p2F+WVDGB8CoNEhvtKICRrwQEFYmxbc5NByCCi5RXeKCQehXIlSmosP64I=@vger.kernel.org, AJvYcCXCwG6JidX90EnajByysIDYD8vYj7fJs3BOXHg90+PXbf8CaZ60PkYumlkGGdyKu86/Bo3pYOJraMrjrCfO@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCsbXNgPvjRLl+yZK3G73I92P1A/SzrsygQrtb4AJgEXjEFXK
	wqxkPgjSnBtqRM4P8DyXenZSHInH7SKg4SnzXAsSM6iQfUoR5d5ttnx1ECiOhKbHoN74adPhdUd
	0017gwhmTMkPqAZ8WefOywAXKDww=
X-Google-Smtp-Source: AGHT+IHPEQt2Y0pz/cmLWyo9qzhRO7GhKCjDosc6S/Df5anYnXykwsDnAOCfso46oOY/2ZUEpv40Ux2NDtYMxB8jNDA=
X-Received: by 2002:a05:651c:3254:20b0:326:cb09:8220 with SMTP id
 38308e7fff4ca-326cb098720mr20785581fa.16.1747041271801; Mon, 12 May 2025
 02:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
In-Reply-To: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 May 2025 18:13:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARq9LdeB2uGusFxSrG=enrpAk05KC2V77o8Wh191y_Z4w@mail.gmail.com>
X-Gm-Features: AX0GCFvsK52rOeUbpqcgGKDBRYxdE-fzGACWT3JmBUy3_4FTOVNX5AXbjFlkqbE
Message-ID: <CAK7LNARq9LdeB2uGusFxSrG=enrpAk05KC2V77o8Wh191y_Z4w@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: revert relative paths in compiler outputs
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 3:02=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> -ffile-prefix-map/--remap-path-prefix break the ability of debuggers to
> find the source file corresponding to object files. As there is no
> simple or uniform way to specify the source directory explicitly, this
> breaks developers workflows.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (2):
>       Revert "kbuild: make all file references relative to source root"
>       Revert "kbuild, rust: use -fremap-path-prefix to make paths relativ=
e"
>
>  Documentation/kbuild/reproducible-builds.rst | 17 +++++++++++++++++
>  Makefile                                     |  3 +--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> ---
> base-commit: 3ce9925823c7d6bb0e6eb951bf2db0e9e182582d
> change-id: 20250511-kbuild-revert-file-prefix-map-4de45dfada75
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>


Both applied.
(I locally fixed the doubled Fixes:)

Thanks.



--=20
Best Regards
Masahiro Yamada

