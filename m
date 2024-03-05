Return-Path: <linux-kbuild+bounces-1158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A687173E
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 08:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D548B22108
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 07:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839537E797;
	Tue,  5 Mar 2024 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VlXnkEQx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C87F7EF17
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709624875; cv=none; b=MmeWk33iIMQPst9P/5UqOScvIkqv/BFgcbyUqZCr1YG2XfmzR1s0JsQybUo0hqw22AS2Tzn9Om2b4srqFRGa8paALSv3nPhP8IpwATFbArv61fvcMLr9q8/T04UqUlidckf1S9EAZtO2017R85QSgt1FRNT6XgYBb2u8PAx2+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709624875; c=relaxed/simple;
	bh=aB0XHaiTDyHrnaivcfyZhLLHgPhVa+avcwTvwIOXbyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icq6sIu82Vt0Mx6nk+l3CUhXTWNrfEe53o9nKxXpocywbD801sMq1+79WuDFhlzJxV39yl7FS0rlVL35U/UZEBZ384hLs5mWIxibAVZX0tbcoWFQ/p5csmgnoM1aMjXtcUiLlCssKYDAvnkD3cstZPP3sb96oRgavXJixOAMgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VlXnkEQx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a45aa7cb2b3so28961566b.3
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2024 23:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709624871; x=1710229671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETqSTrw+MB27WJWkFkmSpGFRuQ0HFijBgJsrmdL6EXI=;
        b=VlXnkEQx7AZG82bVlue0V6SFmZRZ7HaptMGCu812vluRYLU0yKC+8iIhBXYgdDCHqy
         HqaK47uPYSOu21MngyxsOTMpygs+e1XN7qZymv2eDhGE7zxTpzPWXyi2Uj75ytRW5Ku6
         f3jmSs0l5NUFqtrUpIby9mumafeVqNOfshOxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624871; x=1710229671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETqSTrw+MB27WJWkFkmSpGFRuQ0HFijBgJsrmdL6EXI=;
        b=C0+MC0gX/YlMgfk0fj+6r92d721L4OcQAgAyF0ycez2ktJW3cv5MqNJNlVmo+r4kt1
         UmUVtCK07fgi+VDBmQXRZKFJfCLc6dQ5AWidpFGWx7+yCozIYSkXJhz1EnOjoPkLNVnY
         BIv/Xsy7JuQAIK2wmhkWQvf5AYMrbgvBMeS4uZvmCHomZN6u5fNE+j+3JAhWTgeTVcH+
         IABNBVg14o8CKK55yudf8RL85Y8FURK2lVy3oOrcY69ZRGAEnGVJGuBxPTh3rPaklTZo
         XNVvMSl1Eh3nT6C3n6AhiCnLVtVSNbNdS66qGSyMChFUnTJ4m9KdNK8bkNztAwYR3uqT
         KAvg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/IKlosrKcA4KBws2uQs8GoYuQCfS0AjdSSZXfBb0E6pB5AlUED/uwoPQyxYmYSlXNXu0uAfiDk+QU8h2aPEUEzpaEkDsd954d59g
X-Gm-Message-State: AOJu0YyAPQ3psiNptekt9BYTtlY7F+yFgu0p5L0qiNBSs36WQ7eL9RlV
	FPNZt+Tty9QgcMkmuCIOtDvgbrL8KoyEKJyakos3TR59ppDLx3gdbRF6/fuu46VjpzgZbGrYzhc
	=
X-Google-Smtp-Source: AGHT+IE9qpbtT4R10z9mnvf+DcGm6S88f37+Yvm9kkU3hQS4+QWEUZYnrhypfnOtWnjof97gVvW9WA==
X-Received: by 2002:a17:906:1cd4:b0:a44:1cb4:f496 with SMTP id i20-20020a1709061cd400b00a441cb4f496mr6769786ejh.75.1709624871439;
        Mon, 04 Mar 2024 23:47:51 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id s23-20020a170906a19700b00a44899a44ddsm4745820ejy.11.2024.03.04.23.47.50
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:47:50 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33d28468666so3584559f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2024 23:47:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJKas1X8yyUvERPRMkNP53Bf1f4Qeo3NWbqnGVq92bNq6KOiqaMWHmbu8+gWAIMWFowXWb/uxsqDsoQ3ihPyRfZgNwfnxMBUIf8X00
X-Received: by 2002:a5d:668f:0:b0:33d:c2cb:c18d with SMTP id
 l15-20020a5d668f000000b0033dc2cbc18dmr8834609wru.32.1709624870321; Mon, 04
 Mar 2024 23:47:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228060006.13274-1-tfiga@chromium.org> <CZGUX81CR7UB.EUM2N93UUY2H@gmail.com>
 <CAK7LNASDCq6PCOB2Q=EW+2V3vKDHKxc0vsFQX9hWW51TXGZk4A@mail.gmail.com>
In-Reply-To: <CAK7LNASDCq6PCOB2Q=EW+2V3vKDHKxc0vsFQX9hWW51TXGZk4A@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 5 Mar 2024 16:47:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CJ0K4MPgeaeVRvPZYFYTBADidS+MDUi6EmWKNpWxz2Eg@mail.gmail.com>
Message-ID: <CAAFQd5CJ0K4MPgeaeVRvPZYFYTBADidS+MDUi6EmWKNpWxz2Eg@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: menuconfig: Make hidden options show with
 different color
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 10:57=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Thu, Feb 29, 2024 at 1:36=E2=80=AFAM Matthew Bystrin <dev.mbstr@gmail.=
com> wrote:
> >
> > On Wed Feb 28, 2024 at 9:00 AM MSK, Tomasz Figa wrote:
> > > When hidden options are toggled on (using 'z'), the number of options
> > > on the screen can be overwhelming and may make it hard to distinguish
> > > between available and hidden ones. Make them easier to distinguish by
> > > displaying the hidden one with a different color (COLOR_YELLOW for co=
lor
> > > themes and A_DIM for mono).
> > >
> > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > ---
> > >  scripts/kconfig/lxdialog/dialog.h  |  5 +++++
> > >  scripts/kconfig/lxdialog/menubox.c | 12 ++++++++----
> > >  scripts/kconfig/lxdialog/util.c    | 19 +++++++++++++++++++
> > >  scripts/kconfig/mconf.c            | 18 ++++++++++++++++++
> > >  4 files changed, 50 insertions(+), 4 deletions(-)
> > >
> > > Changes from v1:
> > > (https://patchwork.kernel.org/project/linux-kbuild/patch/202312280546=
30.3595093-1-tfiga@chromium.org/)
> > >  * Replaced A_DIM for color themes with COLOR_YELLOW, because the for=
mer
> > >    has no effect to black text on some commonly used terminals, e.g.
> > >    gnome-terminal, foot. Reported by Masahiro Yamada and Nicolas Schi=
er.
> > >    I ended up with COLOR_YELLOW, as it seems to look comparatively di=
m
> > >    with mutliple light and dark color themes in Chromium hterm and
> > >    gnome-terminal.
> >
> > Thanks! Run a quick tests in xterm. Looks neat!
> >
> > Is there a reason to set hidden flag in all of the _if_ and _switch_ st=
atements
> > in the build_conf() function?  Could similar be done in a more generic =
way? For
> > example:
> >
> >         visible =3D menu_is_visible(menu);
> >         if (!visible)
> >                 item_set_hidden(TRUE);
> >
> > Or this approach will bring some negative side effects ?
> >
>
>
> I guess he just inserted item_set_hidden() where he saw item_make().
>
>
> Since build_conf() resources to itself, the code flow
> is difficult to track.
>
>
> You can safely factor it out in some places (for example, just blow),
> but that does not make a big difference.
>
>
>
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index b7e08ec98717..ba0f177121ed 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -546,16 +546,15 @@ static void build_conf(struct menu *menu)
>                         }
>                         item_set_tag('t');
>                         item_set_data(menu);
> -                       if (!visible)
> -                               item_set_hidden(TRUE);
>                 } else {
>                         item_make("   ");
>                         item_set_tag(def_menu ? 't' : ':');
>                         item_set_data(menu);
> -                       if (!visible)
> -                               item_set_hidden(TRUE);

I wanted to be consistent with the current code, which already has the
same item_set_data(menu) in both branches. I'm okay with either. Do
you want me to resend with this change?

Best regards,
Tomasz

>                 }
>
> +               if (!visible)
> +                       item_set_hidden(TRUE);
> +
>                 item_add_str("%*c%s", indent + 1, ' ', menu_get_prompt(me=
nu));
>                 if (val =3D=3D yes) {
>                         if (def_menu) {
>
>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

