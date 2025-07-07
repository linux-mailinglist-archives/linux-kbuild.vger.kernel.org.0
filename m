Return-Path: <linux-kbuild+bounces-7908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF495AFB6F6
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 17:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11724173F9E
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C87824B26;
	Mon,  7 Jul 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgizBTYf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D4EEDE;
	Mon,  7 Jul 2025 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901211; cv=none; b=I6IsROqe8nYVQ1Rofsmy3/0Pv515y08tJcOIOTAMCZ41qTj/WIY5aACJQOIQ8qdMuDNjz8cBoWrrRW3zhljJYtRbAE4ah0kbIfX3Ho6EVNOoV+7fNDhhY56BTLvKa2+IflZOaOCXOkDAusiI6jOhEcz5RrZwy+qHR1wYP3Uucxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901211; c=relaxed/simple;
	bh=b46nuMBVjMg856O0Da2secAsr7015J7i+bLyu8whlw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XD+dhMd2KZxeaC7hrwRrxC2lBlp9M3k6tu1GWL8v9CZ9xaUvxdecnyfRicbBHM5Z/p+nSuhasnnLHLwHXAupRmVgsOigWCEtqoAHEO5Fos0kJGeC1lEMp9s9bZHv4Qv94KC3sLV07LjB67Pff7UtQp0LUxi308dslCNE0yQ8DKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgizBTYf; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a58d95ea53so38613341cf.0;
        Mon, 07 Jul 2025 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751901208; x=1752506008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wU+Kc9hr+FKFqyASghrwTWi231haZcWPg0AEYXltRjc=;
        b=FgizBTYfDSpoQpwQtwfmHEf8mx+XfdCh15TSX89IRsrReCJcCccTLQ9F0IBdI0MTG8
         ADoOjnPxaTZQPezSz8TOCROfOysvEJmNR2Fu0L5fYDq38WIFyArnIp9AlKdd8YDBRhMh
         gC6NE6M67dmsjLXXlNkRg+ur7fYo1FEPy1qg0gM3r7KMqnOuNd5mOknp/YW0PuFgfZYV
         dm4xMgF9XJEJGAXl8ubx/BOspWVMnEpLpwZynf73Wj11lngo6knb4ttkzp90pbtwBtYL
         nyAwSSPspEOmdBlRHDQry7vitDio/L66qLIMWRXXo+A7o2Ahf9f2WNskYOmqh166JA0H
         nSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901208; x=1752506008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU+Kc9hr+FKFqyASghrwTWi231haZcWPg0AEYXltRjc=;
        b=UKgYetxyJYWfmOcRLNYDZNn+Ui3PRcn6X01NSz/4Rrr/XqcBpTxtEfw9sF5813XiMU
         2k2pTV2EjXba6fooHXCKgwpwiY48tOkjil+sBB2wHBv4mfPbggI+qTYari68P5GblE2L
         VV3lKhfFcVv1dpzZEyij3cmh197zg4CPcxiSXDSRUGgO4E4UB6zMe7nuNLjOznprr06v
         MXzVbh1hK34Fmr7d37bPoQwGhuDaBZPotCL6c+ZluBX1CxGeJgut+aBdTj3wBe/4IaG0
         /dAcuomijIhEP3+mFV7zXgqtTm+0ixkF36/tOfKt1EsuhSruq73lNHMIhyIhFskE21UJ
         27Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUeuFuefQJj3h8lmB51fzH0f3QNlZGrvoqsVV2eOjJ0qnHb+9gsVMOs6wmX4ilYUMkYNaoDg2rPaSQP5DuW@vger.kernel.org, AJvYcCWi+gDS22NBnzYBlVfcqUfM0iUmMXpjhMYKbMGaW9CWdNNlddKNKh70lF8JlR/dSzsBO25cGZ/qHIUPWvLXAKs=@vger.kernel.org, AJvYcCWjdj7O8Hjex992hX1PZujymnmNioV+MlGUlqGiUnzAwFV5QzP7IGch8SjhxOtPZjoI6jXX7P//FGS3XW1EDA==@vger.kernel.org, AJvYcCXiCev2SeJn9AnLDNj5jZNKIxmOn1P+SisyBAH675x7lMqzO6dwNNGxkpQOtlw6nxppUEQiG64ob4bS/F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkZ6iaJ1+JjfSde6ojD5WlapRzhjbrE7udi7VXYUw9zmqTx7u
	P1vKzRsnu+Ei/utnr0OQG4wgf1PyYQR2CX1HfjFFkwaQ2oPmV44N52/G
X-Gm-Gg: ASbGncu/w+dzxGBSXiZnP3q74XHuQJ1e7mCsOWk1jX+4lX9vPlx5yMjghBij1A0vjWb
	hgaI8478OWO4Hsxd3Oi/Ovej2Ckj14Q1un8QGF6EANjcujFdytedaZmMMv1SBGsKeZiWRLZvRF9
	uUfVxb2DedTfsFti4PLMSNgtUwJH3/BBQfVRVV12IFuTMChrpH2xcOS5TmL0tf4uGYPIJqRVpHp
	4Hw7HmgQ75dmKMNzktchJekYyfHnu7JYmEPor4b9w0SfikFb88qCB3FNxO2esmVwtSbOKuTk84l
	Bzlpr+Te46f6wf65KvmvGCVO7BbeK6Qnwjv2jPxeOA6s7GujCoEDUug2EjuyuPUn8pMXvu1rdr/
	eG8FHXR24+hFDmE40n5o0uUtJxE5cKx9e7ZFPfcvgzLqlXs2/8cxg
X-Google-Smtp-Source: AGHT+IGF2mjIxrMUA3JwHk7twUryOi05Kk5XH3umZe4PU/R/nsBf37n3nn88DGx6tmBt62ZevxTFdw==
X-Received: by 2002:a05:622a:4d8f:b0:4a9:935b:abf3 with SMTP id d75a77b69052e-4a994ef3374mr195180161cf.10.1751901208345;
        Mon, 07 Jul 2025 08:13:28 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949fb04asm65446731cf.20.2025.07.07.08.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:13:27 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8712BF40068;
	Mon,  7 Jul 2025 11:13:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 07 Jul 2025 11:13:26 -0400
X-ME-Sender: <xms:FuRraGc65SqNf1yxj1nWPGmBNfKEDueW8rdTJNmK2MMz_HpcAUlhVQ>
    <xme:FuRraBQft0bqrWRsr4A3w4bw3vg_h5hcRuBo9TJ6dvVyBkfUcVTlv35KKImMZr8tx
    70b89PZBX5p4phVIg>
X-ME-Received: <xmr:FuRraKcI3NbnAZF9s84kQoHchiPbRqqPHUxjUAJ1iz_urVOdyuov6YQQGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedviedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehg
    rghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmh
    grihhlrdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtg
    hgrhhofheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:FuRraBr_Q0pWsF_49dFtj3Jqikk9epPdxrkBThs2ECzRQTkj95TbWg>
    <xmx:FuRraLe1bYyMCKiMh5qqyQ0VL7CwfFno_Y9i-sYbLYkO180aukfFMA>
    <xmx:FuRraJlh8fxsIqXKGXvUc0uZYo1jKlQFUA-cYxQVk5EXoBkmgJJeVQ>
    <xmx:FuRraGtcRmLZB2NeqR1_eHz3L7xyBR63FfLZIwNGgkDgigDmxBlxsQ>
    <xmx:FuRraEyt__xhrwD8YO8MmRtAVm76MNgU6tXoTju3gaI4SUBQBY-pFU1F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jul 2025 11:13:25 -0400 (EDT)
Date: Mon, 7 Jul 2025 08:13:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
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
Message-ID: <aGvkFbs5caxLSQxa@Mac.home>
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>

On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
> On Mon, Jul 7, 2025 at 3:32 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > Introduce the `SetOnce` type, a container that can only be written once.
> > The container uses an internal atomic to synchronize writes to the internal
> > value.
> >
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> 
> LGTM:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> > +impl<T> Drop for SetOnce<T> {
> > +    fn drop(&mut self) {
> > +        if self.init.load(Acquire) == 2 {
> > +            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
> > +            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
> > +            // `self`.
> > +            unsafe { drop_in_place(self.value.get()) };
> 
> This load does not need to be Acquire. It can be a Relaxed load or
> even an unsynchronized one since the access is exclusive.

Right, I think we can do the similar as Revocable here:

        if *self.init.get_mut() == 2 { }

Further, with my following Benno's suggestion and making `Atomic<T>` an
`UnsafeCell<T>:

	https://lore.kernel.org/rust-for-linux/aGhh-TvNOWhkt0JG@Mac.home/

compiler can generate a noalias reference here, which allows further
optimization.

Regards,
Boqun

> 
> Alice

