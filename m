Return-Path: <linux-kbuild+bounces-1171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D0C872149
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 15:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443421F22CBE
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 14:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92FD85C62;
	Tue,  5 Mar 2024 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztl2Bx+2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1155E59
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709648139; cv=none; b=IMntAokZRBsHMj+jMA9XSeYCdkYERhkRRhcp+3Kn8TuICFGhK3ZWOuyZAo+k+e2E3QTgllpICVoJWEuo2xtIqRajCuccIQlhywAUDiPMd/m9iO1+U15whUk8m6dzO0yLSs54NK8+d+444JUKnmpqlhSxVIiDCM+DR2ilLf6S11M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709648139; c=relaxed/simple;
	bh=QN6RmPhI2Bk1mW2OjQAqwmIdAPYSK8IJQXbD+jI7kEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqNhK0X0HxGcZzLGCpWwYZu/C/3UpRtgIMq+xTEQd2e9X6uM0/OF8aap2Aw0Hw65yt+580lYJwbnAzo0/VRZ4qiGD4U304VNDz17/Nta5KB9LXmSFetLs9KIk4lUTIe/g720enKOmwt9ngNHyTtjciN+zFOH3Rn3uITWPJ9jk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztl2Bx+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B95DC433C7
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709648139;
	bh=QN6RmPhI2Bk1mW2OjQAqwmIdAPYSK8IJQXbD+jI7kEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ztl2Bx+2zORbybB44HHhQYlTA1j+Se5wYxf8zXaU3g6LUJC36twZLTu8d7TIeE6DZ
	 IgloZktDxhVcwgni1phpPiuhPKwkI9waCriQJG/l3WeABj7Sj1bkQwcRp3/WbMciHm
	 RtEZr05PWmbOEA4W3vs3cv2SE+e0m9FbpgR5RPfPIzuMqSWzV9UkS8DQrQi5c0LNQk
	 zNpWP/UcnjIMeoxYrZeDsa0UqZPekJduwys8KMQH3aXH+ORcscwv6Uk38164cmpA+s
	 PeyfDk4QZQl+yMaNE1XGaUV3YTL079gEq4bcVFU990jqo8HLnlf+BSow1AiLedFxd3
	 siPzu1XjSU8MQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5131c0691feso7332643e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Mar 2024 06:15:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJfhi6NigDB8J0LJUifnAPjWpbhQ/2GWB3kBU9OR7LelIT7p0OqR/suR+qQjC18z5qVE3dBhruVejj2agMHDaYpGG9kvm8ZmFH+X2n
X-Gm-Message-State: AOJu0YzU9a3/fcuhoICXSjyA4yl/ZjBmXpGNFv6IjQauSVUnXNN39cUC
	dhFt0Zwv48vzHmWt7y9wgls/MOep2fz5GQdYNCVE6CYesMSd45dbf8lACMTKrp2oZryuEEHmBil
	1jm2LM0ULTYsss6x0EEemjKXwogU=
X-Google-Smtp-Source: AGHT+IGGdjj0FFhKP5EOeNsAvKO5BF1Wd7K0RwrkjljZrop1EvFRh47bn4NStgPdSHicKWKlFA0eoVpI79XMPDyO35s=
X-Received: by 2002:ac2:511b:0:b0:513:13a4:95e4 with SMTP id
 q27-20020ac2511b000000b0051313a495e4mr1364827lfb.36.1709648137822; Tue, 05
 Mar 2024 06:15:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228060006.13274-1-tfiga@chromium.org> <CZGUX81CR7UB.EUM2N93UUY2H@gmail.com>
 <CAK7LNASDCq6PCOB2Q=EW+2V3vKDHKxc0vsFQX9hWW51TXGZk4A@mail.gmail.com> <CAAFQd5CJ0K4MPgeaeVRvPZYFYTBADidS+MDUi6EmWKNpWxz2Eg@mail.gmail.com>
In-Reply-To: <CAAFQd5CJ0K4MPgeaeVRvPZYFYTBADidS+MDUi6EmWKNpWxz2Eg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 5 Mar 2024 23:15:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS1x577a26yUivDomvaioxKTXyKWw-aRuyZYjCom1OwmA@mail.gmail.com>
Message-ID: <CAK7LNAS1x577a26yUivDomvaioxKTXyKWw-aRuyZYjCom1OwmA@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: menuconfig: Make hidden options show with
 different color
To: Tomasz Figa <tfiga@chromium.org>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 4:47=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wro=
te:
>
> On Thu, Feb 29, 2024 at 10:57=E2=80=AFAM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > On Thu, Feb 29, 2024 at 1:36=E2=80=AFAM Matthew Bystrin <dev.mbstr@gmai=
l.com> wrote:
> > >
> > > On Wed Feb 28, 2024 at 9:00 AM MSK, Tomasz Figa wrote:
> > > > When hidden options are toggled on (using 'z'), the number of optio=
ns
> > > > on the screen can be overwhelming and may make it hard to distingui=
sh
> > > > between available and hidden ones. Make them easier to distinguish =
by
> > > > displaying the hidden one with a different color (COLOR_YELLOW for =
color
> > > > themes and A_DIM for mono).
> > > >
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > ---
> > > >  scripts/kconfig/lxdialog/dialog.h  |  5 +++++
> > > >  scripts/kconfig/lxdialog/menubox.c | 12 ++++++++----
> > > >  scripts/kconfig/lxdialog/util.c    | 19 +++++++++++++++++++
> > > >  scripts/kconfig/mconf.c            | 18 ++++++++++++++++++
> > > >  4 files changed, 50 insertions(+), 4 deletions(-)
> > > >
> > > > Changes from v1:
> > > > (https://patchwork.kernel.org/project/linux-kbuild/patch/2023122805=
4630.3595093-1-tfiga@chromium.org/)
> > > >  * Replaced A_DIM for color themes with COLOR_YELLOW, because the f=
ormer
> > > >    has no effect to black text on some commonly used terminals, e.g=
.
> > > >    gnome-terminal, foot. Reported by Masahiro Yamada and Nicolas Sc=
hier.
> > > >    I ended up with COLOR_YELLOW, as it seems to look comparatively =
dim
> > > >    with mutliple light and dark color themes in Chromium hterm and
> > > >    gnome-terminal.
> > >
> > > Thanks! Run a quick tests in xterm. Looks neat!
> > >
> > > Is there a reason to set hidden flag in all of the _if_ and _switch_ =
statements
> > > in the build_conf() function?  Could similar be done in a more generi=
c way? For
> > > example:
> > >
> > >         visible =3D menu_is_visible(menu);
> > >         if (!visible)
> > >                 item_set_hidden(TRUE);
> > >
> > > Or this approach will bring some negative side effects ?
> > >
> >
> >
> > I guess he just inserted item_set_hidden() where he saw item_make().
> >
> >
> > Since build_conf() resources to itself, the code flow
> > is difficult to track.
> >
> >
> > You can safely factor it out in some places (for example, just blow),
> > but that does not make a big difference.
> >
> >
> >
> > diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> > index b7e08ec98717..ba0f177121ed 100644
> > --- a/scripts/kconfig/mconf.c
> > +++ b/scripts/kconfig/mconf.c
> > @@ -546,16 +546,15 @@ static void build_conf(struct menu *menu)
> >                         }
> >                         item_set_tag('t');
> >                         item_set_data(menu);
> > -                       if (!visible)
> > -                               item_set_hidden(TRUE);
> >                 } else {
> >                         item_make("   ");
> >                         item_set_tag(def_menu ? 't' : ':');
> >                         item_set_data(menu);
> > -                       if (!visible)
> > -                               item_set_hidden(TRUE);
>
> I wanted to be consistent with the current code, which already has the
> same item_set_data(menu) in both branches. I'm okay with either. Do
> you want me to resend with this change?



I am fine with either way.
I thought build_conf() was messy,
but it is not a problem with your patch.



Talking about the code consistency, what about this suggestion?

https://lore.kernel.org/linux-kbuild/CAAFQd5AOvUtHOOU-OKQKJwyJGXSt6EopcMBsH=
Wz83n_0XfnOjA@mail.gmail.com/T/#med19d030bf8167637964b58da0f5b86b18fe3f5e


In line 26, A_DIM is directly assigned.

   dlg.button_inactive.atr =3D A_DIM;



If you verbosely add 'A_NORMAL |',
the other line should look like this:


   dlg.item_hidden_selected.atr =3D A_NORMAL | A_REVERSE | A_DIM;


And, we need to insert 'A_NORMAL |'
to every assignment.



If you agree with me, you can offer to modify the patch locally.








--=20
Best Regards
Masahiro Yamada

