Return-Path: <linux-kbuild+bounces-4960-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52899E1998
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82222281265
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EB81E47AF;
	Tue,  3 Dec 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dFb9h3JH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB21E282D
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222512; cv=none; b=dahaKh4HZjdrtW70oUfK9SKTfuFAE6yO1MBoyIBu9LJsVjrTUQKVJp4zuXG5Pp7by0Qs2OR50CP7LDqBcmhN0FFfKL7PfJ6a5oJ7fWJ1FPb3rc3coj66R94PhC5mMqs9ivDJRT83e7yEZ498sSBtvgqu+KuU+YC++0ZJfVlYy88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222512; c=relaxed/simple;
	bh=TL201jFusOcy5kb/oBJhgkR+PepWge4tVHSN2wyf8Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NII5yHIbboyGAMxhIIIKHm35AS5q/maAgR/9vKdKnBr1TD7fO3hx35sJWQdgGmwWlq2qHty+JoTNm3zxuev5p4cvVPX+ULxOTdOjsnFdgi7JXoHeHANSjjzCRzmdIsJInpSmW7yckKTy25KmHQ4hZ8zPrApw3tS7ZwwZoV8qXfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dFb9h3JH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3518188f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 02:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733222509; x=1733827309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxJeAYGiauVydM1R0Kz154ASS522bJT6J3oUKe+lank=;
        b=dFb9h3JHvaB3myquydkcrRLs0T5HZd5arrZpkMFjOsqVya14AsO3zjx1+uqjnbTsUg
         sw9V8uUeY9YX1iejWemPHoiEvp4WyuXpqQahrKr3iO8HVcxMNvLRt56ETwVvZZBq3VFQ
         RNdZjpn483dYKfE7+BTBOomfqz5fF+lGT6SUH6pRUYyBefWMGg4+EMvKxGX9lRB0H91q
         jG+x56/WY75rzK8tGX0tGAFChwzBQSIQbG3EJ4AnuQ5zHyvNsAfctnJ5xR2Actt9oJ4X
         cbH7s3UQGhQt9mX7fw6C1H55JwiDjLb0bXV4kqCyiDaZLv2z9SSHrFKFepIhcf1wmj4X
         cisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222509; x=1733827309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxJeAYGiauVydM1R0Kz154ASS522bJT6J3oUKe+lank=;
        b=xKfP/ARLgiVNfykynmDmXPKakMjbP9UqyGNwIVKSN5xe1WpCQZe3NxzKYxAfs96Tq8
         hhTmeG0MDrK66ukzA9QffBl0F/EeFfGzIHTeO+4uzoCsLKH3C9SsOB7/H0Dq9Y48kcQ+
         ZfTT1V6F/6xvARCYksXC3nJETvwpU8mDa/xVe5FU6whCjyZUdIIbZ4AbxRBAnGKqbgr+
         a4M7tpNmMLJwGVExLWUffiBfd39kDMxC++r4Tdnt5HAWgku9G+8IA9bAeCsMcfZ4wJ0K
         e7yTprlVT4JX1dKzKW8MbGLaf25X4j6MobWROput9DX/mwWRCvTLvJLLFu/J68e/1VAH
         Zn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+HtNkYu3Q0NoO4v6qlHjKmTz7+Th99Z4G1jphQZgVvzjV1vIrnu6F3SSCKujvoVTMJ2BBTVf5oEPwxYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4zzIBcC3z+Z/lgb0lEqLcVpHZsNCeBtBGyVwmd0fzBevTtcE
	NKBjDmdRZ2w78+iWUsIqezTnfElaJuM+ZOGLJvJE8xlUiTDry4mWMae1pIkv77g=
X-Gm-Gg: ASbGncsW/QAIPlGsCy4B6VqOKomGPBa3FkfQDxc733k6oCkkvbcjYAcBB9T8DfgnxOD
	9TrRad3p29YsU4vEhP3YJUlWBPHjBz9TH5RH01cqjf8Pt41bE2+xi5nPxICI7ugQ42Ria+xpoTp
	1Mi5fmJC1UHhIjVH8Zpb6LBcz1omMe6K8t/XiRJF94FWXU+WLnwwWSfg2gXy0fbySGHFwF0tsuc
	FlxGlF3n82VgXpfN/D1JQl0ZXl5lBE/xg48B5U8w/sA00GZihWVgWY40O8aASrxdHQZZe3NPgdc
	VMjEu3A18qmbhh+NzAoYLlxRadrqYr3wWpnnU7Q=
X-Google-Smtp-Source: AGHT+IG64oQCz/84e8PsqauFcMscYG95zcLiCF2ACFPX3k65Vz0ntaCz6G4h+yVvzy6py/Ra6LlvjQ==
X-Received: by 2002:a5d:5f8c:0:b0:385:e1eb:a7be with SMTP id ffacd0b85a97d-385fd3ee55emr1744273f8f.26.1733222508710;
        Tue, 03 Dec 2024 02:41:48 -0800 (PST)
Received: from localhost (p200300f65f242d005bbc9b581c6b9666.dip0.t-ipconnect.de. [2003:f6:5f24:2d00:5bbc:9b58:1c6b:9666])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a71bsm15004422f8f.55.2024.12.03.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 02:41:48 -0800 (PST)
Date: Tue, 3 Dec 2024 11:41:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Matthias Maennich <maennich@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] module: Convert default symbol namespace to string
 literal
Message-ID: <p6zlyv5lxec4xtefp4h6vukbyvxy4l4tcrdnhorezooruzm7vg@vobe4dltqrsl>
References: <20241203102124.3147478-1-masahiroy@kernel.org>
 <20241203102124.3147478-4-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyk7eawi2ea2ef73"
Content-Disposition: inline
In-Reply-To: <20241203102124.3147478-4-masahiroy@kernel.org>


--pyk7eawi2ea2ef73
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] module: Convert default symbol namespace to string
 literal
MIME-Version: 1.0

Hello Masahiro,

On Tue, Dec 03, 2024 at 07:21:07PM +0900, Masahiro Yamada wrote:
> Commit cdd30ebb1b9f ("module: Convert symbol namespace to string
> literal") only converted MODULE_IMPORT_NS() and EXPORT_SYMBOL_NS(),
> leaving DEFAULT_SYMBOL_NAMESPACE as a macro expansion.
>=20
> This commit converts DEFAULT_SYMBOL_NAMESPACE in the same way to
> avoid annoyance for the default namespace as well.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

You were quicker than me, I'm still in the build test phase of a very
similar patch.

> diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation=
/core-api/symbol-namespaces.rst
> index 55886b4e6aea..27a9cccc792c 100644
> --- a/Documentation/core-api/symbol-namespaces.rst
> +++ b/Documentation/core-api/symbol-namespaces.rst
> @@ -68,7 +68,7 @@ is to define the default namespace in the ``Makefile`` =
of the subsystem. E.g. to
>  export all symbols defined in usb-common into the namespace USB_COMMON, =
add a

I added quotes around USB_COMMON here --------------------------^, too
(and in the translated variants).

>  line like this to drivers/usb/common/Makefile::
> =20
> -	ccflags-y +=3D -DDEFAULT_SYMBOL_NAMESPACE=3DUSB_COMMON
> +	ccflags-y +=3D -DDEFAULT_SYMBOL_NAMESPACE=3D'"USB_COMMON"'

And I used

	-DDEFAULT_SYMBOL_NAMESPACE=3D\"USB_COMMON\"

which is probably just subjective.

Independant of the above:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--pyk7eawi2ea2ef73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdO4GUACgkQj4D7WH0S
/k6cBggAomnw1kjeWjGMN3MfcMu9qSplcZJNjMCKl7ETxATWJi5sVLWu4fpFpIPC
OwyhxBY31V8gC6w1+G6LzKtKTrRPYYE/kkz5vRLK6v0A0UPqe3h3jQQaQ9WewA56
mWoltZVXP5lwEVGAmoa6xzMZhIFD1xVmNOhHB03go+bGsd2LYLAIJO+BOtoOwYI7
Y163RyvQzioy55jpxgTPCW1aJl+O35lq/auq5gVFhx4B+YYnScXyOY0s07RbhkUZ
v7HamSmAnrpgVvPHKqxNzbc/Skd8SzuOsVOseNlmBrQHdJQPRPy08Fniv/+OnubF
a5DSvqJKCKS1q4i4VebzotzABF7ecg==
=qkJ1
-----END PGP SIGNATURE-----

--pyk7eawi2ea2ef73--

