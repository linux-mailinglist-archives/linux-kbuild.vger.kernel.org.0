Return-Path: <linux-kbuild+bounces-4439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A750E9B73FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 06:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC9131C20C53
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 05:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307DC13CA8A;
	Thu, 31 Oct 2024 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3fYsPVyL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C17F460
	for <linux-kbuild@vger.kernel.org>; Thu, 31 Oct 2024 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730351189; cv=none; b=DOzlzVDukcc05M8Qrn7EDe6SYCh6Np/ZWATbRPLjEMclEr8I9eoNSjMKioZVS0lM2SiBFHxjB/YhIVpKJ67aUTGG7fT7U+ihg4Z/SXdUwqMqMMb4yjNLK9Z2UmHUq1nRwZgROcoXysWlBURl6mDyCUh4dt/3uX3eET1vmxFoIZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730351189; c=relaxed/simple;
	bh=CFQpG6SQWKfCkcBSL/I30J6EEER7ES3CKQCiV1mDbS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4+lpCgJgpG3JwJ2EPvCKAW1o+8uRmnIZDXCcClA8DNJgPCKWs5eXetCe5PWpsPl72ie6/7AFFcRiHS0gkC1GR3pqCX+hhN+3m+i/k/gsokqOXU/s3a6MSsMwTsV9s0/M2N+zAkEzogTSKAQArX/bSWph/3qn/pcnp9uKQVD1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3fYsPVyL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c93e9e701fso300a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 22:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730351185; x=1730955985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i2Hp+Jo553Bp7SVYgd1y/RHX4+QcCFvIVpGPREXUzM=;
        b=3fYsPVyLoT2T4oTbcm9S/y5jCqTwGNzpZJdqL7Xb+ZesNgKoMlz1QiALWKXuOd+X7r
         pTVtADZanbzDZFhbwcUIS6cvjKXM5NpYnmyp45ePviv9o3q0PFWCKgxLzGeMtcIo9DPk
         hZLWYkNFAHy0DRiug3CblKiGd7/12zZ7cmvQu3PsBVQ0ZMD/9cyiMRyXmwAamjSzUbOF
         yfUbqoaa/ZJ7HctqTzTQZKeZIwBSkDroxZiEbF0ZJnKCEAdQV3J6i4nwsRzDz031BkEo
         HOKXuPe35qUd7eEJifY8ZGHYVK/BTyPKHpk6OjKf8+9/FmhiTf3Icqknwfcb1U0Ly0Kp
         9sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730351185; x=1730955985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0i2Hp+Jo553Bp7SVYgd1y/RHX4+QcCFvIVpGPREXUzM=;
        b=T6bwsjTI706vnriH17KeVGlkGV+jMkqCRCF7s0z7vPLru1Y2QAqfswtA+eLPJRs+Q1
         Rm9gUx/tklpOWD1zXptvItJWyzjGeDvI6UMiSYqZ361zM6eYXvy7V0NGXydA3Vqa+cK6
         gR8J1G7dyNFnxANCoTh0wInc/KpjiyX8x5bqrewXCMXz0sXbKGSrffEr5Np3OvEIZJm+
         9JD4tLc9Onr9nRogjvFu7TgPu0wdtc+kPe6xGIveAXksnEHsspzI4aY33rewbODXryDl
         wIrZUjzrMlIdgv+rXDxgHRxJDzhsE6ph+fnhGeC7jdr3BPwS7/cb5f4OZbMAMcaDJ5HL
         BeCg==
X-Forwarded-Encrypted: i=1; AJvYcCVob5ZoapV4XiOXlRUlGuo3nQfK7ji4uQO5xbyJzZASwqUQiLLxFdfidzDhon1uG7BYkRYUhgcsm2t96fw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2CGjAC92lnM5hS1WW2J3h8hmPlGkFSgAipZlXZo8eFWBISzL2
	nfcit58DUbv5Zd+zcmm0mieg8SNagtSDIzrtocISSGMHLDP1YkkIjJRdd4FuC8c+rhVw4JjYxbk
	Mu6Gl7EulTrfTkHTfH/K+358AFHxKqmD53DOW
X-Gm-Gg: ASbGncta4o6KfR13k31e/A0kG7UVgf8IJn12bZuz925i4cvqOOmTH7f6Gv3GmR2DhsS
	D1WMQ7FzMzMsTIn43d9Priz1T0f/x+OWD7ON8InyCwTziNe6Aq2ddTHlL6axG1q5s
X-Google-Smtp-Source: AGHT+IEa2MH5wcVvPPE8kavAhbMUGA/AKUSL18Rtzs97BVFow1m5e63bvnyqTFocsSVTt92eT3Zz91fTBE0w+m9p+IY=
X-Received: by 2002:aa7:d6c7:0:b0:5c4:2e9f:4cfc with SMTP id
 4fb4d7f45d1cf-5ceaa4c1727mr5520a12.6.1730351185225; Wed, 30 Oct 2024 22:06:25
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au> <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
In-Reply-To: <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Oct 2024 22:06:12 -0700
Message-ID: <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>
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

On Wed, Oct 30, 2024 at 9:37=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > Matthew Maurer <mmaurer@google.com> writes:
> > > Adds a new format for MODVERSIONS which stores each field in a separa=
te
> > > ELF section. This initially adds support for variable length names, b=
ut
> > > could later be used to add additional fields to MODVERSIONS in a
> > > backwards compatible way if needed. Any new fields will be ignored by
> > > old user tooling, unlike the current format where user tooling cannot
> > > tolerate adjustments to the format (for example making the name field
> > > longer).
> > >
> > > Since PPC munges its version records to strip leading dots, we reprod=
uce
> > > the munging for the new format. Other architectures do not appear to
> > > have architecture-specific usage of this information.
> > >
> > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> Michael, Matthew, why make everyone deal with this instead of just
> making this an arch thing and ppc would be the only one doing it?
>
>   Luis
>

I'm not sure I understand - the PPC changes are in an arch-specific
directory, and triggered through the arch-implemented callback
mod_frob_arch_sections. What would you like done to make it more of an
arch-thing?

