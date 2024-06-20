Return-Path: <linux-kbuild+bounces-2225-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7666990FF58
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 10:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80A328565D
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 08:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238DF1ABCA6;
	Thu, 20 Jun 2024 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="R7ZNqx3f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XToeBiMX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F6D1AB515;
	Thu, 20 Jun 2024 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873162; cv=none; b=EogEZnd9s9HVFetyIdx7VeB9bMmttAPki26wWYBALug7E/uHMfRg81yv68CBtxm7yvfs5IWjlYjSdhPRWANILp0B8EfNFuPBJUrLrVjIprJnbTKcKM0F33gbL+dxSa79i4G2HG2azylg2AJ1GSqsRDUfRDugDAHLcDyIPjxcD9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873162; c=relaxed/simple;
	bh=iu9Qsy1Q3Z5wWLHAdLya1yL55GGGG38xW3ihZShowMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYl5jJd2b0msFwDYYTBMrjTxxNIjlJ0Vz1W6PwiUXq4wIZOJ3Xr9jKINllH0lA4YWbc+JnFYXd2HQXY2zuDX9v4FWuHlafa6uBjRD8mAnsENZOw5ODyKvw5Oqn5HtXVMVUbJuOZSLKIK62uOsCaJMVf2Kg4+rYmx18VGOCwd1EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=R7ZNqx3f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XToeBiMX; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 996A613807C3;
	Thu, 20 Jun 2024 04:45:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Jun 2024 04:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718873158;
	 x=1718959558; bh=/nJGfaLPFrBcfjyfQUIv53koNxCSN0bq8WWaPmsRHUY=; b=
	R7ZNqx3fwyA9N7V/mXsFgJcDcv4t6b96eJHbbQZCbTLytBtBxjFMHpnSHlfdnubR
	zXC9EdLI3ngeQGGTq95OIU+hPL3293Ownr9DsxgDVVLiXup8DwT1Uke4xgzFtPZg
	mOS2+E4OYIhpUyAEnmFIpd3mDJSpT3X91hWwo3ekIhD0hlMyvlsInxfa22QpYHrB
	T1cwA2yhictnn8nRj60yYeZhF24Yym+QVhRMBTehFZ5mdBRmjzmj087syS11sS9R
	PN17Awj57eCD6meh8QiEqtjEkuVziI3h3DwGzvHnbfgBbe9owQLrsX1FH+fNOLwt
	w+aVmJv2RJ4QzbbxcOUwSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718873158; x=
	1718959558; bh=/nJGfaLPFrBcfjyfQUIv53koNxCSN0bq8WWaPmsRHUY=; b=X
	ToeBiMXbs5QBo5iL4dYy/xS6sFMaPnbkgNDipEu+/+SUq3pfWTlySlsFcJNn44+W
	2lmwHDxLB6jnZcLUlxr3rHtTy1JX+iwcbCuiFBSeXHd8tim7pvIasAh72sZ4nB7W
	6+RkcqNr+4AIxGLQphqx/02ZLwIaA9z9bagD71DCLE3gCCyBKW1kthlYXvCCXY64
	gUFeKD7trzMDXHZziDY9gPMm4ME1ika0s1Cz1BBxBslhi8hcmo6w/m/RwVgM+mAF
	eDjBkNWw/qS1B+O4EwoOtQCp2oRiK4wrPLCBThoA66JoWKW9F5aCrSG7X9kGxpVF
	9heoZi98FbpIwJ5Og8Vfg==
X-ME-Sender: <xms:RexzZr9F5QiJTeHm-vgBajKhNS_ovATwJzOROiOdLtVLHyQBieaLsQ>
    <xme:RexzZntoUvxrMg-aC1qwjG_edT0wxibvIlOv8xVZ5O1tAxI-8Wp_4IlMTISjBISnj
    IPRuY8gL5SSDA>
X-ME-Received: <xmr:RexzZpBWuWtHlJvHYyJoTmIZa4ixJn1H-pZ3XlujzluiPc9DSYx0YJESnPIQV38Q0EX9FTpFf5jOr2nCI9AS_GdvcBDCHIgBXiBZew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgke
    ffieefieevkeelteejvdetvddtledugfdvhfetjeejieduledtfefffedvieenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:RexzZnenUlMAgqLLYF-nvcBKPAg4XjhaenBx38nA3XAjwLYwc2OCRw>
    <xmx:RexzZgP8nYwvQTtaSioid3DEoUCxcyAYas1gsrj2pRE7BBNmhaePiQ>
    <xmx:RexzZpmbWT1M1e5vRAhWJAOsAG9thQXLzkRjvor44dJf4tuMGBV2Nw>
    <xmx:RexzZqtHnDI9Q-ln7iIK_sADTLVa84PDcE-UWqSB4hCpxYXt2deVeg>
    <xmx:RuxzZmt_vjCwBxJRaAPeJg381Vl2_epK_NsEGLGkFmBw19HTF_OKjz4I>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 04:45:56 -0400 (EDT)
Date: Thu, 20 Jun 2024 10:45:58 +0200
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling
 and comments
Message-ID: <2024062005-subtype-collage-2c35@gregkh>
References: <20240601004856.206682-1-jhubbard@nvidia.com>
 <CANiq72m46gN4GkfeXgykEar6OVa56ck9FmWQComd+iuf61FVSw@mail.gmail.com>
 <4262dee7-b6fb-449c-9de8-7d6404912338@nvidia.com>
 <CANiq72n=mFF5+MxAmOwNS+ZOGo=H199MX_5nPiZTKchFK+Gn6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n=mFF5+MxAmOwNS+ZOGo=H199MX_5nPiZTKchFK+Gn6g@mail.gmail.com>

On Thu, Jun 20, 2024 at 10:31:53AM +0200, Miguel Ojeda wrote:
> On Thu, Jun 20, 2024 at 8:13 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > What exactly did you have in mind for how that should look? The
> > "make rustavailable" target has some leading *** and some bare
> > statements, so I'm not quite sure exactly how to lay it out:
> 
> I was thinking something like:
> 
>     ***
>     *** Rust is not available.
>     ***
> 
> (the `***` prefix is used also in other similar scripts and by Make itself).
> 
> However, thinking about it a bit more, we should perhaps just let
> `rust_is_available.sh` tell the user why it fails, since it is likely
> the next step the user would do anyway:
> 
>     $ make LLVM=1 rust-analyzer
>     ***
>     *** Rust compiler 'rustc' is too old.
>     ***   Your version:    1.62.0
>     ***   Minimum version: 1.78.0
>     ***
>     ***
>     *** Please see Documentation/rust/quick-start.rst for details
>     *** on how to set up the Rust support.
>     ***
>     make[1]: *** [linux/Makefile:1973: rust-analyzer] Error 1
>     make: *** [Makefile:240: __sub-make] Error 2
> 
> What do you think? Then there is no need for extra output here and the
> patch becomes simpler too.

As someone who just ran into the "wait, how do I get rust to build on
this machine again?" problem, yes, having the link to the documentation
right there would be helpful.  I did know where to find it, but others
might not, and it's free to add.

thanks,

greg k-h

