Return-Path: <linux-kbuild+bounces-7213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FFAC0403
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771291B6110D
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 05:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937A41547F5;
	Thu, 22 May 2025 05:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngIHv3WH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AA64D;
	Thu, 22 May 2025 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747891916; cv=none; b=Oi+SvD1jjaDCKIRd5vXX2m/XYAUFwzy2OiD4gGRlVkTIhJ4K/MMfLbkxzR+KPtNDhrA026QfBMaTpooQYtNvizrTQZWr5j+v4v6B0tOqwXnrkAwXOwSAneYTefeD9E8V2Nt4ww3jx8ZJ9h2KHyz56rogfFN6VV0orCx9DiVgiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747891916; c=relaxed/simple;
	bh=f+Cf8kiHoAb2dL8MAQuId5zLnyAR56RgdhuMut///Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/vXxK4NrNV8YSVgkFB/x53g5w6aqEvqU9/6LepjFHtdiXmjDvrejkJKlZjlfRwfALu0mTa6t9r+W+wCogbyTmOuu+U6HQeSjWZvCeikv+9UiiaP88am909QgWA9oe8hyJWK3oRS/bzhjnzeVzAE3aieERzJM3pK4MiNVhREQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngIHv3WH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A13C4CEED;
	Thu, 22 May 2025 05:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747891915;
	bh=f+Cf8kiHoAb2dL8MAQuId5zLnyAR56RgdhuMut///Fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ngIHv3WHeugtCPpSvU+PlZTHJmdCAZYCvAr0naIbwSG1uJgpjuU96Q8HXYSrPe5+d
	 Rv82Y1JSdYyvDkrsYq4t8UtKvTKreZeXMC5nNTLftvkaKyDpSBnfZvmcdymTQ7TkmF
	 8dwRDQJZMUAX8Lwph2sr2wmd9Ds26tjk2z+NXbydaf19LhDhlkOSQ3zAIJy0sq9kgG
	 awDlOFjCz2+KWPNS0iydfibzRENElLb1wlkAWMn82wMaI92IYPvUyi/ufL1v1RyNSC
	 ngw489Vb9Coe7CR/phu2aOtgfDnWa1b+zh4LS4md0gvKM+Mp+mzVyp1Q+LiynDAd4s
	 aGOeq3p7+DwFA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-550eb498fbbso6934619e87.2;
        Wed, 21 May 2025 22:31:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlux/43wJrvFhBZCgwGMTfg/hshZ/InKC+UgAuFzGVD0fxcTttoyOeOEv3n0bcCBhT80sK/i9+KNQxEEDT@vger.kernel.org, AJvYcCWQI01myFBBVdQF/spz+kXJIMl20peTsznaJD7wHOe3EF0lk260hMAd4CFVcAOjEscDvYGpWA+I/P2cvrQ=@vger.kernel.org, AJvYcCXho1sf25LTRgzd8uk1VHpSwLen3f+YM3PF1ijTuDv7WEKxtuaEM9DAU0xoEWJ78C6QddNtTgNuc9JiplZo0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtLLCGrERIeXoTV0meuTDV80HOzReOYvX4wqMjn8KHsq0NhkSY
	pnMrfYoMCKZ6pZdWislTzfor4TfiYlPEP8TqSmPGYxlPW0sx8TKczlwSYi6EWfwhNuq595sRwO9
	Ucq44wiPrx6EZeXzHsxYRnuSTn0/jdT8=
X-Google-Smtp-Source: AGHT+IFH38wCW4z7NKSQjF1vZ8KahVXLdpPNR1xgR4tkmBPTJk2EuU6ISTVQ+ewbG8krjRP8ee1WWGmwTuJb5sVv77c=
X-Received: by 2002:a05:6512:640f:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-550e98fbe63mr7862654e87.41.1747891914460; Wed, 21 May 2025
 22:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141844.046738270@infradead.org>
 <CAK7LNARNbu7vxwW5YvpnUxTAcdFfvakDbeTarp06+e3q1uJWxg@mail.gmail.com>
In-Reply-To: <CAK7LNARNbu7vxwW5YvpnUxTAcdFfvakDbeTarp06+e3q1uJWxg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 22 May 2025 14:31:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNASwCRjnCrM9GdS7TAer-zzZEodM9N_wcfXwFWajsxPX-A@mail.gmail.com>
X-Gm-Features: AX0GCFtPwf8BSUr4vcANiW7tiOuBwXJsYxqfIDYnMkNX_jfC5EV4IioDaYr28Do
Message-ID: <CAK7LNASwCRjnCrM9GdS7TAer-zzZEodM9N_wcfXwFWajsxPX-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] module: Add module specific symbol namespace support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 4:19=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, May 2, 2025 at 11:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > Designate the "module:${modname}" symbol namespace to mean: 'only
> > export to the named module'.
> >
> > Notably, explicit imports of anything in the "module:" space is
> > forbidden.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
>
>
> >  static void check_exports(struct module *mod)
> >  {
> >         struct symbol *s, *exp;
> > @@ -1709,7 +1717,8 @@ static void check_exports(struct module
> >
> >                 basename =3D get_basename(mod->name);
> >
> > -               if (!contains_namespace(&mod->imported_namespaces, exp-=
>namespace)) {
> > +               if (!verify_module_namespace(exp->namespace, basename) =
&&
> > +                   !contains_namespace(&mod->imported_namespaces, exp-=
>namespace)) {
> >                         modpost_log(!allow_missing_ns_imports,
> >                                     "module %s uses symbol %s from name=
space %s, but does not import it.\n",
> >                                     basename, exp->name, exp->namespace=
);
> >
> >
>
>
> I believe this code is wrong because "make nsdeps" would
> incorrectly add MOULDE_IMPORT_NS().
>
>
> When MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=3Dy,
> EXPORT_SYMBOL_NS(foo, "module:bar") can be used by
> any module or not.
> That is not what we have decided yet.
>
> At least, MODULE_IMPORT_NS("module:bar");
> does not solve the issue at all.


Peter is not responding to my feedback.

I will apply this and fix the code by myself on top of that.



--=20
Best Regards
Masahiro Yamada

