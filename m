Return-Path: <linux-kbuild+bounces-3409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D170D96E1B9
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 20:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0185E1C23AE3
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 18:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A742117ADF7;
	Thu,  5 Sep 2024 18:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2MH0RSR+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE2C157468
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Sep 2024 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725560176; cv=none; b=fmqe6oT4TraN4uONWz2PnMDOdDR0alJ3+qGXuUuVBdoFZMwqgMi+qZqdPN+B2MZvZLPpAVx2Se2vS43+s9rTVdKWzsDcc5+yU5eGOQPCk9SpPPxDv8YoQ9RWYrks4Ej1Q7JUeFGzgRAnr3YuBesEKKXCloCc7Wtazo9EwSFth/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725560176; c=relaxed/simple;
	bh=VDG73B3i8Fkx0gtYg22krryRHLAdvGRMSQ2YE6B/GM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n28lhZsC/O7QClmyXGp/Z7tAcTUN4I33I6JoJjPqTeQEPgnansmCueq1eMa+yBgKrnsDkGS4wCBvBaH6dIMcDn25F/RhRq9i5P4lLAaDWdGrkrAc2PrJF4uVxvfwnI2BtyzzxR56pugXwEvGNXjXWTHfjWhNIbQ65yhQs+HYd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2MH0RSR+; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4567fe32141so39001cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Sep 2024 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725560174; x=1726164974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdUTGl7VQBs4B0vEjvie8Mtu3hSlR654PMQj+t2RiC8=;
        b=2MH0RSR+vBTqzWcGR82xVle83Co3iKi8k0SOVZRgYdM6YUfUT0t/U+S05hqjqfYBMm
         E8OxUZIxYGAy8bwOBDXGlD2IQsfOBPHR7VEFkCRUshU5JbHckkVWjpqnPtS9aUiCWF33
         1CZv7V6HZ/LV2WiS0XqDEl4BK+JvtdXsYEwTkY6RaB5zLyp76qofq4DG9MkgWSKfHLlg
         fr91AnP3EqFQWrvWmffIljiYcBXYJQJmwN/wE2IQBmC5vEayfhplZ/IdJFHVODSc+bEB
         5rH5K+gmEVmF3GSmsUPXdCP3nF3RgARM5frtEd9VgoFMAnIHTWHfTqwBcSZPjxF6u3VG
         h+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725560174; x=1726164974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdUTGl7VQBs4B0vEjvie8Mtu3hSlR654PMQj+t2RiC8=;
        b=AoqzwP6HIitHSGrI+bGfNy6k3XXLppnns+rEyCWUs64xkHGDSCDXIuXX28fejBY3+G
         bfN+5C+8T9CjaEIDrdt9+4s4zPuIl0dBYbvUAdOaFrzjl1u0J8XWvnsHDziPdhdodnAK
         26/8jglfzeQra4XIcTFaq26RuvI4ejndhiJ7JUc+PTAQLUMmTD1RwbZgr43eHSwm3oTg
         GADxgK0A059x5I9LPH2ho3YD1IeganNqW3JeKa2KaSowsH8myMasuGJ2r99bsxWTQX64
         nytZaZYYcHOxwZ5Pw5q7D4rCUl+ArsRUxdhyh/ORC1S4CfpLE1al26AQNIZFslAO7ms7
         9QYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnLsVaybgUa61R/6atZe9HRExKPosCpYdhOKqvy0coBo+Wy9k6VtMZ7R9eDAZUz2zHf4gtnV443iEPT+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqnKdfoUVfpofGxG1RI+NOnCrtnBQc0RecxexgKR9Y6nuZ/W4
	elBBKtGN8xlVL1mbtHclqHA4Ghsc6RJkmZ92hMazHPtypbKCkZ44ZWrfTfTEqXsg5HLuMLwmffu
	IXKsJx26+78LNuWD+N6FNOfYc9v4idAMi4Vzb
X-Google-Smtp-Source: AGHT+IHplDe4MMiBWOY5cVCCpgg/EB/UGBgSHmgVn9Z/Jd71Qt02BDSa8paxdOMnp8DalfNq+r7OJlfFE4bJP3BtPdQ=
X-Received: by 2002:ac8:5891:0:b0:453:55b5:ecfb with SMTP id
 d75a77b69052e-4580c434242mr323391cf.2.1725560173715; Thu, 05 Sep 2024
 11:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-32-samitolvanen@google.com> <47bc562d-b9c7-464b-a2e2-dbb8c14d146b@suse.com>
In-Reply-To: <47bc562d-b9c7-464b-a2e2-dbb8c14d146b@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 11:15:36 -0700
Message-ID: <CABCJKucxDtCeq5NgwU9+8Fb1yGbrcV_91NbzM=6YquPLL48Jxg@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] gendwarfksyms: Limit structure expansion
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 8:15=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > Expand each structure type only once per exported symbol. This
> > is necessary to support self-referential structures, which would
> > otherwise result in infinite recursion, but is still sufficient for
> > catching ABI changes.
> >
> > For pointers to structure types, limit type expansion inside the
> > pointer to two levels. This should be plenty for detecting ABI
> > differences, but it stops us from pulling in half the kernel for
> > types that contain pointers to large kernel data structures, like
> > task_struct, for example.
>
> I'm quite worried about this optimization for pointer types. It could
> result in some kABI changes not being recognized.
>
> I assume the goal of the optimization is to speed up the tool's runtime.
> How much does it improve the processing time and is there any other way
> how it could be done?

It=E2=80=99s mostly a matter of how deep it makes sense to go. For example,
queue_delayed_work_on accepts a pointer to s#workqueue_struct, which
points to s#worker, which points to s#task_struct, which points to
s#mm_struct etc. Does a change to an internal kernel data structure
several references deep change the ABI of the function?

If we traverse through the DWARF without limits, during a defconfig
build the highest pointer expansion depth I see is 70 levels (!), with
~5k symbols going 30+ levels deep. We would end up pulling in a lot of
major internal data structures at that point, and a change to any of
them would change thousands of symbol versions, which feels
undesirable.

I'm fine with increasing the limit to something more reasonable
though, the impact on performance doesn't seem to be significant in
parallel builds. Of course, this might impact vmlinux.o processing
more, if we end up doing that, since the DWARF at that point contains
information about all the data structures.

I do wonder if there's a better way to figure out where to stop than a
hard limit. Any thoughts?

> > diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwar=
f.c
> > index 92b6ca4c5c91..2f1601015c4e 100644
> > --- a/scripts/gendwarfksyms/dwarf.c
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > [...]
> > @@ -651,6 +742,7 @@ static int process_exported_symbols(struct state *s=
tate, struct die *cache,
> >               else
> >                       check(process_variable(state, &state->die));
> >
> > +             cache_clear_expanded(&state->expansion_cache);
> >               return 0;
> >       default:
> >               return 0;
>
> I wonder if it would make sense to share the cache between processing
> individual exported symbols.

The actual DIE caching happens in die_map, which is already shared
between symbols. The expansion cache keeps track of which DIEs we have
processed per symbol, so we don't process the same thing twice and end
up in a loop, for example.

Sami

