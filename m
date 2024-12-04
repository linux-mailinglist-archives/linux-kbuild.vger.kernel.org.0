Return-Path: <linux-kbuild+bounces-4990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12139E3C5C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 15:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2606281D47
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 14:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BB91F7096;
	Wed,  4 Dec 2024 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VtRef5HE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FA1F7086
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Dec 2024 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321644; cv=none; b=KmJ6WM8K57Vp9JEZZ+RxgFdlnTIXSxipDmM6/mf3lBi2w/sJsC65p1E2bxErvsSzvIKNsHuc8Ftqgq+KkRFsANTiw8FA8j6Orulo5dRfmt1zo592MO7KXVoJbVAKxNgPxVNylKZ763TQ9lj1j5QGwipDzYpSIPjZZ4F/7a923Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321644; c=relaxed/simple;
	bh=YqBTTtmspgpAaPB8Vl+lCcOngN3SNoVwGWM8tIXXFeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:From:In-Reply-To:
	 Content-Type:References; b=X5f2g/JnQ9q3gbWAA3AJ2z2hdep2WJwx80Rapdi9q0cdgeDLbpEWhr9f4hP24AQrkZGXOxkSWAgk8yxk1GV6Z+zwJTowcR8/KmwHwEKahTSjmCY3pFCQgjSfhQmyZ/zbZ4tZQ5q7ecZ5FTzvFFkEDriXMP5otcHbH1wHUk5Eh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VtRef5HE; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241204141359euoutp02ef20d6cc9c935392f8964ed4fe4a56fa~N-tjqx8Eo0325603256euoutp02Y
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Dec 2024 14:13:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241204141359euoutp02ef20d6cc9c935392f8964ed4fe4a56fa~N-tjqx8Eo0325603256euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733321639;
	bh=ISwloY1NdxbnE/1mwJNybSwdv4dMdqKYhk40MdTyGqE=;
	h=Date:Subject:To:CC:From:In-Reply-To:References:From;
	b=VtRef5HE7je+H//esV3MYKxFyNwD1ZrJj45p0JFNx73y4Y7OCNbERr3Lba+M8OE2K
	 pNbocEvSzANvscJngGym6ErtX4HLGDtL/gD6ynU01qJ4AL3V/HXOXBi862/wBiG/6e
	 dN5CCjvP6vprQShx5/BIymNJflmmJH2qtSa4+A/I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241204141358eucas1p1c41e5a9f9948febc7c06b4f0ff4b17c8~N-tjO3niI2143621436eucas1p1D;
	Wed,  4 Dec 2024 14:13:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 3E.CD.20397.6A360576; Wed,  4
	Dec 2024 14:13:58 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241204141358eucas1p26b1ad0b9f899e2353e93e5fca429e92f~N-tir2THC1530015300eucas1p2l;
	Wed,  4 Dec 2024 14:13:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241204141358eusmtrp18e6327bffa1bf8832b53fd2e8e34607a~N-tiqnbsQ1529915299eusmtrp1c;
	Wed,  4 Dec 2024 14:13:58 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-79-675063a684dc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id E4.53.19920.6A360576; Wed,  4
	Dec 2024 14:13:58 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241204141357eusmtip15584069bb27958c26e67ec8045196107~N-tifdn8D1462514625eusmtip16;
	Wed,  4 Dec 2024 14:13:57 +0000 (GMT)
Received: from [106.110.32.87] (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 4 Dec 2024 14:13:56 +0000
Message-ID: <a8f28e4b-5319-4b99-9882-645057f92b95@samsung.com>
Date: Wed, 4 Dec 2024 15:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
Content-Language: en-GB
To: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada
	<masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthew Maurer <mmaurer@google.com>, Alex Gaynor
	<alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu
	<petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin
	<marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes
	<mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek
	<sedat.dilek@gmail.com>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
From: Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <20241121204220.2378181-21-samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7djP87rLkgPSDXomqlr8nb2d3eLnVT6L
	i2deM1o0L17PZrF+RbDFn107mCwu75rDZtEw+zurxelrC9gtHj64wWpxd8UNJosbE54yWjx/
	v5bJ4nPjPiaLlfOXM1os/fKO2WL9s8PMFktXvGW1WDf1BIuDsMeSzl9MHjtn3WX3uHlnJYvH
	gk2lHgeuNDB7bFrVyeaxf+4ado8Xm2cyeixetpPNY/2WqyweZxYcYff4vEkugCeKyyYlNSez
	LLVI3y6BK2P/ry3sBX0tjBWXVl9kbGCcm9zFyMEhIWAiMXutRRcjF4eQwApGiU/Np1khnC+M
	Eo/nLmeHcD4zSmx7+hsowwnWcXbObkYQW0hgOaPEvqtccEVr13VCdexglLjzcwcLSBWvgJ3E
	nN07wDpYBFQk7l3qg4oLSpyc+QTMFhWQl7h/awY7iC0sYCaxe/ZGMJtZQFyi6ctKsM0iAucZ
	JaZ+tgVZwCzwmFliz5llbCAJNgFNiX0nN4E1cAo4SBw/c44Z5DlmASuJ6Sc8IebIS2x/O4cZ
	4gNFiRkTV7JA2LUSp7bcYgKZKSHQxSVxe2IjI0TCRWLr8gtQtrDEq+Nb2CFsGYnTk3ugmtMl
	lqybBWUXSOy5PYsVEqjWEn1nciBMR4kpn+MgTD6JG28FIa7hk5i0bTrzBEbVWUgBMQvJw7MQ
	7p+F5P4FjCyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAlPn6X/Hv+5gXPHqo94hRiYO
	xkOMEhzMSiK8QdoB6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5VVPkU4UE0hNLUrNTUwtSi2Cy
	TBycUg1MDtVyvZvSbkus77zS2x8qLfLbyeLBrOdhjx12PDURuGuV89pv1i61Hba+JwQsKhpk
	N5/TTL9ZoRPwkKejU/i8Wb0lw/MfUtvmsW9c8F777uJd/mZrXN0/VJhndMiuTvB3+/JUjv02
	p++e96fW/0xZ6rwxX1jNycmP9+GBuvhlrmy3j3+0+VbvtrE77dmrV25pxhxdl6YvPn53Z46b
	44Ea6y2Lk/x0rxzQfmZvP2ODh9ImuYMnp07912yh8z0rwYD74CWntEqlhTU5BtLxGhvWCTpU
	v3hiubTXe3/gpd+iE2zvnHbaseLcu+DF0TGaxn1HzJ+ps67+fPBVxbzfSjJRch2HtdNNE55y
	GH1tmCekxFKckWioxVxUnAgAinlAfwwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsVy+t/xu7rLkgPSDT79ZrH4O3s7u8XPq3wW
	F8+8ZrRoXryezWL9imCLP7t2MFlc3jWHzaJh9ndWi9PXFrBbPHxwg9Xi7oobTBY3JjxltHj+
	fi2TxefGfUwWK+cvZ7RY+uUds8X6Z4eZLZaueMtqsW7qCRYHYY8lnb+YPHbOusvucfPOShaP
	BZtKPQ5caWD22LSqk81j/9w17B4vNs9k9Fi8bCebx/otV1k8ziw4wu7xeZNcAE+Unk1RfmlJ
	qkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsb+X1vYC/paGCsu
	rb7I2MA4N7mLkZNDQsBE4uyc3YxdjFwcQgJLGSV+fepmg0jISGz8cpUVwhaW+HOtiw2i6COj
	xOVDD6CcHYwS2y6+ZwKp4hWwk5izewcjiM0ioCJx71IfC0RcUOLkzCdgtqiAvMT9WzPYQWxh
	ATOJ3bM3gtnMAuISTV9Wgm0TETjPKDH1sy3IAmaBh8wSxyf/h9p2klHi5JfVYPexCWhK7Du5
	CaybU8BB4viZc8wQkywkFr85CDVVXmL72znMED8oSsyYuJIFwq6V+Pz3GeMERtFZSA6cheSQ
	WUhGzUIyagEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA5LPt2M/NOxjnvfqod4iRiYPx
	EKMEB7OSCG+QdkC6EG9KYmVValF+fFFpTmrxIUZTYChNZJYSTc4Hpr+8knhDMwNTQxMzSwNT
	SzNjJXFet8vn04QE0hNLUrNTUwtSi2D6mDg4pRqYpA/pmJXzTfrG7mS5fonasavKby/qMc6c
	G6nygmVSbM0x0cRHbw6J5W/8ldpvViH55r+m0aTG7tW/JvOq8tlUz9iuz8tr0LS2i2lfvs/U
	574XuSo7f3wxb17uelNjTndoDpNHxC7HmXxvtxcICbUp7RL8vuVr0AqlgOjbUgLLeS462PKq
	p7RsKoizDOM2sXrcOZWh9M5+KU7N0JBHcnJava+U5u71eyxtLJAzI12z8apAymrO7pJ/r2Ie
	ddWsT16r3cL2aqn2K1F5pb3NOttOisRffzln3gx2lWk/mIrdLJMa2eSC1BI8vurxv5gZ8Cvt
	69NdP1g3Zy8vTHnF/XIhf2hU+N3sbzs1l8SerlViKc5INNRiLipOBABJv4xGxwMAAA==
X-CMS-MailID: 20241204141358eucas1p26b1ad0b9f899e2353e93e5fca429e92f
X-Msg-Generator: CA
X-RootMTR: 20241121204243eucas1p191055690457a8f56962315c32df2558d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241121204243eucas1p191055690457a8f56962315c32df2558d
References: <20241121204220.2378181-20-samitolvanen@google.com>
	<CGME20241121204243eucas1p191055690457a8f56962315c32df2558d@eucas1p1.samsung.com>
	<20241121204220.2378181-21-samitolvanen@google.com>

On 11/21/2024 9:42 PM, Sami Tolvanen wrote:
> Add a basic DWARF parser, which uses libdw to traverse the debugging
> information in an object file and looks for functions and variables.
> In follow-up patches, this will be expanded to produce symbol versions
> for CONFIG_MODVERSIONS from DWARF.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>   kernel/module/Kconfig                 |   8 ++
>   scripts/Makefile                      |   1 +
>   scripts/gendwarfksyms/.gitignore      |   2 +
>   scripts/gendwarfksyms/Makefile        |   8 ++
>   scripts/gendwarfksyms/dwarf.c         | 166 ++++++++++++++++++++++++++
>   scripts/gendwarfksyms/gendwarfksyms.c | 126 +++++++++++++++++++
>   scripts/gendwarfksyms/gendwarfksyms.h | 100 ++++++++++++++++
>   scripts/gendwarfksyms/symbols.c       |  96 +++++++++++++++
>   8 files changed, 507 insertions(+)
>   create mode 100644 scripts/gendwarfksyms/.gitignore
>   create mode 100644 scripts/gendwarfksyms/Makefile
>   create mode 100644 scripts/gendwarfksyms/dwarf.c
>   create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>   create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>   create mode 100644 scripts/gendwarfksyms/symbols.c
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 7c6588148d42..f9e5f82fa88b 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -169,6 +169,14 @@ config MODVERSIONS
>   	  make them incompatible with the kernel you are running.  If
>   	  unsure, say N.
>   
> +config GENDWARFKSYMS
> +	bool
> +	depends on DEBUG_INFO
> +	# Requires full debugging information, split DWARF not supported.
> +	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
> +	# Requires ELF object files.
> +	depends on !LTO
> +
>   config ASM_MODVERSIONS
>   	bool
>   	default HAVE_ASM_MODVERSIONS && MODVERSIONS
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 6bcda4b9d054..d7fec46d38c0 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -54,6 +54,7 @@ targets += module.lds
>   
>   subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
>   subdir-$(CONFIG_MODVERSIONS) += genksyms
> +subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
>   subdir-$(CONFIG_SECURITY_SELINUX) += selinux
>   subdir-$(CONFIG_SECURITY_IPE) += ipe
>   
> diff --git a/scripts/gendwarfksyms/.gitignore b/scripts/gendwarfksyms/.gitignore
> new file mode 100644
> index 000000000000..0927f8d3cd96
> --- /dev/null
> +++ b/scripts/gendwarfksyms/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +/gendwarfksyms
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> new file mode 100644
> index 000000000000..9f8fec4fd39b
> --- /dev/null
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +hostprogs-always-y += gendwarfksyms
> +
> +gendwarfksyms-objs += gendwarfksyms.o
> +gendwarfksyms-objs += dwarf.o
> +gendwarfksyms-objs += symbols.o
> +
> +HOSTLDLIBS_gendwarfksyms := -ldw -lelf
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> new file mode 100644
> index 000000000000..81df3e2ad3ae
> --- /dev/null
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
> +{
> +	Dwarf_Attribute da;
> +
> +	/* dwarf_formref_die returns a pointer instead of an error value. */
> +	return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
> +}
> +
> +#define DEFINE_GET_STRING_ATTR(attr)                         \
> +	static const char *get_##attr##_attr(Dwarf_Die *die) \
> +	{                                                    \
> +		Dwarf_Attribute da;                          \
> +		if (dwarf_attr(die, DW_AT_##attr, &da))      \
> +			return dwarf_formstring(&da);        \
> +		return NULL;                                 \
> +	}
> +
> +DEFINE_GET_STRING_ATTR(name)
> +DEFINE_GET_STRING_ATTR(linkage_name)
> +
> +static const char *get_symbol_name(Dwarf_Die *die)
> +{
> +	const char *name;
> +
> +	/* rustc uses DW_AT_linkage_name for exported symbols */
> +	name = get_linkage_name_attr(die);
> +	if (!name)
> +		name = get_name_attr(die);
> +
> +	return name;
> +}
> +
> +static bool match_export_symbol(struct state *state, Dwarf_Die *die)
> +{
> +	Dwarf_Die *source = die;
> +	Dwarf_Die origin;
> +
> +	/* If the DIE has an abstract origin, use it for type information. */
> +	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> +		source = &origin;
> +
> +	state->sym = symbol_get(get_symbol_name(die));
> +
> +	/* Look up using the origin name if there are no matches. */
> +	if (!state->sym && source != die)
> +		state->sym = symbol_get(get_symbol_name(source));
> +
> +	state->die = *source;
> +	return !!state->sym;
> +}
> +
> +/*
> + * Type string processing
> + */
> +static void process(const char *s)
> +{
> +	s = s ?: "<null>";
> +
> +	if (dump_dies)
> +		fputs(s, stderr);
> +}
> +
> +bool match_all(Dwarf_Die *die)
> +{
> +	return true;
> +}
> +
> +int process_die_container(struct state *state, Dwarf_Die *die,
> +			  die_callback_t func, die_match_callback_t match)
> +{
> +	Dwarf_Die current;
> +	int res;
> +
> +	res = checkp(dwarf_child(die, &current));
> +	while (!res) {
> +		if (match(&current)) {
> +			/* <0 = error, 0 = continue, >0 = stop */
> +			res = checkp(func(state, &current));
> +			if (res)
> +				return res;
> +		}
> +
> +		res = checkp(dwarf_siblingof(&current, &current));
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Exported symbol processing
> + */
> +static void process_symbol(struct state *state, Dwarf_Die *die,
> +			   die_callback_t process_func)
> +{
> +	debug("%s", state->sym->name);
> +	check(process_func(state, die));
> +	if (dump_dies)
> +		fputs("\n", stderr);
> +}
> +
> +static int __process_subprogram(struct state *state, Dwarf_Die *die)
> +{
> +	process("subprogram");
> +	return 0;
> +}
> +
> +static void process_subprogram(struct state *state, Dwarf_Die *die)
> +{
> +	process_symbol(state, die, __process_subprogram);
> +}
> +
> +static int __process_variable(struct state *state, Dwarf_Die *die)
> +{
> +	process("variable ");
> +	return 0;
> +}
> +
> +static void process_variable(struct state *state, Dwarf_Die *die)
> +{
> +	process_symbol(state, die, __process_variable);
> +}
> +
> +static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
> +{
> +	int tag = dwarf_tag(die);
> +
> +	switch (tag) {
> +	/* Possible containers of exported symbols */
> +	case DW_TAG_namespace:
> +	case DW_TAG_class_type:
> +	case DW_TAG_structure_type:
> +		return check(process_die_container(
> +			NULL, die, process_exported_symbols, match_all));
> +
> +	/* Possible exported symbols */
> +	case DW_TAG_subprogram:
> +	case DW_TAG_variable: {
> +		struct state state;
> +
> +		if (!match_export_symbol(&state, die))
> +			return 0;
> +
> +		if (tag == DW_TAG_subprogram)
> +			process_subprogram(&state, &state.die);
> +		else
> +			process_variable(&state, &state.die);
> +
> +		return 0;
> +	}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +void process_cu(Dwarf_Die *cudie)
> +{
> +	check(process_die_container(NULL, cudie, process_exported_symbols,
> +				    match_all));
> +}
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> new file mode 100644
> index 000000000000..f84fa98fcbdb
> --- /dev/null
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <errno.h>
> +#include <stdarg.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include "gendwarfksyms.h"
> +
> +/*
> + * Options
> + */
> +
> +/* Print debugging information to stderr */
> +int debug;
> +/* Dump DIE contents */
> +int dump_dies;
> +
> +static void usage(void)
> +{
> +	fputs("Usage: gendwarfksyms [options] elf-object-file ... < symbol-list\n\n"
> +	      "Options:\n"
> +	      "  -d, --debug          Print debugging information\n"
> +	      "      --dump-dies      Dump DWARF DIE contents\n"
> +	      "  -h, --help           Print this message\n"
> +	      "\n",
> +	      stderr);
> +}
> +
> +static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
> +			  Dwarf_Addr base, void *arg)
> +{
> +	Dwarf_Addr dwbias;
> +	Dwarf_Die cudie;
> +	Dwarf_CU *cu = NULL;
> +	Dwarf *dbg;
> +	int res;
> +
> +	debug("%s", name);
> +	dbg = dwfl_module_getdwarf(mod, &dwbias);
> +
> +	do {
> +		res = dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie, NULL);
> +		if (res < 0)
> +			error("dwarf_get_units failed: no debugging information?");
> +		if (res == 1)
> +			break; /* No more units */
> +
> +		process_cu(&cudie);
> +	} while (cu);
> +
> +	return DWARF_CB_OK;
> +}
> +
> +static const Dwfl_Callbacks callbacks = {
> +	.section_address = dwfl_offline_section_address,
> +	.find_debuginfo = dwfl_standard_find_debuginfo,
> +};
> +
> +int main(int argc, char **argv)
> +{
> +	unsigned int n;
> +	int opt;
> +
> +	struct option opts[] = { { "debug", 0, NULL, 'd' },
> +				 { "dump-dies", 0, &dump_dies, 1 },
> +				 { "help", 0, NULL, 'h' },
> +				 { 0, 0, NULL, 0 } };
> +
> +	while ((opt = getopt_long(argc, argv, "dh", opts, NULL)) != EOF) {
> +		switch (opt) {
> +		case 0:
> +			break;
> +		case 'd':
> +			debug = 1;
> +			break;
> +		case 'h':
> +			usage();
> +			return 0;
> +		default:
> +			usage();
> +			return 1;
> +		}
> +	}
> +
> +	if (optind >= argc) {
> +		usage();
> +		error("no input files?");
> +	}
> +
> +	symbol_read_exports(stdin);
> +
> +	for (n = optind; n < argc; n++) {
> +		Dwfl *dwfl;
> +		int fd;
> +
> +		fd = open(argv[n], O_RDONLY);
> +		if (fd == -1)
> +			error("open failed for '%s': %s", argv[n],
> +			      strerror(errno));
> +
> +		dwfl = dwfl_begin(&callbacks);
> +		if (!dwfl)
> +			error("dwfl_begin failed for '%s': %s", argv[n],
> +			      dwarf_errmsg(-1));
> +
> +		if (!dwfl_report_offline(dwfl, argv[n], argv[n], fd))
> +			error("dwfl_report_offline failed for '%s': %s",
> +			      argv[n], dwarf_errmsg(-1));
> +
> +		dwfl_report_end(dwfl, NULL, NULL);
> +
> +		if (dwfl_getmodules(dwfl, &process_module, NULL, 0))
> +			error("dwfl_getmodules failed for '%s'", argv[n]);
> +
> +		dwfl_end(dwfl);
> +	}
> +
> +	symbol_free();
> +
> +	return 0;
> +}
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> new file mode 100644
> index 000000000000..23e484af5d22
> --- /dev/null
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#define _GNU_SOURCE


I'm getting these warnings:

scripts/gendwarfksyms/kabi.c:245:6: warning: implicit declaration of 
function 'asprintf' is invalid in C99 [-Wimplicit-function-declaration]
         if (asprintf(&target, "%s %s", fqn, field) < 0)
             ^
1 warning generated.
   HOSTCC  scripts/gendwarfksyms/symbols.o
   HOSTCC  scripts/gendwarfksyms/types.o
scripts/gendwarfksyms/types.c:260:6: warning: implicit declaration of 
function 'asprintf' is invalid in C99 [-Wimplicit-function-declaration]
         if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, 
quote) < 0)
             ^
1 warning generated.


I think it may be cleaner to define _GNU_SOURCE in the CFLAGS instead.

> +
> +#include <dwarf.h>
> +#include <elfutils/libdw.h>
> +#include <elfutils/libdwfl.h>
> +#include <inttypes.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include <hash.h>
> +#include <hashtable.h>
> +#include <list.h>
> +#include <xalloc.h>
> +
> +#ifndef __GENDWARFKSYMS_H
> +#define __GENDWARFKSYMS_H
> +
> +/*
> + * Options -- in gendwarfksyms.c
> + */
> +extern int debug;
> +extern int dump_dies;
> +
> +/*
> + * Output helpers
> + */
> +#define __PREFIX "gendwarfksyms: "
> +#define __println(prefix, format, ...)                                \
> +	fprintf(stderr, prefix __PREFIX "%s: " format "\n", __func__, \
> +		##__VA_ARGS__)
> +
> +#define debug(format, ...)                                    \
> +	do {                                                  \
> +		if (debug)                                    \
> +			__println("", format, ##__VA_ARGS__); \
> +	} while (0)
> +
> +#define warn(format, ...) __println("warning: ", format, ##__VA_ARGS__)
> +#define error(format, ...)                                   \
> +	do {                                                 \
> +		__println("error: ", format, ##__VA_ARGS__); \
> +		exit(1);                                     \
> +	} while (0)
> +
> +/*
> + * Error handling helpers
> + */
> +#define __check(expr, test)                                     \
> +	({                                                      \
> +		int __res = expr;                               \
> +		if (test)                                       \
> +			error("`%s` failed: %d", #expr, __res); \
> +		__res;                                          \
> +	})
> +
> +/* Error == non-zero values */
> +#define check(expr) __check(expr, __res)
> +/* Error == negative values */
> +#define checkp(expr) __check(expr, __res < 0)
> +
> +/*
> + * symbols.c
> + */
> +
> +struct symbol {
> +	const char *name;
> +	struct hlist_node name_hash;
> +};
> +
> +typedef void (*symbol_callback_t)(struct symbol *, void *arg);
> +
> +void symbol_read_exports(FILE *file);
> +struct symbol *symbol_get(const char *name);
> +void symbol_free(void);
> +
> +/*
> + * dwarf.c
> + */
> +
> +struct state {
> +	struct symbol *sym;
> +	Dwarf_Die die;
> +};
> +
> +typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
> +typedef bool (*die_match_callback_t)(Dwarf_Die *die);
> +bool match_all(Dwarf_Die *die);
> +
> +int process_die_container(struct state *state, Dwarf_Die *die,
> +			  die_callback_t func, die_match_callback_t match);
> +
> +void process_cu(Dwarf_Die *cudie);
> +
> +#endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> new file mode 100644
> index 000000000000..2c901670224b
> --- /dev/null
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +#define SYMBOL_HASH_BITS 15
> +static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
> +
> +static unsigned int for_each(const char *name, symbol_callback_t func,
> +			     void *data)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *match;
> +
> +	if (!name || !*name)
> +		return 0;
> +
> +	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
> +				    hash_str(name)) {
> +		if (strcmp(match->name, name))
> +			continue;
> +
> +		if (func)
> +			func(match, data);
> +
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool is_exported(const char *name)
> +{
> +	return for_each(name, NULL, NULL) > 0;
> +}
> +
> +void symbol_read_exports(FILE *file)
> +{
> +	struct symbol *sym;
> +	char *line = NULL;
> +	char *name = NULL;
> +	size_t size = 0;
> +	int nsym = 0;
> +
> +	while (getline(&line, &size, file) > 0) {
> +		if (sscanf(line, "%ms\n", &name) != 1)
> +			error("malformed input line: %s", line);
> +
> +		if (is_exported(name)) {
> +			/* Ignore duplicates */
> +			free(name);
> +			continue;
> +		}
> +
> +		sym = xcalloc(1, sizeof(struct symbol));
> +		sym->name = name;
> +
> +		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
> +		++nsym;
> +
> +		debug("%s", sym->name);
> +	}
> +
> +	free(line);
> +	debug("%d exported symbols", nsym);
> +}
> +
> +static void get_symbol(struct symbol *sym, void *arg)
> +{
> +	struct symbol **res = arg;
> +
> +	*res = sym;
> +}
> +
> +struct symbol *symbol_get(const char *name)
> +{
> +	struct symbol *sym = NULL;
> +
> +	for_each(name, get_symbol, &sym);
> +	return sym;
> +}
> +
> +void symbol_free(void)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *sym;
> +
> +	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
> +		free((void *)sym->name);
> +		free(sym);
> +	}
> +
> +	hash_init(symbol_names);
> +}


