Return-Path: <linux-kbuild+bounces-8742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E4B45C94
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 17:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B45562D20
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 15:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53802F7AA6;
	Fri,  5 Sep 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfuKzJoB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAA225408;
	Fri,  5 Sep 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757086133; cv=none; b=ErJwssJvDkeffWpK5bcFVku9DXAwxZITJOe0BPN4hLXJ3gASTf6Y6+2pU8jlRMxDsOQPaBRisJQul1WcKfqBGyjJSjxdDS8l46scz7fuwb3gaTZIEuJlaGuiaXT8HsFCriVaC78gsYrOAeedIJyNZY+KUNA2mzutdoOJMM5r4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757086133; c=relaxed/simple;
	bh=sPEEy5vULDAfl0FqPxMJIccT/9QzwSSYVorKW+7DqOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lD3DCjnqSllmu9NpufXuE13MoWK8C7xxTIhYdUfK7SjjOMYVeCbiwlU20Gzj05YNhNVsfiA49setVke1eytRi1eiSz648HYLkNA6aTC9zBM8Zt5l6h2OB3XO7415v2MDMM/4/SHP9kEiLSQDm/37RntBosiQVotqwyEi9nsc59g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfuKzJoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F727C4CEF1;
	Fri,  5 Sep 2025 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757086133;
	bh=sPEEy5vULDAfl0FqPxMJIccT/9QzwSSYVorKW+7DqOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfuKzJoB7YDS6ZdqbW1seO4OuIsImFFTGR/bXgnGmFJpT8WbxoE0kxe+/AkT2++HE
	 aM2+HP3yidLqlM3C+RLjI7Z5r8mzwoxE4wfa2ikahg+1BswcHiQsmrt5orqitio4Ea
	 Qas/HwsGqrfN7eF5HmmhXZFQfIN7s0XA/8Rk4kwnC3vgtWWQo+sOJlC6GgRHRTukOh
	 GciBrU64ZYTKgOP2Bqx1S4J+G3efY9zyq4RFVewODDTRq5TghYcbO/XOMJiJ6Z/wWt
	 eB9VWDk6YF1Dork/u60T77O+xEjdWSGPRaBYnwNzwHVccac84mr6BwXDrUCjTAHOkF
	 LPXsaZS7k04ow==
Date: Fri, 5 Sep 2025 16:28:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Tejun Heo <tj@kernel.org>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250905-swipe-unstuck-dd7ad6e5466a@spud>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
 <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cr2zhJdWyNpNS/E7"
Content-Disposition: inline
In-Reply-To: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>


--cr2zhJdWyNpNS/E7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2025 at 06:56:35AM +0800, Asuna wrote:
> > One thing - please don't send new versions
> > of patchsets in response to earlier versions or other threads. It
> > doesn't do you any favours with mailbox visibility.
>=20
> I apologize for this, I'm pretty much new to mailing lists, so I had
> followed the step "Explicit In-Reply-To headers" [1] in doc. For future
> patches I'll send them alone instead of replying to existing threads.
>=20
> [1]: https://www.kernel.org/doc/html/v6.9/process/submitting-patches.html=
#explicit-in-reply-to-headers

Ye I think this is mostly just misleading. You're better off providing a
lore link in the body of the mail than replying to some old thread. I
find that explicit in-reply-to stuff only really helpful to send a
single patch as part of a conversation where it's effectively an RFC.

--cr2zhJdWyNpNS/E7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsBqwAKCRB4tDGHoIJi
0o8oAQDiIK6HL6oaYXWxQpproLYlTxZVq7be/QUm0+0M9Fhj4gEAyoX5K7PDnHGS
NVoLGxCGdehDtQmXjvmrQUSeQfwA8Ao=
=fC2y
-----END PGP SIGNATURE-----

--cr2zhJdWyNpNS/E7--

