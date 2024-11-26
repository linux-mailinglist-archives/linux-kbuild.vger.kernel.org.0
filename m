Return-Path: <linux-kbuild+bounces-4876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDC9D9BCB
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 17:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8022F280F9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 16:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3746313C80E;
	Tue, 26 Nov 2024 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsDaQiqq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD4DF60;
	Tue, 26 Nov 2024 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639787; cv=none; b=FQDKoVJLQvzTXm+hDphg2JOZN1YCTmnDvBKRPdBxrHIQgkdgDsgIq4L1rbK/6wdRds6DW3Q3zO8ZL6KIqFAZG6XE0WrgYoRcYxVlStidvglArS9DoUuVtdOxyb5/zdggQdr+pc5EepHas8VyeY9XIBiHqmeIymaNIXkCNVacRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639787; c=relaxed/simple;
	bh=ULVZkUVpPyuoV/jx7FwrJg9O52Q/jEMQNSXnmwgn79s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AC8TYY5BwWtUGW/cwnqM8ElYBhoPmZeqdj1/pFKL+Vk9LCgN7v6WQzeIU2MRY7hzof+vn2VYQ3pArQf0AijwsTsnXaats4qwq2PxSiu5x55vDfKJ0fiU3TrDuOZbnKPvw0DB8DhFrj0r8qMDNa1BnAuoPlB+ca4OmKNB1BlY8bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsDaQiqq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffd4c03a32so1733521fa.2;
        Tue, 26 Nov 2024 08:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732639783; x=1733244583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oADn+iPT5XDeRAFUULaljb47zne7h8r5+7JZ961sH5g=;
        b=ZsDaQiqqktWI+7gNfECrISd3iI1PWT8wc67cTS3O1bMlA6t1oBtnvbsxJmSVmelk09
         im3av0X2NiCaJFx52L7bwVkeo/yzC1MJih+ic8a/662YiYgw1wsfXLpgqpSJP2nfmE4b
         HCwd7MOCYqOYNDfjjaneTGu2SWVE5JaFYueSr1qoSwHS2flXDD+Ow3hMnVxcZyiyGeSc
         fSXDbqRZVqDFBcbVcjQ6XPakiLSE5icySU9ST5TFnG/NGiHEUdx78/eMq98YXhkGno1O
         lRFMkeNPBFa+2K4IXMA2hdhxcU62JRNJOJFwZNactNTHUARjfkNTW/bP6QdBzWQ3gHna
         ub8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732639783; x=1733244583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oADn+iPT5XDeRAFUULaljb47zne7h8r5+7JZ961sH5g=;
        b=q2DejbujzoF261miWEizClfufkpjbqKVgDKhoG4BPRUQ1gD/MRupe3Jlb03tfSlRI9
         fakMPAuWBx9Y5Wf0Ad+enDZQ9I+Er/lFideU9xtgmYBmQqfO0MtLqrVyG8+T348f7qSS
         WHvwb3b5at3etgsdBIzz68WHvOTwLpsUdvcfuxxCXV+rz8s5xiG6LF201ErbrEklpQ3r
         TReHxaCADU8qFl2YQy2pEqv6By2OrcsUX6Wk6hCSQcJJH2TGJOIKOAz9HTU4Y803ehs6
         grmxpYv++K3lbzgWycrO63WRu4tDPJMBekT+A/EfaOzo+V57H096dV1L6Hb30xiZP9BT
         hpqw==
X-Forwarded-Encrypted: i=1; AJvYcCWEikXWunQWN8ujnQi08vz4N/ilxl3jaEJ3+24Q2QVBsDrCE75+T2R7KaKS+wkFvy4297zCq/ld86CiKZY=@vger.kernel.org, AJvYcCXGxgEH4yjEU1zvJNgErl64UKgJNpsyatf1anY3pUwyKpXGD8Wki1sDCT0Tc11t/rjAL32kQVGHBtJXMq/B@vger.kernel.org
X-Gm-Message-State: AOJu0YyAinKPa2W6xRUpDXSPR8EOEBqSUk/zZ9easHWZlV5hJEUnVuoV
	giXaJ1uon9UMsyKzG5IMl98YtP8LYAgOW1FcUsKRUiHmdu9HVh3+YtwKOY/xn/CvCQHaALvTeRR
	dxey8w5mUi6NhFwSvHv35GeNAnOqnFtIW
X-Gm-Gg: ASbGnct97cT6Klq0Z/uzgYjh0AGUkCHGUJ1Lc29bi3V3AC7Ut4lkpSTdXdbuOw8pumd
	b0TbT2LyHLYuIQp95TikLtOoQH7JgKG0FtLpcGAE+8VURus0QZ21O9BZrE5dn
X-Google-Smtp-Source: AGHT+IHv/dmJqwBNoJ26KNKACfA2CpfTA1jKhep/gdg7DDIKfmr+HqNEwlEqOLmiovrcQV+A5iBJ/TLTx59KtCbWGNM=
X-Received: by 2002:ac2:410d:0:b0:53d:d3f1:2f4b with SMTP id
 2adb3069b0e04-53dd3f12f92mr7100520e87.30.1732639783148; Tue, 26 Nov 2024
 08:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126155832.15560-1-sedat.dilek@gmail.com> <CAK7LNAQh1VqXmw=zTJaAbDum0G0CweDHzQZ-eJgfBR6ZinnC6Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQh1VqXmw=zTJaAbDum0G0CweDHzQZ-eJgfBR6ZinnC6Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 26 Nov 2024 17:49:06 +0100
Message-ID: <CA+icZUVqrtw0QkDEQ8OX9bH8uX3cg98jSV1kOyOeOa-3Qsp49A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fix names of .tmp_vmlinux {kall,}syms files
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 5:46=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Nov 27, 2024 at 12:58=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
> >
> > When playing with gendwarfksyms v6 from Sami Tolvanen I noticed:
>
> The gendwarfksyms is unrelated.
>
> >
> > $ LC_ALL=3DC ls -alth .tmp_vmlinux*
> >
> > -rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux2.kallsyms.o
> > -rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux2.kallsyms.S
> > -rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux2.syms
> > -rwxrwxr-x 1 dileks dileks 101M Nov 22 20:52 .tmp_vmlinux2
> >
> > -rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux1.kallsyms.o
> > -rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux1.kallsyms.S
> > -rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux1.syms
> > -rwxrwxr-x 1 dileks dileks  52M Nov 22 20:52 .tmp_vmlinux1.btf.o
> > -rwxrwxr-x 1 dileks dileks 514M Nov 22 20:52 .tmp_vmlinux1
> >
> > -rw-rw-r-- 1 dileks dileks 2.1K Nov 22 20:51 .tmp_vmlinux0.kallsyms.o
> > -rw-rw-r-- 1 dileks dileks 6.3K Nov 22 20:51 .tmp_vmlinux0.kallsyms.S
> > -rw-rw-r-- 1 dileks dileks    0 Nov 22 20:51 .tmp_vmlinux.kallsyms0.sym=
s
> >
> > .tmp_vmlinux.kallsyms0.syms is NULL byte - it's a dummy file.
> >
> > Further looking at the other .tmp_vmlinux syms files:
> >
> > .tmp_vmlinux2.syms
> > .tmp_vmlinux1.syms
> > .tmp_vmlinux.kallsyms0.syms
> >
> > Change the naming of file
> >
> > .tmp_vmlinux.kallsyms0.syms -> .tmp_vmlinux0.syms
> >
> > While at this, fix the comments in scripts/link-vmlinux.sh.
> >
> > INFO: v2 is based on Linux v6.12
> >
> > Link: https://github.com/samitolvanen/linux/commits/gendwarfksyms-v6
> > Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkj=
tm4vSVKkXPTg+Q@mail.gmail.com/
> > Link: https://lore.kernel.org/all/20241123132237.15700-1-sedat.dilek@gm=
ail.com/ (v1)
>
>
>
>
> I removed unnecessary information.
>
> I left only the following description.
>
> ------------>8------------------
> kbuild: rename .tmp_vmlinux.kallsyms0.syms to .tmp_vmlinux0.syms
>
> Change the naming for consistency.
>
> While at this, fix the comments in scripts/link-vmlinux.sh.
> ------------>8------------------
>
>
> Applied to linux-kbuild.
> Thanks.
>

Cool, thanks!

-Sedat-

>
> > Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> > ---
> > v1 -> v2:
> > - Add commit description and follow naming consistency
> >   as requested by Masahiroy san. -dileks
> >
> >  scripts/link-vmlinux.sh | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index a9b3f34a78d2..239fe036606f 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -203,8 +203,8 @@ kallsymso=3D
> >  strip_debug=3D
> >
> >  if is_enabled CONFIG_KALLSYMS; then
> > -       true > .tmp_vmlinux.kallsyms0.syms
> > -       kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
> > +       true > .tmp_vmlinux0.syms
> > +       kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
> >  fi
> >
> >  if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; the=
n
> > @@ -231,14 +231,14 @@ if is_enabled CONFIG_KALLSYMS; then
> >         # Generate section listing all symbols and add it into vmlinux
> >         # It's a four step process:
> >         # 0)  Generate a dummy __kallsyms with empty symbol list.
> > -       # 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and sec=
tions,
> > +       # 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and sec=
tions,
> >         #     with a dummy __kallsyms.
> > -       #     Running kallsyms on that gives us .tmp_kallsyms1.o with
> > +       #     Running kallsyms on that gives us .tmp_vmlinux1.kallsyms.=
o with
> >         #     the right size
> > -       # 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms se=
ction of
> > +       # 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms se=
ction of
> >         #     the right size, but due to the added section, some
> >         #     addresses have shifted.
> > -       #     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
> > +       #     From here, we generate a correct .tmp_vmlinux2.kallsyms.o
> >         # 3)  That link may have expanded the kernel image enough that
> >         #     more linker branch stubs / trampolines had to be added, w=
hich
> >         #     introduces new names, which further expands kallsyms. Do =
another
> > --
> > 2.45.2
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada

