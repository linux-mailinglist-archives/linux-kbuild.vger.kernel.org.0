Return-Path: <linux-kbuild+bounces-5166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3AC9F5CBD
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 03:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54BD21890D84
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 02:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCED135945;
	Wed, 18 Dec 2024 02:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joshtriplett.org header.i=@joshtriplett.org header.b="cJhMB+HE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C6MEsEsl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA42F3B;
	Wed, 18 Dec 2024 02:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734488217; cv=none; b=bBSLfsCz8Uaf78HHCWS4MEbCu4CE+rka9VHjBKZCtRe+AHu1rJxX9g7FnwdgBOC4m6bDZTCRoqykkPb351E2imxSVWndUgciGMXBS2Wbde7iRuVKF0H1Om3VkjvopBel9Bc3GchTMZ2WzFQMMrAZbivEojAgBORyBr7iEr3psNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734488217; c=relaxed/simple;
	bh=bGHJ+T10BJskD8jQuXADbqU5mVSEfgy4GShYhi6G/oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpi4wuq8AK+RXhAlmd0tvfCR26DbN7SrlB4XtlM2+bHHDsp7wUkYa8byeZZcL9teyqn60ryPmL1xN6D7/WBV2UqgHAWjTpCqPa1tQW+Y5glopn4R457EZuX2NRZERglseAtK4glMD7YYup1JyZNjYsQ9JJd0ekUI/ojNaF3wipE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshtriplett.org; spf=pass smtp.mailfrom=joshtriplett.org; dkim=pass (2048-bit key) header.d=joshtriplett.org header.i=@joshtriplett.org header.b=cJhMB+HE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C6MEsEsl; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joshtriplett.org
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DF95E2540091;
	Tue, 17 Dec 2024 21:16:53 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 17 Dec 2024 21:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1734488213; x=1734574613; bh=523o3y8NJ8P5ZgdcNrSyC
	Fa3NkSc5nUpqrtZIkvhdEk=; b=cJhMB+HE0jW9BDoC6u3cFMelGMYsGDQCDe7Zg
	9LX86+uSyL2/rviXFRYp69+dWPLVE3Crs9EbwNUVtISfPRBoUuqPv1iYKuC18CrU
	zJP1T9VZwv6k6K9LoCSREjcHMLtbkpzy4FiAsxzABv+yFUTZIsuDXi0f4GgnMfqB
	h6iq3LezWuwAwvdJqnVgHJ17+I1rpbE5OgxRL79wmTJjCxUP3EX2HD0n477KE/44
	Ep10AwNmJN4wi/zNAC+0RoQFcRa8Tm8fYJV+6+XB0KvsufWl46OnoflsH5FUZHOY
	g75kqzUjGbNIglolg07phlC2CXApVcuR02otY+iXNhxbMouiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734488213; x=
	1734574613; bh=523o3y8NJ8P5ZgdcNrSyCFa3NkSc5nUpqrtZIkvhdEk=; b=C
	6MEsEslu372ISteFuk4982zQ1X5WC/qSDJHYVK1jW4+An4MdiAehQD/7PcHtl/v/
	Hbyfd350+k280p2xyOF2sSLmotfWDww0bhzvQyeCt34o0LY4CQABQGSdRexh4WJG
	yJ07aCZuKS8B9hefRE3UNw+MVbAiANdxfTAaSndcJkO9ms8Fa3EJQHDrYTeF/Ikz
	H7XngQy71TysElucC/6saOh0KDgYMduwNOWBANYGCOZ1IQoGAZfWJAqmrupe8etV
	JgFrUJ4UN8mDQUkSpXmSZnJC8BQxNELbGaZD9MBvZS3ziYMWoB5pai03XTb0uSoD
	pQWcpbas/dwG/bOmfIZjQ==
X-ME-Sender: <xms:lDBiZ-JO1cFz464_ZqcGR3DGYlU83-DTiWmXfAnGaN4JPDDmEAbcIw>
    <xme:lDBiZ2K-_yiENMTO3e0SvWGUDJ63j373B9Mx72eMFom_E1cTHG5QAeDRV-ZhU_M_x
    a-1NeHPGyleZz5-IXc>
X-ME-Received: <xmr:lDBiZ-tzqK-U0E1iPpxFiL1gae-0F4IvfsDCw4xOdkZRFv7QDB0bHpzxMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleeigdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheplfhoshhhucfvrhhiphhlvghtthcuoehjohhshhesjhhoshhhthhrihhplh
    gvthhtrdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeifffhhffhhfekieehveekteet
    ffeugeejhfdutdelhefhgefffefghfeljeenucffohhmrghinheprhhushhtqdhfohhrqd
    hlihhnuhigrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepjhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrghdpnhgspghrtghpth
    htohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhguhgvlhdrohhj
    vggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprgigsghovg
    eskhgvrhhnvghlrdgukhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgu
    rghtihhonhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrd
    hfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:lDBiZzbpZQ6Htu7pSYTfD1cvKTkmDRb9j40sglhrWoV0YjQMEeBOwQ>
    <xmx:lDBiZ1aU9r7mlsdiPkBed6duNGvAu7zgrhVzy-MWpGDn1qM3sH_UrQ>
    <xmx:lDBiZ_AIcawljzjORiD0mk8l761epmTC6m0ybQipNT9EnayBWmrlCg>
    <xmx:lDBiZ7b_BcpzmK7LmeAWXiNMq14U8BI2KtBObwQsJCeO2csQvSMBew>
    <xmx:lTBiZxNP4QyIfsjBLZMUiCh95T7j1Qs5oBqtjXj6-D3MPa8LiDlIqNgH>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Dec 2024 21:16:50 -0500 (EST)
Date: Tue, 17 Dec 2024 18:16:48 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
Message-ID: <Z2IwkAxgMt2XqI9U@localhost>
References: <2024121344-excusably-resurrect-d01a@gregkh>
 <87h674c5vq.fsf@kernel.org>
 <UW-ATumT4L-13ZXX-lO1inQGeZK7VgQWNAHE3688ulGj-rvzxWkUdrmnAUlufI1W5-9d6vzH3TXZ4VOmYh9wxA==@protonmail.internalid>
 <2024121646-shelve-series-5319@gregkh>
 <877c7zbx2u.fsf@kernel.org>
 <8e1b5c5e-52ae-4332-a49c-990add7611f6@kernel.dk>
 <2024121630-steed-grating-6352@gregkh>
 <64a40555-e3f8-4671-8ece-3c3b677ccdfb@kernel.dk>
 <CANiq72=01Oaszr08hV2ABLbd0RJt9oO=j=aWAizbbCUg+T+aNQ@mail.gmail.com>
 <CANiq72n+XM9qgMGq_94OOawOU0NC+7b=mF1dpSSBq2_AtVJung@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n+XM9qgMGq_94OOawOU0NC+7b=mF1dpSSBq2_AtVJung@mail.gmail.com>

On Mon, Dec 16, 2024 at 04:48:21PM +0100, Miguel Ojeda wrote:
> On Mon, Dec 16, 2024 at 4:39 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Agreed. I would suggest to consider marking it as a Rust reference
> > driver, since it is a prime candidate for it:
> >
> >     https://rust-for-linux.com/rust-reference-drivers
> >
> > That way, it is clearer that the duplication is meant to build the
> > abstractions and temporary in the long-term.
> >
> > Then we can also easily track which ones are meant to be those, and
> > Greg can get justifiably angry at you/us if the duplication isn't
> > resolved when the right time comes... :)
> 
> By the way, I half-jokingly suggested this elsewhere, but we could
> trivially allow module parameters only for particular modules, i.e.
> only allow to use the `params` key here if the name matches `rnull`
> (or if they set a special flag or whatever).
> 
> Yes, it is a hack, but it would give people pause when trying to use
> the feature, i.e. to think twice. And, to me, it makes sense to
> encode/acknowledge this kind of thing explicitly anyway.
> 
> So if that would unblock this and reduce the chance of repeating
> mistakes of the past, then we can easily do that too.

This seems like a great idea. An allowlist of drivers that are allowed
to use module parameters would encourage *new* drivers to not use them,
and that allowlist can have a comment atop it saying "Only add your
driver to this list if it needs to maintain an interface compatible with
an existing driver in order to avoid breaking userspace. Otherwise, use
configfs, sysfs, debugfs, or something else other than module
parameters."

I wonder if we can implement such an allowlist for C modules, too. :)

