Return-Path: <linux-kbuild+bounces-7962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9AAFF3AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 23:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C4887BEE5A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 21:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5CC2417EF;
	Wed,  9 Jul 2025 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdkPtuhn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C023C4EC;
	Wed,  9 Jul 2025 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752095114; cv=none; b=UuPBlGicpRHmh+3MM3AWc4wA6G/qsNZhhLR6hMRK66gCN+7srLG/kcIEwMuN8U+bmm7xrVPiW99oAbEmOuoyTq/GdE/rFjwNNGtPV1GhlWHhQ1u0j+Go0MGmREZbPg4zE941w0ipVTO24Q0iiQTtbZ7Ms1yMJfoNZSPJRXYn21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752095114; c=relaxed/simple;
	bh=JqDMxZnmqKYLmQg7R6+bgbRHaT2ndVnR8RfUVyOSqoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS79u5hAhi+xjZYyGPd/QtOR3nqPU1Rlk9IXBFauVNLBLim49CRz5GqwlGMmXZrz2RcvvYl62uEI/Nho6hxMQUmv0ESNPssZAh3kZpF5fSxH0Tj4AEyY5UqWljVZ9V/2CCVQ+1IItndxy32oCbwFLc1bFUhZzD0G/yPocvJd2QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdkPtuhn; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fadb9a0325so3002446d6.2;
        Wed, 09 Jul 2025 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752095112; x=1752699912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+IzJssnOfeb6EMV1AYSHtJ4+Rp7DCyKCX39HvIGnkw=;
        b=cdkPtuhniQMylyPdtrAv7teUBZ1MhTn8aEgeheKz9LlRanhDII9/wB6u6R6z3L0hUd
         xDvUuKqLbPi711Dhp4cWQloYKQNBNAtUgIADxmQvA6+IWOEOqHzEa9pXAkQ3Rr9NE13c
         S1MPOTMc0sB8+8IFKYO550e79T8AXk9/9w4n3xp3IQz+hi+KhTxqKGSp+f5bNELXMVSQ
         YG9P9Vm4QwRbtKoE3bQzoX+20jZpC4x5BjStc3qHP3meBscZkdiMVNNfUbuHAZoxrd5v
         Uzykosk+X69CN4E6jcamfX7MZGI2dr84QOqELsP4nwgCmWYgtd3dbnK7XmAnz7O9o9TG
         r0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752095112; x=1752699912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+IzJssnOfeb6EMV1AYSHtJ4+Rp7DCyKCX39HvIGnkw=;
        b=gcaiVA4RVmsG61Gjl6er8yudb17IIMHZS4BnEXme5/kxaauL2XK4le5/7Q1ay8IL2o
         mSveT0hY1SzX8HnVLIcHu/TCv1z0U1tVE3WT14NgqBfDD6skG2jHQmpgfTl0kzB40BE+
         ctFN7qmLR43AcQJyZf7T8cFtKTsjoFvh+p4oZv/NpPHe5go0q9LhTnzK29j7SELmhozJ
         Q/nGgNm3xJ2O8OFMmgPstVGU+iffSBWZDl9wLIhAFwGqb71gSYtr8S4D+IzFYaZeAdmy
         RPG2/N3SN3eC+66C/BmPUWGF3MfnIzsz3jf3ykHMeQEeXVcnJVfvgntbM+O10CXZt4ym
         qWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz8vMYOP7050wKmPuCqBiUV1dQRyrb0NL3aTNcABOeBZXzQnIhyMjY0tUWrN+pcNBEqKIBJyral+TUJS0=@vger.kernel.org, AJvYcCV2f9gbF6L9/feD1B0mCIlHkt8b9rX6EUEXWtQqqRN1WBawQw4WM5Dz+ad9NkTDegONzmhHCtEqcrzfdkZR@vger.kernel.org, AJvYcCVgImSGYcCM7TiGSMj5q5Hyj1TVwo+57kjNsfOMCV6pw/UxhSB3/L4ieetj1eEY10XH8aa4lZGf9knyvpA02qg=@vger.kernel.org, AJvYcCXTSUyhfbHbNFdEtKySItjocGr8dmWwmc0CrZb3SjkavTl/yJRi5DqcBxD3jXZGpmNgTA9CVYLTO5nJqXCWkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4sj9WG/lHxbBAn0lIHYg0qhtKgJNtXQP25Czt+jGQtXGC3WqL
	rEogc366fnKD9mS7PFutnjNQXfisvQQ4Iyy5Y8HZ5Zx04KYeEi/KvnZJ
X-Gm-Gg: ASbGncsnat8asPcLgwsSH9aU9IM78q66skYxGI2PETM6V0syvkUxvTrYQexC2o2oUZU
	71ZJwmsBOv6EA0qPRUkCr36hOqP6Nwtqsn01E/bdtcJwsbO5oaOUEf9VA9z153ynvkc3rJvWPWf
	qS1BcEtVnOfWQwXvqjGOj31e07Zi6FPzkC/Z8412yG+MldZwvFTdotsNWyG+OYD5yMLgWxmJxE5
	xhrzQNThS+tW+YLljuPE296suxCz0gF2bRH6QgJ3rUfmvgrehthf3r3q4KP4cL78WeG1/j7Sj8w
	JRJYEj8j4p/qH8Xsk/TqWA7EVxu/1pdDmzFlZHP+p/R4HU0+pHLlJb2xPKofVaqvOqW4otxogPQ
	1CIo8Orqn9H0EiKvS2KNLNAC9G5n7pA45pxNedloWVFa85AlipfAE
X-Google-Smtp-Source: AGHT+IFuOy52f0AzBLLPaHxh5cK0HhrF3TJzNo1Yvb0GLJseUH40vmuIGi4iSOsWOnczl9a+vkeaiA==
X-Received: by 2002:a05:6214:c62:b0:704:574a:d28d with SMTP id 6a1803df08f44-70494f4971amr25812076d6.17.1752095111759;
        Wed, 09 Jul 2025 14:05:11 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497dd0b27sm79476d6.120.2025.07.09.14.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 14:05:11 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9DC07F40066;
	Wed,  9 Jul 2025 17:05:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 09 Jul 2025 17:05:10 -0400
X-ME-Sender: <xms:htluaFYnsMYc2T-kAIV9XmqGxwU8_aBfRxKTUtwI6NW4xR9Se19g5g>
    <xme:htluaH4KeAo-UxE42OIzz4uxH6K-XV7DTp7NhDEolge6h0eGiXil7azazBu3f2Smz
    cA-DJpoGk5szIGzyA>
X-ME-Received: <xmr:htluaN9iYiYros3cCkxLabgTqn7fvPUrL9YtnYbvQC0Aiqt07pjQt0wG_e38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehg
    rghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprh
    hothhonhhmrghilhdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:htluaBZI1HrsLwyInA6sHmR3axuuZHueD0tcEHBi_9H8byeZzUITig>
    <xmx:htluaF27SODdsyTVFs2Pmrt7pr9nFUMwzmYeP1A3paehqcRm82Io9w>
    <xmx:htluaD4QWlXQHe6wpePnhM4xhyajH5JK6sGUmpk5uS_M7JgWhnzY_g>
    <xmx:htluaBQ3XWmn0w1eYeVWuCp_XqK7R-tDQ6_CULJytDO4HOiuV_2Y0Q>
    <xmx:htluaMrDYOW87WvbsWGExcnO0Odmv5imqfLPZdUaGym18HPGhlWLW6SJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jul 2025 17:05:09 -0400 (EDT)
Date: Wed, 9 Jul 2025 14:05:09 -0700
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
Message-ID: <aG7ZhTaZRL9ZpyP5@tardis.local>
References: <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
 <KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid>
 <aGvkFbs5caxLSQxa@Mac.home>
 <877c0joyfo.fsf@kernel.org>
 <lsO9eeoR7qtPcjbhow9WfkrujYbxWh9JwZCHDO9K4VU6gtpl4pNYJisLImSI7OrRxW7qu-soEy9zjF_3snXZGQ==@protonmail.internalid>
 <DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org>
 <87ple9lkjr.fsf@kernel.org>
 <DB7QEZNTH2SB.SSRG5H7TXZZT@kernel.org>
 <aG7NFizFGeFBSXY-@tardis.local>
 <DB7SYPUAUBUS.30DITWX21NJ96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7SYPUAUBUS.30DITWX21NJ96@kernel.org>

On Wed, Jul 09, 2025 at 10:22:04PM +0200, Benno Lossin wrote:
[...]
> >> >>>>> > +impl<T> Drop for SetOnce<T> {
> >> >>>>> > +    fn drop(&mut self) {
> >> >>>>> > +        if self.init.load(Acquire) == 2 {
> >> >>>>> > +            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
> >> >>>>> > +            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
> >> >>>>> > +            // `self`.
> >> >>>>> > +            unsafe { drop_in_place(self.value.get()) };
> >> >>>>>
> >> >>>>> This load does not need to be Acquire. It can be a Relaxed load or
> >> >>>>> even an unsynchronized one since the access is exclusive.
> >> >>>>
> >> >>>> Right, I think we can do the similar as Revocable here:
> >> >>>>
> >> >>>>         if *self.init.get_mut() == 2 { }
> >> >
> >> > Ok, now I got it. You are saying I don't need to use the atomic load
> >> > method, because I have mutable access. Sounds good.
> >> >
> >> > But I guess a relaxed load and access through a mutable reference should
> >> > result in the same code generation on most (all?) platforms?
> >> 
> >> AFAIK it is not the same on arm.
> >> 
> >
> > Right, when LTO=y, arm64 use acquire load to implement
> > READ_ONCE()/atomic_read().
> 
> But Andreas was talking about relaxed load vs mutable reference (=
> normal unsynchronized write)?
> 

No, I think it was a relaxed load (self.init.load(Relaxed)) vs a normal
unsynchronized *load* (*self.init.get_mut()). Yes, there is a mutable
reference, but we never use it for write.

Regards,
Boqun

> ---
> Cheers,
> Benno
> 

