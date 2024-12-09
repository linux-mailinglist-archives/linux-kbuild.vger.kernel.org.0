Return-Path: <linux-kbuild+bounces-5048-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F389E97BA
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 14:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12EB283ABF
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 13:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8ED1B422E;
	Mon,  9 Dec 2024 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zdjnc5qI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D01B043B
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Dec 2024 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752034; cv=none; b=lmM4eCcOm23VxfgZYun+l3Bq+qKQVnUI2NDwom2I8IFQIFoCiRqzvW1QaQO00OjaoAVsatKKww2E+MYAJ+7CiZYis47OekiyMGzmq4mLrFJC1oRRfHulSPHyBYL/tGf2CHaNoevmn2Ar1YaBMvjxVQvUjBv2Xh+/PKmyYCRu2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752034; c=relaxed/simple;
	bh=VZ8BLHpIvIA7CdsGrjygFMn49lnT93T1P/vBxLw3Cd4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MCYwDQ2tfPuzlrTpCNYaibsDocKrbHkZRnIGGOgJYOo3GMWyZhxzMcj0T0enyZ9LzjzPDO5gGPwReKW15Ss0Uh3AzRTZWMR2J2L457W0eMYIxrLDRf44vNBN0J8/773LdHxAhsTpxaQJcwfLhdvYf7YytylGP1R1ZQDambT6+6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zdjnc5qI; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733752030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xt463gkM88BZ/ztE5UEYpOypmlzLl4hnsjpCnQQUmQM=;
	b=Zdjnc5qIa0sD2dDMkivntOg4GrlxknbRg+dTnhsukOs1OZ957nQCdtz1egeWGQDF/+eVAl
	r7yCNuj9WP61QgS1qKOp36MDEmuVd09QZSU9GOqTY6f1Ez/sb5odOEVNIITIWPQhp6Oiu+
	J637qPQZMFJ5PeSS4oEJiAT4T0ZHVfI=
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
In-Reply-To: <20241110013649.34903-6-masahiroy@kernel.org>
Date: Mon, 9 Dec 2024 14:46:56 +0100
Cc: linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 cocci@inria.fr
Content-Transfer-Encoding: quoted-printable
Message-Id: <82FA2E02-05A5-4297-B364-9D7D89001D9D@linux.dev>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 10. Nov 2024, at 02:34, Masahiro Yamada wrote:
>=20
> Currently, Kbuild always operates in the output directory of the =
kernel,
> even when building external modules. This increases the risk of =
external
> module Makefiles attempting to write to the kernel directory.
>=20
> This commit switches the working directory to the external module
> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> some build artifacts.
>=20
> The command for building external modules maintains backward
> compatibility, but Makefiles that rely on working in the kernel
> directory may break. In such cases, $(objtree) and $(srctree) should
> be used to refer to the output and source directories of the kernel.
>=20
> The appearance of the build log will change as follows:
>=20
> [Before]
>=20
>  $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>  make: Entering directory '/path/to/my/linux'
>    CC [M]  /path/to/my/externel/module/helloworld.o
>    MODPOST /path/to/my/externel/module/Module.symvers
>    CC [M]  /path/to/my/externel/module/helloworld.mod.o
>    CC [M]  /path/to/my/externel/module/.module-common.o
>    LD [M]  /path/to/my/externel/module/helloworld.ko
>  make: Leaving directory '/path/to/my/linux'
>=20
> [After]
>=20
>  $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>  make: Entering directory '/path/to/my/linux'
>  make[1]: Entering directory '/path/to/my/externel/module'
>    CC [M]  helloworld.o
>    MODPOST Module.symvers
>    CC [M]  helloworld.mod.o
>    CC [M]  .module-common.o
>    LD [M]  helloworld.ko
>  make[1]: Leaving directory '/path/to/my/externel/module'
>  make: Leaving directory '/path/to/my/linux'
>=20
> Printing "Entering directory" twice is cumbersome. This will be
> addressed later.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Hi Masahiro,

I get the following error since this patch is in master, but only when
using COCCI=3D in combination with M=3D<relative or absolute path>.

It works when I either use COCCI=3D or M=3D, but not with both.

$ make coccicheck COCCI=3Dscripts/coccinelle/misc/flexible_array.cocci =
M=3Darch/
make[1]: Entering directory '/home/fedora/linux/arch'
You have not explicitly specified the mode to use. Using default =
"report" mode.
Available modes are the following: patch, report, context, org, chain
You can specify the mode with "make coccicheck MODE=3D<mode>"
Note however that some modes are not implemented by some semantic =
patches.

Please check for false positives in the output before submitting a =
patch.
When using "patch" mode, carefully review the patch before submitting =
it.

grep: scripts/coccinelle/misc/flexible_array.cocci: No such file or =
directory
grep: scripts/coccinelle/misc/flexible_array.cocci: No such file or =
directory
/usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file =
scripts/coccinelle/misc/flexible_array.cocci --patch /home/fedora/linux =
--dir . -I /home/fedora/linux/arch/arm64/include -I =
/home/fedora/linux/arch/arm64/include/generated -I =
/home/fedora/linux/include -I /home/fedora/linux/include -I =
/home/fedora/linux/arch/arm64/include/uapi -I =
/home/fedora/linux/arch/arm64/include/generated/uapi -I =
/home/fedora/linux/include/uapi -I =
/home/fedora/linux/include/generated/uapi --include =
/home/fedora/linux/include/linux/compiler-version.h --include =
/home/fedora/linux/include/linux/kconfig.h --jobs 4 --chunksize 1
Fatal error: exception =
Sys_error("scripts/coccinelle/misc/flexible_array.cocci: No such file or =
directory")
coccicheck failed
make[2]: *** [/home/fedora/linux/Makefile:2089: coccicheck] Error 2
make[1]: *** [/home/fedora/linux/Makefile:251: __sub-make] Error 2
make[1]: Leaving directory '/home/fedora/linux/arch'
make: *** [Makefile:251: __sub-make] Error 2

Thanks,
Thorsten


