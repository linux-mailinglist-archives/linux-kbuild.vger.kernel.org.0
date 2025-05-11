Return-Path: <linux-kbuild+bounces-7072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2706AB2653
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 05:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337DE178B52
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 03:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8C7166F1A;
	Sun, 11 May 2025 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ns54DvY4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8D417BB6;
	Sun, 11 May 2025 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746934661; cv=none; b=ky+s3qmgigPxnO739XvdhFxSibkVAL77Wr3neA6D3ERULMZfjPw+tRzXNQmRnUU8mU5TDGuYE5jcejw6u0i7JIDK+OzCXR3sLD58KhqJrm91onKnC37qvA5ZRITwuwBSVuS099cMDqh/w7X9j3b0qpc72LiQh3b7ytb325pHNv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746934661; c=relaxed/simple;
	bh=tv8sM48QUQnYFuWY8j3But9w9+nOTUysCQCeSSq/cvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aqhjp7bBGgEG5/YbQ8c3Rx5TaXkhfFbHlbSSqj1S4L8luqmui6wfUtBJBdtdOZAiwRyIX0iOLDUG4/UppLavOzgWc+lhmnJc58X6PoRNNApQL8BckwIPtQv9N9+tARpwFWoxtYk3etNNOgGPp/JD7REKieN7NNSLeA2cnbuSaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ns54DvY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B92C4CEEF;
	Sun, 11 May 2025 03:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746934659;
	bh=tv8sM48QUQnYFuWY8j3But9w9+nOTUysCQCeSSq/cvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ns54DvY4gvSO9qsL5HASYEdHS9OUC7FVnssa1PKYaFW1X41pR/9MgyiPhSPJUqYTp
	 lqp6Xoi918hJJ0NgxdPIR42kXa9xaKNNgwgwJLn3sb94Zw+F/+Q2pMM0xhnX0NS8am
	 u2dakWRe9tUtf7N+YXNBNvrBbavqjOUpCKoVWcu/OwQCcIC+mL0/ExpTBd8hZFf1PA
	 nd52e6fNiplcfzqDpI26/YTSifi8PCqvZSBbNKQmMhe+OFTX+D70oxOfE/F3cy61dN
	 VvRBHqHUVOixeYZL2zyEk0OZnXJ15HgEmbHSNkJ7eJUea6XbrEDTcNbU8fx4YMC2Va
	 HaezDWyEj40IQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db3f3c907so32230081fa.1;
        Sat, 10 May 2025 20:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWLa2VKc8sxqnMkcYDoI0dfH4/s6XQleadH6gd/J9BCRENZ64VaNHsoVby350wjmJGKXkfXFB/hZD7mspX@vger.kernel.org, AJvYcCXNF4hLkc64DiQcbkEvtpuHMMusJ79ubeUcxFgQQljx1MXjUB5TDd+h1Y3C9rCMNoDQUSI87CojdLMgb0dm@vger.kernel.org, AJvYcCXf3jRGacVuWFGeaSZm2j/lahZ6FvjdwoTGhjRj8Vhyu9LXU52Azonb2vsnaZ1S/k7Tig1dLpmYdwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPKcAonqISm9PeqR0t7O4d1/3FUJ8SwC0iFxOPdDXYE6VC6Uc
	pixJ7nuBO5nVR00StRxLWl8TXPruQpSMpk7c+cgRjq0Ct2QjQOPx9cNsSriJ8S+Lopk79H7xr13
	Ax6+3ZbnPjHUBpb0zVrwzM4hHURc=
X-Google-Smtp-Source: AGHT+IGohHgR0c/CYoeV3cjcOvlGcK+kydJ3ZkZAGhP4m7AtpnaLaFHRSvPHsKGfxQxrD43XKQcTaTGGM6xMsn75eTQ=
X-Received: by 2002:a05:651c:158c:b0:2ff:56a6:2992 with SMTP id
 38308e7fff4ca-326c46ae922mr34320631fa.37.1746934658486; Sat, 10 May 2025
 20:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
 <aBEttQH4kimHFScx@intel.com> <5e996ded-2325-48b5-9cde-972b70e0934a@t-8ch.de>
In-Reply-To: <5e996ded-2325-48b5-9cde-972b70e0934a@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 11 May 2025 05:37:02 +0200
X-Gmail-Original-Message-ID: <CAK7LNAR8pRJXCPaiEjUAQs9L-FM3p3yv5wTfSjw5FN616hqDYQ@mail.gmail.com>
X-Gm-Features: AX0GCFvrHv49d4NNQEfir1SoZpA39P5wX2n4q3mpmv5akjX7zL-kQAsb_Q060yk
Message-ID: <CAK7LNAR8pRJXCPaiEjUAQs9L-FM3p3yv5wTfSjw5FN616hqDYQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: make all file references relative to source root
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 9:30=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> On 2025-04-29 22:51:17+0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Sat, Mar 15, 2025 at 02:20:14PM +0100, Thomas Wei=C3=9Fschuh wrote:
> > > -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> > > Other references, for example in debug information, are not affected.
> > > This makes handling of file references in the compiler outputs harder=
 to
> > > use and creates problems for reproducible builds.
> > >
> > > Switch to -ffile-prefix map which affects all references.
> > >
> > > Also drop the documentation section advising manual specification of
> > > -fdebug-prefix-map for reproducible builds, as it is not necessary
> > > anymore.
> >
> > Hi,
> >
> > This broke 'objdump -S' completely for me.
> >
> > I see the following difference in the debug info:
> > -    <12>   DW_AT_name        : (indirect line string, offset: 0): driv=
ers/gpu/drm/i915/i915_config.c
> > -    <16>   DW_AT_comp_dir    : (indirect line string, offset: 0x23): /=
home/.../src/linux-2.6/build
> > +    <12>   DW_AT_name        : (indirect line string, offset: 0): ../d=
rivers/gpu/drm/i915/i915_config.c
> > +    <16>   DW_AT_comp_dir    : (indirect line string, offset: 0x26): /=
home/.../src/linux-2.6/build
> >
> > Looks like I can work around it with some combination of --prefix and
> > --prefix-strip, but that seems far too tedious to have to do every
> > time I need to decode an oops.
>
> Yeah the --prefix and --prefix-strip mechanism is only an ugly
> workaround.
> Unfortunately I don't see a nice for this issue at the moment.
>
> Masahiro, could you revert this commit for now?
> I'll try to come up with something better.

Could you submit a patch
with a commit description?

Thanks.




--=20
Best Regards
Masahiro Yamada

