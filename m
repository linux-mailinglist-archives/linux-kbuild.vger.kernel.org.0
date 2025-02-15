Return-Path: <linux-kbuild+bounces-5759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67514A36E40
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B23216FF99
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 12:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA9119CC2E;
	Sat, 15 Feb 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOGff1BZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793923BB;
	Sat, 15 Feb 2025 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624108; cv=none; b=hY3m6r2LgEr7kNO2w2JdhaIr/yvHlKCOApKC2vfvG3/RJLCFibu0taaomdUnsr0KerFrxbCCrJMCCaRe+7wRoPdWMneD7O414Dh7JXDtIuNirvwa23ct97zLdrPavlHCsjJku4GMvzPac8pW+cfacyRnBHRg/K7n6GwPXbwOz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624108; c=relaxed/simple;
	bh=JaGaLcR0OlSjmLSJpiA+1SLPxaqyRVrzGxCfQHiGiqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7HdWJd5KkxaLz4tfcjqY1/lo2WAa3csxJVF7Si0O/+fnCRvLfVVshP/Vuu0MazD6k3VLo1BKNh48EOYeHgDEzHO99wxbBWyOEw41TGoJUXmmLtV9fHX1UKqhSJJYxZ/Udk7ybLjdn28ysRLKATmAxMl012uQewnDLcr1ymD0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOGff1BZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E27C4CEEA;
	Sat, 15 Feb 2025 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739624107;
	bh=JaGaLcR0OlSjmLSJpiA+1SLPxaqyRVrzGxCfQHiGiqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bOGff1BZMouX1S6Q65nVCH08VaflkQKErpJ798norzjRrMmro1QHPiLxO3s+BIknY
	 kfDGT45x7HOecEuNj1jIIJY1mLfXSgsiL28x/MsycpjxeFqiBZ5KpbAbZzJCpXeNoJ
	 W3+44JCmWCT/ujHhEmzR9XJD+uhBHqa/60sTa97hBos5VHA/2w5VrF9hajjVqiRswE
	 ucVAc/8R7rzM7zuPubdt35sJ6/I2Qa03bUpE+e6p9bwT7DYljjgILl2nr/1PAm/2Cg
	 iB+cafwi0klRuVh15P33Dra2tXgLixe5FidkiUb4N9sL7nFlh/qv2nGCvZR2Kgdhmi
	 j2oK9k4F2kwqQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-309311e7b39so3247621fa.2;
        Sat, 15 Feb 2025 04:55:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGu54a54tYhpHv6/ngEAZJI8Zn0PusXGuL6H78sXXQy6qDAFaxlLocopNkNvFkOMiHm+SbeKeTBYY=@vger.kernel.org, AJvYcCVfeJyRifJih7KSj5aeanFo5BHbCqQQX8YKO4lihtcjftUF6PP7Prk2yAiwqxpXDvi4A7VGTa8CbSyZBarG@vger.kernel.org, AJvYcCXdSIq8lSN6XXnGpKEDmgyNt7Us6b0qL7RlDkbdekP1w/V4ft00m5kSCoVBkbtUTPahCo95W6pZpIvMK8lA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi2IIUjbSG+LujSUosgzq1vSVdtJh7iK8edV5iJxFHRUM4zkDT
	yYJMAp0eq/8C0C9ee+3TdIzhhKEi8QETmbMsKz9HjHiOOYiQlmOJyB52ndnTKeFZnL2B4s4wEt7
	ch5VpEDmpNM4WDhV7oeroXSiKbPg=
X-Google-Smtp-Source: AGHT+IFr8B7hsxDGqPUfOa8Yt6UmqRsD8EDegrqTe7PrwrORnf5yIkQ1bZMOVSd/B+oxrfBkZP+2XqN3y2BvsUbfqPs=
X-Received: by 2002:a2e:8890:0:b0:309:2000:4902 with SMTP id
 38308e7fff4ca-30927afe770mr8871081fa.36.1739624105962; Sat, 15 Feb 2025
 04:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Feb 2025 21:54:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqSPBnGfVXCfJq7oCtE1ge4-L5QY6gVx8_chpmKDQusg@mail.gmail.com>
X-Gm-Features: AWEUYZnVsPiXOOz3xRjVnfczcOOJr7OrhGTC5DvdAIckDANbA32iNLDI_H8iysg
Message-ID: <CAK7LNATqSPBnGfVXCfJq7oCtE1ge4-L5QY6gVx8_chpmKDQusg@mail.gmail.com>
Subject: Re: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 8:42=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Several drivers express optional Kconfig dependency with FOO || !FOO,
> but for many choices this is neither suitable (lack of stubs for !FOO
> like in HWMON) nor really needed and driver can be built in even if FOO
> is the module.  This is achieved with IS_REACHABLE, so provide cross
> reference to it.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/kbuild/kconfig-language.rst | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index 2619fdf56e68..66248294a552 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -194,6 +194,8 @@ applicable everywhere (see syntax).
>    ability to hook into a secondary subsystem while allowing the user to
>    configure that subsystem out without also having to unset these driver=
s.
>
> +.. _is_reachable:

Instead of this, could you move this hunk below ?





>    Note: If the combination of FOO=3Dy and BAZ=3Dm causes a link error,
>    you can guard the function call with IS_REACHABLE()::
>
> @@ -580,10 +582,15 @@ Some drivers are able to optionally use a feature f=
rom another module
>  or build cleanly with that module disabled, but cause a link failure
>  when trying to use that loadable module from a built-in driver.
>
> -The most common way to express this optional dependency in Kconfig logic
> -uses the slightly counterintuitive::
> +There are two ways to express this optional dependency:
>
> -  config FOO
> +1. If pre-processor can discard entire optional code or module FOO does =
not
> +   provide !FOO stubs then in the C code :ref:`IS_REACHABLE<is_reachable=
>`

Instead of the link, please move the code example at line 200 to here.

The note at line 197 is not strongly related to the 'imply' keyword.


One more thing, please document the drawback of IS_REACHABLE.

It is true that IS_REACHABLE() resolves the link error, but we
will end up with run-time debugging.

foo_init()
{
        if (IS_REACHABLE(CONFIG_BAZ))
                baz_register(&foo);
        ...
}

Even if CONFIG_BAZ is enabled, baz_register() may get discarded.
Users may scratch their head why baz_register() does not work.
Due to this reason, IS_REACHABLE() tends to be avoided.


"depends on BAR || !BAR" is configuration-time debugging.


> +
> +2. Otherwise (and module FOO must provide all !FOO stubs) use the slight=
ly
> +   counterintuitive Kconfig syntax::
> +
> +     config FOO
>         tristate "Support for foo hardware"
>         depends on BAR || !BAR
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

