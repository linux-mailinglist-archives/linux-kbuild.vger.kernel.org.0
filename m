Return-Path: <linux-kbuild+bounces-4706-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C59D1ADD
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 22:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DA03B21EE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 21:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334E31E7C0B;
	Mon, 18 Nov 2024 21:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCwFGM4m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79D1E6DC7
	for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2024 21:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731967130; cv=none; b=oSnHljn3ejQYlPt69bfqtN0d83xLS1dkeUQlt372YgAOweDyybnB5L6/bGW0J3XxvPRqbuVfsrMhtvP5+kE8Fxp0ukoTeR69gl9hMyTJHD2/fPBifhnqXTFShEVRDu5iiGycFjYKzfCXNzNmuGmBZ0yCu5Qg7vwwIz63vL07C80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731967130; c=relaxed/simple;
	bh=hQkH15gr6Qgm2KoVe/ThQVUD4flOHdtYi2Q7pTwd0MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOztBeL3dk/f7irexRzVJkh6UrqNDOJwjMqkhNmLXq5L0v5ZD33v79SOWOSpQAT4NUBcOOo5dducLwZMXTwPyUz7vYh2qAqxNM9+LRFrGe63gzzHfnPkP41aoDFQg5Zgai3cfJ+qt3uCPC0/5Yg10XDhXcaIlVOhXn4Hn75zQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCwFGM4m; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cfb81a0af9so3404a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2024 13:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731967127; x=1732571927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ3Et6WIBdQ7sud4i/NonpGyXfau4X1TNW+PUgugafE=;
        b=YCwFGM4m7dm3zFbfStEWvyaCFaFZgAlEnsbWu0wmvgKiX3fe9zlLm1kZwFEwV+Y7q/
         crJtP3SJxgkueA8WSOKJrQIztfNl6bxSkwKeJvsVh0iA61LK0rsBcohX1jJhvdneuxvN
         /JFSN23ZmIszzCTZL+nvL4lxcm/2fAI+LK17pHRid03SQFt3q63VmmkkbI+0rejeoaW8
         uXawDrsKcpcfBip21IbCPgpMygCAEMCqEMCfPoxlmnLiUQGU6suyP8I71Zgo8TKnWikf
         6Uais1OpfOsGBQQQfOpbIOIx+/02IIGLk70py3jHHlQAJ+Hpt3Bm5bakqdoZ96pTz05s
         d63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731967127; x=1732571927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ3Et6WIBdQ7sud4i/NonpGyXfau4X1TNW+PUgugafE=;
        b=oolaCNFui0y3DU9ZtH1+X2/gjxCnwx3v4fSJuCT7yQS4o5LJKgH5XxEOlgz2PHwbV2
         22a2qGIRJ57RHL/t41wwH2wS4T8OScYLRXoKOzIrpNRGtHGtlPp1pbRTEGlhJ/uyfV28
         uOan+BcQt6mMaETAe9K9wNX1qv58x/fi54xhLWO9B+0W9ZTOlgomY/R57MIoRfzvzf3C
         PRlUW5AUJ+kbisKUyVoNAItrZM5CABtgMPoqSAVmcRDRxMDL00pnn9l89zlqK2hl+vI5
         mCZ/9fdLiu20kTLm51ZtITcV4E169RtES5ZV/ffZ5cdHSAHA14wkRlEi0ysAz92XJlMQ
         AIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUVRz7Mb+/3QwV+jRIcOyC2HFSNLE1NQjyEBVKZVYfCqmyVURaEQ9shSVhDSAx7uF8NFaPKyPDYQduXUGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3TVHeNODRob3AqGQN94heqs6aqRzBEED1e3i3Ucy4x2a/jht
	fx4oHbALOzMSHfaMO7vTbMKUyk/S1/jmNELrOu1xjoOprB38Zq7rlVK4j9w7OCY0OAR4OYEV6Ft
	RepspPmv3iY4N6vhBuH9EbIzj1DAJEknhFpyJ
X-Gm-Gg: ASbGncth6DfL4ci7tofrR2CSpIRb8Oq77m91QjpxnsQ0+lie3GK2BvVru6udwmB434Z
	B9J4uyVM8SsWhKSNxzuUz75cFDjJKb8kMzQRv3JHKuqvqeSIiwHo5MHnJ3U4=
X-Google-Smtp-Source: AGHT+IED/n5r3VjG+Ri+3OnSZ0XSX0QLyw7ggJKkFG+u6FSu0srLpXwOc/cszXrN20qB0TpblSw7+zX2Fd7l9uwnoW4=
X-Received: by 2002:a05:6402:50c6:b0:5cf:deaf:ac2 with SMTP id
 4fb4d7f45d1cf-5cfdec1bb2cmr23256a12.2.1731967126565; Mon, 18 Nov 2024
 13:58:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com> <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
In-Reply-To: <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 18 Nov 2024 21:58:09 +0000
Message-ID: <CABCJKufVpx4dsr7A44qA0ydwTEx+3Qy_OMx9Ch6OKa4nzvRj2g@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 16, 2024 at 9:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Nov 14, 2024 at 2:54=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Hi,
> >
> > On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > To avoid duplication between host programs, move the crc32 code to =
a
> > > > shared header file.
> > >
> > >
> > > Only the motivation to use this long table is to keep compatibility
> > > between genksyms and gendwarfksyms.
> > > I do not think this should be exposed to other programs.
> > >
> > >
> > > If you avoid the code duplication, you can do
> > >
> > > // scripts/gendwarfksyms/crc.c
> > > #include "../genksyms/crc.c"
> >
> > Sure, that sounds reasonable. I'll change this in the next version.
>
>
> BTW, is it necessary to share the same crc function
> between genksyms and gendwarfksyms?
>
> If CONFIG_GENKSYMS and CONFIG_GENDWARFKSYMS
> were able to produce the same CRC, it would be a good motivation
> to share the same function.
> However, as far as I tested, gendwarfksyms generates different CRC values=
.
>
> When a distro migrates to CONFIG_GENDWARFKSYMS,
> the new kernel cannot load old modules built with CONFIG_GENKSYMS.

No, it's not necessary to use the exact same function, this was just
to avoid adding more external dependencies.

> So, there is no need to share the old code.
> Another solution might be to use crc32() provided by zlib, for example.
> It requires another external library, but this already depends on
> libdw and libelf.

Makes sense. I'll switch to the zlib implementation in v6.

> > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > >
> > > Does this Ack add any value?
> > >
> > > Acked-by is meaningful only when it is given by someone who
> > > maintains the relevant area or has established a reputation.
> > >
> > > $ git grep "Neal Gompa"
> > > $ git shortlog -n -s | grep "Neal Gompa"
> > >      2 Neal Gompa
> > >
> > > His Ack feels more like "I like it" rather than a qualified endorseme=
nt.
> >
> > Like Neal explained, an Ack from a potential user of this feature
> > seemed relevant, but if you don't think it's meaningful, I can
> > certainly drop it.
>
> Tested-by is more suitable if he wants to leave something.

Ack. Neal, I'll drop the acks from v6, but if you end up testing that
series, please feel free to add your Tested-by.

Sami

