Return-Path: <linux-kbuild+bounces-4611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738549C3059
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0B528207A
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B1614F9EB;
	Sun, 10 Nov 2024 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFlBxZSd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13E14F121;
	Sun, 10 Nov 2024 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202630; cv=none; b=dlFMa0P5JdXXjyZnHH74PJJo9VHHOrtCtZDij690ncTmM6lLdUSC0rhjjt6Z1GAwy8VXtyDX/LUTynhlzayX4INP2DWr9aygC10rRvuNof0mIMe41+PAH/QtNq+4Z0vbCnu5keTktZiEIsGVEYLd5RepzKaavsP+0PtWC9nQ1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202630; c=relaxed/simple;
	bh=Hq/3MBZSIE9wAa3fShhSryh3ayVPZALjJGUIQoeZ8QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLDeOl74iKXo3fgQHHLoFzY/XPd8DfmuqRaX75yDyIla+9PYeDBilCMyQVlNSGzEp4HR4IhGQ45bN3mTu/RcX3jD5q1Yp778U6Zz+Cr6k3lIuqPWmWf9/Gd3agTnPwqNpS7jUKZqvfXjwPlQMlVazohlCkJV9fhgC/TjULKeK24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFlBxZSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF9DC4CECE;
	Sun, 10 Nov 2024 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202630;
	bh=Hq/3MBZSIE9wAa3fShhSryh3ayVPZALjJGUIQoeZ8QQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bFlBxZSdeNx1LohdwS2UCDO1xM/oTZyFkdmap9qHqvutGAUdmt6eH9CpDjmN7yDTY
	 9PlBL1Mo7jBeVEXmt+BiffQZPmnyK817648m7fSDmsReUDiOU2gvzpdUnjjXCOoGY5
	 L4/Wpqgeic2YLryNAN1dYHTK4z8OJUgwBnQSdmPMuibL2a4B7GvMB8gcoNSYsCy19r
	 IXwUC7vt22CZajWNtkCzeA+EnQ16GcbUxrfWe7ZHu07dyj9k2x0/Y01T3SUNH+EYxl
	 UmJPIjzkFqE7dHr72pMqpk5dj2qGinj1oGbhVaQiA/A0b/u32W3YZIpf6bVZS4/jxE
	 XT0Bm6Prhv4Og==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so5240456e87.1;
        Sat, 09 Nov 2024 17:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMqcjosr/sP3ifGKukf7aywZ8Y+OE4lGK6zlVxnYg/avH64EWiw8BtNi2DcqNsbP/EhVxBIfAR/47j0M0=@vger.kernel.org, AJvYcCWdg4/AwhC7iy2iyPEipuaUu3aZyGwPyhegHvpScIGbaDWCQZw5/2kHVtWrmRTVrmgEwdVpGC8nlSXtYFE1+bA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3GOgCXpqYJVWRqsTNVN4MdP/GEIVzZFtptGxuDL6WxtPX4byM
	qVrslwgBhhkIytHgOzkRw1OibYf551O5yx8YxYHqtKCPTi4rkiSHvjjpHMV35L367ZqmabR4Aib
	zwQPsrLyXDhQdU9rOkwuQhITNuu4=
X-Google-Smtp-Source: AGHT+IHUhU0ROX8OdVi52tjJJSq+LdO5tFyeyINTRxSOzJvM7W2GUDGG+EPxO5JkvWLd6hAWFIGl4NvIi3YCIU35k3o=
X-Received: by 2002:a05:651c:247:b0:2fb:65c8:b4ca with SMTP id
 38308e7fff4ca-2ff23daf148mr27750441fa.40.1731202629022; Sat, 09 Nov 2024
 17:37:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-20-masahiroy@kernel.org>
 <20241003-mustard-marmot-of-storm-af36a2@lindesnes> <20241004-precious-nightingale-of-pluck-b78ac3@lindesnes>
In-Reply-To: <20241004-precious-nightingale-of-pluck-b78ac3@lindesnes>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 10:36:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNATpKk28mx5Au6pge-uAJCwqkQHdUXKNTDs-QQj6bOoeFQ@mail.gmail.com>
Message-ID: <CAK7LNATpKk28mx5Au6pge-uAJCwqkQHdUXKNTDs-QQj6bOoeFQ@mail.gmail.com>
Subject: Re: [PATCH 19/23] kbuild: support building external modules in a
 separate build directory
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 4:45=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> w=
rote:

> > > @@ -640,6 +648,7 @@ quiet_cmd_makefile =3D GEN     Makefile
> > >     } > Makefile
> > >
> > >  outputmakefile:
> > > +ifeq ($(KBUILD_EXTMOD),)
> > >     @if [ -f $(srctree)/.config -o \
> > >              -d $(srctree)/include/config -o \
> > >              -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then =
\
> > > @@ -649,7 +658,16 @@ outputmakefile:
> > >             echo >&2 "***"; \
> > >             false; \
> > >     fi
> > > -   $(Q)ln -fsn $(srctree) source
> > > +else
> > > +   @if [ -f $(KBUILD_EXTMOD)/modules.order ]; then \
>
> If I do
>
>     make O=3Dbuild
>     touch fs/btrfs/modules.order
>     make O=3Dbuild M=3Dfs/btrfs/ MO=3D/tmp/btrfs CONFIG_BTRFS_FS=3Dm
>
> the 'modules.order' check does not work correctly.  But a consequtive
>
>     make -C /tmp/btrfs CONFIG_BTRFS_FS=3Dm
>
> shows the 'The external module source tree is not clean.' message as
> expected.
>
> If I replace $(KBUILD_EXTMOD) by $(abs_extmodtree), it works for me also
> in the first case.

Right, this check does not work correctly
when KBUILD_EXTMOD is a relative path.

In v2, I changed this part.



--
Best Regards
Masahiro Yamada

