Return-Path: <linux-kbuild+bounces-4874-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030C9D9B07
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 17:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0171605CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 16:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A936541C69;
	Tue, 26 Nov 2024 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZlvqEMH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FEC11187;
	Tue, 26 Nov 2024 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732637203; cv=none; b=g+YBTrz11cYnblwQASR1+OQwcruET9f/Ufv5Rroln5pptlaAd2VNu1TFZrknKee1mf+5swz7QI2Ro4hXDZqJNMYnQIbOuVusRSWIcMd/E9Vg8xr17M+fe/jX5XwODftF51MbwS5KRb7GaR1MSD8KeCxFO/tEKUToA8DLlyc1/Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732637203; c=relaxed/simple;
	bh=vhR8EYS1HdyobGuIsx2zE+xsEg9f0EW+yUJkI/S6m2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAynKMy9qbdjf6VLv4P9xSxV4tBq3SgPWME43u8fI8C6CSEPIMWykLsuYSzyatbDHq0CkDS8lcZjHrCvnQJrd92VYLn6sSvKJxrZZJZYXwk+tUjvJLRmn+O99kZNFOgrBDHiBE5lgg6Dv4+bW3FNAR2kv17wKfm6t7YNR7QRrns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZlvqEMH; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffa8092e34so53560041fa.1;
        Tue, 26 Nov 2024 08:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732637200; x=1733242000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UPu25mUUKvFoZUgYNn84ptNZ8OivHgiFe8NVIPaOQPE=;
        b=cZlvqEMHpAwHZMPkYmedfAt/0eGRbZBOF6qjdKUlUyKYJ5o/F+77JYgqHlkBKgtS5m
         Y31Rtf1ctCK/pk+WNS7nVYScnjslSKSfueQi0inuf3j0xMM5c8xSqtZvOrwiCkzHhHp3
         bp0juKc4qPHARgxDIH59Xa3FlBQ09565eCCf+uhQ5WkSiADljZE89z11ZVPJQ/8yctq0
         2xKHARhhSdPDRL62XJR6aUvMXEH4IHlfqICavUwv+G5EFpo233Bg7+oaBo68JvMMOGtZ
         mA6JHOzjs+k55U9S6FelamPvQ8ZqHSXOVyi69QsFNVswi+Pg8c+3wN4ehzOgW12PdE0k
         gY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732637200; x=1733242000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPu25mUUKvFoZUgYNn84ptNZ8OivHgiFe8NVIPaOQPE=;
        b=wUae9W4+xGO40heEK9vCoxpkjBaBlVpNOYvYWjBSi0NSJeqSPUhJLzrpkfobtWFMrH
         bRF1aOw+WjFOfaTTGylqanAO2dqbaQ1sNCZWIUeCEdNkaA8esycvWULO3k7mkaCg6HCa
         I4r0ZSY98xFBlCNKz1TSSGxoR2/HuR2ok2uaANQp6af7Hbr1RJyu7Qc6ZPFAMXQNFA7l
         beXvj/0dLTgBY9mOYmUhC14mAEhj+B2Sv2CoND5eNNd1U32Up00tYuG1SNlWvtEYHw94
         FYC20o97NvHqSSSdh4UxjPlpcAw6hNGwpG6ztS7xT8IpgCXTVtR3T2BSsiqQxdRhATC1
         4Dcg==
X-Forwarded-Encrypted: i=1; AJvYcCX5AozJVzxOm4ixId1MzCyU/peGYZLEqohlfDWZi/OpjJgYlRjuOjmlofxZ4odKAl96Eoe1sH8o0GB5TDUt@vger.kernel.org, AJvYcCXuGnH6s7rReZflZ2adbzbI5O+4RihJPLwleWMjrQyAlmAXoCAA2I7sYhbSkvziJ7q3nK2TH+bL5AewvU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuB4JKFFanmbbdrOnuhYSj+vyO4VXOb4c50AM5yiAmi26r4deb
	dblnfAGTi5ZiEurWuAz1f1L6U5WweQQfeK/aMOtVx11VV31fhKryAYqsN37iREl+zSqTPK3DNeS
	sFKyItbnivD1YrYqzka6BTGvuHJOJcTzh7Hk=
X-Gm-Gg: ASbGncux5zIt626I8jgLXYg8hNyvtki2OewM0DvtrizZA4F4RwTWjrDJ9CE3HAm53ie
	XRkr0ERUaMrpaFTUtkcPLOCNkJFOoN1iKpiBnaS+oEZvKceXGEDyrsjUb32x6
X-Google-Smtp-Source: AGHT+IF3O4OhVhX6crucATwShGKu57rGiArkEP3/ONwFG1pOW3Uf65l4a1pzA8CXGDNHAStYmXkYEmYpol2yWlICd0Y=
X-Received: by 2002:a05:6512:3983:b0:53d:ea3c:2ba0 with SMTP id
 2adb3069b0e04-53dea3c2d2cmr2029862e87.16.1732637199583; Tue, 26 Nov 2024
 08:06:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123132237.15700-1-sedat.dilek@gmail.com> <CAK7LNAQL4Ht5W2qZrx5+ACX7Xc0pr4FRht7jYFyyjUKR1Afi=w@mail.gmail.com>
 <CA+icZUV9Wbpw5DbGgkd3BYrU5xA9A9rHnX85Mc_4u6PajygjiA@mail.gmail.com>
In-Reply-To: <CA+icZUV9Wbpw5DbGgkd3BYrU5xA9A9rHnX85Mc_4u6PajygjiA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 26 Nov 2024 17:06:03 +0100
Message-ID: <CA+icZUWfoP=-dpEYjQU5RZxESYyxjXsQZ9=PiVfKUD71DFb6MA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix names of .tmp_vmlinux kallsyms files
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 4:12=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Tue, Nov 26, 2024 at 4:01=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sat, Nov 23, 2024 at 10:22=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail=
.com> wrote:
> > >
> > > For details, see thread "kbuild-next: .tmp vmlinux syms files"
> > >
> > > INFO: This patch is against Linux v6.12.
> > >
> > > Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsE=
kjtm4vSVKkXPTg+Q@mail.gmail.com/
> >
> > This is not the right way to input a commit description.
> >
>
> Hi Masahiro,
>
> I can add a proper commit description in v2.
>
> >
> > >
> > > Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > ---
> > >  scripts/link-vmlinux.sh | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > > index a9b3f34a78d2..c9088436baff 100755
> > > --- a/scripts/link-vmlinux.sh
> > > +++ b/scripts/link-vmlinux.sh
> > > @@ -203,8 +203,8 @@ kallsymso=3D
> > >  strip_debug=3D
> > >
> > >  if is_enabled CONFIG_KALLSYMS; then
> > > -       true > .tmp_vmlinux.kallsyms0.syms
> > > -       kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
> > > +       true > .tmp_vmlinux0.kallsyms.syms
> > > +       kallsyms .tmp_vmlinux0.kallsyms.syms .tmp_vmlinux0.kallsyms
> >
> > If you aim for naming consistency, this should be
> >
> > .tmp_vmlinux0.syms
> >
>
> OK.
> I was thinking of this, too.
> I can change this as well.
>
> The rest below is OK?
>
> Thanks for your comments.
>

Info: Sent v2

Link: https://lore.kernel.org/all/20241126155832.15560-1-sedat.dilek@gmail.=
com/

> Best regards,
> -Sedat-
>
> >
> >
> > >  fi
> > >
> > >  if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; t=
hen
> > > @@ -231,14 +231,14 @@ if is_enabled CONFIG_KALLSYMS; then
> > >         # Generate section listing all symbols and add it into vmlinu=
x
> > >         # It's a four step process:
> > >         # 0)  Generate a dummy __kallsyms with empty symbol list.
> > > -       # 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and s=
ections,
> > > +       # 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and s=
ections,
> > >         #     with a dummy __kallsyms.
> > > -       #     Running kallsyms on that gives us .tmp_kallsyms1.o with
> > > +       #     Running kallsyms on that gives us .tmp_vmlinux1.kallsym=
s.o with
> > >         #     the right size
> > > -       # 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms =
section of
> > > +       # 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms =
section of
> > >         #     the right size, but due to the added section, some
> > >         #     addresses have shifted.
> > > -       #     From here, we generate a correct .tmp_vmlinux.kallsyms2=
.o
> > > +       #     From here, we generate a correct .tmp_vmlinux2.kallsyms=
.o
> > >         # 3)  That link may have expanded the kernel image enough tha=
t
> > >         #     more linker branch stubs / trampolines had to be added,=
 which
> > >         #     introduces new names, which further expands kallsyms. D=
o another
> > > --
> > > 2.45.2
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada

