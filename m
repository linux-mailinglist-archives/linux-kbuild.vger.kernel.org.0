Return-Path: <linux-kbuild+bounces-4297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB39AD487
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 21:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA1C2831B2
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 19:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BB51D27A0;
	Wed, 23 Oct 2024 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAL4Nhzk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986141D07B8;
	Wed, 23 Oct 2024 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729710499; cv=none; b=QJrcJX3yzRQLOm1VodVRdji+j8OG+Fey5W0biMhMNXuAUC3k325vw6GdlUKwQgRxh1woMwICtKu8ucmKtXMW2L0DvzJe01fmHFLBKAe2u5DQ+Z+2NKeNWQ0V1fMPA90HCyugW91mfvfwpaA4h/VmazIL/RHI7JfboppPnHbtOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729710499; c=relaxed/simple;
	bh=qPASF+nEG5o1TkfPJJ+nMRm7tQ+l8xWFlxCiiWKyXLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XI0RABdIe/kNaGcHJ6DDoH+/NKjcPWYiBvcI/hwqB53IA4J8LT+VJucyOaE81HZptbBQaZkRt6bL98Z4isO0qg80d35z/XPwRuJ97uSxvp5BM7ZNM4QrKp9PHxL0m2tT+3fZoxM3ydQoGJZgCFmGGw6X0p3IUIG4dhW96HnZDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAL4Nhzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306EBC4CEC6;
	Wed, 23 Oct 2024 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729710499;
	bh=qPASF+nEG5o1TkfPJJ+nMRm7tQ+l8xWFlxCiiWKyXLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PAL4NhzkOAMWr/2nIUlmbl6uo6rlB0k+2GkkGAg8KIBMXWCry6DnV9S6l6QlFeS3A
	 zrCsK5Xnu2Ky5kxLmFjlUKtUwPa6CANAVmONmMaHCClD3XdvmhrQar3LZr4V4ffISr
	 cQkY+pg72uDZvnTG0ypGFLj6No4vj7lZuvC3laW7QVRziTryqieydI6+4u5yf0qwIA
	 W/vz3gCtjiFPd8ZGLJ4/XSyFoz26AqTMyAbuNdg2YcJL0hj5itEgq4PT1CD8V9IGPb
	 lIubeFFG0t/okIAFWQ8SIjxDMGcoR9nOxL+EXtmmFZHkOWq8XTU7IIoFSrHTGVhdjK
	 DENzt50VVryLg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53a007743e7so142118e87.1;
        Wed, 23 Oct 2024 12:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjVpSe06dsbDR3e0ut8y+NmkerNh995z312ZC3lX2Ci3b4axrR0BrWh+4VIZCNs0AeWcv1pmcxv4QPISA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznOFktls4LWlkyj8F9q58xea3cFeobwuQEIyZhvnndQL7bt5zt
	z1tcJGz9+YNtV1Ax+b/Fl83qK3YOcxBgEqiwmW9BB9T0z4J9L2L/wqfwF/gPxpWJFMhNxyxAykK
	M7XHnBUVHY6gxwLDrX3Z5dp52NGs=
X-Google-Smtp-Source: AGHT+IEuQDy+/NCbarEU5wqTFe/z4Sf+EoZvh3J8SBaGAqmZVIFvxIQNYil+DYyDU0xusqijum/m/DTZHcwGbrTlKOE=
X-Received: by 2002:a05:6512:3d08:b0:539:f23b:59c3 with SMTP id
 2adb3069b0e04-53b1a34a10cmr1552193e87.34.1729710497846; Wed, 23 Oct 2024
 12:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <4931941.GXAFRqVoOG@devpool47.emlix.com>
 <CAK7LNAQdRdzbwciav5ewA2P9X=r6CeMb55zRny5QWCe62gR73w@mail.gmail.com>
In-Reply-To: <CAK7LNAQdRdzbwciav5ewA2P9X=r6CeMb55zRny5QWCe62gR73w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 04:07:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_LUBhg3aoX1iumO8vCoiLFfMTJ3xpDkHhM2A3U3HCyw@mail.gmail.com>
Message-ID: <CAK7LNAT_LUBhg3aoX1iumO8vCoiLFfMTJ3xpDkHhM2A3U3HCyw@mail.gmail.com>
Subject: Re: [PATCH 1/7] kconfig: qconf: use QByteArray API instead of
 manually constructing a string
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 1:37=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Oct 23, 2024 at 3:29=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wro=
te:
> >
> > Using a naked char[] here isn't necessary as QByteArray has a nice API =
for all
> > of this. Calling constData() will also always return a 0-terminated str=
ing so no
> > further handling is required. And then the whole manual memory handling=
 can go
> > away as QByteArray will care for this when it goes out of scope.
> >
> > Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> > ---
>
> I do not need this patch because I can refactor this function even deeper=
.
>
> I have locally kept several clean-up patches, but I have not got around t=
o
> submitting them.
>
> I will send some of them later.


https://lore.kernel.org/linux-kbuild/20241023181823.138524-12-masahiroy@ker=
nel.org/T/#u


--=20
Best Regards
Masahiro Yamada

