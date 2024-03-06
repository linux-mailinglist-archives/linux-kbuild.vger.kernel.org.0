Return-Path: <linux-kbuild+bounces-1185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E489872FC4
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Mar 2024 08:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81D241C214EE
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Mar 2024 07:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0882117BCC;
	Wed,  6 Mar 2024 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ObHd7zz4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20488DDA8
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Mar 2024 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709710534; cv=none; b=Nc7rNqT8fRo1c+1C6p5nuQBUBlnZv5uG+MxkqUgD5O6kwhybbGN/c54dfmbGj0s3Bw4mqNytZ+SSlKki+DdX94YJEgIRhlz7CQ4/82B1VbfYrBjPhuGq0pVXuHHLUB6uzhElnxUGILhkwkHAn3AD1mUP4F8/gQl95NBdOP1Zk4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709710534; c=relaxed/simple;
	bh=JPmt+tjw9v3rkjCVhXonHHSDRnkTBwkz0t3oxuNzAm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBI6y2I02cSJHuG7aDCHaqQ8vBNqT9DtS7oXwCbJlsGrS9S3e+av9UxYYeHQ1fzStSaolscBm1QYCyIearcucy8wU38u7JQdMfMHQlJIU7j7ihsCikNv6OwWbSxi9MGDESnfxEVzB4CRdLt8t71x4jSKOuafQvLvUm75Kdal2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ObHd7zz4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5672afabb86so3308540a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Mar 2024 23:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709710531; x=1710315331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2wRuVSdLbgs+mdhSoX5dLknFkbTwWJr5HT+J17n1i8=;
        b=ObHd7zz481+6ch15zhNB/WqfpxouViGURoE5QzgHIbVNbucd00SlIsHnpKkVTr6qXL
         9O0xmxn8Qv+bhQanh7dVNT4K01fAjrarwb8xg9g9cm1bBa6VwKaNAtwE9PCV6D1FQu+8
         2v2LKzOm80tf3HUx8L0O+usLSy/HAzP1SZBL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709710531; x=1710315331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2wRuVSdLbgs+mdhSoX5dLknFkbTwWJr5HT+J17n1i8=;
        b=WViuJ5xqV08XhNOMCwMDKxNtEDBW3ng9cGcPJu2NIt4wti+yfqAqo8E7jy/wf7NM6w
         maPXqjsOIeUWvKP5gjya5lFzhbO8HrRc+BvVnmRuPVNpppI22mQ7irjGuvPD4I32sKdP
         0mnuEKnHfFVbjnG+4nUUbC0qYE2HdaEV1x38tR3JaAVTrBl7XZG8UBoawMboJ0H6dC69
         4tdwvge3hKkyzx4YGVeuNglyTJBWhNhZXnSW9heD66WpjkB3TMVM2HaquVJ3BIvPFYgJ
         yYqsfc9JX7hyd7ETbeMD8d2o2JnNJSpPcJDkj4OETxl/b1pI56bLY5NPcei1AewVhGex
         mmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD6FX5YCWG4Grei+3xbnr1a75MvFT2hQxWi5pTvghfhsO6KuE+8crFeBf2UKVAG24HhY5dZPB6zshrovMs1k9vNvXJTRI4EQZ578mc
X-Gm-Message-State: AOJu0YxISl6PARNHzQCPjD7kSy9keLbQOBlokulyStT9ony8ztpGHhYQ
	awfZwosFqnxd3z1CPCWUy3P5wRJwgb/wnFTR3CdnbI82Q7zGU3e1Gsj1VlfP8FyTEWj7NSDe4Dc
	jvg==
X-Google-Smtp-Source: AGHT+IHsAMvk5oWQ57ctyzu2xXd97peeleUKWYOw8FOxSXfORX2qU0KpTaI2imPJzu8ELsIjktg55A==
X-Received: by 2002:a17:906:66c2:b0:a45:bcaa:979c with SMTP id k2-20020a17090666c200b00a45bcaa979cmr399350ejp.75.1709710530901;
        Tue, 05 Mar 2024 23:35:30 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id an19-20020a17090656d300b00a4536b32ae0sm3347637ejc.30.2024.03.05.23.35.29
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 23:35:30 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412f5e905e2so2273615e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Mar 2024 23:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQLimCKOiC1L55SfFBD/6FVTvjJ5uhTQYlWAq+iCSO6CZnXTgtBJGCk+Ulm4ORA8FUUxb3thxO/M240ncVPinnrUcgwxvw1hDSIcnF
X-Received: by 2002:a05:6000:1751:b0:33e:3462:f6d6 with SMTP id
 m17-20020a056000175100b0033e3462f6d6mr5590695wrf.64.1709710529468; Tue, 05
 Mar 2024 23:35:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228060006.13274-1-tfiga@chromium.org> <CZGUX81CR7UB.EUM2N93UUY2H@gmail.com>
 <CAK7LNASDCq6PCOB2Q=EW+2V3vKDHKxc0vsFQX9hWW51TXGZk4A@mail.gmail.com>
 <CAAFQd5CJ0K4MPgeaeVRvPZYFYTBADidS+MDUi6EmWKNpWxz2Eg@mail.gmail.com> <CAK7LNAS1x577a26yUivDomvaioxKTXyKWw-aRuyZYjCom1OwmA@mail.gmail.com>
In-Reply-To: <CAK7LNAS1x577a26yUivDomvaioxKTXyKWw-aRuyZYjCom1OwmA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 6 Mar 2024 16:35:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B0MbP306GeiTE8HRsCQ=wb7R8pUUrMewXVC+rVMSRmfw@mail.gmail.com>
Message-ID: <CAAFQd5B0MbP306GeiTE8HRsCQ=wb7R8pUUrMewXVC+rVMSRmfw@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: menuconfig: Make hidden options show with
 different color
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 11:15=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Mar 5, 2024 at 4:47=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> w=
rote:
> >
> > On Thu, Feb 29, 2024 at 10:57=E2=80=AFAM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Thu, Feb 29, 2024 at 1:36=E2=80=AFAM Matthew Bystrin <dev.mbstr@gm=
ail.com> wrote:
> > > >
> > > > On Wed Feb 28, 2024 at 9:00 AM MSK, Tomasz Figa wrote:
> > > > > When hidden options are toggled on (using 'z'), the number of opt=
ions
> > > > > on the screen can be overwhelming and may make it hard to disting=
uish
> > > > > between available and hidden ones. Make them easier to distinguis=
h by
> > > > > displaying the hidden one with a different color (COLOR_YELLOW fo=
r color
> > > > > themes and A_DIM for mono).
> > > > >
> > > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > > ---
> > > > >  scripts/kconfig/lxdialog/dialog.h  |  5 +++++
> > > > >  scripts/kconfig/lxdialog/menubox.c | 12 ++++++++----
> > > > >  scripts/kconfig/lxdialog/util.c    | 19 +++++++++++++++++++
> > > > >  scripts/kconfig/mconf.c            | 18 ++++++++++++++++++
> > > > >  4 files changed, 50 insertions(+), 4 deletions(-)
> > > > >
> > > > > Changes from v1:
> > > > > (https://patchwork.kernel.org/project/linux-kbuild/patch/20231228=
054630.3595093-1-tfiga@chromium.org/)
> > > > >  * Replaced A_DIM for color themes with COLOR_YELLOW, because the=
 former
> > > > >    has no effect to black text on some commonly used terminals, e=
.g.
> > > > >    gnome-terminal, foot. Reported by Masahiro Yamada and Nicolas =
Schier.
> > > > >    I ended up with COLOR_YELLOW, as it seems to look comparativel=
y dim
> > > > >    with mutliple light and dark color themes in Chromium hterm an=
d
> > > > >    gnome-terminal.
> > > >
> > > > Thanks! Run a quick tests in xterm. Looks neat!
> > > >
> > > > Is there a reason to set hidden flag in all of the _if_ and _switch=
_ statements
> > > > in the build_conf() function?  Could similar be done in a more gene=
ric way? For
> > > > example:
> > > >
> > > >         visible =3D menu_is_visible(menu);
> > > >         if (!visible)
> > > >                 item_set_hidden(TRUE);
> > > >
> > > > Or this approach will bring some negative side effects ?
> > > >
> > >
> > >
> > > I guess he just inserted item_set_hidden() where he saw item_make().
> > >
> > >
> > > Since build_conf() resources to itself, the code flow
> > > is difficult to track.
> > >
> > >
> > > You can safely factor it out in some places (for example, just blow),
> > > but that does not make a big difference.
> > >
> > >
> > >
> > > diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> > > index b7e08ec98717..ba0f177121ed 100644
> > > --- a/scripts/kconfig/mconf.c
> > > +++ b/scripts/kconfig/mconf.c
> > > @@ -546,16 +546,15 @@ static void build_conf(struct menu *menu)
> > >                         }
> > >                         item_set_tag('t');
> > >                         item_set_data(menu);
> > > -                       if (!visible)
> > > -                               item_set_hidden(TRUE);
> > >                 } else {
> > >                         item_make("   ");
> > >                         item_set_tag(def_menu ? 't' : ':');
> > >                         item_set_data(menu);
> > > -                       if (!visible)
> > > -                               item_set_hidden(TRUE);
> >
> > I wanted to be consistent with the current code, which already has the
> > same item_set_data(menu) in both branches. I'm okay with either. Do
> > you want me to resend with this change?
>
>
>
> I am fine with either way.
> I thought build_conf() was messy,
> but it is not a problem with your patch.
>
>
>
> Talking about the code consistency, what about this suggestion?
>
> https://lore.kernel.org/linux-kbuild/CAAFQd5AOvUtHOOU-OKQKJwyJGXSt6EopcMB=
sHWz83n_0XfnOjA@mail.gmail.com/T/#med19d030bf8167637964b58da0f5b86b18fe3f5e
>
>
> In line 26, A_DIM is directly assigned.
>
>    dlg.button_inactive.atr =3D A_DIM;
>
>
>
> If you verbosely add 'A_NORMAL |',
> the other line should look like this:
>
>
>    dlg.item_hidden_selected.atr =3D A_NORMAL | A_REVERSE | A_DIM;
>
>
> And, we need to insert 'A_NORMAL |'
> to every assignment.
>
>
>
> If you agree with me, you can offer to modify the patch locally.
>

Ah, sorry, missed that email. I think we can just remove A_NORMAL if
we have the other bits, as you suggested in your first reply. Let me
fix that.

Best regards,
Tomasz

