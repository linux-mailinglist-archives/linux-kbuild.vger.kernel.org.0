Return-Path: <linux-kbuild+bounces-5587-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E22AA2433C
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 20:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0839C3A7D13
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 19:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10931F2392;
	Fri, 31 Jan 2025 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txIOvCgk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8073328373;
	Fri, 31 Jan 2025 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738351664; cv=none; b=Ha8zTanmK9tbygKl3+e4zvAvh0uPfrYuHGD1T1dpRC1Krf8YlUNZkOZEx0zee7uWnfrEmXf+rZy5IjSJ7AbvfKdIPzR6GkK2go/NFEdphF9ieEMO49TIkbVb00vUjiwC9z5DqcHgHCrjqLWrsbZjRPA0acPxfpxnobnN4nNFHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738351664; c=relaxed/simple;
	bh=8ZjHAEUnHwb/OxfM2C7tCwLOoq0d4EVrXFDpiPBwwaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3GYYOmI/nnyR8p7jndzH8vAnaguNBLrnSjEzd9A52ofkkZCQat7q0eeFcUMVN6okUcxydJbw+AQyPn/HaVnQTbfy5NpVBZy0GDNKfxgeuJpWyQhH10bqXGktVsav8IDabxcdDHnFEfiSlXSgTiIk9UImn2zCabysaM4BEpfVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txIOvCgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30B7C4CEE5;
	Fri, 31 Jan 2025 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738351663;
	bh=8ZjHAEUnHwb/OxfM2C7tCwLOoq0d4EVrXFDpiPBwwaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txIOvCgkpu/lOG69LFDj5JBLEKhf69uclQlwLcLnC6J5VwmMQWh9lvQkCLvHllwvV
	 D54AbWA3FVsI/Le0gRBTbxL//OZ6mP/MoM8ZXDL86Pp2oC9hIM2iK1HOPYnhoPWNZ4
	 wh5Nb/gJrFUdVx51POAsFhSbnyTXpxOrQ8Pv86TBr4u3x85icGkSp8NPkhMoXMXFhO
	 xd07dTxVlyfxycXBFZqI/01gunv5N8e/zDO7Q7ORRwzlVQbOJ2MjkO+JyofW3PtMDM
	 DPWvCo7bTo9mddgmQ05l6TrV/DVrj+3J0Y5U04cAo8Q+jvPiBnANj+4LDmZpkVL39S
	 RaAjKx+qa0ovg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-304e4562516so22957761fa.1;
        Fri, 31 Jan 2025 11:27:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUda35KgUxbhgtQHd3wF6hdkEmeRy99hSQ2av1BjRqAcRBFRGOMyTdD/E+MbGEO/3Z1Avh2oDM1gp7z1g==@vger.kernel.org, AJvYcCWQA38QS/HQWCCV5V9+rA89iueDeYFf0QfHwKm8EiCuv/uy7eFsgpHmRpSQ4TmvZbwJljr4aVRj6MzT+gY=@vger.kernel.org, AJvYcCXIuSlVwXU2eZxixSmYsU25fFFRHisVJcQWW6+8ts5mxwufY0pF+n4ANBKMW72jAnupFwNQYScVlBiTdK6d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DWSXyO5mpvVYTDzDqi/wRhdWkrgD58W0+RYrBVLDqNte57v+
	OsrTcqd852uY/nXa4BAaUWLULKSmKDOD6ml6KhM17Ley9l28Go8jjMk6rNNZSs6Qt+zEI3DZz6A
	75jGiHflzaYCldSH1fhyY9+bqEl8=
X-Google-Smtp-Source: AGHT+IG2RakmGGM1ifb4d35368XxTcUkemgdpicReeEmtk37Jf3VqXy4jG1UwPWDnmp44ziy6t68f/4RjUVGL78PYO0=
X-Received: by 2002:a05:651c:243:b0:300:182b:91a0 with SMTP id
 38308e7fff4ca-307a10d315fmr31677561fa.7.1738351662525; Fri, 31 Jan 2025
 11:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
 <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
 <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com> <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
In-Reply-To: <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 04:27:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYYSQe5O0eWP0DZ_NJOd6Z+qUS99-QYEWnQhVJdBmyhA@mail.gmail.com>
X-Gm-Features: AWEUYZkme6hiFtxkMTL26YwECmBvllAYv8R14z3ZK-yBJQzRbAelQsPtQwz4I5I
Message-ID: <CAK7LNATYYSQe5O0eWP0DZ_NJOd6Z+qUS99-QYEWnQhVJdBmyhA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 4:02=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Fri, 31 Jan 2025 at 19:58, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Sat, Feb 1, 2025 at 3:40=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> > >
> > > On Fri, 31 Jan 2025 at 19:35, Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> > > >
> > > > On Tue, Jan 14, 2025 at 12:53=E2=80=AFAM Ard Biesheuvel <ardb+git@g=
oogle.com> wrote:
> > > > >
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > Due to the fact that runtime const ELF sections are named without=
 a
> > > > > leading period or double underscore, the RSTRIP logic that remove=
s the
> > > > > static RELA sections from vmlinux fails to identify them.
> > > >
> > > >
> > > > Dumb question - why can't you rename the section 'runtime*' to '.ru=
ntime*' ?
> > > >
> > > > .rel* matches to sections that just happen to start with '.rel',
> > > > which may not be REL or RELA.
> > > >
> > >
> > > That is what I proposed originally [0] but it was shot down by Linus.
> > >
> > > [0] https://lore.kernel.org/all/20241014125703.2287936-4-ardb+git@goo=
gle.com/T/#u
> >
> >
> > Does this work ?
> >
> > $(OBJCOPY) --remove-relocations=3D'*' $@
> >
>
> Only with binutils, not with llvm-objcopy


Applied to linux-kbuild.
Thanks.


--=20
Best Regards
Masahiro Yamada

