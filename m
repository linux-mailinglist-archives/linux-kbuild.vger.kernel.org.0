Return-Path: <linux-kbuild+bounces-4022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D138D9980AA
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 10:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6D7283C2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 08:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8251E908E;
	Thu, 10 Oct 2024 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uJZDVwwh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0EA1C6884
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549090; cv=none; b=UC5MkIfC/pdKRClmRQ9D+ki8csRqdZRHAICZAEG3kS+uPnkznOx2EWQRYYHRJc54YIR+LQYod3bn+443lUfKKxf1vd9ITjKEGYIBkZ+4yWmi8zNWO9dRbTfhmg98dWe5gyaEW5Nz0h4H9ZMhUXiK5jYXrzqrzi46D1Mvwbuylc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549090; c=relaxed/simple;
	bh=osnJ/gYQ8YeI3Ir3s2vU1xez5jQHlWoORgPbRKpVzcE=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 In-Reply-To:References; b=AY2hTW0SlcXx0/jmq/nYVOADA9yWi+K6fE2CQRK9TPYhyS7twxTtBoY2IN9Ic8Gfi8iipknYjVgz1mpr68BUct+rbZ2UeYDYdnYQA3kJptNq02/UAYLiALdQMSc6TAURIBbp8FKOef4FxlwVMfko1oSITftKO3uvZIpBOLDH2j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uJZDVwwh; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241010083124euoutp02ac5f89256d91b7fdbc75fa2d8cb13080~9CjwKxu1O1938619386euoutp02b
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 08:31:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241010083124euoutp02ac5f89256d91b7fdbc75fa2d8cb13080~9CjwKxu1O1938619386euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728549085;
	bh=osnJ/gYQ8YeI3Ir3s2vU1xez5jQHlWoORgPbRKpVzcE=;
	h=Date:CC:Subject:From:To:In-Reply-To:References:From;
	b=uJZDVwwhCVrgLjRFbtm51EtP8GUTtEs1pCqGDt848zFgbH7iNynCoqpBZUEwNiR+v
	 xWK9ha9BAiPSATzAHN5uvoBdj3qp0lJrkCpmAQdyP3UvyJZ/su8S+BdL0c5zfO4dWW
	 dYOHmCMQJ/DoGGZRFp32i9rz6vexFh+w7nhf6l5U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241010083124eucas1p14f79f5e3d311bc68b2fcae482e43fe27~9CjvkO6RJ2759927599eucas1p1e;
	Thu, 10 Oct 2024 08:31:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 43.98.09875.CD097076; Thu, 10
	Oct 2024 09:31:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514~9CjvEJroI0813008130eucas1p2I;
	Thu, 10 Oct 2024 08:31:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010083123eusmtrp1a4ca1a75f3fdc97a2d039203d258efa8~9CjvC9H_62497224972eusmtrp1s;
	Thu, 10 Oct 2024 08:31:23 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-c2-670790dc8d6c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id C7.F6.19096.BD097076; Thu, 10
	Oct 2024 09:31:23 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241010083123eusmtip2b5366410eebb48e047bcc554dea90d6b~9Cju1bDDH2861228612eusmtip2M;
	Thu, 10 Oct 2024 08:31:23 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 10 Oct 2024 09:31:22 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Oct 2024 10:31:22 +0200
Message-ID: <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com>
CC: <rust-for-linux@vger.kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, "David S.
 Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>,
	=?utf-8?q?=C3=8D=C3=B1igo_Huguet?= <ihuguet@redhat.com>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, Vegard Nossum
	<vegard.nossum@oracle.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] rust: query the compiler for dylib path
From: Daniel Gomez <da.gomez@samsung.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Tamir Duberstein
	<tamird@gmail.com>
X-Mailer: aerc 0.18.2-67-g7f69618ac1fd
In-Reply-To: <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjeubf3g2bQS2HxRKfEBrdMAwph8ywqGZmJd4k/RLM4t4WtKdeC
	K4gtLRNkqRWEUgOCDqQwxEioVYRZWEHkw9Qg32MLroDQdUssDErHqsBE/Bj01ow/J8/7PM/7
	nue8OTQuvkSup5NT0zllqlQhIYUC6/2lnyMmzlPyHaU2EZpwPiLQi4pmCvWM6AToH7uOQKO/
	dOKoruk0hiqHcgTo1wE3QD9aHuBoaOEFjvTFNRR63tqCoeHWShItP53E0J9/jBKovWGYRGNl
	sxTKM7tINNneQyDzZRNADZP3cPR0oI1Cg9a+lUNXR3wE2SbzGMa22hpJtkb/DGNvGx0UW21R
	sxX55QRrua4n2Sp9FcZ6XQ8F7L95bSR77qwFY+c6fiNZT08hwT6xbGKLDPepA6LPhbsTOUWy
	hlNuj/1amHTXtUSkdYu+1bl6SS0YebMABNCQiYG/m3NBARDSYuYagI22MbAqiJl5AE9XY7zw
	BMCp0k7ydUfPwohfMAE4m3ftf5fTNIHzRSOAV+cd1GpLIBMMe8sfCVYxzmyDtVfcOI/fg7nN
	yz6PgNkCx8t/Inh/DLxZaqZWB+FMEQWXuuwrBU2HMLvh40VfDHKlt6PX4usNZY7A+sUGio/3
	DnxVVOy7K4CJh61nKnCe3wwvFZsFPM6GfU0Pfakhc1sILY/tfmEvrFi+4R8UAme6m/z4bdh/
	4ZzfI4c19UY/ToNt40ZiNRtkdsHCAQVPx8GcMxdJng6Co55g/rlBsMRahvN0IMw/Kz4Pwo1r
	FmRcsyDjmgVVA/w6WMepVSlyThWdymVEqqQpKnWqPFJ2PMUCVj5v/8vu+RZgmvFG2gBGAxuA
	NC4JDYy4QsjFgYnSk5mc8vhXSrWCU9nABlogWRe4JTGMEzNyaTr3DcelccrXKkYHrNdiJbP5
	G17+/dlFSnbnVVm0pfaecmb6yy/CN8sXAqYexHrMcfL92j3Wqa3BuviCqthRwN1IbLlVo/1O
	5M6mbnZ67nia98tOHe0+cDUzwVoeTtZXdqXlLA/e7WeeH3Psk+zM2hG23F568AipoSPsUXbz
	hQ7k/aH2/UOLnSXT9Wr80xNuh2Fon6PIXX1Y44yKHj6Z25ewa0HhNjq/b8kzGEwfpxPWE5Ub
	5+IPZ0zlZme+FTo4r9mTlbDdcrQ/pu5UtWyjSBgd9+yNsCyJ9bJ35lbSh9pjQ+82diUHaWUF
	UP/XdLtrL3Fom1cfO9fVUBji1eGaT5hMg+ODnZsyZONLTkwhEaiSpFFbcaVK+h8H2FQ+KwQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsVy+t/xe7q3J7CnG0x4q2Fx5/4TVou/s7ez
	W5y43sRi8eFaE6vFjQv7mS3WbGlksphzvoXF4uKZ14wWGzZdYbY4//Uvs0XnxCXsFn927WCy
	uLxrDpvF7x/PmCwePrjBarF3/WU2i5vT37BbtK98ymbxbO8JVouV85czWqx/dpjZ4seZPewW
	Z7edAhJNa1gdJDy2rLzJ5LHr0GY2jyWdv5g8ds66y+6xYFOpx+yOmawem1Z1snnM65zH5PHx
	6S0Wj+/te9g8eto2MXm833eVzePtiT5Wj8+b5Dz6u4+xB/BH6dkU5ZeWpCpk5BeX2CpFG1oY
	6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GUcePqTteA4f0XT05NsDYzXeboYOTkk
	BEwkTny9ztTFyMUhJLCUUWLX3W3MEAkZiY1frrJC2MISf651sUEUfWSU+DnnFDOEs5lRYvHD
	VrAqXgFBiZMzn7CA2MwC2hLLFr5mhrA1JVq3/2YHsVkEVCVuz9wKVW8isXbaSnaQQcwCvewS
	l3bMA3I4OIQFbCQ+fWMDqWED6t13chNYr4hApMS6b+vZIS5Sk/jfP5EF4oguJol9X68ygSQ4
	BQIldjXPhnpBUWLGxJUsEHatxOe/zxgnMIrMQnLrLCS3zkJy6wJG5lWMIqmlxbnpucVGesWJ
	ucWleel6yfm5mxiByWnbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEV7dhazpQrwpiZVVqUX58UWl
	OanFhxhNgZ6eyCwlmpwPTI95JfGGZgamhiZmlgamlmbGSuK8bFfOpwkJpCeWpGanphakFsH0
	MXFwSjUwTXk8vbnN9wBviv3S9jX1doIdztkyh+a/iml7dirRq/ap7b1CDccVS990Crk9EGfX
	qDrzY7nxVo2W6WeEw+Yoyr1IeBAhnxZ3Qsfgi8fjSxPeTD1ftED6t+a1BT98kpbx7V3gW1e0
	7OqSWyVmdy0+RbwOTFuy/c+t+e/Per/SMJRfXzS90av55qFbsXuSLcQLyv/OmLfzl9Sz4qh9
	E3/ndvwQfnYt+LTzBR/pynMfs++/1WdrNF0yj2PJMb0pzkLWPWL/p/oIzZil/Sz8dYJKz4wD
	uSu3v3i6+WkaW1CQwVSFENH7ryQ5Tzbvv3P3SJOw2v7WK7r2Xi+0tv7T2jRx89oPKy489zW1
	ZOQI3Ld9b6ISS3FGoqEWc1FxIgDBQWT91wMAAA==
X-CMS-MailID: 20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514
X-Msg-Generator: CA
X-RootMTR: 20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514
References: <20241008224810.84024-1-tamird@gmail.com>
	<CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
	<CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
	<CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
	<CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>

On Wed Oct 9, 2024 at 3:12 PM CEST, Miguel Ojeda wrote:
> On Wed, Oct 9, 2024 at 2:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>>
>> What would you have me link to? With this patch applied and using
>
> I was thinking perhaps the series from Daniel, if that is the latest
> discussion (?), i.e. I would like to understand what is the policy
> around changes like this, what happens if it breaks, etc.

Building Linux in macOS is now supported for arm64 (targets tested: allyesc=
onfig
and defconfig). The upstream policy is to use the build system variables to
configure the necessary tweaks to support building in macOS. However, this
will not always be possible then, patches are welcome from the build system
maintainer to support "portability" across OSes. But not full integration.
Please, let me know if this is not clear.

This policy forces macOS users to provide their own environment, documentat=
ion
and dependencies. I created bee-headers with the intention of providing all=
 this
(including the missing byteswap, elf and endian headers) as reference or fo=
r
developers to use.

So, after installing bee-headers and all other linux dependencies (llvm, se=
d,
awk, etc), one would simply do:

source bee-init # To initiate the build enviroment
make LLVM=3D1 defconfig
make LLVM=3D1 -j$(nproc)

Here a more detailed documentation:
https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md

The last version of the series is v3 [1], which fixes a build error that ca=
nnot
be fixed in macOS via build system environment. This is enabled when using =
Intel
Xe Graphics (DRM_XE), included in allyesconfig target.

[1] https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880=
e60@samsung.com/

>
>> https://github.com/bee-headers/homebrew-bee-headers I was able to build =
a kernel
>> on my apple silicon mac. Relevant config:
>
> That is great.
>
> Thanks!
>
> Cheers,
> Miguel


