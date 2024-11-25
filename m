Return-Path: <linux-kbuild+bounces-4838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA19D79CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 02:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B542824E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 01:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB97D17D2;
	Mon, 25 Nov 2024 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceZiiTLZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277F10F9;
	Mon, 25 Nov 2024 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498643; cv=none; b=QEWbP7r5FhYOaqrr4JqySmUSRDolsBA7rKbs1PAv9ErUWP7/fT5TQ9LQvZgIT7wmbraipnKVa8mY3qzslrXuI7hPR22K9sLnKUX6+d/3/YevSg6sYnrdlgU8nugxcVjKV0lIkclL0d0JE8k6ZBEJ0SCT95s7u7RPOdeTrOVKVHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498643; c=relaxed/simple;
	bh=KllHGmMopu/37TluP1feylEgM4OCLhkOUfIf6vwEc2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTjJEeMHVcuOwTxWmN6rLVtgUU9wUAyN2jqNkVIVLcSlZcWKZjAR4AXX3+vFZ/9nTl0UnUnjbTVrXNU3L+Tmb3kMFsnn8cWO3wx4XetSqmhTRtWbDfoAU2UpqGSTFT3C2+YZHHSmxEpLLq6elOyglGHuMi5mTr2Itz6sXq2fNa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceZiiTLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A189C4CED6;
	Mon, 25 Nov 2024 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732498643;
	bh=KllHGmMopu/37TluP1feylEgM4OCLhkOUfIf6vwEc2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ceZiiTLZlhhQZHwY8qf3D2HpRlRcL+FAXXyYCPF5+w82G9Jb4aCcDxJdW1tiKmWEf
	 hNEzz/2GKF2A6kkwbLtp5Gv6xq/t+lnKD5zWdhDsWuVU1Dx5PAn9xUGUwsqkcYFMDv
	 9ULq+Vnl85Ah9ZErtzkXBePSGHduOONseKj1MFtO2k5GDhlSRjfgCjIYcN9J4iv7NS
	 WmL3kz/H1MnCokh5sBHZvDqSXZjwic3Ej+TpRyofAoVfMiW3RtzCR0pfuPz0W/P5Cn
	 4Yvj0bIG34Ou28dfZwNRClb8Vy/OcdG+jjomhzvTScXeQbxUnhm8O1UXeO6GXz2s8X
	 Sd5e6B+rTXIlw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so1011324e87.3;
        Sun, 24 Nov 2024 17:37:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVpCfunrr7jGKigJufN1LgWMqem2JjBIm30wAm3h0qvzbOiVHcFkxyD7pXQ/BGRlLKWplmhHuH/ljQ2QeP@vger.kernel.org, AJvYcCUzH0cjVyxlesWtUCix477Xx3dcL9Qg1zvAL8hagpoNHLdNgtCnlGwwlQKDGX7l6OCQifEjGl0FNcbLbCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54IclhwAJwZAl/EH/gzRe5AMu9WVNFp+E1BjBYqQLYjTE31iw
	5nvqk3nvBlV70oojHmEJXW7mI9Gm0nr2xp9sc4KbdxaOuG5a9xzBDeNrdChyWPT6BBlbmnYVSb0
	dU+mYvmMA1UEqcEdt7n9n1NAG/lQ=
X-Google-Smtp-Source: AGHT+IG/kgVten0RINBeVc73gwjvGXdezvKwJlyq7glSkZqHMpRvrsgZnWcU/joTTiH0eUJDVqGZqN+9We17P1mZgI4=
X-Received: by 2002:a05:6512:b18:b0:53d:e537:c780 with SMTP id
 2adb3069b0e04-53de537c929mr261052e87.35.1732498641786; Sun, 24 Nov 2024
 17:37:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
 <CAK7LNARURUizjHNhCKjdLSJp1mCF0HYvyOfm7n8LHmUBjYByQw@mail.gmail.com>
In-Reply-To: <CAK7LNARURUizjHNhCKjdLSJp1mCF0HYvyOfm7n8LHmUBjYByQw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Nov 2024 10:36:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgCBzesiPzyQarGY8308jZ1rC5zC2e6xZCw0UmaB=qyw@mail.gmail.com>
Message-ID: <CAK7LNATgCBzesiPzyQarGY8308jZ1rC5zC2e6xZCw0UmaB=qyw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information choice
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 10:27=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Mon, Nov 25, 2024 at 12:59=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@wei=
ssschuh.net> wrote:
> >
> > Kconfig by default chooses the first entry of a choice setting.
> > For the "debug information" choice this is DEBUG_INFO_NONE which
> > disables debug information completely.
> >
> > The kconfig choice itself recommends to use "Toolchain default":
> >
> >         Choose which version of DWARF debug info to emit. If unsure,
> >         select "Toolchain default".
> >
> > Align the actual configuration with the recommendation by providing an
> > explicit default.
> >
> > This also enables more codepaths from allmodconfig/allyesconfig which
> > depend on debug information being available.
>
> Please give me some examples for "more codepaths" enabled by DEBUG_INFO
> because this is the opposite to the previous decision.
>
>
> Commit f9b3cd24578401e7a392974b3353277286e49cee mentions:
>
>   all*config target ends up taking much longer and the output is much lar=
ger.
>   Having this be "default off" makes sense.
>
>
>
> allmodconfig is often used for compile testing in CI/CD.
> We need to see the sufficient gain that sacrifices
> the build speed.
>

Presumably, DEBUG_INFO_BTF is the one because you submitted
some patches at the same time.

Are there some compile errors that are not detected
when DEBUG_INFO_BTF is disabled?




--=20
Best Regards
Masahiro Yamada

