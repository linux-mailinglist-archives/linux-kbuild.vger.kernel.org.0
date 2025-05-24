Return-Path: <linux-kbuild+bounces-7254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A22CAC3088
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 19:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4AA217E87A
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 17:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577201E0DEA;
	Sat, 24 May 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCai76dt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81B1E502;
	Sat, 24 May 2025 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748106503; cv=none; b=mP8cmGWW2f5UmA94wdB4X8GakSMTpygyNy/+iZw5mGsG6xbrW0kNNS8xfQr0DR3gb4m1oVn6hAMqLCLcascM+tSRqsGmfKgVZlq4nXwdNkFta0GtjKfV00akE68fxFNshv7nxQvC+tJG0GNcGzkjpMvLEq8XyA96gJe8zHxyBZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748106503; c=relaxed/simple;
	bh=7+TM/n6ai+omIt+WF0zO4MV42VZZUnYOpb7bunwoEAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlbrhRHFnNIDMRtrknFvbsdGSaiOwkXThO4hS+6fH0Bc/NsfQR9XZulYvfwiSJU/K9eAJ1wCdLYazI6s3uH0Ro/Oa1ATnYanS2G/8QaMqiDXdRml8CguWRQ4g/p7Tn35LzY8k2jKTfGz24pHgkfc3IFVBlCHf7IHxu3Xz6EDgA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCai76dt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CEDC4CEE4;
	Sat, 24 May 2025 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748106502;
	bh=7+TM/n6ai+omIt+WF0zO4MV42VZZUnYOpb7bunwoEAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sCai76dtm/VcFkfiJFz+5BuUSJnmKuPB+Rl1GnHj7LHgj6Oj/I5HY+L0dEsc56Cud
	 TxmtiSEoYb/XmzEaRHuhkk47U9G/JdMkQqf53+PfoLRni3N/MGFaXj3/wf/LC2xmrk
	 L2HPqxzCcNJhTuJbKr4nH2dsRvs9eDKYHDpYu9660iIawl0VV61AmEaFv2RjRTIkWE
	 mDtmEW6Gkxef8sbG+MSmYoxzHza4e5b++EpZg4eVFMhyAXK73EIvB7R7hXu4BTAqQi
	 jtYGz1TJWM0aTLFbOHypiy1GAQTK8aMGD9uBlqxHD1Bc1DXjrHYE3IJZZQuNVsD+p4
	 A59t019k/ni4Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3280ce0795bso7711351fa.2;
        Sat, 24 May 2025 10:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKAwSn6a3DLlnMV0ZUdlZNbyRP5m46xfvqVA+2JIPVSeN15MMZn6Gh6RQ9i6iKo7bZUdMf8jfu45OaLiBZ@vger.kernel.org, AJvYcCXoZgkfNX1nk0RXKjYkVMiz8rNj1fkQpYZ3IQFl5p9FwkgnSYbTdKXqrF/oeBD9MijLu+5FsjDX0t0r7mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2KPnTSFhe4QN24cFG8viWfNnooIXkuI0wc+wcghgknrvKqeU
	qiZ22Rtrl+hXND76OglyxrM6EVclWcRKoEBlL5F3S53JrqIiq4MSQp+Js85lZPz8J6Ghz/d+ZSC
	dOtyu996OxPoAuE9XjX/kSthrHq6Ek8g=
X-Google-Smtp-Source: AGHT+IFSYXY1uQlLrBWnw5PAjCmGapkbcpR6P46oNufADbn+gagWrR3GPhulQF/wotNYYLBIuX4GmSJidjLQdVLs0Dc=
X-Received: by 2002:a2e:bea4:0:b0:326:c07e:b0a4 with SMTP id
 38308e7fff4ca-3295b9c2c54mr8236851fa.11.1748106501294; Sat, 24 May 2025
 10:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com> <27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com>
In-Reply-To: <27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 25 May 2025 02:07:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQAoPhZrbY=5iBSCxWegSaoqsdtY=3zK+u+ZrgevidAsw@mail.gmail.com>
X-Gm-Features: AX0GCFtZ_tLd8Ul1A5BM_eszKowxTUOGMleFBLQX19e531w-COFBAyBEgthzAOs
Message-ID: <CAK7LNAQAoPhZrbY=5iBSCxWegSaoqsdtY=3zK+u+ZrgevidAsw@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: check for a NULL pointer before access
To: Bill Wendling <isanbard@gmail.com>
Cc: Bill Wendling <morbo@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 9:49=E2=80=AFAM Bill Wendling <isanbard@gmail.com> =
wrote:
>
> The call to 'prop_get_symbol' may return NULL in some cases. The if-then
> statement accesses the returned value without cheecking if it's
> non-NULL. After inlining, the compiler may treat the conditional as
> 'undefined behavior', which the compiler may take the opportunity to do
> whatever it wants with the UB path. This patch simply adds a check to
> ensure that 'def_sym' is non-NULL to avoid this behavior.
>
> Signed-off-by: Bill Wendling <isanbard@gmail.com>


Same reaction to this patch

https://lore.kernel.org/linux-kbuild/20250212154537.235297-1-ant.v.moryakov=
@gmail.com/


Please attach a test case
that causes a segfault with NULL pointer dereference.











> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> v3:
>   - Fix whitespace for real now.
>   - Patch from another email account so that the whitespace is retained.
> v2:
>   - Fix whitespace
> ---
>   scripts/kconfig/symbol.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index d57f8cbba291..9c5068225328 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice=
)
>                 if (prop->visible.tri =3D=3D no)
>                         continue;
>                 def_sym =3D prop_get_symbol(prop);
> -               if (def_sym->visible !=3D no)
> +               if (def_sym && def_sym->visible !=3D no)
>                         return def_sym;
>         }
>
> --
> 2.49.0.1164.gab81da1b16-goog
>


--=20
Best Regards
Masahiro Yamada

