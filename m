Return-Path: <linux-kbuild+bounces-7770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3FAED338
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A4527A728F
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F12946F;
	Mon, 30 Jun 2025 04:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSaC0A23"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408519F40B;
	Mon, 30 Jun 2025 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256905; cv=none; b=LeXRhcR4X+bHNl/0AJvJD08WBcu3QSr43gdwV3Bjt6yJTWZ0mm0XN6Fau5DxX0hdV+nz5coeEqXNnCkHqgbY2qgCJK6gbFSfGawGI0KHnYDJG+U25RjHvu49XPQC85/iA4zV8pd2SXUgzH7XnF0AbS8cL/ZcOOAMnJIQTAdwrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256905; c=relaxed/simple;
	bh=ksHujzIsG45SR9mQJCwAuEpXX1rmjkNjq4lBJXuTJT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzeygCQPD74BdxxHkCzalWBbW+WfMhjrpO+Md2zHR60AFcGULaVwPc8iV5pbPZioGxmgDHOuM5Xcs0dmhkGtA2zF4BFl4hGFI3pbIFGPgalEYAb9EBuXAM/X4gsLgjtQfYcwqyMV107xwonPVFCV2Oy5n4qplc7W3DJzRoGg1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSaC0A23; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD133C4CEE3;
	Mon, 30 Jun 2025 04:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751256904;
	bh=ksHujzIsG45SR9mQJCwAuEpXX1rmjkNjq4lBJXuTJT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gSaC0A23xjllUB+MWjNprj6jj8GySCY6y7zgxMuUCB6WeuF1Io6e/iH5jfx6tC0VN
	 Ozg0vdnx9SU11Tg8SXrfGWoY8Ot1Aj1fqibpNzbm3e9IzPiOVTdlRk82ibdgxcEY1h
	 ZEiw5GTZJNq++98zjgh7+/CbZVaeZCJEBfSYCDJHKdOHtE6EsHjSa233uwt8RGP1x7
	 9rI0+07ev1MH09iYUHWse32j3jI/cgrT7kam4c983RhOV1eRocT96EQLkzPXBITeEP
	 d8Vl5rdRuqTZe2gzRZRFDOWyDSBaUCvJ1wnsOd1/OmA4tUlB1gQtHYu6y6jgyTuAJv
	 v6s3DHmX2Aakw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b561a861fso34895141fa.0;
        Sun, 29 Jun 2025 21:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXndayi8VLCzh4eWoaiYiryfV4pwMYdnEUJiUVUJ1tDKd23Zm0xZzqpm/T100FPDHP3K3nIf7fnB21ZaRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUk7Z+Xjsgg3CsM42XCJ7maBsAtFV7/OwlesOl6NMXqnuh+GA
	2qTsAdrvGj9McW8Rmnyv4a0n9Jg2O4ol18cynittnOpw56J+OQXt1/ZSjhlmQAe9HF1x4be3HrF
	EXJTeGeVWHf7ckMQ9qwOQSfBa/CrCD8c=
X-Google-Smtp-Source: AGHT+IGnizFGab0t/yh8IhiMrrIZ+jVKG5jqVQ+oAMqoUeG2qKoL8ik3NYuq/52Xx4kEu9I2iqgKplbfIbSYxh/8D+E=
X-Received: by 2002:a05:6512:124d:b0:545:225d:6463 with SMTP id
 2adb3069b0e04-5550ba20d37mr4066163e87.42.1751256903516; Sun, 29 Jun 2025
 21:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-31-masahiroy@kernel.org> <c6033a11-82ae-49a9-aec1-ac820b9ce6ee@infradead.org>
In-Reply-To: <c6033a11-82ae-49a9-aec1-ac820b9ce6ee@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 13:14:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyr7xtjhVTV=Rs4WqbP6YQN90Xbb5N=snEyjdXqUGDBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzatm_8AbvWdx_kXr-Pi5SVEmybAROKsq5GbjFiNA7h5boDvplckaezL8o
Message-ID: <CAK7LNARyr7xtjhVTV=Rs4WqbP6YQN90Xbb5N=snEyjdXqUGDBQ@mail.gmail.com>
Subject: Re: [PATCH 30/66] kconfig: gconf: remove glade_xml_signal_autoconnect()
 call
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:58=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> > Now that all signals are connected manually, this is no longer
> > unnecessary.
>
> Double negative. Or is that what you meant?
>
> is no longer necessary.
> is now unnecessary.


is no longer necessary.

I will fix it. Thanks.






> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/kconfig/gconf.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> > index 02bbb7ce4c4a..09537245213a 100644
> > --- a/scripts/kconfig/gconf.c
> > +++ b/scripts/kconfig/gconf.c
> > @@ -1120,7 +1120,6 @@ static void init_main_window(const gchar *glade_f=
ile)
> >       xml =3D glade_xml_new(glade_file, "window1", NULL);
> >       if (!xml)
> >               g_error("GUI loading failed !\n");
> > -     glade_xml_signal_autoconnect(xml);
> >
> >       main_wnd =3D glade_xml_get_widget(xml, "window1");
> >       g_signal_connect(main_wnd, "destroy",
>
> --
> ~Randy
>
>


--=20
Best Regards
Masahiro Yamada

