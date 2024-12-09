Return-Path: <linux-kbuild+bounces-5049-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E07959E97EC
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 14:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7594C28141C
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 13:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9891ACEAA;
	Mon,  9 Dec 2024 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lidOB0rR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F881A23AE
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Dec 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752566; cv=none; b=ORuXqYBtMdRl5MnunMidgHCMTFpRQvx4GstFsYCkZqCXZ63UYDd8PjbyLcYu+zRT/zLX30JfzmLqDRLgHDo9ftzhak+WJ/aPm4uPAGHvTwH5FMx6GA9vD4NJ0Whd0BsdgXV6xidXE9VTiKMCJhqbRaeVHLNu9PmKkXgsr0YsflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752566; c=relaxed/simple;
	bh=f6XqPaGHJ0jJAPxY8ehyTH9J2e5L1tx3XwidYZzgqb4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rjvGGC5IBW5Wkp+z2bwxc4zTCARmOTGUuxi1NLqiLFJU2GnHv/qIR5pV8VbSL+/KPjlyfGqrXfXCXJOQI0M7XMHpzPFx46OSpHYhhtd34D2Vb0Ev9kpc+CwPA0ZalPhNqrusHOtq8zTbt2+vpkCMISINN7VNFmWMhwD4a2tQMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lidOB0rR; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733752558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMD7OR5YZ9oyBrkqZP0zItfH8mnaDJd5RfsgeWQ8jts=;
	b=lidOB0rRhzPAswU66ZHocV9Yglns74v/VdiF1Z3la7rkMoMWGcma1H3Y3iQ1sOjrxg2x/f
	lOexU8R0UTdCDDUJYSPVG6UneeSgS0GytGN7jZSxSeijapRANr+T6Nf61J54WsioEoHCBJ
	ks3owmk0w31XQZnvub6yusy4u9QYmlY=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <82FA2E02-05A5-4297-B364-9D7D89001D9D@linux.dev>
Date: Mon, 9 Dec 2024 14:55:44 +0100
Cc: linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 cocci@inria.fr
Content-Transfer-Encoding: quoted-printable
Message-Id: <1116D946-05F3-4463-A61F-DE221F258A3F@linux.dev>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
 <82FA2E02-05A5-4297-B364-9D7D89001D9D@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 9. Dec 2024, at 14:46, Thorsten Blum wrote:
> On 10. Nov 2024, at 02:34, Masahiro Yamada wrote:
>>=20
>> Currently, Kbuild always operates in the output directory of the =
kernel,
>> even when building external modules. This increases the risk of =
external
>> module Makefiles attempting to write to the kernel directory.
>>=20
>> This commit switches the working directory to the external module
>> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
>> some build artifacts.
>>=20
>> The command for building external modules maintains backward
>> compatibility, but Makefiles that rely on working in the kernel
>> directory may break. In such cases, $(objtree) and $(srctree) should
>> be used to refer to the output and source directories of the kernel.
>>=20
>> The appearance of the build log will change as follows:
>>=20
>> [Before]
>>=20
>> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>> make: Entering directory '/path/to/my/linux'
>>   CC [M]  /path/to/my/externel/module/helloworld.o
>>   MODPOST /path/to/my/externel/module/Module.symvers
>>   CC [M]  /path/to/my/externel/module/helloworld.mod.o
>>   CC [M]  /path/to/my/externel/module/.module-common.o
>>   LD [M]  /path/to/my/externel/module/helloworld.ko
>> make: Leaving directory '/path/to/my/linux'
>>=20
>> [After]
>>=20
>> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>> make: Entering directory '/path/to/my/linux'
>> make[1]: Entering directory '/path/to/my/externel/module'
>>   CC [M]  helloworld.o
>>   MODPOST Module.symvers
>>   CC [M]  helloworld.mod.o
>>   CC [M]  .module-common.o
>>   LD [M]  helloworld.ko
>> make[1]: Leaving directory '/path/to/my/externel/module'
>> make: Leaving directory '/path/to/my/linux'
>>=20
>> Printing "Entering directory" twice is cumbersome. This will be
>> addressed later.
>>=20
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>=20
> Hi Masahiro,
>=20
> I get the following error since this patch is in master, but only when
> using COCCI=3D in combination with M=3D<relative or absolute path>.
>=20
> It works when I either use COCCI=3D or M=3D, but not with both.

Using the absolute path of the cocci script fixes my problem, but this
used to work with relative paths too.

$ make coccicheck =
COCCI=3D$(pwd)/scripts/coccinelle/misc/flexible_array.cocci M=3Darch/

Thanks,
Thorsten


