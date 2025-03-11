Return-Path: <linux-kbuild+bounces-6063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4548A5CDB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841963A3EC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 18:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4092620E5;
	Tue, 11 Mar 2025 18:19:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C525C6F9;
	Tue, 11 Mar 2025 18:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717189; cv=none; b=YFOIZVf5uGCvSi+Xyteea9oBPxp8G3Az2LOluSKqlJTYqZyUUD/3BjJZKvt9lRNquA9ysl7I+xN/tVPuAyWy29eRm0l2Hots0DbfwudeVfOtSb28qsEm8aP0uXmBE7wlKnfDi+p/1JWLiT7qsqHdOTttMjPC4ZNeUN8lbnfsBSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717189; c=relaxed/simple;
	bh=MHVyXDoO64HS3559zU6bnpyhretFKohKi5W0Sl1YvqY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tF4vl40xlsbbc2szLjQVmc/Eqy+dpEjH7J6fBo9PTp1UPo+D/dpD/Q6LTP/89d0t5bVuAYKxoKrEigBYLeMPf0T/3DDPh6qiHeHZSzSzlZJdfhLSUkIAl9d4gu0wuir509qJYphfgY/cBv0yhEThtWHT87RvQQB+vW9WEe6pqX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1ts3Wp-008fZK-2f;
	Tue, 11 Mar 2025 17:36:30 +0000
Received: from ben by deadeye with local (Exim 4.98)
	(envelope-from <ben@decadent.org.uk>)
	id 1ts3Wn-00000005VjB-3swI;
	Tue, 11 Mar 2025 18:36:29 +0100
Message-ID: <c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths
 relative
From: Ben Hutchings <ben@decadent.org.uk>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel
 Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich	 <dakr@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org, Urgau
 <urgau@numericable.fr>
Date: Tue, 11 Mar 2025 18:36:25 +0100
In-Reply-To: <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
	 <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
	 <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SHz5T4wd+MHzPWqVsRS0"
User-Agent: Evolution 3.55.3-1 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-SHz5T4wd+MHzPWqVsRS0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-11 at 20:03 +0900, Masahiro Yamada wrote:
> On Mon, Feb 17, 2025 at 10:23=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >=20
> > On Mon, Feb 10, 2025 at 6:11=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@we=
issschuh.net> wrote:
> > >=20
> > > Remap source path prefixes in all output, including compiler
> > > diagnostics, debug information, macro expansions, etc.
> >=20
> > Hmm... We don't do all the cases in the C side -- the docs ask to use
> > `KCFLAGS` when one wants to remove them in the debug info:
> >=20
> >     https://docs.kernel.org/kbuild/reproducible-builds.html#absolute-fi=
lenames
> >=20
> > I am not sure if there is a reason not to cover all cases in C (Cc'ing =
Ben).

I think we should use the prefix-map options by default, for both C and
Rust code.

The default of using absolute filenames only works when the build and
debug systems have their sources in the same absolute directory.  For
some developers this will always be true because they're the same
system.  In the general case, and particularly in production, it's
unlikely to be true.  See below.

> GCC manual mentions the below about the -fdebug-prefix-map=3Dold=3Dnew
>=20
>=20
> "It can also be used to change an absolute path to
> a relative path by using . for new.
> This can give more reproducible builds, which are location
> independent, but may require an extra command to tell GDB
> where to find the source files."
>=20
>=20
> I guess "the extra command" might be a bit annoying.

The command in question is "dir <source-root-directory>".  It's not
particulary annoying.  It also isn't needed when invoking gdb with the
kernel source root as its current directory.

Running that command adds the directory to gdb's source search path,
causing it to look for sources referenced in debug info by:

1. Appending the full filename to that directory
2. Appending the base filename to that directory

(This is slightly simplified from the docuemntation at:
<https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html#So=
urce-Path>.)

When the debug info has relative filenames, case 1 should always work.

When the debug info has absolute filenames,=C2=A0case 2 can work if all
sources are in the same directory.  But the kernel has source files
spread across many directories, so there's no general way to make gdb
find them all.

Ben.

--=20
Ben Hutchings
A free society is one where it is safe to be unpopular.
                                                      - Adlai Stevenson

--=-SHz5T4wd+MHzPWqVsRS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmfQdJkACgkQ57/I7JWG
EQmoUA//bvfMyVxAIIZMWScGpaRq/gpNTlamMQSFtw1CYif6BFsPte+S7LrofDBa
CsyVy+IMGqUnusl/sSL7EWHBq8egHTxLX3mWytZgiGl9f47rkL4zeVIqOFra1fPi
bC0xuk2qjRH/TNS3+WIu26v2w8PMM+OWRnxtUiICCbiL/6w2tNjtseXfvpwAbXid
MmxmELMAC1IwFJTNHiuN4dhGFdBdcWJLh0RrRV81PKXrw/8fpR0aJPmZ4NqhUVxP
jyRPqJ9g8bMWCKlBYAjVZeWw6Tv280YXppRs4L8t9e+K4p+D0EuIy9PzSLea3kwu
foYm5R/mPH9OXYWGVvSN1ag5slsWEGQCssi21Yary9/JmQtcKYMbFDPBJ5Euf3bM
UqOWmsAd3/Dz3Unm4g+EDxY5sz25lhpxCj0m929MHrIJgqj/58AzCc9HrZh0P6G2
e9G5Kd/0NHpWwOLqRsEn7f18YPfMoxWkjZn3MCQwPQAGGItLlwXFbvro29oX7QPq
4N6G7jZA9yTKR+1nfLyGS1JAoXJdgPyAPx8UkK+hK60SGatHJkjhznaU4rTAdyi1
nsLmqnoqe1FolwU6VeSrbU4/fNUxwuYHZ3geLUOiwCNLjbPdnOl5o8Plky4Jxm7n
7nNEsT72Hvgg6UBmEJHE/jH4bEy4mUHxlKWNP7RjSQ/VMoAzdkU=
=JjRR
-----END PGP SIGNATURE-----

--=-SHz5T4wd+MHzPWqVsRS0--

