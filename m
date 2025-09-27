Return-Path: <linux-kbuild+bounces-8965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 790CABA6324
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Sep 2025 22:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DAE8179D6A
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Sep 2025 20:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3856D1D63F7;
	Sat, 27 Sep 2025 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHdtofk7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224813B58B
	for <linux-kbuild@vger.kernel.org>; Sat, 27 Sep 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759004404; cv=none; b=WfTjOSWR43oGOPoUsjB6oL0EflpdUMAQXiR5wfmD7aT8uYP7tjTPZbWy6sA9Mh8xzsfoPLqRXwHCtVVyUSift/dXW9xaLseYor6woddUOxNEKBm05DBBXw+AT3ptJgESu6Jdm/JNP219+ytZBvyMq3gYdTi3mNXS2f8BkOHZDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759004404; c=relaxed/simple;
	bh=elBQlQ0lRBRyBHUGvss+kQFqw5050kVF34p620qcKFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs6GUeHHS30QL5VXMSDLjqFUSUkgtmQge2i+ntSqtu+Z1zgd1aUBym4iushJ/L6Hbu/+YpHXcMHVYs5w1jE36OBJ7QuajEplvTYSXdlWwT7KMnynM+FVS3glqIIkA6WTHzQsS9zdN61m/gShuKioMpii8z6wOAaYnvSrPCSdZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHdtofk7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ECFC4CEE7;
	Sat, 27 Sep 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759004403;
	bh=elBQlQ0lRBRyBHUGvss+kQFqw5050kVF34p620qcKFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHdtofk7f2Jt8wTG/39mRhRUDk/iXNLH9RnmF7dv5N3/+Q/SC6W1fjptLzE8J9H5j
	 q6iHZucHdpQaR8S9XQMCbPiN3MzjOfNIRyfCnVWjcR0BtI7IZ6qDIED42tsL7DO47/
	 KmjGhSntscKe7Tt9uR/xtAjHlma+ySkNBLbDk1AHbjoiViVhDn89z+JZOMROfk4//O
	 vED2UWqOMlKmrWb8zv35FpBs+k3PH6RKu1jGHdi0bTreB7tpdfWme5SZyBDTuVu7cM
	 u/ZGNXASgu2QWSPVDwSdewEn/JxWF8rIPdCgbifIYS65HvNgh7FMpcG98ZT/ptANFh
	 co9+/vGMJoe/A==
Date: Sat, 27 Sep 2025 22:18:47 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Tool directory build problem..
Message-ID: <aNhGp7NDCCrtwJqm@levanger>
References: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="++043sky81sjvUI9"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>


--++043sky81sjvUI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, Sep 27, 2025 at 11:23:22AM -0700, Linus Torvalds wrote:
> This isn't new, but I hit the problem once again because I decided
> that I should make sure to build-test the tools before the 6.17
> release since I got another tool pull fairly late in the game..
>=20
> And it fails annoyingly and immediately, with
>=20
>     make tools/all
>=20
> failing quickly for the ACPI pfrut tool with
>=20
>     undefined reference to `uuid_unparse'
>=20
> errors.
>=20
> Those errors do *not* happen if you build it inside the tools/
> directory itself. So doing
>=20
>     make -C tools all
>=20
> works just fine, but we literally have a "tools/%" target that is
> designed for this, and it doesn't work.
>=20
> It doesn't work for that pfrut tool because the top-level Makefile
> rule does this:
>=20
>     $(Q)$(MAKE) LDFLAGS=3D O=3D$(abspath $(objtree)) subdir=3Dtools -C
> $(srctree)/tools/ $*
>=20
> and that "LDFLAGS=3D" is an overriding variable assignment, so the use of
>=20
>     LDFLAGS +=3D -luuid
>=20
> in tools/power/acpi/tools/pfrut/Makefile end sup not working.
>=20
> But it works in all other situations, just not when build this way
> from the top. Annoying.
>=20
> I'm not sure *why* the top-level Makefile does that "LDFLAGS=3D"
> override thing. It doesn't do it for anything else. Just that LDFLAGS
> variable.
>=20
> Yes, yes, the ACPI tool makefile could then use
>=20
>     override LDFLAGS +=3D -luuid
>=20
> but why would it do something as crazy as that?
>=20
> That "LDFLAGS=3D" override goes back many many years,  In fact, it goes
> back to the very initial addition of those rules in commit
> ea01fa9f63ae ("tools: Connect to the kernel build system").

I have never really dived into the tools/ tree, thus I am not able to give
helpful comment about build problems of any tools/% target,
spontaneously.


But I know that there has been a long-term strained relationship between
kbuild and tools.  Masahiro put it this way in June 2024, when asked
about his concerns about the tools/ integration in top-level Makefile:

Masahiro put this

    # The tools build system is not a part of Kbuild and tends to introduce
    # its own unique issues. If you need to integrate a new tool into Kbuil=
d,
    # please consider locating that tool outside the tools/ tree and using =
the
    # standard Kbuild "hostprogs" syntax instead of adding a new tools/* en=
try
    # here. See Documentation/kbuild/makefiles.rst for details.

into top-level Makefile after yet another troublesome patch discussion
(referenced in commit 6e6ef2da3a28f3e02).


Further, he mentioned worries about the (current) situation:

    The tool build is integrated as a pattern rule in the top Makefile.
    (tools/%)

    So, you can build other tools from the top Makefile.

    See commit ea01fa9f63aef, which did not get Ack from any Kbuild
    maintainer, and caused subsequent troubles, and the benefit
    of which I still do not understand.
   =20
    Supporting "make tools/perf" in addition to "make -C tools perf"
    only saved a few characters to type.
   =20
    So, the problem remains, unless I revert ea01fa9f63aef.
   =20
    I decided to not care about it too much, as long as
    such tools are not used during the kernel build.
   =20
    I am really worried about objtool and resolve_btfids,
    as these two are used for building the kernel.

    https://lore.kernel.org/linux-kbuild/CAK7LNASZi3A_BzFACOvZhwByHaVon-Cd5=
H++uygsv4m_fhDOyQ@mail.gmail.com/

So, to be honest, I doubt we have someone at hand right now who is able
to fix the tools/ tree.

Personally, I'd favor if we could work towards removal of the 'tools/%'
rule in top-level Makefile, as long as tools/ is not kbuild-compliant.

Kind regards,
Nicolas

--++043sky81sjvUI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmjYRpgACgkQB1IKcBYm
Emn6MhAA3LWKRKLounvgcD8jWkWKgG6Jl+8wM/oh/T6MfzjOiUTR/TEjFLUm20VM
YZZJonC2mOMX/A8cYqhMKwkfP2XxDcuaWc1c3DGPqGL3QiLIrvphD4gMdk6o93HL
dEKQkKsc9FZ5CTJjRTuNSCIWY7C2/skdei+51FW08ByKA+bdG3aIC2GO7DgsT/p+
XnkKBsZ4d1fVPeHnoGk/j2ld0SDJ7EywJJMIf7POQwjokrAYksmFteYGKVi0oEt1
+RksCLmRDF4NFsTU9drCEjAwva8I71TehciVpMvc1RsTMCOwYwFkOEpKrplWmDnv
xowm+LXeQHCT75vp72VmhIgEMiBfsOFS/mWrMfuH+d+d7BoMSTI/F35xrdiDNXuy
qWPjOGhaYScSM1PFnPVXwdtNRF+BRF3m8JOTsySKEGu6hfaM8llTqeUcyVo96RWQ
s9F9pYzalUTo0v1OoLKl4+U/pHLzHMfDtuF+OJPraabpgnx17t9S5kJd25OyOfvx
KFhpntkJvvK2D7c+6HUz8XvI81yQ8yg16FaYHT/f4++wT+tK5e6A2FxolYujV9Ak
T+ZntMlwuGqYQyvHQaMa9xenmK3b0k0akFVCEIvYVeKOFhlnuBUBDgKoU2rdJrIb
x2KKx7RDOM74TLG1j1iTBuNeQFC1SgAHegf9mFYhB1qFeg40Lzc=
=lgzM
-----END PGP SIGNATURE-----

--++043sky81sjvUI9--

