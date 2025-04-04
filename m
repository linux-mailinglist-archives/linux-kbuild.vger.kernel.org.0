Return-Path: <linux-kbuild+bounces-6441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A220AA7C3B0
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 21:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8326D3B8752
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 19:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEC61EB5E5;
	Fri,  4 Apr 2025 19:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUmaRHyI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F00713D531;
	Fri,  4 Apr 2025 19:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743794055; cv=none; b=gXD78OLe5/f1yfwgwfvS66rMVzGHznCwtzHhBA/37x45Zakp5dakZPXaLQRZ89uywEyB7ZHoykNMGh+ngcLcuBDWnzzMGtodw2UaUL4IycKZTCu9EktWp82mNe4G7alNpNtPf1TM0WGtpAxz36rv7M0kTGlCWqDalfct/EgOHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743794055; c=relaxed/simple;
	bh=GK+D2xH4mkrxRKPj7PvUUgbKX8MxtbEYJKBgNsU0E5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8g3onYDWI1WMTczpboHGVL5ncXbhdgZBtlwoy66FIsMYqD7eMW74uJ325pxQJ7UJM991FvnXR6I2IKjLRzZoBAD5Enmxf93rKqbLyJL46eZ8oRIHEzI3kwu83JijrSHcXTuhQXf0hDPs5ChUVkGIP0ILaPyvM5sk9wlRHAbeKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUmaRHyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5799C4CEE4;
	Fri,  4 Apr 2025 19:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743794054;
	bh=GK+D2xH4mkrxRKPj7PvUUgbKX8MxtbEYJKBgNsU0E5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qUmaRHyItvJ8EJ+roxxHS5ngiJEPJy7E70pySwNt0yNmDmyh+MZS8x4cS5MCysGoX
	 LZcaEB4/h43lwEI3J9qO3tVnjgaoEJIlnb6DWbaoNEABqg7zlNtpmi4rmN0ZZahBsE
	 pNgCACpxrcTxx0s8OFKdKyBXxrDmeyd8kHAJyDWv0yPw5Q/pNR5pHc5FMlIv3Se0BV
	 0zAA3xqQQhKYqCGqqz2zGKmoqdVnKd3PFlxyJLuwhisf0+cZbtlWiB/oJPFuwNtB4E
	 FYvxOydZoorTtEoTZ5RGzp5fL9ZPLjdA680incHxM1QvXac4ohr43aK+VbRje6ttY8
	 RzqInD3laftmg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54c090fc7adso2723753e87.2;
        Fri, 04 Apr 2025 12:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+epOPttJm3DWs7Z6Cz6+XwEN8xodcVuSr+XwSQdPmyZikCmMCygwkdFmk+fSFIQDrg93Rac8xUr5SBxc=@vger.kernel.org, AJvYcCV3OCUz/AxwS4w+MqBtnlbUcRue8BBTzbrcxKCf+PzD2hTntUHcTetXVuUtSGXcYOFK99Dq0AQLY5bWwp3J@vger.kernel.org
X-Gm-Message-State: AOJu0YyZh09qtzoR1nSCOfMqIZMSgQ4dXVIP0IzwXxKk0ZAIv4pfu9jE
	6GpEjPUaIy1Al0z1ML2/xrS9SIo9qyG5zpWpnxfoLA8f8Z4zAF3QOdOQ8c/Z22lE+TBG9RHtHR1
	r2F9/jBPHiqqyIbg9xDGIPz73Pjg=
X-Google-Smtp-Source: AGHT+IHo8Zqk50+G/P2S5Zi88hZgN1tRYEpbqnYOoFkbSvSmjZn7bFkhRjH/37/ERpHR7IE42aQ9+wiL+E1VemAHEvY=
X-Received: by 2002:a05:6512:1092:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-54c232de6e0mr1113271e87.13.1743794053586; Fri, 04 Apr 2025
 12:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com> <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
In-Reply-To: <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 5 Apr 2025 04:13:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
X-Gm-Features: ATxdqUFMOH72JyC-qPh1E-3hdWpTn9ObjU69eNYz1Gu2sxaIJ7P9ql1xkBZcGqQ
Message-ID: <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:37=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Fri, Apr 4, 2025 at 4:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> > > > > Current version of genksyms doesn't know anything about __typeof_=
unqual__()
> > > > > operator.  Avoid the usage of __typeof_unqual__() with genksyms t=
o prevent
> > > > > errors when symbols are versioned.
> > > > >
> > > > > There were no problems with gendwarfksyms.
> > > > >
> > > > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > > > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macr=
o")
> > > > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-1311=
51e1c035@molgen.mpg.de/
> > > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > ---
> > > >
> > > >
> > > > Why don't you add it to the genksyms keyword table?
> > >
> > > It doesn't work, even if I patch it with an even more elaborate patch
> > > (attached).
> > >
> > > I guess some more surgery will be needed, but for now a fallback work=
s
> > > as expected.
> > >
> > > Uros.
> >
> > The attached patch looks good to me.
>
> FAOD - do you refer to the submitted one for compiler.h or to the one
> for scripts/genksyms/keywords.c? (The latter doesn't fix the warning,
> though).



You are still seeing the warnings because __typeof_unqual__
is not only the issue.

Hint:

$ make -s KCFLAGS=3D-D__GENKSYMS__  arch/x86/kernel/setup_percpu.i
$ grep  'this_cpu_off;'  arch/x86/kernel/setup_percpu.i




--
Best Regards
Masahiro Yamada

