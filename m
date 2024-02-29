Return-Path: <linux-kbuild+bounces-1082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B086BE9F
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Feb 2024 02:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38ED289875
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Feb 2024 01:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FD32D048;
	Thu, 29 Feb 2024 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4GpLAmJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E526B22F13
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Feb 2024 01:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171869; cv=none; b=Icf+sSUkmAodDiN9DDKlKuluckgtq/orp6WH+Rp3h2Lr/6PGaK8fV+LJjWZf3aVSt1k4cHd3AT6BYsnJwai9AtV/nrXxeG2quRu8Ll5QYQWDgqTmv8NjGuALDj7gYUUP5ImvRHyt6m4XEkWHLlPi56fvucd1D+8lWopItxeoJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171869; c=relaxed/simple;
	bh=uXhNWL2T8nL8G0BwVAMk7eXZ79aAkzaVeGevjlDkEL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJgcItSLK0x184Xtu+ovfhRMMOoavI9ytnRWiyOFKV/QtetzDCGYZijyYBpFCim2D4+RMHc60NeSlQQJewMfZKOAIT/G9GJwysg/+CgVuD+xF2Qi8FNoAAhXgHYCezaCba9vGL5H3hYbDknA91mX0kluh1rkZ9bkQKwtYGsLGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4GpLAmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EB7C43390
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Feb 2024 01:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171868;
	bh=uXhNWL2T8nL8G0BwVAMk7eXZ79aAkzaVeGevjlDkEL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m4GpLAmJnvDhXWEZG0ccw7DxB3cT0TkaiYWffPU/gxH8zoCqBqt/EChUBgAML4Eoy
	 w2iCwMFUlD2Vpd9OK4DS/j4XrNBA0+VDKlJdKUgYg5cmkjKqz4Fyum+AlXPL4cHQSi
	 7nlhx/1UjF6MOLFRgug2yhGVowyhGfNcaVpThPlQixSfq/NPEzTNyuuU+uc0YS8nfR
	 ZFDRYn3OCNX3W2EEwCqssyr1MaM35JLmNv6Jod5HmFu1jpWP89r1tz+TWVuTaeDOZl
	 g88NkisLb85Q35bKlsYejNnsokllLc/SgVCW+xPRyE7dHhdjzIFaKIFpB5gv4LN4W+
	 Ykbw+uWI8R5vQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-512f892500cso263797e87.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2024 17:57:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuOC8dOTk5pVL9OwFYhR3wPOvWTqTFGVvM4sVCxynxpuglcBuFvTHVipu1N/SytWiqX+n2wdb00H40hkoC58fgY6XlcnbrEvHK7sow
X-Gm-Message-State: AOJu0Yw8fEo9b0kqwqInj1Yfj97MaqkPfNvBrgLtVhBX2eUpz2jnNY2C
	O2z1sQVxRjnVAivlE3UG/m//PocYpJnJ5DLmcviqQ11/SE8zTmlM9PP/h6GaXYbFyxY1PBeUlSq
	LxpRfXTFdkJ7IDZKOfC3Zw8Kvilg=
X-Google-Smtp-Source: AGHT+IFfe+mhf8+60dVLeL6s58IN15n1RI4NJNvrmYWTQp5+hoNXu0qL47RmYWt3fimhLNx2y5nXqNB1bAwqv873xg4=
X-Received: by 2002:a05:6512:2824:b0:513:26fd:5c13 with SMTP id
 cf36-20020a056512282400b0051326fd5c13mr21262lfb.52.1709171866925; Wed, 28 Feb
 2024 17:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228060006.13274-1-tfiga@chromium.org> <CZGUX81CR7UB.EUM2N93UUY2H@gmail.com>
In-Reply-To: <CZGUX81CR7UB.EUM2N93UUY2H@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 29 Feb 2024 10:57:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDCq6PCOB2Q=EW+2V3vKDHKxc0vsFQX9hWW51TXGZk4A@mail.gmail.com>
Message-ID: <CAK7LNASDCq6PCOB2Q=EW+2V3vKDHKxc0vsFQX9hWW51TXGZk4A@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: menuconfig: Make hidden options show with
 different color
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 1:36=E2=80=AFAM Matthew Bystrin <dev.mbstr@gmail.co=
m> wrote:
>
> On Wed Feb 28, 2024 at 9:00 AM MSK, Tomasz Figa wrote:
> > When hidden options are toggled on (using 'z'), the number of options
> > on the screen can be overwhelming and may make it hard to distinguish
> > between available and hidden ones. Make them easier to distinguish by
> > displaying the hidden one with a different color (COLOR_YELLOW for colo=
r
> > themes and A_DIM for mono).
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  scripts/kconfig/lxdialog/dialog.h  |  5 +++++
> >  scripts/kconfig/lxdialog/menubox.c | 12 ++++++++----
> >  scripts/kconfig/lxdialog/util.c    | 19 +++++++++++++++++++
> >  scripts/kconfig/mconf.c            | 18 ++++++++++++++++++
> >  4 files changed, 50 insertions(+), 4 deletions(-)
> >
> > Changes from v1:
> > (https://patchwork.kernel.org/project/linux-kbuild/patch/20231228054630=
.3595093-1-tfiga@chromium.org/)
> >  * Replaced A_DIM for color themes with COLOR_YELLOW, because the forme=
r
> >    has no effect to black text on some commonly used terminals, e.g.
> >    gnome-terminal, foot. Reported by Masahiro Yamada and Nicolas Schier=
.
> >    I ended up with COLOR_YELLOW, as it seems to look comparatively dim
> >    with mutliple light and dark color themes in Chromium hterm and
> >    gnome-terminal.
>
> Thanks! Run a quick tests in xterm. Looks neat!
>
> Is there a reason to set hidden flag in all of the _if_ and _switch_ stat=
ements
> in the build_conf() function?  Could similar be done in a more generic wa=
y? For
> example:
>
>         visible =3D menu_is_visible(menu);
>         if (!visible)
>                 item_set_hidden(TRUE);
>
> Or this approach will bring some negative side effects ?
>


I guess he just inserted item_set_hidden() where he saw item_make().


Since build_conf() resources to itself, the code flow
is difficult to track.


You can safely factor it out in some places (for example, just blow),
but that does not make a big difference.



diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index b7e08ec98717..ba0f177121ed 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -546,16 +546,15 @@ static void build_conf(struct menu *menu)
                        }
                        item_set_tag('t');
                        item_set_data(menu);
-                       if (!visible)
-                               item_set_hidden(TRUE);
                } else {
                        item_make("   ");
                        item_set_tag(def_menu ? 't' : ':');
                        item_set_data(menu);
-                       if (!visible)
-                               item_set_hidden(TRUE);
                }

+               if (!visible)
+                       item_set_hidden(TRUE);
+
                item_add_str("%*c%s", indent + 1, ' ', menu_get_prompt(menu=
));
                if (val =3D=3D yes) {
                        if (def_menu) {








--=20
Best Regards
Masahiro Yamada

