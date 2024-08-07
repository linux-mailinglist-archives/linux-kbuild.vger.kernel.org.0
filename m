Return-Path: <linux-kbuild+bounces-2902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB594B03E
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 21:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8159728473A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 19:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52AC143729;
	Wed,  7 Aug 2024 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ihaPWKki"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72A140360
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Aug 2024 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723057407; cv=none; b=X5HN4AUGMNBcJo16tet40VVCk4NaWzK5sTaVE/U6bE+0h0J028xtmsSvLaxKgxmnN38cMU/WP+HZxIPu6yQS6fQMJV7c0vb9po9mTKVe8k6yglYsdapS3GYxTwo09IwZ2tfCTBjDG3EcZuH4xksDgEhxmXhXq/OvYeUjUGKrgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723057407; c=relaxed/simple;
	bh=ulTv8wBav1gIUnpkHf1eqxgT+ur6Le5BcM5ox5LoUww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version:References; b=AIgs4wJP/kIJjq39KSiXY1MR360/ntI1iXV/3Qna1DlyE1o9I3HHwiKWvPT3WKV9aErSeZMm02moY6U+/J6R9eUROCXOzVcs0vwTl1Btg2aVcDCdRi6sj5SJwnr4P81gEEbdKOphMLNDOoKjMI1zJEbAASVWnRDeQxPdCemZZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ihaPWKki; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240807190318euoutp0294555b551444cf09c2cb467ebaf7eb46~ph5Msu3Aa2826128261euoutp02z
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Aug 2024 19:03:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240807190318euoutp0294555b551444cf09c2cb467ebaf7eb46~ph5Msu3Aa2826128261euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723057398;
	bh=u3ONDoWglRNMXTNh6hT6eFfvRL0TKx0mVObOZpuuDzM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=ihaPWKkitKt9KKgPTJ+mLRiha+pzbTnN13jmzZjNLDqV/KV1UfGG1OmW7K6rV73YO
	 ovLWLjYYU6dtbZn3FMiCk6sBUYeF9iCBv14MLJXw03SXNfpX4WJtc8gq8GrN7xwtcz
	 NUiScdGx0ihR2flGvgi5Z0TuGXfAm6V8hqRzyuoo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240807190318eucas1p1475ea858d8530d72b91468428ef565fb~ph5MW3eLy1731417314eucas1p1a;
	Wed,  7 Aug 2024 19:03:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 95.F2.09624.6F4C3B66; Wed,  7
	Aug 2024 20:03:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240807190317eucas1p2bc0480d84b5bdcfb2190862f0961dc15~ph5L6K-7j0203802038eucas1p2h;
	Wed,  7 Aug 2024 19:03:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240807190317eusmtrp2e5adb2c416c4bd7237c3150dc044bdd0~ph5L5r1Nd1368113681eusmtrp2R;
	Wed,  7 Aug 2024 19:03:17 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-29-66b3c4f6ad10
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 9B.63.09010.5F4C3B66; Wed,  7
	Aug 2024 20:03:17 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240807190317eusmtip2509d79b497e42cef95cc354afab4be9c~ph5LqxrTZ0245102451eusmtip2d;
	Wed,  7 Aug 2024 19:03:17 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 7 Aug 2024 20:03:16 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
	([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Wed, 7 Aug
	2024 20:03:16 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ard
	Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
	Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: avoid scripts/kallsyms parsing /dev/null
Thread-Topic: [PATCH] kbuild: avoid scripts/kallsyms parsing /dev/null
Thread-Index: AQHa6PWE/airBDzsa0q/3I+bdMIFJ7IcFjuA
Date: Wed, 7 Aug 2024 19:03:16 +0000
Message-ID: <uwfctpxzk5cyzg4iaujeywa6qcyfeqbocas3aevgu4g3ub5iln@vzcsyaeshk36>
In-Reply-To: <20240807181148.660157-1-masahiroy@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E69F66C8E0EBA446AB1B71F1437F75EE@scsc.local>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djPc7rfjmxOM2i5z27x88t7Ros/u3Yw
	WVzeNYfN4uGDG6wW7Sufslk823uC1YHNY9ehzWwem1Z1snl83iQXwBzFZZOSmpNZllqkb5fA
	lfG2UbDgLnfF9aV/WBoYX3J2MXJySAiYSDzZsZmpi5GLQ0hgBaPEnslNTCAJIYEvjBJLZ5hB
	2J8ZJS4/04Zp2P9sPQtEw3JGid6bq6EcoKKpK/4yQjinGSVmPHjHDDf348H/rCD9bAKaEvtO
	bmIHsUUEtCTuLO1gBSliBmm/tu4/2HJhAVeJ2btmMUIUuUl0PDwGVMQBZBtJTHyRDGKyCKhI
	bJlRBFLBK+Arcf3hfTYQm1PAWuLlgn0sIDajgKzEo5W/wFYxC4hL3HoynwniBUGJRbP3MEPY
	YhL/dj1kg7B1JM5ef8IIYRtIbF0KMUdCQEli7o2ZzBBzdCQW7P7EBnICs4ClxMs3LhBhbYll
	C18zQ5wjKHFy5hOo1v2cEnNuKEHYLhLX511gh7CFJV4d38I+gVFnFpLrZiHZMAthwywkG2Yh
	2bCAkXUVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYOo5/e/4px2Mc1991DvEyMTBeIhR
	goNZSYS3OXxTmhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe1RT5VCGB9MSS1OzU1ILUIpgsEwen
	VAPTnF4/u8rFHE7SPIW3DB8GHTnNvnZ53Q3+4s0TOVf62socntL+sPmYSLHd3us65RnLvk4X
	dDAsO9Z96/n650Li1k+ZDYzu89750ZvQ8uZOyQ25xsbGb12Nk4Mv9Veefya+4qm9k0GBuQdr
	j7EuK7utra3kJYcdwhdfHvJ9IHEj4c1cgem3Ytc9Pr3VaLPBa98/aqVLVF5tCuBrnRHhyTFb
	c7vm/YWbHmU/Pdad9PDJHaO2S5fmp8/8LmjtGbBOr9heqHJ3+a1kl+smHM4d3oGMoe3nmJmv
	e6edFvpRWHnmcNtx9tJ9L8+kXfqy8U7QK+efho+51Qx3vfjy6Cj36z6uxTZTdE9ZNDq+msUq
	0jFNiaU4I9FQi7moOBEAvwyAQqwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xe7pfj2xOM2i/oGbx88t7Ros/u3Yw
	WVzeNYfN4uGDG6wW7Sufslk823uC1YHNY9ehzWwem1Z1snl83iQXwBylZ1OUX1qSqpCRX1xi
	qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/G2UbDgLnfF9aV/WBoYX3J2
	MXJySAiYSOx/tp4FxBYSWMooseyfJkRcRmLjl6usELawxJ9rXWxdjFxANR8ZJb4efc0M4Zxm
	lOibNR0qs4JRYk/bOmaQFjYBTYl9Jzexg9giAloSd5Z2sIIUMQt8ZpRYd2YzG0hCWMBVYvau
	WYwQRW4SHQ+PARVxANlGEhNfJIOYLAIqEltmFIFU8Ar4Slx/eB9qVx/QmO4HYGM4BawlXi7Y
	B/YCo4CsxKOVv8D2MguIS9x6Mp8J4gUBiSV7zjND2KISLx//g3pNR+Ls9SeMELaBxNalEHMk
	BJQk5t6YyQwxR0diwe5PbCD3MAtYSrx84wIR1pZYtvA1M8RtghInZz5hmcAoMwvJ5llIumch
	dM9C0j0LSfcCRtZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgall27GfW3Ywrnz1Ue8QIxMH
	4yFGCQ5mJRHe5vBNaUK8KYmVValF+fFFpTmpxYcYTYEhN5FZSjQ5H5jc8kriDc0MTA1NzCwN
	TC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamCafZlv3i8NWbNvO+x1L/TyevzDqWujr
	LMkje2nDs/513+sDHzbXSDrHX1JVu7rvqJSA/SkzCQ9BhftLjqpp3Chxns+jX9kp17qA403D
	sQnGT63bEov0DuWm7zvRIMFxf0JWbeE96crCqiPXVDaeEReU2dU5a9osH7Z1m4oSt27+8+D7
	5aanE12PFumxad2P+72K7VqB4vGfL84qrWS7Zas+873HbzWD9Lb+c4ZshZ+4GFLNM8/VzJzx
	Umhdeb/QhEuvj3Hu/1oZkrrT46VhfHLsfMPdRXq6FyxfTDb57hIrrWogvd7nle1kEVf3R25/
	elx8eEtb5uZJ2uxVDQ9dt//2Iz392hBu4dcn/0zbosRSnJFoqMVcVJwIAMc7Q7S2AwAA
X-CMS-MailID: 20240807190317eucas1p2bc0480d84b5bdcfb2190862f0961dc15
X-Msg-Generator: CA
X-RootMTR: 20240807181200eucas1p242be38e7c6ce8c18fdd74f959d748447
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807181200eucas1p242be38e7c6ce8c18fdd74f959d748447
References: <CGME20240807181200eucas1p242be38e7c6ce8c18fdd74f959d748447@eucas1p2.samsung.com>
	<20240807181148.660157-1-masahiroy@kernel.org>

On Thu, Aug 08, 2024 at 03:03:00AM GMT, Masahiro Yamada wrote:
> On macOS, getline() sets ENOTTY to errno if it is requested to read
> from /dev/null.
>=20
> If this is worth fixing, I would rather pass an empty file to
> scripts/kallsyms instead of adding the ugly #ifdef __APPLE__.
>=20
> Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
> Reported-by: Daniel Gomez <da.gomez@samsung.com>
> Closes: https://lore.kernel.org/all/20240807-macos-build-support-v1-12-4c=
d1ded85694@samsung.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/link-vmlinux.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f7b2503cdba9..41c68ae3415d 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -219,7 +219,8 @@ kallsymso=3D
>  strip_debug=3D
> =20
>  if is_enabled CONFIG_KALLSYMS; then
> -	kallsyms /dev/null .tmp_vmlinux0.kallsyms
> +	truncate -s0 .tmp_vmlinux.kallsyms0.syms

This looks nicer. Thanks for a quick alternative!

I prefer self explained commands and use the larger argument if available:
	truncate --size=3D0 .tmp_vmlinux.kallsyms0.syms

But other than that, LGTM.

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>

> +	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
>  fi
> =20
>  if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
> --=20
> 2.43.0
> =

