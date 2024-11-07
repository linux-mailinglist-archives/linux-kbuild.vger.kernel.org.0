Return-Path: <linux-kbuild+bounces-4554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF59C0F1C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371421C24364
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2B221791A;
	Thu,  7 Nov 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zhgwGXl3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26602178E6
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Nov 2024 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731008420; cv=none; b=qyWxfXfsqAPK3Sa5OhkWlgDs96x1QMjGvDT5/n4B+Bs5g0i/LcpOOR2Y/jhcHzpPtzAKW7A4GSW1fMijyse8k9khmtl0Ir0Aj5j3rjR3HAtIL9mXhN1mPtpN9YOFmwdMTh0Uobkm0JfiKaHfRdsyu1YRSFc7xF4SzMC/W+Lh0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731008420; c=relaxed/simple;
	bh=Hqpenv6p1LWFDwIjrHP2BsQXKPVjR2b5HZRJ4ZqChTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYMU3aue78hwRol1Gzjbrg9eCn1IUEERBSGUiOpZV8G0KW5FajATMkr4MZyzs5eD8SSbFGc4JdmLOpGxsrp0H5R0iJ4o2hjRJtAOjQYYRCU8uTytxhkvM1QCdHKQXQuz8umXtm6ZXlUaf0iFOAmjRMXr8eAPUsLlK29ZJe+zZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zhgwGXl3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so3753a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Nov 2024 11:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731008417; x=1731613217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
        b=zhgwGXl3wArw+w/R+l2xwrB7BtISB3OVqwvwQb25nE3DEQQIzxXLJAeaXnBIey8KEm
         QGhhbyxjo7IFQqdJsmCPANVISzFCfdy/I4FKQq5PF8Hp5zl7BtPb7CC/vekWhkIMj2zg
         D/bFPg/XZzFy+MXHR+ERBnN4gzFH4VWYfMEG7Otcl4p67K08Mm9tusAY+PPnDthmNoRA
         P9kyYFgFkzTO2y8yQa6Xy7ikMrKqZvAbvVftR6SDSyCcqP8Fmo1R1ehIlNnMNDy+EODS
         qzuHEwueFO+yBz6cxzUoDlpWPxo79ZjCFP27QRsyDckDofFAGrQeeIlKwD9VkPvXDCKS
         Cluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731008417; x=1731613217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
        b=Ri6Chgk055qDd0cPF4ZyuP9TTNxRWoieJ3OMAhTLx7scFqG6MS8TrRfBSvxuM6JCpT
         8nUSsMt2OVsPH/KJVmLscVML4AmthUlpSE8USdGFwItqWC5cBqDFonvFHv86ANFeSr/2
         9nCqmuUXhHa5zkTjhhHHJu1OMR/wbSgLlfZhFHvhGhdbB6JCX+mJU6fmCyz6zzK2p1D3
         jcByK7o2KHgNKHDgnUCy/rYzJQO949/SQEBmFeeqYyHoLsvj9fXdfsnLU+M8q36rhhOE
         dfgJTsDc0F0X/bO0reS/YSVWvBcigAo3jZvuxRGQIvHm0Iq1ChVNlP7PpzGmZ/EcJMcF
         juZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk86gYyTmsZ6xsaBTNLE4snwiqNpjNSsXs6ya0jCHfPX4shr9KIaTgC5cYYzl1bWI6Wh+HDuPdx0IBL3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8AQPkS9TKBIYWO6pwDPMEukbDszIL/2aIbc70YHqJZPxUGcuD
	MGSW2YyJwJzMb47596zHiaWTZ/hBxyafzzffYH7I6foDwd4NxlQE/VqS2sC1214Sfg4GLXPhUbw
	evfM2UD4KkdEv9jXop8zlYGZRV6qZeQKG4BCh
X-Gm-Gg: ASbGncsSse2e5Q4V9KHHJolqAPvhsnvxt+/8X7pAGcfaYSrBuKyyEmufRe7SVWI5+zH
	ihEl8jiW/VvEPaHOwXSmXU7Q35PpKzpfoQi8LyOct0N594+9Q72A/EXjUmeilaQ==
X-Google-Smtp-Source: AGHT+IEBiwFNQfuoAxFiltxJ2hrjOfio8RnmCYl6hN2gWLInsahzd3pu0ISjskuePHQ29yF2SOFAso1eK087KsDFWnI=
X-Received: by 2002:aa7:c846:0:b0:5ce:b7c5:4b3c with SMTP id
 4fb4d7f45d1cf-5cefbcb8d85mr748450a12.5.1731008416865; Thu, 07 Nov 2024
 11:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au> <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
 <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com> <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
In-Reply-To: <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 7 Nov 2024 11:40:05 -0800
Message-ID: <CAGSQo00=H8iUAP9FwSxgT3kdBmBrzsdWqA0kh5f_5FsBLxyBUQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Lucas DeMarchi to the thread after voicing an interest in the
modpost patch.

On Thu, Oct 31, 2024 at 12:49=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Wed, Oct 30, 2024 at 10:06:12PM -0700, Matthew Maurer wrote:
> > On Wed, Oct 30, 2024 at 9:37=E2=80=AFPM Luis Chamberlain <mcgrof@kernel=
.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > > > Matthew Maurer <mmaurer@google.com> writes:
> > > > > Adds a new format for MODVERSIONS which stores each field in a se=
parate
> > > > > ELF section. This initially adds support for variable length name=
s, but
> > > > > could later be used to add additional fields to MODVERSIONS in a
> > > > > backwards compatible way if needed. Any new fields will be ignore=
d by
> > > > > old user tooling, unlike the current format where user tooling ca=
nnot
> > > > > tolerate adjustments to the format (for example making the name f=
ield
> > > > > longer).
> > > > >
> > > > > Since PPC munges its version records to strip leading dots, we re=
produce
> > > > > the munging for the new format. Other architectures do not appear=
 to
> > > > > have architecture-specific usage of this information.
> > > > >
> > > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > > ---
> > > > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> > > >
> > > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > >
> > > Michael, Matthew, why make everyone deal with this instead of just
> > > making this an arch thing and ppc would be the only one doing it?
> > >
> > >   Luis
> > >
> >
> > I'm not sure I understand - the PPC changes are in an arch-specific
> > directory, and triggered through the arch-implemented callback
> > mod_frob_arch_sections. What would you like done to make it more of an
> > arch-thing?
>
> Sorry, yes, I see that now, that's what I get for late night patch
> review. Nevermidn, this all looks good to me now.
>
>   Luis

