Return-Path: <linux-kbuild+bounces-8741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBFBB45C86
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 17:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28DD48560B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 15:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80E723D7F8;
	Fri,  5 Sep 2025 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5coExKt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294F231845;
	Fri,  5 Sep 2025 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085966; cv=none; b=GDJRPm0TJQQqGt8wB71VTTfZIe72NJndGfB2pzwtPoo6Q+Y7bIU3ORfb06v57FT0eJRyabiNDsVLq5w3jBcCn6bLx4FCyX5D19hL1ZeQ8V5yHVG3cin9ljumYdncD7MXweLV0Gi3GpV5mnZ3kkpGuX/tLooiE0B5MVW50P5uOzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085966; c=relaxed/simple;
	bh=HeSmTEkMZa5aYj4W+/yA7FOCufTHzp4QQTSxsuJZE1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEStt7Ue/8tLmyKibXUcM83Su5w6CRkS00CynDxlrdNohXZ7TZkcsN8uKzN1AbbGKYsiE1hf4fOZYWFwURfZ6FTd90mu2kgRF+EPkV47TFER8AV8WGJ7IgKGvD0IshdRmklwc4mUIEPkLD9ahzyG3CLAw0/wn0xOnQURFln/PWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5coExKt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95369C4CEF1;
	Fri,  5 Sep 2025 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757085966;
	bh=HeSmTEkMZa5aYj4W+/yA7FOCufTHzp4QQTSxsuJZE1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5coExKt3JFlpn19Eh/CX6P8SbVNODKaVutXfs0yU0xu8ok2KvaAAHxVRuNAXmY9m
	 JdcAnimbzcKMzcu4NXIiz6SWsyshIqac2oE3lqMNq926ekkR18m/uo1RT5N4p6R7gQ
	 IHAcu1cJOOuZo3jvJNVyATQQ3gTPH6adbIme1r5T+V41ffhmCLO4WJBazIptDQrQwN
	 jKZQjNVz7i/nXi441Yln43I1FQZCBovg+l8Yq9GNZ/mE+l9Z/kGIdM0xk2KwtV4I0s
	 6rBixDmc1FaR9+rcesjmSIPl9wh2/B4MDhjTZkpyySVoHhrwY7/LwDbnffAz/SaayM
	 /4o4yimnhYZbw==
Date: Fri, 5 Sep 2025 16:25:56 +0100
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
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250905-domain-theater-214254632b87@spud>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
 <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
 <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+82/AboaHQrENvzx"
Content-Disposition: inline
In-Reply-To: <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>


--+82/AboaHQrENvzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 07:07:20AM +0800, Asuna wrote:
> CC rust-for-linux list, I missed it in copying from get_maintainer.pl, the
> thread is a bit of a mess now :(

If you're doing that, keep the whole message in the mail. Think I just
perpetuated the problem by replying to the mail a body rather than the
one with the amended CC list.

--+82/AboaHQrENvzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsBBAAKCRB4tDGHoIJi
0vPPAP0WJW3cfKzXqItvB2XzxRMkipRGuzMESsAFO02Trs2WgwD+KeERdtt4LZdp
OrpmtNGQfWOFHR1lVYnmonUUL88WawI=
=lC0v
-----END PGP SIGNATURE-----

--+82/AboaHQrENvzx--

