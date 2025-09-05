Return-Path: <linux-kbuild+bounces-8740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B32B45C84
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 17:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9F616C17A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 15:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A559225408;
	Fri,  5 Sep 2025 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O18InHgf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558071EFF80;
	Fri,  5 Sep 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085889; cv=none; b=TqZSrtf9bYhOGDhuOZZD8pqC9tr6zsZFJ+vv+/oNIuE5g8YNUtg3HhhUaXe/CUM1XCkYkb6V50TLe12s3Pa2QxR4ilw2MuY2Ah0gmAvvSCivI3588E2lGVjuNGyKh1Dr4YKkNxuoGBok76o10Dw3GtJUri20vz0+PDBL/67j+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085889; c=relaxed/simple;
	bh=8YZ6X5KZJEhH4BEj11wZLZMihkQrfiHeRWmRqcL1PG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPV2hN4XlsgiilmMqbnQ4Ufudef0OBdBiGxTnjI4EMlo3iuCXJiHZDe/MvKq5mE+ALCL/+Wtl7X/56ggzzDifJGzDL0pND7AMUaLWN8AlFxlmF52vntF49aNWmrC3a6tfQ2Q69DO3vZ+0du7b6j/EfYS27ECo0C4ekkpXDkKlGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O18InHgf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28ADC4CEF1;
	Fri,  5 Sep 2025 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757085888;
	bh=8YZ6X5KZJEhH4BEj11wZLZMihkQrfiHeRWmRqcL1PG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O18InHgfGkEe6qdiupEfZ/rxyk3ESsIOqG1A+gtZL2zWNFkB6hXBdJvwWWToXla3l
	 wAt98PCKdsFUpkXrvSO4AHZQFJN9gCb9FDN+6TO7w2QBpBmkyosA7Z6oOO0MmhQeJZ
	 kfqIdOEL1meUpPA0oxdHmKOeUpD3ym12FVjUvRasaK0Nm9fCZSA5ncNqfI3ZRl7h6h
	 2kDNIl0XEdwDeQ0PwyHJFnc1IS7JKRaCP9WYPMVMfQ+L3e8uTAyuf8XhElTZd4GkYN
	 T4AUBeJq9gzbC/BR5QXn3gafdVGsvkEmOkNALjs5UhaQSbWbazp5DLIM60otJkG2+3
	 fUTIVO4pU9OWg==
Date: Fri, 5 Sep 2025 16:24:39 +0100
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
Message-ID: <20250905-prolonged-chip-73be9d74ddb5@spud>
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
	protocol="application/pgp-signature"; boundary="nGPHKziLNNz0QDF3"
Content-Disposition: inline
In-Reply-To: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>


--nGPHKziLNNz0QDF3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

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
>=20
> > Other than Zicsr/Zifencei that may need explicit handling in a dedicated
> > option, the approach here seems kinda backwards.
> > Individually these symbols don't actually mean what they say they do,
> > which is confusing: "recognises" here is true even when it may not be
> > true at all because TOOLCHAIN_HAS_FOO is not set. Why can these options
> > not be removed, and instead the TOOLCHAIN_HAS_FOO options grow a
> > "depends on !RUST || <condition>"?
>=20
> Yes, it's kinda "backwards", which is intentional, based on the following
> considerations:
>=20
> 1) As mentioned in rust/Makefile, filtering flags for libclang is a hack,
> because currently bindgen only has libclang as backend, and ideally bindg=
en
> should support GCC so that the passed CC flags are supposed to be fully
> compatible. On the RISC-V side, I tend to think that version checking for
> extensions for libclang is also a hack, which could have been accomplished
> with just the cc-option function, ideally.
>=20
> 2) Rust bindgen only "generates" FFI stuff, it is not involved in the fin=
al
> assembly stage. In other words, it doesn't matter so much what RISC-V
> extensions to turn on for bindgen (although it does have a little impact,
> like some macro switches), it's more matter to CC.

> Therefore, I chose not to modify the original extension config conditions=
 so
> that if libclang doesn't support the CC flag for an extension, then the R=
ust
> build is not supported, rather than treating the extension as not support=
ed.

I don't agree with this take, I don't think that any extension should
"blindly" take priority over rust like this. Got two or three main gripes
with how it is being done here.
Firstly, you're lumping every extension into one option even though many
of them will not be even implemented on the target. There's no need to
disable rust if the user has no intention of even making use of the
extension that would block its use. That runs into the second point, in
that you're using TOOLCHAIN_HAS_FOO here, which is only an indicator of
whether the toolchain supports the extension not whether the kernel is
even going to use it. The third problem I have is that the symbol you're
interacting with is not user selectable, and therefore doesn't allow the
user to decide whether or not a particular extension or rust support
with the toolchain they have is the higher priority. If the check moves
to the individual TOOLCHAIN_HAS_FOO options, they could be a

	depends on !RUST || <condition>

which would allow the user to make a decision about which has a greater
priority while also handling the extensions individually.

> Nonetheless, it occurred to me as I was writing this reply that if GCC
> implements a new extension in the future that LLVM/Clang doesn't yet have,
> this could once again lead to a break in GCC+Rust build support if the
> kernel decides to use the new extension. So it's a trade-off, you guys
> decide, I'm fine with both.
>=20
> Regarding the name, initially I named it "compatible", and ended up chang=
ed
> it to "recognize" before sending the patch. If we continue on this path, =
I'm
> not sure what name is appropriate to use here, do you guys have any ideas?
>=20
> > What does the libclang >=3D 17 requirement actually do here? Is that the
> > version where llvm starts to require that Zicsr/Zifencei is set in order
> > to use them? I think a comment to that effect is required if so. This
> > doesn't actually need to be blocking either, should just be able to
> > filter it out of march when passing to bindgen, no?
>=20
> libclang >=3D 17 starts recognizing Zicsr/Zifencei in -march, passing the=
m to
> -march doesn't generate an error, and passing them or not doesn't have any
> real difference. (still follows ISA before version 20190608 --
> Zicsr/Zifencei are included in base ISA). I should have written a comment
> there to avoid confusion.
>=20
> Reference commit in LLVM/Clang 22e199e6af ("[RISCV] Accept zicsr and
> zifencei command line options")
> https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d44986=
94e15bf8a16
>=20
> > What about the case where TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not
> > set at all? Currently your patch is going to block rust in that case,
> > when actually nothing needs to be done at all - no part of the toolchain
> > requires understanding Zicsr/Zifencei as standalone extensions in this
> > case.
>=20
> This is a bug, I missed this case. So it should be corrected to:
>=20
>    config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
>     =A0 =A0 def_bool y
>     =A0 =A0 depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC ||
>    !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI ||
>    RUST_BINDGEN_LIBCLANG_VERSION >=3D 170000
>=20
>=20
> > The TOOLCHAIN_NEEDS_OLD_ISA_SPEC handling I don't remember 100% how it
> > works, but if bindgen requires them to be set to use the extension
> > this will return true but do nothing to add the extensions to march?
> > That seems wrong to me.
> > I'd be fairly amenable to disabling rust though when used in combination
> > with gcc < 11.3 and gas >=3D2.36 since it's such a niche condition, rat=
her
> > doing work to support it. That'd be effectively an inversion of your
> > first condition.
>=20
> The current latest version of LLVM/Clang still does not require explicit
> Zicsr/Zifence to enable these two extensions, Clang just accepts them in
> -march and then silently ignores them.
>=20
> Checking the usage of CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC:
>=20
>    ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>    KBUILD_CFLAGS +=3D -Wa,-misa-spec=3D2.2
>    KBUILD_AFLAGS +=3D -Wa,-misa-spec=3D2.2
>    else
>    riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=3D
>    $(riscv-march-y)_zicsr_zifencei
>    endif
>=20
> It just uses -Wa to force an older ISA version to GAS. So the
> RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI I corrected above should =
be
> fine now I guess? Or would you still prefer your idea of blocking Rust if
> TOOLCHAIN_NEEDS_OLD_ISA_SPEC is true?

Nah, if the explicit setting isn't required then it should be fine to
not block on it being used. To be honest, I'm not concerned about
Zicsr/Zifencei being communicated across to bindgen as much as I would
be about other extensions, my motivation here is regarding build
breakages - in particular when things like TOOLCHAIN_NEEDS_OLD_ISA_SPEC
is set, since it's a very niche configuration that if someone told me
they were using I would tell them to stop. As I said, the original
reason for this existing was to support w/e old version of debian linaro
were using that could not do LLVM=3D1 builds and I think the person who
added to this handle gcc with older binutils was trying to do a gradual
move from an old toolchain in steps to a modern one, so neither were
instances of someone actually wanting to use such a strange mix.

> (To be clear, the breaking changes regarding Zicsr/Zifence are since ISA
> version 20190608, and versions 2.0, 2.1, 2.2 are older than 20190608)
>=20
> The only thing I'm confused about is that according to the comment of
> TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI, GCC-12.1.0 bumped the default ISA
> to 20191213, but why doesn't the depends-on have condition || (CC_IS_GCC =
&&
> GCC_VERSION >=3D 120100)?

It's probably something along the lines of there being no _C_ code that
produces the Zicsr and Zifencei instructions, and therefore no build
errors produced if they're missing. That's part of why I said my
motivation in this particular case is build breakage, more than anything
else.

--nGPHKziLNNz0QDF3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsApwAKCRB4tDGHoIJi
0mwmAP9bDnlcc+95AWzyJyyoYFiI/Rtae49SrnuKHIhcU/MzCgD/XQD+0ddConmh
ToGmliLxcwvMgLrAOpS8ZStzbjbnYQo=
=xiVS
-----END PGP SIGNATURE-----

--nGPHKziLNNz0QDF3--

