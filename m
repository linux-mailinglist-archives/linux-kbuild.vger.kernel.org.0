Return-Path: <linux-kbuild+bounces-6015-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C5A57B81
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B07E16CF54
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 15:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10B81DD0D6;
	Sat,  8 Mar 2025 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQNh60gQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF04D8CE;
	Sat,  8 Mar 2025 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446959; cv=none; b=HgxXRLf49FGpGI9bcppDfYv+Rkzv0PW5lcZKFOT4I8lbb0ODXodbp9qYME4IZVJFf47bcT9HUblkW3ItC9cc/Q3wgjVE6Id2fq04FbAsS3A8ZrVDCnH+3liz4SD54kpLBMKAGHDsxDPyC216m+Sf95aNIY7WmOksMAz0xrQJx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446959; c=relaxed/simple;
	bh=ybVJfraoYQPZPx1Us7G+uiNToMDiA5aSJo2/VvckgyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IT9rJZRUo0rmmcV88RP6TkbH8LAis7KJmPLao56xptQ9Qwg9CLjLsTiHZuRvvnuHJXJy7tHYweGls6dsBmQ9OsS10FLqhv1LtVePZ9rTiMHqnAJ0OHzuF58JIF1DIEN8T4kKSH5KktRadEw8H4mpoHNyZS/FznIXwnBjSD6kAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQNh60gQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B35EC4AF09;
	Sat,  8 Mar 2025 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741446959;
	bh=ybVJfraoYQPZPx1Us7G+uiNToMDiA5aSJo2/VvckgyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MQNh60gQoQKMLxanmY860rMbNxZNPQCuYrzJjVyNi27NxlWQ4TDyxW66KLutNrJCc
	 ezZOyfzF49INMdBhxpKeCEdxNIB22mGZ9Ez3ocbWy+dXmJ3Mb/iat1/Gfgxir3UinU
	 UOexi3ek9hU6AQxHMU5zgvcZPrXp7UtNr0/gJEpWr+AQDXZ+P6VGA+Te/nEpBVUMdH
	 mfFOVUbkXc9n4g1hjUD62TC6iQOFKYDpZZKQArz/67RbGdtu+2ye+/cZYjRMl3aHbH
	 Mv/3JjGFsBdBQsQwCBIvYdamWwaWbQQCEdar7whzu+dblLiTEJW/CnLvY9sNUCIogG
	 HjLSI6K77Hglw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30761be8fcfso31632011fa.0;
        Sat, 08 Mar 2025 07:15:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS/eqeRBgmfqmRyk3f5XryrCuIr15EmTZ5N7D+fbKAA3+mk/NRt+SpD0zAMH2rVRbdxwAk+kRI4lAEDA0I@vger.kernel.org, AJvYcCVsmL4mfKOoDnouA1j7VGyNrm2L5p/r10ImEhJcRVcIF+oph9zIQYGZCJYKzMhCeVYyvsvGloZc8CAjM7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8CwuOIBOPmqntWliXUkpVaowSBNMR4KWTO0DAygSsIhU0COY
	tMjoTJ8Qo7WhyEKz0Ss9j7vxZNheW1OeZ/teQoCL/y9olRW8kNDEokNmO18lgwnA85ou/D/N4Zv
	CeMQXqAGFwW1wyXBwx44T/CmpX3Y=
X-Google-Smtp-Source: AGHT+IFPmHN2JT869rHXZ5DQhd7+rjbGr8vz8Lt7jfy/K4V96yDDQCLEnf/uBQ2P/7txEP5Q5yy2M0zcM47IwCow6Z4=
X-Received: by 2002:a2e:be0e:0:b0:30b:f15f:1beb with SMTP id
 38308e7fff4ca-30bf45f37d8mr23249601fa.30.1741446957702; Sat, 08 Mar 2025
 07:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308040451.585561-1-xin@zytor.com> <20250308103437.GAZ8wdPbFGfhzAi1WU@fat_crate.local>
In-Reply-To: <20250308103437.GAZ8wdPbFGfhzAi1WU@fat_crate.local>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 9 Mar 2025 00:15:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASytr9fjfv-9Yt5_9MaKkrdKirjoBPqucEAGgM88uxD2w@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4N7yv4drvIqrJoHXWRrgxB047aL1yboxWzaKVR7Ug-cWBLLVi5bU2KLw
Message-ID: <CAK7LNASytr9fjfv-9Yt5_9MaKkrdKirjoBPqucEAGgM88uxD2w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: Borislav Petkov <bp@alien8.de>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	hpa@zytor.com, sraithal@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 7:35=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Fri, Mar 07, 2025 at 08:04:51PM -0800, Xin Li (Intel) wrote:
> > Meanwhile explicitly state that the headers are uapi headers.
> >
> > Suggested-by: Borislav Petkov <bp@alien8.de>
> > Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> > ---
> >  Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 70bdbf2218fc..8f5aa710105e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1659,7 +1659,8 @@ help:
> >       @echo  '  kernelrelease   - Output the release version string (us=
e with make -s)'
> >       @echo  '  kernelversion   - Output the version stored in Makefile=
 (use with make -s)'
> >       @echo  '  image_name      - Output the image name (use with make =
-s)'
> > -     @echo  '  headers_install - Install sanitised kernel headers to I=
NSTALL_HDR_PATH'; \
> > +     @echo  '  headers         - Install sanitised kernel uapi headers=
 to usr/include'
>                                                                          =
    ^^^^^^^^^^^
>
> It is INSTALL_HDR_PATH too, try:
>
> make O=3D/tmp/b/ headers
>
> for example.

No.   usr/include




--
Best Regards
Masahiro Yamada

