Return-Path: <linux-kbuild+bounces-4872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038FA9D9A3C
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 16:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7332841A0
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 15:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D5A1D5CFE;
	Tue, 26 Nov 2024 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwYkzVdj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D71B85E4;
	Tue, 26 Nov 2024 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732633973; cv=none; b=uc+Tshq0cGLK+hOMVtXKUJFAt9aElbh0125lahTcrmhqQskQ0ncu8VRz+RdMKGVIAqPlQSIemCQrTVg55019vf9TsYU5E3okkdMpFCRcx7+q8UDz6Q9pLHbJ4t429qMi6r4lY1rPlG6KLoNlcLtaUglNYIr8FbaNfnfJZuyAMFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732633973; c=relaxed/simple;
	bh=1cDWZTRMPL38LJP5sGJcBCBhpS/kHENxHbMHPpkOpeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teXUxUtjMSTvdBSzXVEnRhulYjw2ZS3K7dxyf5Y7HiVnP4tFL/v8vuT+98qScpTnH+9Xbuwoq8c7m1llE80WVNVqkzjnMl2uUYgaKHs6jCTYNuooUjC+sw8iGDaprDwTNlM6Y/Iv/RkcHGVkCp+Okpjbo7G2PzH7DCrgLVIfTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwYkzVdj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffbf4580cbso26393721fa.2;
        Tue, 26 Nov 2024 07:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732633970; x=1733238770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MgEjlw55Z49/v6BoNwsnoX/cUraYKdi/pNCtZCSB7Ko=;
        b=BwYkzVdjR9G/W+cgGSMt7Cf9aQyvppQPnrR5ZwDepJMXXY2yh6CUrCZZY17uhOX7MG
         iWo/vBJpcgxiE2ssXc71001fwBLhWj8nj2wjM2zvwOE+G1I9MIjrkx9mklWPdExNWnH1
         wvnwafcqbenXsoRkJOYjvbGqKe1MynKAIQ6zvWvY7b6TRmom+q5XGVnU6pAcfiTeRyML
         jGRUS91Fmmi8Det6mDiuYdy8REZLsv6/qY6+urD56MEvANujdUTTmNGbSNL+hj/C2mAh
         QkgCxhggGSvf+Ld1qEVuPk1pGl3TFdr1dJosSCtFFohkdQm7ZUT9Zaf8wkkwGZbkPqwX
         z3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633970; x=1733238770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MgEjlw55Z49/v6BoNwsnoX/cUraYKdi/pNCtZCSB7Ko=;
        b=vQDxZjy4PCV/imx9oE8ujVLVuXZeeEPnabkFhSCYL+ZYYo+rZ6m+Z+6S3CIHMZ0l+P
         rL+ksHIDpuxNwgr4oUsMkoBeCAdZFhNdscUoiE2FILWeqkKqJUlCVxn99JNbrdMeKdZe
         ak8yJNycW84pIzslMry78qt2wiuvzC+n0k5U7LtVVvIlaHVMUsY0XsJr+S0BapCNrhXV
         GJ6TXoCbGyyjGn1HDgwBgWN3yMO61Jdyljx/aHxMu86ISJqIMVcKecPnsOvP9rPSHqNo
         20R635VvQHrBXOM5csgIG3FEMprsQ1SMp/mOL0Pg/V5aF1l/gRPVbEdMEH3F7kuERzD3
         UhOA==
X-Forwarded-Encrypted: i=1; AJvYcCUdYem0lEsT04UP44KToZcqAgNf3PnbSVncPSvuaDHKrdT56RBV3oNLP39DrIyiBJkCR/0eW5sMlcczPRyN@vger.kernel.org, AJvYcCVJLvzsW0XZsh+mjhBL8KtmO70e0fonozHwHKbmVSSKAx4clqR5XzFLt5epr/09PRj+/cf2L4Rr+XVitaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuKH8oTjXUvWdAoxWQjrAcVuWQ7X67KXXncSUnJ9qAe0vGkBzi
	9O4B8DKCd0vkP0BPIOtqkpkrLITwSxcefYSqB5D80q58HQ8k7swrXQOum/pnsWH4Z/wflStFodE
	u2e2ekdmCKRJP4w1Kcs9b55+IVls=
X-Gm-Gg: ASbGnctbvGStRDLwLDGIAAghpzVkbL8z3dopG9/Cf1w/aPCYyE5ECIFEUk0AWShq958
	AxlRu+KJQyCI4aAqQl27lYN5MZj7f0ChU6A==
X-Google-Smtp-Source: AGHT+IEx8aBvyUxwX4KhjDAPapgTtn8RVsUoKeJKHRReDtlqe14IiV4PkqpM5iqQHZaEknXnRRjDkrEE1MjdQDxEFHE=
X-Received: by 2002:a05:651c:905:b0:2ff:5e46:ab04 with SMTP id
 38308e7fff4ca-2ffa71905d7mr104011571fa.22.1732633969766; Tue, 26 Nov 2024
 07:12:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123132237.15700-1-sedat.dilek@gmail.com> <CAK7LNAQL4Ht5W2qZrx5+ACX7Xc0pr4FRht7jYFyyjUKR1Afi=w@mail.gmail.com>
In-Reply-To: <CAK7LNAQL4Ht5W2qZrx5+ACX7Xc0pr4FRht7jYFyyjUKR1Afi=w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 26 Nov 2024 16:12:15 +0100
Message-ID: <CA+icZUV9Wbpw5DbGgkd3BYrU5xA9A9rHnX85Mc_4u6PajygjiA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix names of .tmp_vmlinux kallsyms files
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 4:01=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Nov 23, 2024 at 10:22=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
> >
> > For details, see thread "kbuild-next: .tmp vmlinux syms files"
> >
> > INFO: This patch is against Linux v6.12.
> >
> > Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkj=
tm4vSVKkXPTg+Q@mail.gmail.com/
>
> This is not the right way to input a commit description.
>

Hi Masahiro,

I can add a proper commit description in v2.

>
> >
> > Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> > ---
> >  scripts/link-vmlinux.sh | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index a9b3f34a78d2..c9088436baff 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -203,8 +203,8 @@ kallsymso=3D
> >  strip_debug=3D
> >
> >  if is_enabled CONFIG_KALLSYMS; then
> > -       true > .tmp_vmlinux.kallsyms0.syms
> > -       kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
> > +       true > .tmp_vmlinux0.kallsyms.syms
> > +       kallsyms .tmp_vmlinux0.kallsyms.syms .tmp_vmlinux0.kallsyms
>
> If you aim for naming consistency, this should be
>
> .tmp_vmlinux0.syms
>

OK.
I was thinking of this, too.
I can change this as well.

The rest below is OK?

Thanks for your comments.

Best regards,
-Sedat-

>
>
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
>
>
> --
> Best Regards
> Masahiro Yamada

