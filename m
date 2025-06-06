Return-Path: <linux-kbuild+bounces-7382-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62944ACFC1F
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 07:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3176D171E6A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 05:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FC21DE2AD;
	Fri,  6 Jun 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjEX/Cgk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ADB1FAA;
	Fri,  6 Jun 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749186796; cv=none; b=bTtTpsMrIz59Fucf7YycsUYbVAEAalBxKaLBxTe+tvsH7wYc7/2pVGa+SI8rS7ZIsw1RWCUQ7XM9DAROtLHAsoAqF0kdUwnprCmAXRMzpgltikiz2ihcfk90D3w8pGWjIKFRtqk0WbBoddU9DOYT/taEvy7fpdrI+302+Hxvl2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749186796; c=relaxed/simple;
	bh=AQKFGhsxgo0BIr9xTB/1Yd2Je/V8W3jZBUx3MvDWR8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nddNWa06jRXeGWpYa3C+Ne/jKZYYSBCfBJZX++gdtqQoQg1sEzYRgLIRQUnT8TNS+vW0xDrFpdPcPa3Tm5vZuIZW6KmDwhSbi4pkZ6gbqqrna3gOf0+sil0p3W1l/Ajf7d9XWiNSgiQ4fsJAkrldAsHQdyD2PV7FGRdTcO8ooVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjEX/Cgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C77C4AF0B;
	Fri,  6 Jun 2025 05:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749186796;
	bh=AQKFGhsxgo0BIr9xTB/1Yd2Je/V8W3jZBUx3MvDWR8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PjEX/Cgk66x0JibO8nGIrIbOeUgD86ou+DoCfXeVEN1GKIxE/4a8C0CdIFdYN50KJ
	 Ny8RzV1s8Kt7fBRWCdMT0xhauT4I+xw9Xw9sb29A3+DpOr0BtPL7q//9MruZwe0ZvR
	 Jsz3YcmJai7SOZEEyWUJs0JWfuvRzrPqs86CnlgFjFPYVixzz5byjJSIm5Od0OEirf
	 VS8VFVwVj0g+TvV4yiU1aCvcZntxoIJcR1pxM8p4Jvv96xl281vlOLqSNuNOneOZc7
	 mNIxxV7M2MEwbxfY18IdHhUFwzYkSao/MTr8iWLrOJSdnTtWO/llBQAem5bl1DQfVC
	 iHnLuKFqvMNUA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32a64f8480eso27527781fa.1;
        Thu, 05 Jun 2025 22:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS0VtlmOO1tVjg48G4HzaGuEvnhJyWW9mTwb0foiKlj94+HOnuPzdy5J7nCbh7uYlYqKXr+WQDTiKeuA4=@vger.kernel.org, AJvYcCVaT5iotqNhWNUZx4/V4N/OiYBvi+ONH8Wq7fOnWyR9MZhY2ZQeBSb9lBZ95TmVcj2l1scue0W0rk2pzKPn@vger.kernel.org, AJvYcCW8JczYHT5vcWjJK3Y320YVlZLYYSvKKSPO2+rDGRk4U2vikNJMemGLB3N6u911gp+9GeWdidDDIEb2QCCbeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2i2eH7A5susaeEqXJep1wg7v2RD/EgBIquVDX5qmn79ADeEo3
	q3c7YDIGGD78q+QC6rhpCsHJFnhgdFCXjOSctb8M1wTXH/ewl2XrEXxqzjGP8fD0/0xZm5k4Cs7
	BLdHe5fKli+Kj/tgs4Y1VH7MYjy5F2cI=
X-Google-Smtp-Source: AGHT+IHbkPRvX6Z0dchWkNRtq7wvCU3la1oqMarRLD78GvdVfaGUutRPCMWy2/WoaMOMqE33X1vpr0BK54oeUG/XpCI=
X-Received: by 2002:a05:6512:3d22:b0:550:e04d:2b66 with SMTP id
 2adb3069b0e04-55366c3049bmr358074e87.17.1749186794807; Thu, 05 Jun 2025
 22:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com>
 <aD1f0CZfbsMR61OX@example.org> <CAK7LNATt+=k3sYU4FWM22aJzzH_a7_1FkO5S=LW7L-Z7K4CQhQ@mail.gmail.com>
 <aD3xFzKQbxaIo60a@example.org>
In-Reply-To: <aD3xFzKQbxaIo60a@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 14:12:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-nL--pe98-AUKkdHpd9Ph-A0USUmk7QL7_PtUaqfzvQ@mail.gmail.com>
X-Gm-Features: AX0GCFs4m3Tl9uhbLkzLOApFdwiFxOWwe5hdViPIxmKzD3M7a8xFttM0u9nkjX8
Message-ID: <CAK7LNAS-nL--pe98-AUKkdHpd9Ph-A0USUmk7QL7_PtUaqfzvQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 3:44=E2=80=AFAM Alexey Gladkov <legion@kernel.org> w=
rote:
>
> On Tue, Jun 03, 2025 at 03:00:07AM +0900, Masahiro Yamada wrote:
> > On Mon, Jun 2, 2025 at 5:24=E2=80=AFPM Alexey Gladkov <legion@kernel.or=
g> wrote:
> > >
> > > On Mon, Jun 02, 2025 at 04:52:36PM +0900, Masahiro Yamada wrote:
> > > > On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kern=
el.org> wrote:
> > > > >
> > > > > In order to avoid symbol conflicts if they appear in the same bin=
ary, a
> > > > > more unique alias identifier can be generated.
> > > > >
> > > > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > > > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > > ---
> > > > >  include/linux/module.h   | 14 ++++++++++++--
> > > > >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> > > > >  2 files changed, 26 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > > > index 88048561360f..e7506684069d 100644
> > > > > --- a/include/linux/module.h
> > > > > +++ b/include/linux/module.h
> > > > > @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_mod=
ule_kobject(const char *name);
> > > > >  /* What your module does. */
> > > > >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description=
, _description)
> > > > >
> > > > > +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>=
__<name> */
> > > >
> > > > This format relies on module-name mangling, but
> > > > I hope we will be able to stop doing it some day.
> > >
> > > I didn't like this approach either when I found out how it was
> > > implemented.
> >
> > Yeah, I dislike it.
> >
> > I hope we can stop this historical mistake:
> > https://lore.kernel.org/lkml/20250602130609.402581-1-masahiroy@kernel.o=
rg/
> >
> > Once we stop doing that, __KBUILD_MODNAME will not match to KBUILD_MODN=
AME.
>
> Do I understand you correctly that I cannot use __KBUILD_MODNAME now ?

Honestly, I dislike __KBUILD_MODNAME, but I know it is more challenging.

So, at least you need to fix the rust issue.




> > Also, you need to be careful about the rust side, as
> > you did not take care of it.
> >
> > https://github.com/torvalds/linux/blob/v6.15/rust/kernel/device_id.rs#L=
157
>
> Oh. This will make it much more complicated because I don't know rust
> well. :(
>
> I found a few more issues with modules when they compile as part of the
> kernel, but was hoping to fix them after these patches.
>
> --
> Rgrds, legion
>


--=20
Best Regards
Masahiro Yamada

