Return-Path: <linux-kbuild+bounces-5585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42714A24303
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 19:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA987188A977
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 18:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3501F131F;
	Fri, 31 Jan 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l23MIy99"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1291F03F5;
	Fri, 31 Jan 2025 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738349908; cv=none; b=bMLHqQ03VODaM9Yd6Ooh7VBgOisVc4dGgsIB6UJCmu7RaP4XQzw5Jt0c3Ee4xPPycdF9IhHxJuJTor76KP698h8rpyq1DK8waAkYEAu++vzssb/JNx5aCf8YfHR4qgf9tnBrbdNi5KeF7cWj7otLRIBYnJaGcuyLSXj+67JFcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738349908; c=relaxed/simple;
	bh=8T0Fu4jQpJW1MEbplsGTq5WDKApJUV829RbJsPGKt/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGygGtomQ28lD4p7IAEL/runAj+MRT6ueHBXOACuGik/Wkvdwj7apSHXetOTfKI0wk78Bdz2VuskccUv3DblZqEyQeLPjQmEVolMcC72j0r7ciLRqO4lJJ58vuWMF9a5a1IRFUOIMCXKZRQ/YZgQ5+E8SlXRGK9WCCPtjszhkPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l23MIy99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A75C4CEE3;
	Fri, 31 Jan 2025 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738349907;
	bh=8T0Fu4jQpJW1MEbplsGTq5WDKApJUV829RbJsPGKt/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l23MIy99HW5a9m3DvfScOln9zW8EzMu1cRwASe7mZxXRTCm4snVO5V2rU7LfQuHCS
	 w+on12Z5SQKZZM1FYy+Hzt5/Vre/yBt1amIwV0Z5onYot4NM66oNPkAusr/tKB9Dqc
	 TQrDHCXLtVX7CkfIERNeTSZ/PLQZJqz979bUAwn4duukwkPRxdT78L0ZRLfMy0F8kH
	 +w1zGFc3Kr1hdcqBVhrLyxzV/09BcFDtJskYJTmwgqYPfa+MX6T65xW5vJxm0E9ev4
	 9tyiBO/TND+LqWl28fLUCFtdKyE+9uM/vdhG4PTMJdwP6Ve8TGX5uCYVditfSDVNDV
	 3wyFpOsX8zzgQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5439a6179a7so2311707e87.1;
        Fri, 31 Jan 2025 10:58:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUx2LFQYsPCdkaadZ2JnlSrCM+sND1Wee/S6msYW3R45AMeq9m9SD2vYatjRF8VzGU9BziaOP3yuhV9A==@vger.kernel.org, AJvYcCVrFkbpNJHXqWthb72O86wXSwQxBT4aoI++DSIbZpBzlR9igBprJcHu3wG1cl2t00S7TCGrLDJAh28mSgY=@vger.kernel.org, AJvYcCXxJ8j8yqAsfolgc1iIpmIBl/VXCDt8E9jJ43uyV08152vM6r9wKWoZEffWj+4+pRSQ6Zzmwb5pxTCQRXxf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28alkp8vqTk5VYjG4efWJo2kXsTn/UIyjCI7E7vMR2NKTdpcH
	fqRU2xgbO4QEhqz9oqaagbwk5Eg6V0fjiguNCm+1HhP+o6D45Gsb2SrohHl/PACOPBJULC4CWPB
	2J+jGy97zCSeBae76tgmTyWdmPRY=
X-Google-Smtp-Source: AGHT+IFIPqTfnhk6FPxdV3GH4AYquqbLfOA6DSr10iylUvN2fvjV5sJM9a8I5o6+bw9IwkO+BVvQcj4Si0UGBbntnaM=
X-Received: by 2002:a05:6512:3e09:b0:543:9b0d:d388 with SMTP id
 2adb3069b0e04-543f0f25369mr1674159e87.19.1738349906418; Fri, 31 Jan 2025
 10:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
 <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
In-Reply-To: <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 03:57:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
X-Gm-Features: AWEUYZnXEnzSkyH22Y1Hiq-WeTYacue4wQNixNlwBXfwAecfzlc0IVNBozaxrGM
Message-ID: <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 3:40=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Fri, 31 Jan 2025 at 19:35, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Tue, Jan 14, 2025 at 12:53=E2=80=AFAM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Due to the fact that runtime const ELF sections are named without a
> > > leading period or double underscore, the RSTRIP logic that removes th=
e
> > > static RELA sections from vmlinux fails to identify them.
> >
> >
> > Dumb question - why can't you rename the section 'runtime*' to '.runtim=
e*' ?
> >
> > .rel* matches to sections that just happen to start with '.rel',
> > which may not be REL or RELA.
> >
>
> That is what I proposed originally [0] but it was shot down by Linus.
>
> [0] https://lore.kernel.org/all/20241014125703.2287936-4-ardb+git@google.=
com/T/#u


Does this work ?

$(OBJCOPY) --remove-relocations=3D'*' $@




--=20
Best Regards
Masahiro Yamada

