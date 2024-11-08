Return-Path: <linux-kbuild+bounces-4578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085259C2514
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 19:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 328F91C22D75
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 18:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6311A9B30;
	Fri,  8 Nov 2024 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJy0teTG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E01A9B24
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Nov 2024 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731091811; cv=none; b=UsEct8iZ9mKMtOBLg9vRjk2a+moYFFsGJZHmDRKKzlmBjZ0UY8i/e+bgipaTn8t/PjvA1haoJZ9JivzLhEnYeksvO5rfvJxzGaKWKrkiqdyiLaF87Y6AZNioQNLufvYTQ/t3MZEER8AJbOg4cF2Qd20+4E3RjwZHcscTVybOSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731091811; c=relaxed/simple;
	bh=pdMqJFn4xYar/ogW6iZpxVVKTHsKKJNMZLA6/IYtp+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHUB7RKhjRrFyjYe23MInTng4urKW15FckGxxIttZJ1kRdEY5mYThxYAvaHh8mobqT5b1PeeAK6WoI+LiqvTRmw5Zir0udLSAcntZe3/wTkvCzAJgwNNDRADCYvOh+Co8BvlAUZ8CCQiOrEv07QOvIUw3z5EnzzeyFNvKslthyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJy0teTG; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460a8d1a9b7so17001cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Nov 2024 10:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731091809; x=1731696609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcZtVBPmVQL+MAycw/KU0YJN3A6fi37snUPr/mVBUXk=;
        b=iJy0teTGAHSJdpaVsIi1LV7AMD+gF/dhg5lkZhBE8Som+ikTIx/Tr3KBPSCWAqd0eV
         79DsIyfumMPJrIDgtMGZYTXJkdiSY6+QoMXXnJ8QSO43JGHY6y/Gnjj/JWq9vWR34457
         6b6gsTl38ElOY/nMv6MeBWqHwdI5pYAgnOmA7MWoB7NQxmi/EWK/sAs+ddFIPZXNZ62Z
         UFYtdywpMCDRTnEEjfH0uqk6TyZgf9f70jFNYXbtXdZjSRXggvAFDYERxjs0rJvbV4zw
         LhImrlIcvsBc0hopwcO29IRO95OEIWrrtx8DpOMmiVzmtRT2SEZt+LsLC8vvNSWQeCUg
         8uUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731091809; x=1731696609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcZtVBPmVQL+MAycw/KU0YJN3A6fi37snUPr/mVBUXk=;
        b=mFmIVqsthN9zkW3VB3wJQA0IddsEf0mFfcR8PDv3YfArecZH8Zt2vQhfsMi5eNXkEL
         3KjyGkFQqRuWn0wEnFHtkfCcYQN13Ckq6jfHzUNQN3kgW3gxI7+A5c5gC3UtIfDKL/km
         XvZSTOCeBSzAk6Cv06X2aBxPJklTXCB5Jv+NCa/zS2o9PGcVIEytUKX0IC7m1uJCYMn9
         Q7Pkpp60/MiO4qeu+HaabEMCQDtqs+kEJA0Fi1A81UcHysB8y6EucQ+DQFftCJjeqzod
         3vYlOG7rsMsHz286BbFP3DK0GbWbWbbIV9th26LtGWoZF7W7zfWnyNeEdXXF2enHMAsP
         8cVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/0ZEB03/5svaaDHrpG2B/fA/sh17gJtSqNRBXgtwShak7TdXCH3Bm8BWzfYCh/X/Td8Zn94l6K/CIHTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvsQULotSMCKYHU+I46Rs8J6+XjUcuVR+rhcfHeqUj2dzoztZ
	CzDqjyNjxGE1rCY5nEf6O9ARCp47FvUQ1jWwQXxESQgoyhoZl6cAh6uKmAOmAE9d6O+CTvM6REw
	s3Tpu+IVQO1N8KqtK4iac+Intn22VdOf0G+qs
X-Gm-Gg: ASbGncunPERWGoJwa0yOtol+lRI5k5W6/KBBVeelZNPf7n1Z8dz9v33BEc+ilIweRpz
	oLkwNRTElRDrPq3RplR6UQXW7GHruwetTgrR8fDfwoWrri+HXAXVZWEQ0CpvsFg==
X-Google-Smtp-Source: AGHT+IHayooXKesO/jmhc3MISQUMRHTU7foDBtuIeVmlZz6ij29U3/xla28tsA7vLuZJNNWCnO4txRPiTygml+GwUa4=
X-Received: by 2002:ac8:588f:0:b0:461:32e9:c5ee with SMTP id
 d75a77b69052e-4631685e147mr96211cf.0.1731091808671; Fri, 08 Nov 2024 10:50:08
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108051030.2918950-1-xur@google.com> <20241108174638.GC2564051@thelio-3990X>
In-Reply-To: <20241108174638.GC2564051@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Fri, 8 Nov 2024 10:49:56 -0800
Message-ID: <CAF1bQ=Rh51kUaNk3zQbPAe6H_buNv3jU9kcyMmJ8csXbZYQqWQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix Propeller build option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Han Shen <shenhan@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nathan, thank you a lot for helping with the patch!

I will send an updated patch that integrates your suggestion shortly.

-Rong

On Fri, Nov 8, 2024 at 9:46=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Rong,
>
> Thanks for the quick patch!
>
> On Thu, Nov 07, 2024 at 09:10:30PM -0800, Rong Xu wrote:
> > The '-fbasic-block-sections=3Dlabels' option has been deprecated with
> > the following llvm patch:
> > https://github.com/llvm/llvm-project/pull/110039
> >
> > The old option still works, but with a warning like
> >   clang: warning: argument '-fbasic-block-sections=3Dlabels' \
> >   is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]
> >
> > Currently, the option change is only in the ToT clang (v20) and not yet
> > released in v19.
>
> I think this whole block could be a little easier to read and understand
> with some more standard kernel commit message practices. I would combine
> the first and third block into one sentence and I would unwrap the
> warning text (it is okay to be long for a little clarity). Perhaps
> something like this?
>
>   | The '-fbasic-block-sections=3Dlabels' option has been deprecated in t=
ip of
>   | tree clang (20.0.0) [1]. While the option still works, a warning is
>   | emitted:
>   |
>   |   clang: warning: argument '-fbasic-block-sections=3Dlabels' is depre=
cated, use '-fbasic-block-address-map' instead [-Wdeprecated]
>
> then putting:
>
>   | Link: https://github.com/llvm/llvm-project/pull/110039 [1]
>
> right above your Signoff.
>
> > This patch adds a check to the Makefile to set the proper option.
>
> Try to avoid saying "this patch" in kernel commit messages, it is
> implicit. It would be cleaner to say something like:
>
>   | Add a version check to set the proper option.
>
> You can see some more commit message tips in sections 4.2.3 to 4.2.6 in
> the tip documentation:
>
> https://docs.kernel.org/process/maintainer-tip.html#changelog
>
> > If the option change is later integrated in v19.x, we need to update th=
e
> > check accordingly.
>
> I think it is worth dropping this sentence entirely, as I would argue
> that it is pretty unlikely that this option gets backported to
> release/19.x, since it would basically accelerate the deprecation
> timeline, which seems unreasonable to do in a stable release.
>

These are excellent suggestions that make the message more clear.
I'll update the patch description.

> > Signed-off-by: Rong Xu <xur@google.com>
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  scripts/Makefile.propeller | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> > index 344190717e47..1a68ea0d1fe4 100644
> > --- a/scripts/Makefile.propeller
> > +++ b/scripts/Makefile.propeller
> > @@ -5,7 +5,13 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
> >    CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlist=3D$(CLANG_=
PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
> >    KBUILD_LDFLAGS +=3D --symbol-ordering-file=3D$(CLANG_PROPELLER_PROFI=
LE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
> >  else
> > -  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +  # Staring with clang v20, the '-fbasic-block-sections=3Dlabels' opti=
on is
> > +  # deprecated. Use the recommended '-fbasic-block-address-map' option=
.
>
> Might be worth linking the specific change here for archeology sake.
>

I will add the link in the comments.

> > +  ifeq ($(call clang-min-version, 200000),y)
> > +    CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-address-map
> > +  else
> > +    CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +  endif
> >  endif
> >
> >  # Propeller requires debug information to embed module names in the pr=
ofiles.
> > @@ -21,7 +27,11 @@ ifdef CONFIG_LTO_CLANG_THIN
> >    ifdef CLANG_PROPELLER_PROFILE_PREFIX
> >      KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3D$(CLANG_PROPELLER=
_PROFILE_PREFIX)_cc_profile.txt
> >    else
> > -    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
> > +    ifeq ($(call clang-min-version, 200000),y)
>
> Would it be better/more accurate to check the LLD version here? I doubt
> it would really happen but it is possible for someone to have LLVM=3D1
> (using their system wide ld.lld and LLVM tools) and CC=3Dclang-20 to just
> use an updated clang. Perhaps:
>
>   ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
>
> here?

I agree: checking the LLD version makes more sense here.

>
> > +       KBUILD_LDFLAGS +=3D --lto-basic-block-address-map
> > +    else
> > +       KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
> > +    endif
> >    endif
> >  endif
> >
> >
> > base-commit: 0dcc2d1066150787017a71f035145c566597dec7
> > --
> > 2.47.0.277.g8800431eea-goog
> >

