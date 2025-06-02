Return-Path: <linux-kbuild+bounces-7350-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B9ACBA98
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 20:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050191893EBC
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 18:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC9F142E86;
	Mon,  2 Jun 2025 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgFclT2x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EB2C3258;
	Mon,  2 Jun 2025 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887245; cv=none; b=Ip8WzxrCyQaa6tcZO8EYwHfL99q93e9MysGZX+WbSrlnNsU5knVtv7wMVyDGgF/iN6UqT86kW45ZhX6dopHcMsxTpFgraX93OKoji4awDMTKzn2yH8SOAZU9QWHIlIH6XvRJrPXndmCZ23A8I3MQzAralRR1/PRdgYO6Hd6UrK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887245; c=relaxed/simple;
	bh=Qa2OkhSnMZSYH2ELOGQ4nB8clbKtymHyAHw10lLMd0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXFsw/DAIguGdOmY5UqG3nmMJJrj5p5wKVhNLVuC4bDmP8/8pMyBSTDv1qosHontCKiCzX4nWcnOtNKvkaRhFng3HzRa8XWpsONzSHk2mxDIxrNmUnGfH6q8axV9pofab5XSH7hpjJcqBBsKd2DBS7onwrFfvoMwrtPNtBdHiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgFclT2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CF6C4AF09;
	Mon,  2 Jun 2025 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887245;
	bh=Qa2OkhSnMZSYH2ELOGQ4nB8clbKtymHyAHw10lLMd0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JgFclT2xOTmrVmEBR+d0M7Gc3WFoCUOSnGBSFGu7T3etc/mtpJPUzgqAZH0R3jPlI
	 oC1FN+a4py4l2FUvrHScHV5JvVeMzwr9g0VPo6lNfpy7GKjEerhSn3RUiaF8Bd1VOw
	 y9uXHWjsVqDGFUhI+mztD/FK08KEnwAGRUpRtWAn0KudQTbdFzuiW5NwjuyneVK4IN
	 JAYwKJmKVuz0ECbUHLKc97FP0mk4F7GbKm7N8RCERxnEFxfSSujLacgbWhXCUdR49i
	 3WeZRYuCBO99IUmtirSqljlcYLofJP6FZudJ3U0+v782dLOaBBkW5YBZA4Wry8HpPd
	 woqnRUZMds0uQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55350d0eedeso737915e87.2;
        Mon, 02 Jun 2025 11:00:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUky/jIZ1ttY5bfi7VzYz7cPdWHNn5UEfMa7qA7l4Q7d7gbkq4ggZSOnLFwznvBCBZmayfBSi/GQxD1uHI=@vger.kernel.org, AJvYcCUqCtoGXaea3K1byveUr4SeOOU7xK1IV8JrSQ2YizZuBitCRAtenj8yX+iQsvB62FIlpsQpq0Vl12mNWw+SdQ==@vger.kernel.org, AJvYcCVxmt2703UBl9bh+A7csz7uMDq2HUHfRYYTnPnCUs7pLNd26pYqcpwyWAzkQnJlvbpwopiFwIiKK26/QR0O@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXDug/4nEigApUYco2oMnIOqYznbbV0ZhWIFxMimjKfXMcH2q
	xEVcInQuFuBqIhDUZaOwGCE2Z9CSoyJQ0Zk5RsZVe9q5Uc/x+zI1ciTXCeIsDV7VXWL847X8peJ
	a1SqUgK+neUKdrOCjTi0s9v40E7YLfjQ=
X-Google-Smtp-Source: AGHT+IFNQCEcSQZV4bUWEALU6sDPgPvVroQDQlVEeG5QOiq2iMSYY1wt/Uuw7Dtsy9H4xj3o7pUMIy/J3NGhdRumzjQ=
X-Received: by 2002:a05:6512:1597:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-5533d161022mr3306598e87.9.1748887243643; Mon, 02 Jun 2025
 11:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com> <aD1f0CZfbsMR61OX@example.org>
In-Reply-To: <aD1f0CZfbsMR61OX@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Jun 2025 03:00:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATt+=k3sYU4FWM22aJzzH_a7_1FkO5S=LW7L-Z7K4CQhQ@mail.gmail.com>
X-Gm-Features: AX0GCFv4XyoMc9AKkgN2V11p6K3I7FTU363_6Jv-xy-pmr_5i5pQfTpVERgKYjk
Message-ID: <CAK7LNATt+=k3sYU4FWM22aJzzH_a7_1FkO5S=LW7L-Z7K4CQhQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 5:24=E2=80=AFPM Alexey Gladkov <legion@kernel.org> w=
rote:
>
> On Mon, Jun 02, 2025 at 04:52:36PM +0900, Masahiro Yamada wrote:
> > On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kernel.o=
rg> wrote:
> > >
> > > In order to avoid symbol conflicts if they appear in the same binary,=
 a
> > > more unique alias identifier can be generated.
> > >
> > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > ---
> > >  include/linux/module.h   | 14 ++++++++++++--
> > >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> > >  2 files changed, 26 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > index 88048561360f..e7506684069d 100644
> > > --- a/include/linux/module.h
> > > +++ b/include/linux/module.h
> > > @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_=
kobject(const char *name);
> > >  /* What your module does. */
> > >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _d=
escription)
> > >
> > > +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<n=
ame> */
> >
> > This format relies on module-name mangling, but
> > I hope we will be able to stop doing it some day.
>
> I didn't like this approach either when I found out how it was
> implemented.

Yeah, I dislike it.

I hope we can stop this historical mistake:
https://lore.kernel.org/lkml/20250602130609.402581-1-masahiroy@kernel.org/

Once we stop doing that, __KBUILD_MODNAME will not match to KBUILD_MODNAME.


Also, you need to be careful about the rust side, as
you did not take care of it.

https://github.com/torvalds/linux/blob/v6.15/rust/kernel/device_id.rs#L157




>
> We can only add the module name to the structure to which the alias is
> made. But the problem with this is that right now there is no common
> structure for DEVICE_TABLE. Each module comes up with its own.
>
> It is possible to add a common structure, but that would be a big
> refactoring.




--=20
Best Regards
Masahiro Yamada

