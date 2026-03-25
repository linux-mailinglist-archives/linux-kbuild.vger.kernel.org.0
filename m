Return-Path: <linux-kbuild+bounces-12263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPJKOTYXxGlvwQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12263-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 18:11:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE69329A71
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 18:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 338D3303D390
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 17:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCB93FE66C;
	Wed, 25 Mar 2026 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPL4YcKR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03E3FB061
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458662; cv=pass; b=AmEfHGVHu4A45HQZQWd1OoAOmJaaEEv55L5A9dfLJAeJVpQzyGBgaoxmzG1274UShEgnzJ8f1rL3x8UN/LNmmTVd7JvH1l5jG+0S4lGQ0u7F+aRcs2i320C2b646spnRs39wNtXhOUGBFF/WC2oxHr9zkGPh17rs5EnqQJUSvbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458662; c=relaxed/simple;
	bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQXiNJfZb8QuK2g3XjZokUolL2pj7eMPx0l2ZsbSO850/5WeynmZBHhk7Jx7tNnj5ab9NAxyv+2RqL4GdaBjjpP+ZpCTZhnszMyJDpQaWArJ4dTsbXSmHEkeHYVK8qJ/a7Mr9By8zz+SN6K86ibEDaeyAFUOwdZRJ/z942PRo9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPL4YcKR; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66a8242c1d8so604a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 10:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774458656; cv=none;
        d=google.com; s=arc-20240605;
        b=V6nE0nubipCkw9x/utzuSiUfbqelFaC3RCbkpKJ/vt0l/lDWLABZ/PPkUJXsb/mL46
         WJY7DJ+kPQ0HvYmVXdZp2jRFMUYtb+oGg0XJ8aXG18RAHBUe0ZLzNxC0xgNDktlKPdYv
         0tYtaBOk5KrqfjeaPhjsQ4lAOeV9ghr5TWmJiEh7S6h/vQdajq1kzlu3rx4JbDBbsxeg
         5gRWn3r7fHaTaQEW18MfhYVLOarH4H/sZnnzpKFubdVKFHaIoiKcODXzClg2wzSqUSLg
         o8ardWw4rJNNdkM71n9xk/HBk8FDtbFgkNAaNKI8Vy5a0H3CwibcRzeagqj76BnMCCXs
         omaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
        fh=dcGestGJ48LAGsgJMH8qTCcGRFyqGTx5GpLdYZulXOg=;
        b=j0LzFyEpNPDS79V6MqNti4MGI84maAK46mtaXtkc6in9lj3D/EZADHgN8frDGqJd1h
         JMGtyrfOHk+aALKlQsF+cCIyDWcqTXKvsjfRbwx+qxrpSjjzu2QxVMAMtO+0T+1aWvFs
         1qSk6y5JOHX9a4phgRIRBwYt1j+VofbGkOuyyZKpDShTmQuPKGdcz/RXxlL7w3ndbDXY
         otV+SL0xbKqvU5pngtRxfsxdU27/sDzLCBxV+V+RHlx4RYrFivjt+4GNjTg8nsqhL2iJ
         2myQSv2myMsbq+e4uuXL54Fe97WmVyE3CSmVkhHniAOr/wcFFbYtrAjzwTf1iDd8Qlss
         BbFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774458656; x=1775063456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
        b=lPL4YcKRVTJnH4qcn+l6H70QLsxVAQUvmN6H76xmfscRknSCZf6uTHRwJY6SuYqd34
         b06LEjWYqyguLIj86Ku7HwUyFJVm0RYgIyGdSPY7CtgPiTk9RN/HMMD1PAyMbpknnasc
         0W/xsxYGOTrwVoshTbNsWPphP7HeFBEKa6VcFkVP/hvHZY+GXHgarU7lelwDex82/OgS
         SmqNEMFGyBHWMn8pPRe+fS3Q7XarFEYUFwORzk6DRwg8mwP5OAaqV65MrCKLSRu1uo6u
         A5NlNtqqZ8LV0pGAOKxHRs2shvskBoGAGtKhF/R2HPOOjGl7V9TzlofgjXfiBOGo02Yc
         8Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458656; x=1775063456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
        b=ro+zWyF4T2FnoKXKz3mmIys7e6bog9DSNvILAoqmkrkwD2LSf6UNGIXUWQ9IT/v7Ch
         C32eYgELxH0HphMkAZPqph4cNBB4B4D0BFrinRxamK3+98NV2ssk+lNKVCMW7jZnI+Sx
         SVucLI/yXFzMT9UWcl+UNMdiYw/+Rf3gfml3Kvrr9P5yqYR4hdDZ92OsBtSNQqaUsj+g
         97vKTrkaAx/9dbDD1YRDPj30chG/imtr6FoL6fUyA98UswkXGLV1pDw8cqblFC8myHH5
         3XCebb1K3wnQ1mJmdgYSWWoBdFaUmr80Z2vRaTpiVgHusSZKZhJSOYE3cgrZHuBDnm7+
         7cGA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Gur3ys+mdhPF793qUjd8wuMBmX+iu78syX4/fYvj93/td/hZ7q4ethC9FgfawrQBJwX5m9lUOxng928=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgcEDdkjHPBStJ3qPLWVuR2NCdQmiii+InxVizWkx22wtN93Za
	bjBbVbKDqySGYuZKYDihDGr+llSwFOJ2C4exueQK6xEgMXYz6R1yrj7py/DLU7QdER/E1M/8ONW
	mN1nVsgS0hTRDpfQkav8eapzSXxfkio9sRqA/RXn3
X-Gm-Gg: ATEYQzxMQhtITwq8w+2Yx9RDfQXpbf6rzHilfRekJunhHK1IHNN5Z8uQD17CBlqz3ux
	iVimVpS11daEOAhqeLn2Byz42yXWsHPS1TG7H9BAQteoJoVX9/Iu1wtjPe7nXjVOj3blRr1dBO2
	XkLJBZnJc+ejCc3TWT4xyGAqMuGF0kYyHLzgA1BekjKhlaq3fp8JH3bY5dD42xtuRWc6a06q+du
	pXhKl/eMdOwRTOJadIv7ypJY+MTVqGqw46mM8aMi3ZzePZ94cMBwXUyQpqJU9mq/PioS37iNCPq
	ErX4sP/nNmMHlKi3plki86byRbniKaQRYSA=
X-Received: by 2002:a05:6402:1493:b0:662:fa40:a4ab with SMTP id
 4fb4d7f45d1cf-66ad9b6d3c0mr10a12.5.1774458655680; Wed, 25 Mar 2026 10:10:55
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162> <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net>
In-Reply-To: <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net>
From: Rong Xu <xur@google.com>
Date: Wed, 25 Mar 2026 17:10:42 +0000
X-Gm-Features: AQROBzB3MBD57ReM7Vot3B9es8jWLO08WJJ045zX_uTQmHQ7XmKgC3cZWPHLi6o
Message-ID: <CAF1bQ=QX5p8OObpZkV9f=y1i-S7Snvsu2HH8gQK9RD=eBiakCA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12263-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AEE69329A71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I have reviewed this patch and it looks good to me. I suggest updating
autofdo.rst to explicitly mention support for Rust.

Regarding the naming convention, I understand Gary's point that Clang
and Rust should both be viewed as LLVM frontends. I am open to
renaming *FLAGS_AUTOFDO_CLANG to *FLAGS_AUTOFDO_LLVM. However, I would
prefer not to use *FLAGS_AUTOFDO, as GCC also supports AutoFDO, but it
hasn't been integrated into kernel builds yet.

These naming updates can be handled in a separate patch.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Fri, Mar 20, 2026 at 9:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Mar 19, 2026 at 11:54 PM GMT, Nathan Chancellor wrote:
> > On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
> >> On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
> >> > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net>=
 wrote:
> >> >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> >> >> > Do you think it's worth having Rust not match the CFLAGS here?
> >> >> >
> >> >>
> >> >> I think the C flags should probably be renamed AUTOFDO_LLVM too. Af=
ter call, all
> >> >> the perf tools involved here are called llvm-foobar as well.
> >> >
> >> > But isn't it just called this because the config option is
> >> > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to tha=
t
> >> > particular config option. It may make sense to rename
> >> > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
> >> > this change, in my opinion.
> >>
> >> I get that it's an existing config name, but previously it is a correc=
t
> >> description, while after this change it is no longer accurate.
> >>
> >> I don't know if there's an established practice on renaming CONFIG opt=
ions when
> >> this sort thing happens though. Perhaps one way is to have add
> >> CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
> >
> > As Miguel mentioned, there is the transitional keyword for Kconfig to
> > handle renames now but I would really like there to be a compelling
> > reason for the rename other than LLVM is a little more accurate than
> > CLANG. The kernel has never really done a great job of referring to
> > Clang when it means the C compiler vs. the whole LLVM toolchain (like
> > LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
> > ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, aside
> > from the configuration, there is the user facing Make variable
> > CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
> > consistency.
>
> If you think the config name should be kept as CONFIG_AUTOFDO_CLANG, then=
 I
> think there is no real benefit in changing the variable name.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> Best,
> Gary

