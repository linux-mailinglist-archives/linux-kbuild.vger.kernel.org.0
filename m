Return-Path: <linux-kbuild+bounces-7959-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0CAFF2B9
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 22:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B2D11C839C6
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 20:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68FF242D76;
	Wed,  9 Jul 2025 20:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQWoyEpA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A56623B63D;
	Wed,  9 Jul 2025 20:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752091933; cv=none; b=k6KjewYfY5KgcOYDUcH7VyzAqP4FbYK6iqNoBORDx9FuggwwxT2fijYCTG5puZ8ImxQvfU6WvDSc/PxnIEHIntOpKfF79cGSTPnljOLsvINkQp5GHnPA9XeMYqLbicxP81jh2ucaR4cxfNgPxCjyo+cx2pcwqdjgmb2hX3f0ttQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752091933; c=relaxed/simple;
	bh=fJveY3LVY7fA7ARwkkO3eFFnhZSk5sSVRzKniKU51as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfolbzHxKqeAd+2KKQ34+j4GMvIUIlaeOSX+sNSoCNDbewt5Gy7mNatEaCnCVWhxkKfzTz7a6n7A/iWFn11D+p0IOmqAhHF6MYkpp7DvESIrZUrnQ42XF2QrG0JfbwM1sNtGoqChY+qRKGP5GqA5tp+rgfvrHzIBBv31qD0w9w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQWoyEpA; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a98208fa69so13381931cf.1;
        Wed, 09 Jul 2025 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752091930; x=1752696730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WBZOpba1sbIab5SXIQhqnQOQmbIt7B49KIb86YpHxyQ=;
        b=LQWoyEpAqyoXNBuiAEI34rJmF6euY2LoCyWmcYp8VqYr2Gf/nQcExflLMMr+oDkG0/
         JYnen05eyubiXf3vb3tnWhkFQu9u1qh98SOgRBDjANK52CegyPNPjXGbBZOFsFvBozoK
         08aCgX9rosu8TaIzP9npRgKpjiykpfBYLiiod/la0gW/Ia10/pea5g6TvLtPL6WeEvWn
         WVf1Ak8SQNk6t6hkP/JbZi+/hp0FJddrMc/mD96akxHQpeYVrOcxNFOzRHdGVJZwZfE4
         t/THdxIhFKN4slLiiF1TXiHf6siKbzX0Jnke9odbiOdwzORpGAKIse2MEeVeYurRm4Gc
         uaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752091930; x=1752696730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBZOpba1sbIab5SXIQhqnQOQmbIt7B49KIb86YpHxyQ=;
        b=iPLSeTBTPBgwMKH39odNaV077KgoeH+S6yBQ+6EPY/YVr9LR4ZcU6bzk/5dNUphIXe
         NVAAH3/OrYbo3+EZuusZlDtZ7ckO/cbk6V4fZcV3zX7UuB3CSSC+8SHk12aJ8j/LgDHm
         fHAPykOeBjVYbQrBfRFX6HpZrqtTjgUw4ofnc1d90xP+xoaqmvZz7jl+KA57bN63ARBH
         ILC8fDXDZ78uC9rhCiOtANepp2V972KOudULtI0elMN/vOtUVYRAemlqgRDFqsgrhXef
         4aXh6cDMD21a0Z8fsBtrmLlD2tw28NZnmKF92KL747i7HokCrODLL4vX6ZInOJfq8YWt
         XTng==
X-Forwarded-Encrypted: i=1; AJvYcCUAwPKXFzHwsGX8GTBGqzGc1mc+Gukx6SMi4Zmon3GP/XalV4pfz49E5rgTsWqnrp+CNzzT0xlrZ2vjFZc=@vger.kernel.org, AJvYcCVVpI7Ri7m+HZvfwGh5QQbGs2cllofUm7+zqEs+h9/e/M3ZhCd7gpA6x9oh1mQAMv3wNgoaSvk7AfyYzwEV@vger.kernel.org, AJvYcCWPwhtyaqe1GBeOA7WTA17W/HBDzx8SLOiDfJeoE2wgDl6k6rptpw6lGUyRm+Q+2pT+FQULxI2OLXH759AQ5w==@vger.kernel.org, AJvYcCX8cmprOhh7eERl/CFiNdnngwHnEq/Uw/EhCc0ln3XPskxJjG9sB6pU4PobmezPMDziBl4PW+zqHGxZZmcraN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNpr5XhuAPz3Xi5hWZo5kLCfZHjGmwViBlo57EDG3CZNcUPKN
	uogfuA4AlCeVGfjkw+NpHCz9x++GhifXozgRKXS0reVp+OOs2+FSiq/U
X-Gm-Gg: ASbGncuo/m+PN0wV6jU8tUqpx+Ro7ti1tpoMgUCaR39UkNSfgisQkLS7T4XbNXYF2Cq
	ass+BlyS3wm0FD0rLoEmEfQr4SmLlce7BCb+shaLw13bSTFXIZUYedeJNoq0tmj8uh8CVzBi+tB
	tYrQPlSJ10GOFlftZ4OWauCBhoZaSExKl5vHC5oBb0n/6mO+k107AgBL5vCcTypYV0IhRu5eIpM
	vk+6jghqKB2S3eMkuGxdJ0uBnNDgOyFCyOZTcJtCtC8Fpf8XfU872+JI4Kwino9N5kpQ86kA3J2
	uDVrNCMipFp6/JOzezZ2N/zT5/onGJs/2DSYu0KFHNaHgoszXZlgM5l6enuYipbcsbUq6DMWm0N
	bwDasqB+KES9Wj+GzwhfU41HgKd8vIWC1eQMnZLczDL6vvNiEsqTl
X-Google-Smtp-Source: AGHT+IEHr6/atxC/zl3e7yt+jYahnuC7nEwPQ6xpP+Y9jMSfaWyupbIOl9QXPI6m7ug2AnL6Yho0tw==
X-Received: by 2002:a05:622a:903:b0:48d:4887:9850 with SMTP id d75a77b69052e-4a9e9cff232mr12740001cf.19.1752091929606;
        Wed, 09 Jul 2025 13:12:09 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e8933sm101178491cf.7.2025.07.09.13.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:12:09 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6E314F40068;
	Wed,  9 Jul 2025 16:12:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 09 Jul 2025 16:12:08 -0400
X-ME-Sender: <xms:GM1uaDg1yUdvIYMqmYeb-BuS32mrPR2vCj8PnaiRbd8XDz2kq8IT8Q>
    <xme:GM1uaLj_80zLyN7ldHn_DyxqBUKvDF55ryjmGFlm74sPBZjmFJ7Y34Q1LBmLg27OY
    Ghkg3kPZG3R5jorBg>
X-ME-Received: <xmr:GM1uaJHo8zBgmI6Mpn8usHhf7wXVsoCvHmbe9mNAPgzAHOGdquTKmZTR8QEVv5UmjzgPQLoWvxFFY21oGiUZUdvF-Wk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeevgffhueevkedutefgveduuedujeefledthffgheegkeekiefgudekhffggeel
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinh
    gusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    ghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesph
    hrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:GM1uaOAgAFWiJdSSlgm1QzaFgbuG35F-L_P5H6hWSHMtFrjCI5gw3A>
    <xmx:GM1uaF-F8S-qaK4b4cMXbq4svP7HP4AgS0zXlYH8RLPR_HV2fdWhAQ>
    <xmx:GM1uaBjfjdsAwYu9XIRRrkHqWL-cweXUJt_EmBxycJBUICtCj3VzEg>
    <xmx:GM1uaOYlPNblUJWo_OqeSfYA62yHFsXomvt9UfwNNm5YrJEJdMZYzQ>
    <xmx:GM1uaDQfddBIRQ-Fd1MMSuJ0XH17dCGgf2sOO0QI2K-gJfRXwXZha-D2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jul 2025 16:12:07 -0400 (EDT)
Date: Wed, 9 Jul 2025 13:12:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-modules@vger.kernel.org
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
Message-ID: <aG7NFizFGeFBSXY-@tardis.local>
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
 <KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid>
 <aGvkFbs5caxLSQxa@Mac.home>
 <877c0joyfo.fsf@kernel.org>
 <lsO9eeoR7qtPcjbhow9WfkrujYbxWh9JwZCHDO9K4VU6gtpl4pNYJisLImSI7OrRxW7qu-soEy9zjF_3snXZGQ==@protonmail.internalid>
 <DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org>
 <87ple9lkjr.fsf@kernel.org>
 <DB7QEZNTH2SB.SSRG5H7TXZZT@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB7QEZNTH2SB.SSRG5H7TXZZT@kernel.org>

On Wed, Jul 09, 2025 at 08:22:16PM +0200, Benno Lossin wrote:
> On Wed Jul 9, 2025 at 12:34 PM CEST, Andreas Hindborg wrote:
> > "Benno Lossin" <lossin@kernel.org> writes:
> >> On Tue Jul 8, 2025 at 10:54 AM CEST, Andreas Hindborg wrote:
> >>> "Boqun Feng" <boqun.feng@gmail.com> writes:
> >>>> On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
> >>>>> On Mon, Jul 7, 2025 at 3:32 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>>>> >
> >>>>> > Introduce the `SetOnce` type, a container that can only be written once.
> >>>>> > The container uses an internal atomic to synchronize writes to the internal
> >>>>> > value.
> >>>>> >
> >>>>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >>>>>
> >>>>> LGTM:
> >>>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >>>>>
> >>>>> > +impl<T> Drop for SetOnce<T> {
> >>>>> > +    fn drop(&mut self) {
> >>>>> > +        if self.init.load(Acquire) == 2 {
> >>>>> > +            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
> >>>>> > +            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
> >>>>> > +            // `self`.
> >>>>> > +            unsafe { drop_in_place(self.value.get()) };
> >>>>>
> >>>>> This load does not need to be Acquire. It can be a Relaxed load or
> >>>>> even an unsynchronized one since the access is exclusive.
> >>>>
> >>>> Right, I think we can do the similar as Revocable here:
> >>>>
> >>>>         if *self.init.get_mut() == 2 { }
> >
> > Ok, now I got it. You are saying I don't need to use the atomic load
> > method, because I have mutable access. Sounds good.
> >
> > But I guess a relaxed load and access through a mutable reference should
> > result in the same code generation on most (all?) platforms?
> 
> AFAIK it is not the same on arm.
> 

Right, when LTO=y, arm64 use acquire load to implement
READ_ONCE()/atomic_read().

Regards,
Boqun

> ---
> Cheers,
> Benno
> 

