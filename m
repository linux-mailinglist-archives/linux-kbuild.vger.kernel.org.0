Return-Path: <linux-kbuild+bounces-5261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E89719FDAE5
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 15:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04D11882621
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DF718A6A7;
	Sat, 28 Dec 2024 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er/0RNuF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA661791F4;
	Sat, 28 Dec 2024 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735396054; cv=none; b=f5vXCIfpJsWs6GOKuFxYtgWGbN2WcBRMM+cYqDStv7vAN6wIF7WJ6AkQmes6TdDrj6nYFGoe1Pi741/ocdvAoHXESJt0xkQAYzitIe5vTE33w/UaPZje/mDj0zZvfTdffla9D1BGtIi1FIcKRcARxYzwSaWJ3RcFiJdfdO2f73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735396054; c=relaxed/simple;
	bh=fPL1msMXavl51S4NGRNsENRMGF195xD+uv2kHb5HguU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKk5I/LcjO+iiO/ipH/4HdH21EeL0YIxrdUToADnNg85RRwfDtmQI32s9mB+PUx1pG0p3vw/yuy/+QqAvgBBKdA6CgHCBXWBvq3JRW55JRk1ZnIwAZOJq+DIHYgliPJuCEO3SfskNDpql/elgQoc7ob0Y6eZfDXq3rfa+x7iouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er/0RNuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844E2C4CEDC;
	Sat, 28 Dec 2024 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735396054;
	bh=fPL1msMXavl51S4NGRNsENRMGF195xD+uv2kHb5HguU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=er/0RNuFzdTQZaTwBFHoo4bKd7P/JgvzOJAMWsJOu4wnWb9sJU1DB0RCSx36bQhMl
	 BQ+cqnWlvtbqmCwvIG+lPuWcTxl1s9JAu4uz11BLmG6DD/qFgY9RARrykrMaI0Zrls
	 Gmo60XdUVZfOgOQi2Ty6IGZhdOmSpU94BdXDlSSTohJZN0E4ofcFDoEjrbkBRDt8ML
	 aDS5VhXq4Ah7y+4bs+9jVn2b8KHGwYBDhGgvlRqZBvdxEe+Tx/awB/fwmO53NY/jFz
	 GMmVkqeTzZxhgNCKwOZYGBpm8URJfJ2j8Gf990msyGnGhOL5dha3fVFLyPfJ6SsIhA
	 y3pG3Aw/xgbCw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401ab97206so8396605e87.3;
        Sat, 28 Dec 2024 06:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaKgoTrzxN3aC9cdCgRin1xhcOcQpYfCK8cvYEbTAZi/aekqbXvbsnlLYxVYV8MyNEpkW1tLgUFDmFwIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iABEZr0xe4tFdh5jidp4y1H6M6VioJdibDnCrx2G/W8ZitbC
	Z5e27u/qyeGTv6KOLa3TBlPe3bbN85+oAwh9KsS1DV7Js8BnjDHs2dhz9+ObzAWLiJKuqFZ49qq
	I5pXfWoP6ZqqR1eoONfJni71+AXI=
X-Google-Smtp-Source: AGHT+IF0DGzp/G4DTuoKFWq+l7gHenGVSdUKdweRHtjNiLRznbgWE4TGeEtqsBIb9DHULt/XLQOGfy7f0s8jd5vK+ng=
X-Received: by 2002:a05:6512:640d:b0:542:2871:535e with SMTP id
 2adb3069b0e04-54229598a11mr8276324e87.55.1735396053214; Sat, 28 Dec 2024
 06:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223124454.3614680-1-smostafa@google.com>
In-Reply-To: <20241223124454.3614680-1-smostafa@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 28 Dec 2024 23:26:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQctX4gN=oCPa8Ke+MAsbEj6_yb3zF+Mp=i9aEw28xcQQ@mail.gmail.com>
Message-ID: <CAK7LNAQctX4gN=oCPa8Ke+MAsbEj6_yb3zF+Mp=i9aEw28xcQQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/mksysmap: Fix escape chars '$'
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, ptosi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 9:45=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> changed the invocation of the script, to call sed directly without
> shell.
>
> That means, the current extra escape that was added in:
> commit ec336aa83162 ("scripts/mksysmap: Fix badly escaped '$'")
> for the shell is not correct any more, at the moment the stack traces
> for nvhe are corrupted:
> [   22.840904] kvm [190]:  [<ffff80008116dd54>] __kvm_nvhe_$x.220+0x58/0x=
9c
> [   22.842913] kvm [190]:  [<ffff8000811709bc>] __kvm_nvhe_$x.9+0x44/0x50
> [   22.844112] kvm [190]:  [<ffff80008116f8fc>] __kvm_nvhe___skip_pauth_s=
ave+0x4/0x4
>
> With this patch:
> [   25.793513] kvm [192]: nVHE call trace:
> [   25.794141] kvm [192]:  [<ffff80008116dd54>] __kvm_nvhe_hyp_panic+0xb0=
/0xf4
> [   25.796590] kvm [192]:  [<ffff8000811709bc>] __kvm_nvhe_handle_trap+0x=
e4/0x188
> [   25.797553] kvm [192]:  [<ffff80008116f8fc>] __kvm_nvhe___skip_pauth_s=
ave+0x4/0x4
>
> Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---


Applied to linux-kbuild.
Thanks.


--=20
Best Regards
Masahiro Yamada

