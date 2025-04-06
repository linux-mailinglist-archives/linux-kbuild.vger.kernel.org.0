Return-Path: <linux-kbuild+bounces-6457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5E5A7CEB9
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 17:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8997616E676
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 15:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FD6218AC7;
	Sun,  6 Apr 2025 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2dmxU4u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA1B218EAB;
	Sun,  6 Apr 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743953789; cv=none; b=HPpebeZKrqBsSD1SuYVHZfpiauc91SKgi1G8hSaRniYeHXTq6fTZHiIccZZq5SZm30FTtEqTfUT0nQ/q0mX+rztFeQ/08SUuZNzz7K7K51oGgzbPKx06Tcr2o048B85m/Ihp3kqAX3uHu//PPK2V9mjN2nJ1PioNTP9iTUj24hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743953789; c=relaxed/simple;
	bh=TRkUE22EAW4BUbGjQ64uqpYI4lJKNEuA696+sk6eIco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NK2tTJQIww54cPGJWDOpeWnZUZwsYOluIp37VXNMXvTdDmgRYCVG9aAnQ8519CQm35coCSXv5mjAeHSj2MTpDE00MAkisywydsonwXWwNcYuzAY3Yb5nxw0ZoWMxVa5X1t5SvrPP8ed83OiYMiiO6a3XiDwYXNLX2bNXwI/rMNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2dmxU4u; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4504092e87.2;
        Sun, 06 Apr 2025 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743953786; x=1744558586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkjZ88rah3dSogYkkyDVPh5HtEIzjtYwoEYxK470L24=;
        b=C2dmxU4uWpEs45m6gNiA9e/oZttKMiSWRFMW2donD5AVBFkm/Mf6L4s99oH1bRjo5w
         vf5iRauHH/GvX2UTqx8zGy+CZptJND8/KC2yCR6a3k91EU89phGRr5wQmiP/X/LiFTXY
         C4weQ7bgVkzH/pv0M6t/BOxsFOXDG3FL63xQqYBUspQzNqmxbGuOY/msCiT5O6RxaC6N
         /1YQeqs+qkMweGPK4f61Bg3Z2rkLaUzOJtT8kxuzCoibDh22VGu0lYL5r8Fa8PBmkXMZ
         alZDflnCzreHzv+mVTlG5FMSXCkvm7Xf/kPlr/MZ3LuqN5uX/wIVESsSVY5TM+AQwYWt
         Vl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953786; x=1744558586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkjZ88rah3dSogYkkyDVPh5HtEIzjtYwoEYxK470L24=;
        b=imTAB89hJeSj+BqXrJkZBrL7aoODqQRkWvyMSlKCKXyDId/WBmAt2moqfcBasvOHdr
         BBvz1C+NZoQ4oDRfbUEcVdBP7aC4X2tZ/RS0AHhGYwCPS+/RvBtgx4ymssiy87KGnAgh
         TngE5Y/hmT6PmZtZKrmHE/C61X78MAN0zLAbF7k7MxsH9qvs6Ee6kMpnHzyTbyphfdCx
         GghyjGtd1aYfqLCxiIqVYiw3pku7Qg5WHr+ETHMJgUY1PKNutu1tWJQ4yd3dZespJ5pb
         WB7CHJ4Ti/1nJXBNvMeyqWHKCumsaA5NSyKjLQrCkA/Cv404YJzSZNEzGBFfKPN6waGu
         ZZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3M7vq6NL4Y1BlPoxMVV/4yaWHWjRPbQW8gvwbp+VlmvJ3lY3Y1jKzaZ8HXlSOtAvW7+iOrTYZDHPOmjY=@vger.kernel.org, AJvYcCUhP9ONZ5YOmGT1O1C0KDfaV5mhaUj8PE0mpnt6yFHYtRZaPaO5J+z2s7hBIE+zYNDREAIfkanQUpeDeV66@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89S1/flqr1negLrtwYMgdb/1EwFOraUg/mRnPvbTLs8A4oWEa
	TGIbUd5JBtyRqvtAbdpPz0yI5uZjHbNjLMQj4UV9Eg0gtQRGaWr8IpTSdzKsm0wTNIaM3BixhrG
	KA/RloMoOYmdFTtxm7uRe2q+QOY8=
X-Gm-Gg: ASbGncsQTEnQF2J+OkHB8t/Yl7c8pLs7aDw9d+XAFW8np2LHRIDxsTjXVYQOsZIqPHL
	L4DEH59GXhLGOjjOOatHvLkH5K3w7FdawzRa0D45yXnLoW6d68TtNbAvMF5fjVc9Dje6QyorQkT
	OMliTNnYAWUro/n/xXBAHTcjGHHQ==
X-Google-Smtp-Source: AGHT+IENrOJnBHatVZdN1RRLNEn+AZCvPmiaUC7JbCeoAXaJgMSRuNFEFbdwdmvkc+9urj6y+xDuq5+lR/cY1mADtc4=
X-Received: by 2002:a05:651c:158b:b0:30b:f775:bae0 with SMTP id
 38308e7fff4ca-30f0c086c20mr30711211fa.36.1743953785312; Sun, 06 Apr 2025
 08:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
 <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com> <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
In-Reply-To: <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Apr 2025 17:36:13 +0200
X-Gm-Features: ATxdqUGAC3ok08g7nDCGm_BqUNPxvyKCYmF7ZT0xIFGxmZ5b6WeVsadMw6U5jx4
Message-ID: <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 9:14=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Apr 4, 2025 at 11:37=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> w=
rote:
> >
> > On Fri, Apr 4, 2025 at 4:06=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > > > > > Current version of genksyms doesn't know anything about __typeo=
f_unqual__()
> > > > > > operator.  Avoid the usage of __typeof_unqual__() with genksyms=
 to prevent
> > > > > > errors when symbols are versioned.
> > > > > >
> > > > > > There were no problems with gendwarfksyms.
> > > > > >
> > > > > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > > > > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() ma=
cro")
> > > > > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-13=
1151e1c035@molgen.mpg.de/
> > > > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > ---
> > > > >
> > > > >
> > > > > Why don't you add it to the genksyms keyword table?
> > > >
> > > > It doesn't work, even if I patch it with an even more elaborate pat=
ch
> > > > (attached).
> > > >
> > > > I guess some more surgery will be needed, but for now a fallback wo=
rks
> > > > as expected.
> > > >
> > > > Uros.
> > >
> > > The attached patch looks good to me.
> >
> > FAOD - do you refer to the submitted one for compiler.h or to the one
> > for scripts/genksyms/keywords.c? (The latter doesn't fix the warning,
> > though).
>
>
>
> You are still seeing the warnings because __typeof_unqual__
> is not only the issue.
>
> Hint:
>
> $ make -s KCFLAGS=3D-D__GENKSYMS__  arch/x86/kernel/setup_percpu.i
> $ grep  'this_cpu_off;'  arch/x86/kernel/setup_percpu.i

I see.

With my workaround, this_cpu_off is declared as:

extern __attribute__((section(".data..percpu" "..hot.."
"this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;

while without workaround, the same variable is declared as:

extern __seg_gs __attribute__((section(".data..percpu" "..hot.."
"this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;

It looks that genksyms should be extended to handle (or ignore)
__seg_gs/__seg_fs named address prefix. Somewhat surprising, because
genksyms can process:

extern __attribute__((section(".data..percpu" "..hot.."
"const_current_task"))) __typeof__(struct task_struct * const
__seg_gs) const_current_task

without problems.

I'm sorry, but I'm not able to extend genksyms with a new keyword by myself=
...

Uros.

