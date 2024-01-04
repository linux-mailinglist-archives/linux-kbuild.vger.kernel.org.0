Return-Path: <linux-kbuild+bounces-464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1D824005
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jan 2024 12:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D4E285562
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jan 2024 11:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB98920DDD;
	Thu,  4 Jan 2024 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEZKKIhf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4620DF6
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jan 2024 11:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D6DC433CB
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jan 2024 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704366002;
	bh=QNlTNClwPlEEC6QlstmypMfevz5Oe6cwp4zY1EyQ13E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SEZKKIhfEFj4RR8NlDAB7JvdvTQkXzTsKDN9WveLDB27lDbLPi9+tSj76EmgT2C0u
	 jihxRAianhDn972WtbMPwG2VKl5g4vlQFZKWirG/I516gG7Y5fj/6omDvWphRmvarO
	 SiwbkToj8zjTfMwbnF+QCpSWPhdHPwARUkT/4e45wsZD14UoBU/dx+fl74Ngvs2gl/
	 ioj4r4Cro2VYo7emweFXTjb7VBXEhO4JvfEintskKMUUeOSSFSDGcPU+zP1apzbP+d
	 9kj8aOgB4Br8qL0d6Cj03Sby6Ilmk73fIGMV6X4eVknIzPyrPzK6KA5XCz0obO+vK9
	 ynMUJygns2X3A==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6dc759c8ddbso216350a34.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jan 2024 03:00:02 -0800 (PST)
X-Gm-Message-State: AOJu0YxCjH2rcdoAh9D9zni1CBmou4KlTXZ1j0yNbFibbdpaCFoBTnDh
	p0qAH2/Af4ObE62mXPVuBX8m9bAQKAfR8E5BioA=
X-Google-Smtp-Source: AGHT+IFO8//nIaNkJTs+JWuKZnB9mhyJVrnoRgEJzbk4exWG9bZuNkIzFhZlDYGUcgJlYxpyBzz2O1FmOxcVBklMWLo=
X-Received: by 2002:a05:6870:10d8:b0:1fb:75a:c443 with SMTP id
 24-20020a05687010d800b001fb075ac443mr227570oar.108.1704366001458; Thu, 04 Jan
 2024 03:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231227070317.1936234-1-kernel@xen0n.name> <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
 <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
In-Reply-To: <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 4 Jan 2024 19:59:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfU1kypaSkQmc24uhO49B452tJJAzvStpZeVBkijOPyg@mail.gmail.com>
Message-ID: <CAK7LNAQfU1kypaSkQmc24uhO49B452tJJAzvStpZeVBkijOPyg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore relaxation and alignment marker relocs on LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, linux-kbuild@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 5:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> On Wed, Dec 27, 2023 at 7:06=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wr=
ote:
> >
> > On Wed, 2023-12-27 at 15:03 +0800, WANG Xuerui wrote:
> > > And even though the kernel is built with relaxation disabled, so
> > > far a small number of R_LARCH_RELAX marker relocs are still emitted a=
s
> > > part of la.* pseudo instructions in assembly.
> >
> > I'd consider it a toolchain bug...  Is there a reproducer?
> Any updates? Should I apply this patch for loongarch-next?


This is odd.

At least, Fixes: 3d36f4298ba9
is unrelated.


The instruction to reproduce it was requested.

I did not see any error for defconfig
with loongarch64-linux-gcc 13.2 provided by 0day bot.




--
Best Regards
Masahiro Yamada

