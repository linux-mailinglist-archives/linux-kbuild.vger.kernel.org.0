Return-Path: <linux-kbuild+bounces-10130-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8886FCC6A17
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 09:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BCE7306F4AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 08:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649C73A1E87;
	Wed, 17 Dec 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kSfqrPIs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD9336ED0
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960782; cv=none; b=Bc/+fQUxkfoS0xnR+NUIUCCIu4PGiwILsr+VppiA3w5nYBxpvM2JwGyGmKVKuvN3OUZ0NP7IK7MsCg3HHzXth0gn/poOI/B7JwBWV1jIXmwpNG+d8zCH6N9Cwv01pun5aYEXr0FFwwRJ9PKgUJNx6ykAUjhXzRCsWf2lrNWjEbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960782; c=relaxed/simple;
	bh=QSCoovFKyuSejATnnpFRaHUf6MGG7N+eW03EWHscftw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXh8wuF2go8Jqm/R3f3WefFJ2Q+hvafowXch5lXu0vQ+zWW74SU2Y6k49O2NB7SLlUkBD7eR1LCva56VZojEONKTTNnbCmP50yaOgZeJwt/Vz2/m+BtKOzpJdQjhwg/1bgFXmuBkg5ZCghvb6DwPnWEgN4rXcTceiVl1Sv+W9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kSfqrPIs; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso50223491fa.3
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765960779; x=1766565579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mlRUHrT4yxTGsEEleTMkt/eOp+5pZyUvB8bhOzrxXd0=;
        b=kSfqrPIsiPfibLgcmtCkfZvMD7qlyVde5D28cmt5S4QOWHCz+DJtWGcsxZaPqp01dY
         8235bVmGevY33aUeRAxsvTxHJMYV/XeiCxP1MrLT8qWT291CLCZTDcwRqQaDT0SECVA9
         JLHcTSPGUWCPPwUFviMITS5YcYXNwU4Lr4frAR07x8r9LxMS3Y8czhID0cTh3KwYpNdF
         kWTfngYxKXfH1CWS8HPf6/Tar+LAd4dAMx0UwbP4ItjkIUVfF9XatxeEWku/FVoJYd9T
         GHp3C8DB/586iRt2ChZvMCWrHGSVNpRpmRdHQZdR/lYs+OTeyky3x5ZTe/nSbLP/EH8H
         jlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765960779; x=1766565579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlRUHrT4yxTGsEEleTMkt/eOp+5pZyUvB8bhOzrxXd0=;
        b=OmIW6wT94hCbSTIdGGBZSpOepgjie0beFbXJvafWY9wV/9NRngCwqeMQ9HzO2Y8MRJ
         BWjwAMC6JYQQ0YcbB7g3dQaqLj81BxhI3M4/8dQ9Dy30MuZ+FmQVw0+ebpMZlMOns5eq
         f3zilN0ZZ70Lg1zzZO2lBoho1VpoMnwhsV5EYNO1GNt/OV46Gf44UcKrvOyGp/o64RId
         8t4IMpbu15unOKD+8ibTIn3SNcpHz3xzO2BpkPafzDFIIi7QhpD0AJPTEpCj8M9oJT/S
         Jq7F+GdKPSBT+L+iTSMyCXxnqcniq92sZCSwBKkr2k37Wid3UYYgTLGBiGqEsVdHItj4
         ib5A==
X-Forwarded-Encrypted: i=1; AJvYcCX1xyatp/RLgyhJZXzAJkW4WylfEwPh4ba05I2M12AR2m/+vC06YzQzyFrsMCPWjRkHULYBzOcoNlUTXzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhlAn60/teMJS0j/N5EAj8ZAfIkVElHwARfGcYMiR8yeTnccpo
	MRmhvOOmq9GSKeGYpqoPi6A93L12OseNJ7ZadciTJKz8cbHW2t8TTG5dhGmD+tSzZYoQ8bn/R9b
	Q7Xdt94q7XUCjxO+ngSWyBfaGO3laQxOHscwDfoE3
X-Gm-Gg: AY/fxX5KDJ2ywy+aidEkl6HoA/MMXJgT5R+oxpSwB5Vk5IFyfCRxCY4l3yRvczgrsWi
	LcSf11RQJh5mNiT4cOVCBhDR1F8JidEp4QOXXMdmC2F35itjocPw4RjMwGO9edYopFiPDu5912i
	CybPrNE4y2pSbsYCSKdoDfGdIYZE1fENZvU/jCYCRZGU/gaXzMPMK11pway21ecQPtU7G6pPLcX
	NRm4yZDK/SK3qnS/F+HnMgvzAkXn8vYf67t43sH/7KRhbC9PpcFjGTfymfrq+N25EP9yb3ojiZd
	kCmZkcUJG5z+ETjl8JJr8E0hLVUlTxW8JGSr
X-Google-Smtp-Source: AGHT+IG3bCUQ2Je+vHFJWCfzmbfZ0ih8wwvZSujz+GVcPBCBClqAhcuvpVpcxDVBKIgCNYB/hRE55SPatZcL3F8uP3c=
X-Received: by 2002:a2e:a54e:0:b0:37b:aaf7:f022 with SMTP id
 38308e7fff4ca-37fd08a228amr54969901fa.35.1765960778239; Wed, 17 Dec 2025
 00:39:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger> <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162>
In-Reply-To: <20251217083202.GA2118121@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 17:39:25 +0900
X-Gm-Features: AQt7F2qWp-eMj8IYy0rDBA50zsQzYgtGEq5tH-RHnDQAKICwZgnQYI1D1qn-NxM
Message-ID: <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 09:32, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Dec 17, 2025 at 05:16:02PM +0900, Dmitry Vyukov wrote:
> > On Mon, 1 Dec 2025 at 16:38, Nicolas Schier <nsc@kernel.org> wrote:
> > > Pat Somaru (1):
> > >       scripts/clang-tools: Handle included .c files in gen_compile_commands
> >
> > /\/\/\/\/\/\/\
> >
> > This commit breaks invocation of clang tools for me.
> >
> > For example I now have this fake entry for mock_uncore.c which
> > pretends to produce intel_uncore.o (along with 2 other commands which
> > produce the same object file):
> ...
> > An attempt to invoke a clang tool using this database legitimately
> > fails with the following errors (the file is not supposed and can't
> > compile on its own):
> >
> > clang-tool: drivers/gpu/drm/i915/selftests/mock_uncore.c: exit status 1
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:47:2: error: call to
> > undeclared function 'ASSIGN_RAW_WRITE_MMIO_VFUNCS'; ISO C99 and later
> > do not support implicit function declarations
> > [-Wimplicit-function-declaration]
> >    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
> >       |         ^
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:47:39: error: use of
> > undeclared identifier 'nop'; did you mean 'nopv'?
> >    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
> >       |                                              ^~~
> >       |                                              nopv
> > /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
> >    71 | extern bool nopv;
> >       |             ^
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:48:2: error: call to
> > undeclared function 'ASSIGN_RAW_READ_MMIO_VFUNCS'; ISO C99 and later
> > do not support implicit function declarations
> > [-Wimplicit-function-declaration]
> >    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
> >       |         ^
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:48:38: error: use of
> > undeclared identifier 'nop'; did you mean 'nopv'?
> >    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
> >       |                                             ^~~
> >       |                                             nopv
> > /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
> >    71 | extern bool nopv;
> >       |             ^
> > 4 errors generated.
> > Error while processing /drivers/gpu/drm/i915/selftests/mock_uncore.c.
> >
> >
> > What am I doing wrong?
>
> Nothing. As you note, ASSIGN_RAW_WRITE_MMIO_VFUNCS is defined in
> drivers/gpu/drm/i915/intel_uncore.c but it is used in
> drivers/gpu/drm/i915/selftests/mock_uncore.c, which is not designed to
> be built standalone. We could potentially move
> ASSIGN_RAW_WRITE_MMIO_VFUNCS into a common header to avoid this but I
> think I would rather just revert 9362d34acf91, as I already figured that
> this was going to be fragile:
>
>   https://lore.kernel.org/20251007163338.GA547361@ax162/
>
> I would rather discourage including .c files if folks want clangd to
> work properly since this seems fundamentally unsolvable if developers
> have written .c files in this manner. I am open to other thoughts
> though.

I am not sure what other clang tools are doing, and why they need
this. But FWIW my clang tools don't need it at all. They would index
all files, get source files from AST (which would include included .c
files as well), and work with that index. So they natively "see" and
understand all included .c files.

