Return-Path: <linux-kbuild+bounces-6911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D2AA8193
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 18:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF325170296
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 16:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1659B26656A;
	Sat,  3 May 2025 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5pXMkVa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A7EAC6;
	Sat,  3 May 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746288844; cv=none; b=B6YcDbkphI/KUHW8fmO/uc8vEQGSAqAWmyYlHo3WWnHgmj/GHfDxeUBF4B+kQYFgtsdN1E2Ib5okKq17aV70emCM4HyMDdlAlFgk+H5KHlCpBYSTjE2om0rv/lZ7MH48dwe6DJBCuc0xC2mlnFrvQ37LrIcKIUu08cQltGn4YIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746288844; c=relaxed/simple;
	bh=dQFlsrCTZJJhnxlBv9NIjwv4jFi5kwKvclce/AdCPNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Huk/CGGX0rbpts1BHJAcozxwTps2hsBlWvfX+Gwd6Wuxeh1e1ua97rzVjuxstb5/Xvu7IqXqSyG44p4T3ixOS5ovSTH+N3mGUuqZcTO0kW8CPt/aVDCoCPZl3Q7p+2zYBvYEm1qvuexwb+K413B/TbKYQv5tjci1adDSUql5lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5pXMkVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2F5C4CEE9;
	Sat,  3 May 2025 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746288843;
	bh=dQFlsrCTZJJhnxlBv9NIjwv4jFi5kwKvclce/AdCPNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z5pXMkVaJpl7FUJLdZa5bZq3J/xwQm0DrDrF7mGZqLAA6P7+gpnwhePcxqI8lJjIN
	 VK9S74bfrEisYKF2IwEr1LLdXI9Q5TWXPrg8IMTTLsDb1Tam6ePoFlGOIjV9+lcZr/
	 rp0LxH8lb54BW7g0lqBM0SmnBb2Aw0XIJUbpxKLxuTk1MvuLPNJNGLGIaNQQR2Xkn6
	 scMQXm4MGtV2nlce1pyvF88QdOMn1hgw+LFob35i+6LBaP6jJOm/+jg/2uUNth6TwT
	 qascuWscFZAreSZmbQhQmTp5jwBt02QQ/5pbRo6B7TLEQfoMw6dLxD2rSxzH82f5jO
	 S8AU8298zi/iw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso27672241fa.2;
        Sat, 03 May 2025 09:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiEEyBVWm73EOAEdMKYyy0DO7IGoBqNW8PeCIhJRK+6SLJlWarzIMur2gvBX8jUDdIvdxLysIwcDVGDDc=@vger.kernel.org, AJvYcCXXu0V0PJEJUzaM5iyQw8PjOLF24kNTbGsCzPAsV04gujaryWzH3hWwavTTqndUfo9/pnTgQ2+ARFcrygQe1pU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxILvLo8KPDPdk/7Ay/Lc8fQlbTqgjG6wgRp4NbdWDE63lMRjlk
	g+4YWKOlnGrtzRQ5v5IEIpBA2Dvx83OfoYC8SS5AVULHus6E4jdW5zkAgvw+d44WgYAL35ELNYM
	mVYiEAH3qYIkAqp6XPKs71XFK0zI=
X-Google-Smtp-Source: AGHT+IEaWaMALwU7NzK8uQ2sCWOt9yd++wv1jm1Y1Ewfwbc1zccZJPC8McJkleTjD1tJKMlZpF2V/oj3r1+7nu3Gpo4=
X-Received: by 2002:a2e:ad93:0:b0:30c:40d6:5cdb with SMTP id
 38308e7fff4ca-321daedda8amr9465411fa.11.1746288841953; Sat, 03 May 2025
 09:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426030815.1310875-1-rdunlap@infradead.org> <CAK7LNASww7Zyeg7G0R9US-_MWtFmBF-P5JiwZkgGBBrfoivi5A@mail.gmail.com>
In-Reply-To: <CAK7LNASww7Zyeg7G0R9US-_MWtFmBF-P5JiwZkgGBBrfoivi5A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 4 May 2025 01:13:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpZvXREY5+4H_WA4UOgYpYoTLS=bpb_Gkb+SyetKh_tw@mail.gmail.com>
X-Gm-Features: ATxdqUGb7qfS5TSIqD7ON7k9RYxn59Gp78YZNa9UVZ7M1cO4MoSPCA2KL2bo4k4
Message-ID: <CAK7LNAQpZvXREY5+4H_WA4UOgYpYoTLS=bpb_Gkb+SyetKh_tw@mail.gmail.com>
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 1:01=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Sat, Apr 26, 2025 at 12:08=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> > Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
> > bpf_perf_event.h for arch/openrisc/.
> >
> > Fixes a build error:
> > usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incom=
plete type
>
>
>
> Where can I get openrisc compiler that enables CONFIG_CC_CAN_LINK?

Never mind.
I downloaded a one from
https://github.com/stffrdhrn/or1k-toolchain-build/releases

Hmm, I did not observe an error like that.

Instead, I got a different error message.

  HDRTEST usr/include/linux/bpf_perf_event.h
In file included from <command-line>:
./usr/include/linux/bpf_perf_event.h:15:9: error: unknown type name '__u64'
   15 |         __u64 sample_period;
      |         ^~~~~
./usr/include/linux/bpf_perf_event.h:16:9: error: unknown type name '__u64'
   16 |         __u64 addr;
      |         ^~~~~




diff --git a/include/uapi/linux/bpf_perf_event.h
b/include/uapi/linux/bpf_perf_event.h
index eb1b9d21250c..61264bdda988 100644
--- a/include/uapi/linux/bpf_perf_event.h
+++ b/include/uapi/linux/bpf_perf_event.h
@@ -8,6 +8,7 @@
 #ifndef _UAPI__LINUX_BPF_PERF_EVENT_H__
 #define _UAPI__LINUX_BPF_PERF_EVENT_H__

+#include <linux/types.h>
 #include <asm/bpf_perf_event.h>

 struct bpf_perf_event_data {











>
>
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Jonas Bonn <jonas@southpole.se>
> > Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> > Cc: Stafford Horne <shorne@gmail.com>
> > Cc: linux-openrisc@vger.kernel.org
> > Cc: linux-kbuild@vger.kernel.org
> > ---
> >  usr/include/Makefile |    4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > --- linux-next-20250424.orig/usr/include/Makefile
> > +++ linux-next-20250424/usr/include/Makefile
> > @@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
> >  no-header-test +=3D linux/bpf_perf_event.h
> >  endif
> >
> > +ifeq ($(SRCARCH),openrisc)
> > +no-header-test +=3D linux/bpf_perf_event.h
> > +endif
> > +
> >  ifeq ($(SRCARCH),powerpc)
> >  no-header-test +=3D linux/bpf_perf_event.h
> >  endif
>
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Best Regards
Masahiro Yamada

