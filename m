Return-Path: <linux-kbuild+bounces-6965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF90AABC4A
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 10:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAEAB506163
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 08:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3229621D5B5;
	Tue,  6 May 2025 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcrDvkpi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E304B1E6B;
	Tue,  6 May 2025 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517861; cv=none; b=hlOgQTEP8wcZAQfuB5zEwSaCY10ZLlCKnZtKD8hLTwqzVBjsRvFLGvPQtoUZFj4RkoJvhvZalXKyUzZ4zGI0Uckf9kgYuQx1GprH/m3X/Ph69ZtW5GlaXlvN44moGay89+eYnRyiGYVUGRZuNe/pDNHA3SdZJ3Oj0dXHE86U3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517861; c=relaxed/simple;
	bh=CiWo4tHmSCuZxPGbxlsgtwSE8g8q6sXdBq2GUKBlkH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAm3HTlWMOAoNGrNU8CDi04Lei9+2Nb5ra8blj/TMFyOJUwMH8l+2h5U3mkSBXZktZtuJ2knIL6IslpbP7HVR7gOeIrslrZ9x8oAVcgdPVIcyypOUbWH57IWduKbwIac0rHCS4koNVsfhihJGwvjBLQP4t6HxoSVjQtn6pRswUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcrDvkpi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7283CC4CEED;
	Tue,  6 May 2025 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517860;
	bh=CiWo4tHmSCuZxPGbxlsgtwSE8g8q6sXdBq2GUKBlkH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hcrDvkpi8oXvWPuyFNgGbSCm1E46NiLcwjEuIkxTQf9QPpRYLTnnnvaNzt0395CaG
	 1gVff77rttYoTE10sAJjHXnNrjVeiujumvBY4I6VC5tgGYoyb9/V0LgbbpZvPLjjou
	 0rXK9mWyKWwgKiGUox1GQOSsPaHANOBFaRyqDYpeFfbOBdrduyyNypTiULmcoPJ8Vr
	 9yaXKBZhnMU0mNruwq+NCTRiXjRcZo3uOmZX8NLBj6n0qLvOtmRjw7kRgMyFcgVEPN
	 bbxD5z4Bi9kXGxKq8CcXsSdudppc/AlWwgbL9+bUx3cU5Uty44Ix76yRJ4bHQJ/Eeb
	 px7gjk9tQ5gkQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30de488cf81so54757231fa.1;
        Tue, 06 May 2025 00:51:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVubpHoqEB9hFWZcP1gNMkiOV4hksP7rGmpm1eNZmfSvBWeVVBzh/CxmneBjfayBIcnKukZSxZMB534VbM=@vger.kernel.org, AJvYcCXfJZSd9akJ3A4y9CFffullmVzV7GlSiN9PYsvj+pxMTb9x9HM7xsdktPCUCYW5MlyHqwNUz9XXUEYjStrB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgp2N34tgp0K0LbqaS5BevkX2RrWOtEt+IX+uYbV1sbMo7OAcV
	EPOQpmTonS7UmQhQxwS2sn2mpyXBuhh+adBkPX5Hu2QuMt0G2luWHaihkeHPdgYE7ss4ISSv/wk
	c4BsniEiz9OqQXBdTYaEbyskE5GQ=
X-Google-Smtp-Source: AGHT+IHsrtKAgEh9ZdN0GLbxFeIjywak6bphQQylGI5PYxQjY4XXC09pHpt2Oin/zpnBbFLlFoHZ4cXNeP3NC14Fp+o=
X-Received: by 2002:a2e:be06:0:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3266cc05b9emr6724851fa.32.1746517859167; Tue, 06 May 2025
 00:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com> <70C0FECF7A9A7B62+20250422105402.145635-1-wangyuli@uniontech.com>
In-Reply-To: <70C0FECF7A9A7B62+20250422105402.145635-1-wangyuli@uniontech.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 May 2025 16:50:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQSMaz32vQPRr4tCkSLoDzwh6Z+A0KPvE9ig8ofwk2DHQ@mail.gmail.com>
X-Gm-Features: ATxdqUGxD0mhajBqiO0ocZNOivk_QYJg2X6X_VnV44mXXKR7x48ZtwSWjbzIE7Q
Message-ID: <CAK7LNAQSMaz32vQPRr4tCkSLoDzwh6Z+A0KPvE9ig8ofwk2DHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	niecheng1@uniontech.com, petr.pavlu@suse.com, samitolvanen@google.com, 
	zhanjun@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:55=E2=80=AFPM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
>
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
>
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
>
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/symbols.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file=
 not found
>       6 | #include <dwarf.h>
>         |          ^~~~~~~~~
>
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

Applied to linux-kbuild.
Thanks.



>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 744ddba01d93..d4b007b38a47 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -210,7 +210,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (=3D 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/
> --
> 2.49.0
>


--=20
Best Regards
Masahiro Yamada

