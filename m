Return-Path: <linux-kbuild+bounces-1886-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545E8C9438
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 11:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60231C209EC
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89177BE40;
	Sun, 19 May 2024 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/+HDY40"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54180748F;
	Sun, 19 May 2024 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716111318; cv=none; b=lBtvJmyclcA0r54T1Y35iBbW6OyJeNabyqcX0KxO4bCJHhgkPUPTtlJzF/QjOVUgA629PUk7eeWIDGCHVbW408t6OFMmQa1VXZ6cGBfiOToKzo62bowZwcVDto5xemf4PDagKMDhsKzLxcUQ+y69chSiN9Jv0AJoaDgIueuaxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716111318; c=relaxed/simple;
	bh=7L2pRm7mdvJMXqSaRAVe9vrR3ol6cvS9LuB5tBqB3xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q16lcTPgtaAlg+R1TyxkeNO+if3RXo4tmdrKRZ+1VKm2sZTlzsVOMtywhrAClTbVXPZF87djcqAlebd+ZgJRM+eruo9U7PUQMzmN2xGcyl+GUIBQaU/Wi3JJVc+BXIWeWH3mpFFZxFuuISFlE0ajRfGDxGfjX1A30eBYGitrAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/+HDY40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EE8C32781;
	Sun, 19 May 2024 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716111317;
	bh=7L2pRm7mdvJMXqSaRAVe9vrR3ol6cvS9LuB5tBqB3xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I/+HDY40736so38QNTROxrDO7lwgGxUpc8zKuACaz56Yaoi3ashwOzpmgZsm4/hGj
	 wLo2VkhgA5mJtugMT5eS0aBHX6azLJsDJpzDsulUPi6JT9RYYl8xt0fyl2NuyqmBfy
	 HUW0pgko4BBm3/f40BFMl96IX95BIwY9DVXoPLI1ShPb5vnNHEi+DNs+/9Aaebrbx/
	 lDT8UUmP1bR3qYdxXCXANqyz2ZUUdz6hjGV/iEFo9ZiDWd7iKm7BfAEIpWep09Bhwd
	 Lkw0V4X07rqnRibnaomB3sWrGMc0Oh9hpTss9dN3apsT/G1imPznT2gM8MueBgyd4e
	 MdNGck7aXh8fg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5238b5c080cso4173809e87.1;
        Sun, 19 May 2024 02:35:17 -0700 (PDT)
X-Gm-Message-State: AOJu0Yze7+Ku5tPQhuUaH2bHm2Yj+dnK5HXGM5mEaoNHiP7qjHv/lXTi
	MUJZjYsxku4dNwjkrkz5fceiC/32WBNbztiPpDcc9vy4suDw0/HGFTFi3fwRfjCvt3A+D6pk7dR
	XQZUQVCEuBN09I5WVDneVCIKYoHY=
X-Google-Smtp-Source: AGHT+IGa6ObMMUkXTdQv/OIlBoXz+kxSimXnEZbs3AcrhVNC0m08wm1AtSAXAk0Po2AzFVm9ro+CoZulZOI72eY280Q=
X-Received: by 2002:ac2:494a:0:b0:516:d18b:eae8 with SMTP id
 2adb3069b0e04-5220fc73dc6mr15085624e87.41.1716111316467; Sun, 19 May 2024
 02:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519092227.2101109-1-masahiroy@kernel.org>
In-Reply-To: <20240519092227.2101109-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 May 2024 18:34:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdNAEwaoe_fU5Pe2ieM+ayDsEnequQiY+MCKzn1=r8TQ@mail.gmail.com>
Message-ID: <CAK7LNAQdNAEwaoe_fU5Pe2ieM+ayDsEnequQiY+MCKzn1=r8TQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix comparison to constant symbols, 'm', 'n'
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 6:22=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Currently, comparisons to 'm' or 'n' result in incorrect output.
>
> [Test Code]
>
>     config MODULES
>             def_bool y
>             modules
>
>     config A
>             def_tristate m
>
>     config B
>             def_bool A > n
>
> CONFIG_B is actually unset, while the expectation is CONFIG_B=3Dy.
>
> The reason for the issue is because Kconfig compares the tristate values
> as strings.
>
> Currently, the .type fields of the constant symbols, 'y', 'm', and 'n'
> are unspecified, i.e., S_UNKNOWN.
>
> When expr_calc_value() evaluates 'A > n', it checks the types of 'A' and
> 'n' to determine how to compare them.
>
> The left-hand side, 'A', is a tristate symbol with a value of 'm', which
> corresponds to a numeric value of 1. (Internally, 'y', 'm', and 'n' are
> represented as 2, 1, and 0, respectively.)
>
> The right-hand side, 'n', has an unknown type, so it is treated as the
> string "n" during the comparison.
>
> expr_calc_value() compares two values numerically only when both can
> have numeric values. Otherwise, they are compared as strings.
>
>     symbol    numeric value    ASCII code
>     -------------------------------------
>       y           2             0x79
>       m           1             0x6d
>       n           0             0x6e
>
> 'm' is greater than 'n' if compared numerically (since 1 is greater
> than 0), but small than 'n' if compared as strings (since the ASCII
> code 0x6d is smaller than 0x6e).
>
> Specifying .type=3DS_TRISTATE for symbol_{yes,mod,no} fixes the above
> test code.
>
> However, this would cause a regression to the following test code.
>
> [Test Code 2]
>
>     config MODULES
>             def_bool n
>             modules
>
>     config A
>             def_tristate n
>
>     config B
>             def_bool A =3D m
>
> You would get CONFIG_B=3Dy, while CONFIG_B should not be set.
>
> The reason is because sym_get_string_value() turns 'm' into 'n' when
> the module feature is disabled. Consequently, expr_calc_value() returns
> the result of 'A =3D n' instead of 'A =3D m'. This oddity has been hidden
> because the type of 'm' was previously S_UNKNOWN instead of S_TRISTATE.
>
> sym_get_string_value() should not tweak the string because the tristate
> value has already been correctly calculated. There is no reason to
> return the string "n" where its tristate value is mod.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Fixes: 31847b67bec0 ("kconfig: allow use of relations other than (in)equali=
ty")


--=20
Best Regards
Masahiro Yamada

