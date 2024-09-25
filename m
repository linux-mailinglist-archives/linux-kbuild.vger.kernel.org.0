Return-Path: <linux-kbuild+bounces-3730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC09855F7
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 11:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D49C1C237C4
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 09:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83AD15ADA7;
	Wed, 25 Sep 2024 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="U3jMNt06"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2E156661
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727254842; cv=none; b=mGrHh85e9XxZyaJpk/LtII+KWr7sF1NdyQeHqt5VW2KiVt36nvwJd5ItdVOLDO69bjVigg7r7E49DS43y9k53fyBFrBSLEO+ucNPiV6KHtH+1x1B1minPHJRD3H4S2YU4DNr0KZ2sjL8C5A3k7wal9tq8sNaa6vWz6roPzu9ysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727254842; c=relaxed/simple;
	bh=HPNeAlYSdlRRq+YCT4R4fY7napkCrhEl3ChvA2zOdBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:From:In-Reply-To:
	 Content-Type:References; b=dZrawWJDi6Yn8X1AV+JLRfcMkV3OiyadkCbJWanrLVmqUTNtzRfp2rXLOKYZtHa6JGLrxPpk1auIvmc+PcLMPYrnUoMYqAJt+Wzri2ro5DfxB3f63vBMTLRERhkXEAIPQ6K9G3gVLZw5OUIg9SkpZsJk893AhIrXWiWnWqShRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=U3jMNt06; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240925090031euoutp025c4315c9ca46d9aa0b0af0441a258e1a~4cR40j98X0707407074euoutp02W
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 09:00:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240925090031euoutp025c4315c9ca46d9aa0b0af0441a258e1a~4cR40j98X0707407074euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727254831;
	bh=2vKSe6/JZz+muAFZRzO/XNOcdLFOD89z6zjjuikN+o0=;
	h=Date:Subject:To:CC:From:In-Reply-To:References:From;
	b=U3jMNt06x5MvlmWOr9X50DEjofSB+/9NfVlyX+bn7HvPNrKBdjK7omYQCm5vI0Mvy
	 ig18XV+sU2qZ1GU4xJKyFSsCXVeRg4rMDhrsmHM5pwpcXjxVj2Fo5KttIyybD/vGnt
	 Mn1Pg2toNqM0bH/ywLucCB4PnxeNrZJLy90xWZdQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240925090031eucas1p24042a68b10ce23b48c54b77abd7844b3~4cR4XZZaP3115131151eucas1p2E;
	Wed, 25 Sep 2024 09:00:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 24.AF.09624.F21D3F66; Wed, 25
	Sep 2024 10:00:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240925090030eucas1p14b2475bfce11ec300d133934220e346e~4cR33p3QF2975029750eucas1p1i;
	Wed, 25 Sep 2024 09:00:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240925090030eusmtrp2c0a54ebb6ec4ea948bc679f08f845142~4cR32r6mG1697916979eusmtrp2E;
	Wed, 25 Sep 2024 09:00:30 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-92-66f3d12f7a79
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id B3.A2.14621.E21D3F66; Wed, 25
	Sep 2024 10:00:30 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240925090030eusmtip199f7f9e1d7a3899daf889ffe5d704f27~4cR3onXIh0358003580eusmtip1X;
	Wed, 25 Sep 2024 09:00:30 +0000 (GMT)
Received: from [106.110.32.87] (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 25 Sep 2024 10:00:28 +0100
Message-ID: <d56f36da-afd9-4956-8b74-8b0b17baadf2@samsung.com>
Date: Wed, 25 Sep 2024 11:00:28 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/16] module: Take const arg in
 validate_section_offset
Content-Language: en-GB
To: Matthew Maurer <mmaurer@google.com>, <masahiroy@kernel.org>,
	<ndesaulniers@google.com>, <ojeda@kernel.org>, <gary@garyguo.net>,
	<mcgrof@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
CC: <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <neal@gompa.dev>, <marcan@marcan.st>,
	<j@jannau.net>, <asahi@lists.linux.dev>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	<linux-modules@vger.kernel.org>
From: Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <20240924212024.540574-2-mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjOuff29rah7PIVTthCs7omjkSoxJiDLmbNMLszW4AoMbKY2a2X
	jw0ottSPsZrKlgkMu2I2KBWVICBlVFglfFQiBJ0UC1MGxcIQJAHKlCJSJrLpGOVi5N/zvO/z
	vO/7nBwKD/6JjKAysnNZdbYiU0IKiZbbK3e3xQz4UmVDczgam5jioZfnW/nIcT+fQCuuQLQw
	nM9D7nudOGpoPo2hgb7HADXW7Ucv7G0YGrRXkEh/fpmHnMOVfDT50L2mNU4D5HlixdCCcRVD
	vtM3MGS5dAWgmqV5HDXO3MRRTZ2Xh/pb7vDfD2eqC//BmHbzAz4zMmYhmEqbluka0uOMrb6Q
	ZGavlQPmcm07ySyf6SCZ4u9tGNPY7CIYr8PAY3y2yERRivA9JZuZcYxVx+w5IkxvKB7Bc5YE
	J6ZrOgk9OEsVAQEF6R2wxHqBLAJCKpiuA9Bpvs7nyBKA/X3f4RzxAdgx+Bi8shRO/rVhuQJg
	Rd/Z1yqD9TeCI+0ANv47g/stInoPbOi8yvNjgpbCucUnJFcPgr3lU4Qfh9FiODFq4vtxCJ0E
	XdMOzI9xOhzmL1nWvaF0F4D1f6j8C3D6MgENzzzrN5H0u/BGr23dLKDjoNNRsGam1kS7YJnj
	I26OGLZ6K3AuwtvQVGIhOKyDd5pHMf9MSP8qhIWdt3hcIx4+WKjdEIXARz3NfA6/BVfbL2Ec
	ToPVV80bmhzY8aeZ598L6d3Q0JfJleVwTF++UQ6Ebm8Qd04gPNdShhuB1LzpJcybEptfBzBv
	ClAJiHoQzmo1WWmsZns2ezxao8jSaLPTor9QZdnA2sd1/tez2AYuPHoa3Q0wCnQDSOGSUNG5
	kaepwSKl4uTXrFr1mVqbyWq6wZsUIQkXSZViNphOU+SyX7FsDqt+1cUoQYQe003Yxbt3+Yov
	Pt+7OJ9c8OlD27xlx2LUmVZj6Y9lUsFB2p0kFi7LGNv93nfs+z4uzQgYOuiKkepCm3bCkqRt
	pWTGwMpLQ96x+KrUnVr5aNXdKU/U0W8jZc6C4gO/3FYlJeZuCdhn/Xz2jdVTcREpSt3hyK21
	10/25NnDnKeqtHmBdkJIJXw4fo+pbCvptkqGVddmXMNi33JAQore4dly/BvZoDskK7mIjA36
	0lM9d7Qp7sisz/uz8EVsQcDf6nHB3h+64lzSoIHofuOt2A+UB56Nl22VH/q9okP6/GZXuj2R
	0Wll8hWLKUz0Sfzh0hPS+YZJeYJJbkouaiL2XySRhNCkK7ZH4WqN4n8a++tiJwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsVy+t/xu7p6Fz+nGUx5Kmdx5/4TVou/s7ez
	W5y43sRi8fMqn8WHa02sFjcu7Ge2WLOlkcni4pnXjBbrVwRb/Nm1g8ni8q45bBYNs7+zWpy+
	toDd4uGDG0C1E54yWjx/v5bJ4sOE/0wWnxv3MVmsnL+c0WLpl3fMFuufHWa2WLriLavF2W2n
	2B3EPZZ0/mLy2DnrLrvHzTsrWTwWbCr1OHClgdlj06pONo8Xm2cyeixetpPN43v7HjaPnrZN
	TB7rt1xl8Xh7oo/V4/MmuQDeKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1Ml
	fTublNSczLLUIn27BL2MNT03mQu+cFY8XbqfpYGxl6OLkZNDQsBEovPhS7YuRi4OIYGljBI/
	Lq1ghEjISGz8cpUVwhaW+HOtiw3EFhL4yChxdAs7RMNORonbdy+BJXgF7CTW7F8H1sAioCrx
	5tN7qLigxMmZT1hAbFEBeYn7t2awg9jCAoESV5+eYAKxmQXEJZq+rATrFRE4wCix6lI+yAJm
	gcUsEss6nrFCbNvNKHHs/HuwSWwCmhL7Tm4Cm8QpYClx+kQH1CQLicVvDrJD2PIS29/OYYZ4
	QVFixsSVLBB2rcTnv88YJzCKzkJy4Cwkh8xCMmoWklELGFlWMYqklhbnpucWG+oVJ+YWl+al
	6yXn525iBKaqbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4J938mCbEm5JYWZValB9fVJqTWnyI
	0RQYShOZpUST84HJMq8k3tDMwNTQxMzSwNTSzFhJnNft8vk0IYH0xJLU7NTUgtQimD4mDk6p
	BiZD+617i7i15U/7eU/4mWa/V6t2eU/uz7bKRrn9gdZHbnnOOX8w2ufy/Lib82VfdP6tWLl7
	e5Eac4bpvFpHf9/935yvT9ZRzNIx17wmu65SKNqcsUlwWqPJtrcfpEw6voft+vlr7fQriXe3
	vd/vJ12QqpD2vS3hptDl26savv/d2XHHVvnECrXOT9d/PTlRr128eL77obMfNX6fNPqx8inX
	1MsvZUM5f6QuyTvvxx3hyqJgklecte7x5M7z11p8njxyrThfrN72+wzXukLf5+073NqqAvx+
	qUswn12iv6vKQejUf/4NS5n8DZdsWdNZUnspuqUt44CxgYZb08abPvO3On/XzlxzpcWM20Ro
	UZ4SS3FGoqEWc1FxIgDywEmB3gMAAA==
X-CMS-MailID: 20240925090030eucas1p14b2475bfce11ec300d133934220e346e
X-Msg-Generator: CA
X-RootMTR: 20240924212037eucas1p253dc701411a9684750103c7da7acd79e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240924212037eucas1p253dc701411a9684750103c7da7acd79e
References: <20240924212024.540574-1-mmaurer@google.com>
	<CGME20240924212037eucas1p253dc701411a9684750103c7da7acd79e@eucas1p2.samsung.com>
	<20240924212024.540574-2-mmaurer@google.com>

On 9/24/2024 11:19 PM, Matthew Maurer wrote:
> `validate_section_offset` doesn't modify the info passed in. Make this
> clear by adjusting the type signature.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>   kernel/module/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 49b9bca9de12..1a2dd52147ba 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1645,7 +1645,7 @@ bool __weak module_exit_section(const char *name)
>   	return strstarts(name, ".exit");
>   }
>   
> -static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
> +static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
>   {
>   #if defined(CONFIG_64BIT)
>   	unsigned long long secend;


The cover letter is missing a From/Cc to the linux-modules list. So I 
was missing the context here. Looking at lore I found it here:

https://lore.kernel.org/asahi/20240924212024.540574-1-mmaurer@google.com/

Can you add linux-modules list in case there's a next revision?

Also, the cover letter is missing a full changelog other than a 
reference to the previous discussions and to the last changes.

Daniel


