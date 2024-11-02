Return-Path: <linux-kbuild+bounces-4479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBA9BA279
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A251B1F22EC9
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4891AB6F8;
	Sat,  2 Nov 2024 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="c+9ZOKFX";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="XxyW00pI";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="2eQpkgSU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DCD15539A
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581723; cv=none; b=GIHEV5XkvUMoWxwA2Xkpo4dKw6I+WnJwo3pUkm+ZzSMs7pvyc1cQVuogrL4vRfjh85Eunf23p01z3/8rvRyqov76NC3mYIBrWhPftR47jyL/vNC7zaN+qjDDMlxmmHNjHEhEOhX25zHSgUx8XknVHxmCphP0qifQ21QJKr/tiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581723; c=relaxed/simple;
	bh=w81R0U1lIRsZHDXwni/3itjs5unPiJTxJyp8enMnTJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk4z+/fil9Sjxvr8l9llmr6rncTBofSzQCCFa5INKkfLQdfFxtbbs9RBni9UjPL43xLueUd5+zS5CpkJWAVcOpk1cLQuqKrfWxZwpL5DdUzTXDsBOgFkEv+kxE4gbs37hoBRNG9kLIP0g5gPqEJQoipeDryed28vWSRIibIZdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=c+9ZOKFX reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=XxyW00pI; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=2eQpkgSU; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582619; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=FXtYzd58hIsejYDBwOty0zqxkAYRX7PGOZxbYr9Cx9Y=; b=c+9ZOKFXnGK6mr0dqNqWJNSlSJ
	M7TKvcybciNDg5IzApM9jNBX9hyzC9dZLzOu9I5dCw4bp61Ky3yNS9Hae8X4rTRSJH4dpWcROISM/
	mR7qycGMQ/3gtfM7CUPzWjBWTOuwkp7OSXGT5Rg9ZwtN8go82N+Gu41e2wcX1oAVFdR30BDYXPmTf
	1uQsgh4TZW2XHKKV/2n1qjzkNmaR5IexaXZGwM5usKBVe4DsLiNAcc5jUMPFBOCvzfJd0FGryvWJq
	LMfQ/j/MV8xyMbup6kM+swDwsXWqLOTG619BpTnDsoL6r5lBvbIe6VfKSAfA7cKETW4m5adum3f2V
	YCpXA/+g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581719; h=from : subject :
 to : message-id : date;
 bh=FXtYzd58hIsejYDBwOty0zqxkAYRX7PGOZxbYr9Cx9Y=;
 b=XxyW00pI+j8IIAV1QjIG5KLG6YgAcj7t20CMMy7HoyvUeKBMjvQHtqeRoGLXYTmsdBDBx
 UKJ8QZYCs/tDye8p/vHGnhluVfNJJNmtUL+6uzGVb3E4iOgm+85//LQsUFqCre/TFuik1uX
 tdctNIOfd/sc+OBsQ43Vb2Kmo+Csb37x7VTzDuE7pOJzXD3XapBLsdmgg80EmPCm261MNIU
 rMi7AfuV+CHZMnv0xayRcVAj24QvVozfLHXosJ/Du/zMZdrGtWl1F4PNHSHOhF1mM+FBuLQ
 T5vy8/7Hsw0VPHOURqhM8SeC5WBWw84XfQkSHv426VZTszCFGu997oIdyrYw==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LL1-qt4Brl-EN; Sat, 02 Nov 2024 21:07:16 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LL0-4o5NDgrgPmC-nHlC; Sat, 02 Nov 2024 21:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581630; bh=w81R0U1lIRsZHDXwni/3itjs5unPiJTxJyp8enMnTJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2eQpkgSUh2CgKPU1dC4PN6kbmJqOtINCvj/U4OgPFEs6Gh6exe8pZoMVaKKxQ66RM
 nG7/b6ExJZqruT+qR1Vy96go7seA/kYAjljC4K+RevD+BdvKDh4g1Icqxtjs3PQ+MB
 E+OPSBnjRX29wyZ84xxpta7CGWw3kGvO1dPACPKI=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 8D4783D7A0; Sat,  2 Nov 2024 22:07:09 +0100 (CET)
Date: Sat, 2 Nov 2024 22:07:09 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Morten Linderud <morten@linderud.pw>,
 Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
 Kees Cook <kees@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] output a valid shell script when running 'make
 -n'
Message-ID: <ZyaUfcPt3OHztjc_@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pmp/jzAoVQhTmg4c"
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-1-vegard.nossum@oracle.com>
X-UID: 191
X-Smtpcorp-Track: Ym8I9n4PkM3_.qgvK80jZl3gv.eAHGrgRYVZB
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sdUJVp0lVq
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>


--Pmp/jzAoVQhTmg4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 06:02:57PM +0200 Vegard Nossum wrote:
> This patch series lets 'make -n' output a shell script that can be
> used to build the kernel without any further use of make. For example:
>=20
>     make defconfig
>=20
>     # ensure some build prerequisites are built
>     make prepare
>=20
>     # generate build script
>     make -n | tee build.sh
>=20
>     # excecute build script
>     bash -eux build.sh
>=20
> The purpose of this is to take a step towards defeating the insertion of
> backdoors at build time (see [1]). Some of the benefits of separating the
> build script from the build system are:
>=20
>  - we can invoke make in a restricted environment (e.g. mostly read-only
>    kernel tree),
>=20
>  - we have an audit log of the exact commands that run during the build
>    process; although it's true that the build script wouldn't be useful
>    for either production or development builds (as it doesn't support
>    incremental rebuilds or parallel builds), it would allow you to
>    rebuild an existing kernel and compare the resulting binary for
>    discrepancies to the original build,
>=20
>  - the audit log can be stored (e.g. in git) and changes to it over time
>    can themselves be audited (e.g. by looking at diffs),
>=20
>  - there's a lot fewer places to hide malicious code in a straight-line
>    shell script that makes minimal use of variables and helper functions.
>    You also cannot inject fragments of Makefile code through environment
>    variables (again, see [1]).
>=20
> Alternative ways to achieve some of the same things would be:
>=20
>  - the existing compile_commands.json infrastructure; unfortunately this
>    does not include most of the steps performed during a build (such as
>    linking vmlinux) and does not really allow you to reproduce/verify the
>    full build,
>=20
>  - simply running something like strace -f -e trace=3Dexecve make; howeve=
r,
>    this also does not result in something that can be easily played back;
>    at the very least it would need to be heavily filtered and processed
>    to account for data passed in environment variables and things like
>    temporary files used by the compiler.
>=20
> This implementation works as follows:
>=20
>  - 'make -n' (AKA --dry-run) by default prints out the commands that make
>    runs; this output is modified to be usable as a shell script,
>=20
>  - we output 'make() { :; }' at the start of the script in order to make
>    all 'make' invocations in the resulting build script no-ops (GNU Make
>    will actually execute -- and print -- all recipe lines that include
>    $(MAKE), even when invoked with -n).
>=20
>  - we simplify the makefile rules in some cases to make the shell script
>    more readable; for example, we don't need the logic that extracts
>    dependencies from .c files (since that is only used by 'make' itself
>    when determining what to rebuild) or the logic that generates .cmd
>    files,
>=20
> This patch is WIP and may not produce a working shell script in all
> circumstances. For example, while plain 'make -n' works for me, other
> make targets (e.g. 'make -n htmldocs') are not at all guaranteed to
> produce meaningful output; certain kernel configs may also not work,
> especially those that rely on external tools like e.g. Rust.

Thanks for this patch set and all the thoughts laid out here in detail,
especially for the write-up in [1], too!

I think it is a good idea to work towards hardening the build system against
known and difficult to spot attacks.  As the patch set integration needs a
complete 'make -n' script (at least for a "simple", defined config) to be
successful, I expect that it might become quite some work and patience, but=
 I
think it is a meaningful goal.

In order to prevent "degradation" of Make rules after a possible integratio=
n,
we need some (automated) testers, otherwise we will loose all the efforts a=
gain.

Please give me yet some days for a first rough round through the patches.

Kind regards
Nicolas



>=20
> [1]: https://www.openwall.com/lists/oss-security/2024/04/17/3
> [2]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags
>=20
>=20
> Vegard
>=20
> ---
>=20
> Vegard Nossum (11):
>   kbuild: ignore .config rule for make --always-make
>   kbuild: document some prerequisites
>   kbuild: pass KERNELVERSION and LOCALVERSION explicitly to
>     setlocalversion
>   kbuild: don't execute .ko recipe in --dry-run mode
>   kbuild: execute modules.order recipe in --dry-run mode
>   kbuild: set $dry_run when running in --dry-run mode
>   kbuild: define 'make' as a no-op in --dry-run mode
>   kbuild: make link-vmlinux.sh respect $dry_run
>   kbuild: simplify commands in --dry-run mode
>   kbuild: don't test for file presence in --dry-run mode
>   kbuild: suppress echoing of commands in --dry-run mode
>=20
>  Makefile                          | 28 +++++++++++++++++---
>  arch/x86/boot/compressed/Makefile |  6 +++++
>  scripts/Kbuild.include            | 27 +++++++++++++++++++
>  scripts/Makefile.build            |  2 +-
>  scripts/Makefile.modfinal         |  9 +++++--
>  scripts/Makefile.modpost          |  8 ++++--
>  scripts/Makefile.vmlinux          | 22 ++++++++++++++--
>  scripts/Makefile.vmlinux_o        |  3 +++
>  scripts/link-vmlinux.sh           | 44 ++++++++++++++++++++-----------
>  9 files changed, 123 insertions(+), 26 deletions(-)
>=20
> --=20
> 2.34.1
>=20

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--Pmp/jzAoVQhTmg4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmcmlHIACgkQB1IKcBYm
Eml7shAAxFIYEaWxMQ0qvfZkqVzQYZHYmTzilt3O6e3MAmhxuuy8OS/a1zWHitzv
dU1cqd06AiecDUu7JKVZmCLVt/afEwe1Tya1/ezcmAdrl6f7dcS3LwXEaZlKUoSG
gzKmMURniJL2GQ8rZbeJavtl6lSIne9Jr5HTh7RZRFX7JCEtvjcHAkhtxvvXIH02
WTo5pPufSmNzRkaVLAGTforuZHT9x20Dvi5EMspYPEcd8pAIhwBj84RUszHnhS3J
NKT3CjtoND7xRI4joHK97DUVCvN5FFUdnmPyNLN7gRFNMXgoaC9m2n5OLpLH/zNo
yATy1sRaso17XKMaL3TV3zCOfwgJPmJweLZ9R8s/V41fCfY4ICP8nij4a4AS24oF
hUJN9KpU2t7/AgsGGAypqO8A3jkHJ1E4m+lbSjB/fnBAAsnTNKQIrQFZKAW/mtUj
xrZSTLYkQ5lGmi7lCwZmrB4CTlfYnOg9R/MScI6u20JE424dj2e15HCMXwwnAd96
j1oovLVCDdjxJpkzO9pZGWUnEke0o9aRA9x7LzLWiz7c53/ZrF6qo4Jrak63f+wD
NlFpK2QOuk+H3EvnrG6gQzVqr6+rF3cM9HkjVV68ayIAbvIEw5GTk3y5CaML9u8o
EE3JIat4rZDaKmRHNOTWf6nxC4moZ5q5oc17LMegdH5QdSYYAzI=
=9a03
-----END PGP SIGNATURE-----

--Pmp/jzAoVQhTmg4c--

