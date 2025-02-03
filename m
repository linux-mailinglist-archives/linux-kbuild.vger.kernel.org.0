Return-Path: <linux-kbuild+bounces-5602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A378CA2516E
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 03:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605C61883D15
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 02:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1EC13B787;
	Mon,  3 Feb 2025 02:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go7x2/Wt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD62A1CF;
	Mon,  3 Feb 2025 02:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738550728; cv=none; b=O1DeM4uQ2D5N6pPwrnC8hd1xVJRfUCVvKLV+mJvwtqs1VWwOv92606bWHekh54XstMoi66c+PB3Q9OG794IQR2V+zhszvyPd203CD+ahvUkD5eegNePSgh/7+K03JLU2vBP3sbNOWwyjou44gomsRAvxpBwiUqssOJ7TucxaY3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738550728; c=relaxed/simple;
	bh=XG0mbk49V0NegpRPkM/klHrf0dbF+cSTFHmpA1Udj3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+oLTsA46HOvb4QKZafFMZ3sj7F8TFY8OS0I8jiNIqrgQtPfdTnxWhwgQGzlK6dOZc8tzqi8Vukgu7gUODoEyd9u8mHplTIvTdbJUvkjS79kVMU1VnTbKATuFsjXIFViZ9BapctRCv3n7hWgdiMOkLKYFqB+7aZ+z+NJMa/VgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go7x2/Wt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D4FC4CED1;
	Mon,  3 Feb 2025 02:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738550728;
	bh=XG0mbk49V0NegpRPkM/klHrf0dbF+cSTFHmpA1Udj3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=go7x2/WtXYy0hLH6pqkLK2jH/711U2X2oMk9dT1Z8HVFpotT2Or4QLGsBtfsChE+g
	 hroh2pPDSwAsxkXTU9RyZzhy40edDypULqoxfjIShLGiqP7xfzT6Nv7UCjyubFoTaN
	 /4hKoc9577HbNgho5r7M1JZouZvEeUwa0vnRK+fntdwpqLKKpZGrfGqoYDI+52N99F
	 RtDIe/6qhEjXT0JcqHTK6cGMLjeCSIlMP5gmKtRUo6G6tq7+MtlrmcV0YLLa/Tbw4V
	 qEUd5DWFLoAcCOAG7cVoU/ewlCTlNL06QELTGFv36rLR3IFldwmKeAGNkaDj6Sy9Qz
	 zzASm9T3lzqCA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401ab97206so3745469e87.3;
        Sun, 02 Feb 2025 18:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWQxKgaIS1C/8fR2GGAHXvZv2EcJPin5cVOtDbno+er2rTuutzdMyOa9NUeAWZ7Bti0CInWrf1@vger.kernel.org, AJvYcCUgUNF8KI6eGBpFX43o5YpXWXquiqnOwz3pUsUYsZyaSVjCAzvn6eTwjDZ5Ak5LRahTQvAt9qs3HxF4wRQA@vger.kernel.org, AJvYcCXdtwJXC+bpP0CCC/rhEv4Kfu0yazGhsKVcfiW2DmpipDwv85aUB41HPaLu/DAkee9rJ8WUALhjlsZqgyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJec9mtVokbVo0+cWQCaxa5iZehe5vtm05pQyqze4KSNafMQZ
	LtsMEyJ6Z1Y9jyzfV2oGBTMM+nUvXHWeP/I7bQ1jWCgsHyybRMlKxnGijDzP8I6krnjSEguJwoq
	2RgIUIlj8fay7m2+kC57BbnXJKeg=
X-Google-Smtp-Source: AGHT+IF19tgvw1mISx/p0V+qRrWjG/6aPn50rV6owggCPM3zdZ5zMVnvGZCfSqZJQIyAy+OpQLR1IKKpsG5KU1fPEMQ=
X-Received: by 2002:a05:6512:1249:b0:542:250d:eef2 with SMTP id
 2adb3069b0e04-543e4bea4b0mr5980225e87.20.1738550726692; Sun, 02 Feb 2025
 18:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh> <20241115083940.GA3971@francesco-nb>
 <2024111541-antiquity-footpath-e221@gregkh> <ZzcYLAFqTSlFm2uF@gaggiata.pivistrello.it>
 <CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com> <Z580LZIi2iXGzSv5@eldamar.lan>
In-Reply-To: <Z580LZIi2iXGzSv5@eldamar.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Feb 2025 11:44:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFfUexOjoBsr385ECC61k-oNzefRZtTtNhdGV01r-iXg@mail.gmail.com>
X-Gm-Features: AWEUYZmdMaCVBGU-SkjDQ6frrwUMLHsMGxpEaxqc-tBhI4EQgCXDmMgjchDjdvI
Message-ID: <CAK7LNARFfUexOjoBsr385ECC61k-oNzefRZtTtNhdGV01r-iXg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Parth Pancholi <parth105105@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Parth Pancholi <parth.pancholi@toradex.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 6:00=E2=80=AFPM Salvatore Bonaccorso <carnil@debian.=
org> wrote:
>
> Hi Greg, hi Yamada,
>
> On Sat, Nov 16, 2024 at 04:51:48PM +0900, Masahiro Yamada wrote:
> > On Fri, Nov 15, 2024 at 6:45=E2=80=AFPM Francesco Dolcini <francesco@do=
lcini.it> wrote:
> > >
> > > On Fri, Nov 15, 2024 at 10:22:13AM +0100, Greg KH wrote:
> > > > On Fri, Nov 15, 2024 at 09:39:40AM +0100, Francesco Dolcini wrote:
> > > > > On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> > > > > > On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > > > > > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > > > > >
> > > > > > > Replace lz4c with lz4 for kernel image compression.
> > > > > > > Although lz4 and lz4c are functionally similar, lz4c has been=
 deprecated
> > > > > > > upstream since 2018. Since as early as Ubuntu 16.04 and Fedor=
a 25, lz4
> > > > > > > and lz4c have been packaged together, making it safe to updat=
e the
> > > > > > > requirement from lz4c to lz4.
> > > > > > >
> > > > > > > Consequently, some distributions and build systems, such as O=
penEmbedded,
> > > > > > > have fully transitioned to using lz4. OpenEmbedded core adopt=
ed this
> > > > > > > change in commit fe167e082cbd ("bitbake.conf: require lz4 ins=
tead of
> > > > > > > lz4c"), causing compatibility issues when building the mainli=
ne kernel
> > > > > > > in the latest OpenEmbedded environment, as seen in the errors=
 below.
> > > > > > >
> > > > > > > This change also updates the LZ4 compression commands to make=
 it backward
> > > > > > > compatible by replacing stdin and stdout with the '-' option,=
 due to some
> > > > > > > unclear reason, the stdout keyword does not work for lz4 and =
'-' works for
> > > > > > > both. In addition, this modifies the legacy '-c1' with '-9' w=
hich is also
> > > > > > > compatible with both. This fixes the mainline kernel build fa=
ilures with
> > > > > > > the latest master OpenEmbedded builds associated with the men=
tioned
> > > > > > > compatibility issues.
> > > > > > >
> > > > > > > LZ4     arch/arm/boot/compressed/piggy_data
> > > > > > > /bin/sh: 1: lz4c: not found
> > > > > > > ...
> > > > > > > ...
> > > > > > > ERROR: oe_runmake failed
> > > > > > >
> > > > > > > Cc: stable@vger.kernel.org
> > > > > >
> > > > > > What bug does this resolve that it needs to be backported to st=
able
> > > > > > kernels?
> > > > >
> > > > > This is not solving any existing actual bug, and therefore there =
is no
> > > > > fixes tag.
> > > > >
> > > > > The issue here is that the kernel build system is using lz4c, tha=
t is
> > > > > deprecated since 2018, and now distributions are actively moving =
away from it.
> > > > >
> > > > > openSUSE Tumbleweed and OE already removed it, so you would not b=
e able
> > > > > to compile a stable kernel on such distribution when using lz4 un=
less we
> > > > > backport such a patch.
> > > > >
> > > > > Everything should be properly documented in the commit message al=
ready.
> > > > >
> > > > > My understanding is that something like that would be a reason fo=
r
> > > > > backporting to stable, if my understanding is not correct we'll r=
emove
> > > > > the cc:stable and send a v3.
> > > >
> > > > Please read:
> > > >     https://www.kernel.org/doc/html/latest/process/stable-kernel-ru=
les.html
> > > > for what meets stable kernel requirements.  I don't think that this
> > > > patch is that.
> > >
> > > Greg, ack.
> > >
> > > Masahiro, can you please let me know if we should send a v3 with the =
stable
> > > tag removed or you can remove it yourself when applying?
> > >
> >
> > I applied this with the stable tag removed.
> > Thanks.
> >
> > (I guess someone may want to backport this eventually,
> > as such distros cannot build stable kernels with ld4 compression.)
>
> Yes please :)

Agree.
This should be back-ported.






--=20
Best Regards
Masahiro Yamada

