Return-Path: <linux-kbuild+bounces-5484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDA7A1120F
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 21:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED6F164F10
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 20:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4249C1FCD05;
	Tue, 14 Jan 2025 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pkiDuXa0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DDC1F9EB3;
	Tue, 14 Jan 2025 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736886821; cv=none; b=uPB2J115FD0jJaLYDoD/wEknky27C95x2cSfeEnFpQGGY6xaZQv8VrZJKENABEdhUKQ4Eke6FTjatmsmiQNzoP5s+YKu52eIeL5CiowMpLxJ9uX/PfA18SgLIhLh0f9fkL+DJAnawccwZrdvaT0JIC63E+RX+DZu/Zm1unSgsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736886821; c=relaxed/simple;
	bh=/b5pKPR+HgSbFg/FbL/HysVPUwhvLoHEZ4VXk4zO65g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwN1imzi5y2cGX0Z6XcQTX9CwRYrUU8u3FcDy3pPnPkVeeSHHvDQO4pnXg8iG7QrIgTowfrhKyLcaOYN0i1+Ok1G8n943fqeYL/w5C7hNapnE3R/KmJ1a4YPVujOqi5Yef/jv/3+LQtKIeS3l6xr/LBo/+6p24o52ol5c1twEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pkiDuXa0; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 14 Jan 2025 21:33:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736886812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VsYc6oT5LuI6oBgnyqWNtel+cPqZHgE1uZnZ+C9qRZk=;
	b=pkiDuXa0mD/3T/emblVQptOn+dOodH3T92+OLcolib4pk+uOFjmMzetAK68IX7Mof/+b2r
	b0aZZUgG6FN0zWPN6cYRNwfMqWbeLSpFXOzLpiia/hDhmazX44sXa1UWp+G3GstIFQVuGo
	xhFsux6oi9qSt5HrdVwxozGWBTE0xmo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <n.schier@avm.de>
Subject: Re: [PATCH 00/17] genksyms: fix conflicts and syntax errors in parser
Message-ID: <Z4bKGZWPvNrooZwD@fjasle.eu>
References: <20250113150253.3097820-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f+9HptkmQYRxHGJx"
Content-Disposition: inline
In-Reply-To: <20250113150253.3097820-1-masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT


--f+9HptkmQYRxHGJx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:00:38AM +0900, Masahiro Yamada wrote:
>=20
> This series fixes several long-standing issues in genksyms.
>=20
>  - The parser contains grammatical ambiguities, including both
>    reduce/reduce and shift/reduce conflicts.
>=20
>  - There are several hidden syntax errors
>    When a syntax error occurs, the type becomes UNKNOWN, and
>    precise CRC calculation becomes impossible.
>=20
>=20
>=20
> Masahiro Yamada (17):
>   genksyms: rename m_abstract_declarator to abstract_declarator
>   genksyms: rename cvar_qualifier to type_qualifier
>   genksyms: reduce type_qualifier directly to decl_specifier
>   genksyms: fix 6 shift/reduce conflicts and 5 reduce/reduce conflicts
>   genksyms: fix last 3 shift/reduce conflicts
>   genksyms: remove Makefile hack
>   genksyms: restrict direct-abstract-declarator to take one
>     parameter-type-list
>   genksyms: restrict direct-declarator to take one parameter-type-list
>   genksyms: record attributes consistently for init-declarator
>   genksyms: decouple ATTRIBUTE_PHRASE from type-qualifier
>   genksyms: fix syntax error for attribute before abstract_declarator
>   genksyms: fix syntax error for attribute before nested_declarator
>   genksyms: fix syntax error for attribute after abstact_declarator
>   genksyms: fix syntax error for attribute after 'struct'
>   genksyms: fix syntax error for attribute after 'union'
>   genksyms: fix syntax error for builtin (u)int*x*_t types
>   genksyms: fix syntax error for attribute before init-declarator
>=20
>  scripts/genksyms/Makefile   |  18 -----
>  scripts/genksyms/genksyms.h |   3 +
>  scripts/genksyms/lex.l      |  17 +++-
>  scripts/genksyms/parse.y    | 150 ++++++++++++++++++++----------------
>  4 files changed, 101 insertions(+), 87 deletions(-)
>=20
> --=20
> 2.43.0

Thanks for the series, especially for the very detailed,
explanatory commit messages!

I looked through all the patches and they all look good to me
-- but my bison/parsing/lexing knowledge is rusty and quite
limited, therefore I cannot review properly.

Acked-by: Nicolas Schier <n.schier@avm.de>

Kind regards,
Nicolas

--f+9HptkmQYRxHGJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmeGyhkACgkQB1IKcBYm
EmmVdw//TSe0HsrjhOzRWxUUHmKVl+3eZTG+75DENWqSN8zdBw8ZXfbgyK67/sKK
1G5OrCEH7XpQHFaKD7s+CDV5vkn93KVseOQM+O9csWegbIqZuGPZGYOPD1K/dnue
E/M6SYIqRg86APU2hWv5sOZjWpy/C1q2spdnmVSCB3JHfcCPNvkY5pkfJfBWG+Ak
lfKhGfeWctOqHYGUVALzC7ByJtzKu5+/vj8p143hOR7zGM87BYWFw7HvU1aSWouh
a7L0kFjzFxdVSJ7iW9tuvw43QpJ4UEvRiCGN+WRZDHc5cmwCZ63I8NA1lZB5CrBH
S0dZIA6qUDPGmJOkFQltDxfEWfTH/YO0jW+LQIqrvGCoQk3z+6HeHRrmVstZIOnF
SQQDoewwNNtONcQkL3zmTLecq0CJovfOTm30kkc4y4iqbNF8wpU5agoSESmW7wAJ
2H7EjkFOGrShpFnbysTDgk1oXZu51OHQUvLkB7NY5VW68hml8wUnu2HqS/9tEqG1
iq5OnvHoqtcCYy7dP7qysFx1YkJpBtbP0c4OxD7AcyT68FAEuOKUY7F0fEnXFG6M
8sDDRFHzajoD4eFOPEMMaBbhKDggK9UDmX1QQcxtqeoNscCKxWw9cTZ+4yY9l2Y7
lCJNqsVu4HE/8vFbP4cGNZmi01kINVxBxA/KyH5O9YP9RLxk3zk=
=lq6c
-----END PGP SIGNATURE-----

--f+9HptkmQYRxHGJx--

