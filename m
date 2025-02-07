Return-Path: <linux-kbuild+bounces-5664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DEA2CA98
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14BF3A8905
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 17:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3270E198A19;
	Fri,  7 Feb 2025 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icKPAsOr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB6175D5D;
	Fri,  7 Feb 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951020; cv=none; b=UlMCQ5Hd3s7cVz2ZDxOr+JIkFjC42irJe3uxiq+qoXBpHMVEaRKjs/01Vfdzu8ayb/zVbf7mv3K6/oFNQxgdWnuCmgnJ3p1DmkuRMoHddAwP4EwwK+WCaVrLolJ8Rk37YViYOU0y5fWjz131AhJbRsDSIAa8Ci6SYPybvkueVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951020; c=relaxed/simple;
	bh=/CRmU47qBUXyWSoahHnGiQo1Gh5hufSUGDC76WwudzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jztN0/ajabi9BjVLYiGJFRWP99ONnXdM6ugVLV6qmoCINtsIUZlIi8jf5F3gF3y6I+zupqlci+pTeKiJk/H/o1bhPDveLqQRrr9qh3jKw15lQDw51LVWKpLhBVVXftpoOQl1QO3o2LoonMVYb5b0YJ10L4gFgNEZI87tonQsueU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icKPAsOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20FCC4CEE7;
	Fri,  7 Feb 2025 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738951019;
	bh=/CRmU47qBUXyWSoahHnGiQo1Gh5hufSUGDC76WwudzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=icKPAsOryE5yUn1OdcnElBDtixzasxxfRyZxl5K4pbf7ipD0Ea8QDnwM9EegS+ECG
	 SXv4DRcBN4fXLyxY0uvRKVRisinIuqw0McHUsPYjGS34esdmeohTqPr8YsVajQeFRw
	 IYNqlns6rYh7Y/QqfCgXa75U+I8NDdW7i3TSsD9f/rFMKfcoN06ZzzodVzW6dinR5G
	 TY0MwxDB5/l2IX3u6eFR54EkYFg8rM0+y6B3fTQRz1NR4sNkQm2SuNHtnIjf7Wzt5B
	 JI6zu7gCUhKyJhVckn7l5M0w1rTzE96XmUt1pVXvITCMFXtBy5TqQQBFjVHnkx0sNk
	 U0ury35OO3fKw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439e331cceso2756276e87.1;
        Fri, 07 Feb 2025 09:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTVftUPYFjFLWua4FkGJHuVen7e0oid6L3KHljI09A+dd6eo0UOLNQ2fkXsbto91T1L46jgZ/s5Lc9fKs=@vger.kernel.org, AJvYcCWG0P8yd4zoidGQ5QxVtz02YrWNQVtmNKX8m8Ma3iG1RCpZK4Y+0AcdsMczVJDP2XfWLnJ2RURIB72CO/qY@vger.kernel.org, AJvYcCWLNsL7hbSfKYuNFTAhqfzOKsQ8uIYnTPp51IKQ00TCTnN/CYzARcuZQaOuvinIZDoUSexSLr0VqeQSnxI9JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWtuy8zZOFcl8G54C9F3cHGnjYUGMK3iAhuNVOHWopjxwF9WP
	qej4gEb+tgt3clwF1C0CQE6yw66/DBjprM1Dtdyfg5e6yQ5buNKGlpzN3O9mMGLrDAs9ZvB5Hsv
	/ucnsXHFKcuojOffz4mtQRH/ZRuY=
X-Google-Smtp-Source: AGHT+IHwjdwtFZ+zisuBvM13DLarDF6ZcKsOicNPr/5NRq0RpmjPPZ+MC0Q5FJl5Quf/K9jXHq68OLsQA/TrjJaaMV4=
X-Received: by 2002:a05:6512:745:b0:540:2201:57d2 with SMTP id
 2adb3069b0e04-54414ae6406mr1132896e87.49.1738951018503; Fri, 07 Feb 2025
 09:56:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.270511329@infradead.org>
In-Reply-To: <20241202150810.270511329@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2025 02:56:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3gG61cyP0cRKXbCogcu9JwuNPHWcYvRQhJDQbx-PyUg@mail.gmail.com>
X-Gm-Features: AWEUYZkdnXJ8vXWq0iGmffzxhPa06o4t_vek2BGUPhIQQ7X-0n-QgZSyDJZhqyI
Message-ID: <CAK7LNAQ3gG61cyP0cRKXbCogcu9JwuNPHWcYvRQhJDQbx-PyUg@mail.gmail.com>
Subject: Re: [PATCH -v2 3/7] module/modpost: Add basename helper
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 12:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:


I do not think you need this helper (at least in your purpose).

You will use this helper in the 4/7 patch.
Then, you will immediately revert it in the 5/7 patch.

If you look at the final result, you did not need to add
mod_basename() in the first place.
(There is just one call site, which does not save any
duplicated code).

I suggest adding verify_module_namespace() in the 4/7 patch
instead of using the helper.


BTW, I think this helper is useful for cleaning up the current code,
but you are not even aware that this common pattern appears multiple times.

https://lore.kernel.org/all/20250207175024.412054-1-masahiroy@kernel.org/T/=
#u



>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  scripts/mod/modpost.c |   16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1553,6 +1553,16 @@ static void mod_set_crcs(struct module *
>         free(buf);
>  }
>
> +static const char *mod_basename(const char *modname)
> +{
> +       const char *basename =3D strrchr(modname, '/');
> +       if (basename)
> +               basename++;
> +       else
> +               basename =3D modname;
> +       return basename;
> +}
> +
>  static void read_symbols(const char *modname)
>  {
>         const char *symname;
> @@ -1697,11 +1707,7 @@ static void check_exports(struct module
>                 s->crc_valid =3D exp->crc_valid;
>                 s->crc =3D exp->crc;
>
> -               basename =3D strrchr(mod->name, '/');
> -               if (basename)
> -                       basename++;
> -               else
> -                       basename =3D mod->name;
> +               basename =3D mod_basename(mod->name);
>
>                 if (!contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
>                         modpost_log(!allow_missing_ns_imports,
>
>


--
Best Regards


Masahiro Yamada

