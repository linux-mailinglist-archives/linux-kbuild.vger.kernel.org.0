Return-Path: <linux-kbuild+bounces-5062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA89EAF27
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 12:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A140F28409F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F21223E83;
	Tue, 10 Dec 2024 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bgDmFAfH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB31223334
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828812; cv=none; b=qujYtqaTn25O+cdMwS5SQfsFpP6BK05Igcf+OTGjycmDkPwyk4B0m5st5hzj9VcFej/7NFHSoWEgONRrCca5xL/fg4LkA2W+EQfnMvQ3ahQHGJkjSy5bplIuXSfSuNVrzVXTjGSOdF4VlUpXcZfHYp5j4bqKgwo6DPSgL3uSUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828812; c=relaxed/simple;
	bh=0gidoGIG0z2WaGCB3NApHeDNViXG+QD8VmOG+MOZf48=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hFUSknJeFCnkH07ngtN/jpCzze38nSu2Ekw7TGOnzIPipky3KdYVnUl2jP0D2Ulsj+eu+OMuIsxxUA/9yQXbT9vK4hERRPryUbZqzzU+7ve2o0Bx8GW2DKxd3sVcsp6YBW62/Lys4KFatNQ+++egZRIbjU28zTqm+F4K2Yh++WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bgDmFAfH; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733828806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8sRqjoiiHcRkTpsPK0hRKSOh3L/dg4EGVpik/b50qU=;
	b=bgDmFAfHIsHzr0y+kzyxvkRUR1idbJIAeTQN+jNTwl0/hSDFc6j1XsDcCuSlL/quNH8wyU
	zxlgmPchLnMrRiNKIvU/X4DtRwDw1tePXYqQZW9UkuQZlWc9u5P4FsnekV4FdACKQt+EaL
	ihH9trlpV79zWoJnOiip+yYEUkCvtnI=
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
In-Reply-To: <CAK7LNAQ1MvB_wXa6F8aZB_srrLTQupRXNsz6Rav27fyjznXZJQ@mail.gmail.com>
Date: Tue, 10 Dec 2024 12:06:32 +0100
Cc: linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 cocci@inria.fr
Content-Transfer-Encoding: quoted-printable
Message-Id: <838D0FCD-EA9C-46C8-BCA7-FECFD3DC04D8@linux.dev>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
 <82FA2E02-05A5-4297-B364-9D7D89001D9D@linux.dev>
 <1116D946-05F3-4463-A61F-DE221F258A3F@linux.dev>
 <CAK7LNAQ1MvB_wXa6F8aZB_srrLTQupRXNsz6Rav27fyjznXZJQ@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 10. Dec 2024, at 11:47, Masahiro Yamada wrote:
> On Mon, Dec 9, 2024 at 10:56=E2=80=AFPM Thorsten Blum wrote:
>> On 9. Dec 2024, at 14:46, Thorsten Blum wrote:
>>> On 10. Nov 2024, at 02:34, Masahiro Yamada wrote:
>>>>=20
>>>> Currently, Kbuild always operates in the output directory of the =
kernel,
>>>> even when building external modules. This increases the risk of =
external
>>>> module Makefiles attempting to write to the kernel directory.
>>>>=20
>>>> This commit switches the working directory to the external module
>>>> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix =
from
>>>> some build artifacts.
>>>>=20
>>>> The command for building external modules maintains backward
>>>> compatibility, but Makefiles that rely on working in the kernel
>>>> directory may break. In such cases, $(objtree) and $(srctree) =
should
>>>> be used to refer to the output and source directories of the =
kernel.
>>>>=20
>>>> The appearance of the build log will change as follows:
>>>>=20
>>>> [Before]
>>>>=20
>>>> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>>>> make: Entering directory '/path/to/my/linux'
>>>> CC [M]  /path/to/my/externel/module/helloworld.o
>>>> MODPOST /path/to/my/externel/module/Module.symvers
>>>> CC [M]  /path/to/my/externel/module/helloworld.mod.o
>>>> CC [M]  /path/to/my/externel/module/.module-common.o
>>>> LD [M]  /path/to/my/externel/module/helloworld.ko
>>>> make: Leaving directory '/path/to/my/linux'
>>>>=20
>>>> [After]
>>>>=20
>>>> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>>>> make: Entering directory '/path/to/my/linux'
>>>> make[1]: Entering directory '/path/to/my/externel/module'
>>>> CC [M]  helloworld.o
>>>> MODPOST Module.symvers
>>>> CC [M]  helloworld.mod.o
>>>> CC [M]  .module-common.o
>>>> LD [M]  helloworld.ko
>>>> make[1]: Leaving directory '/path/to/my/externel/module'
>>>> make: Leaving directory '/path/to/my/linux'
>>>>=20
>>>> Printing "Entering directory" twice is cumbersome. This will be
>>>> addressed later.
>>>>=20
>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>>> ---
>>>=20
>>> Hi Masahiro,
>>>=20
>>> I get the following error since this patch is in master, but only =
when
>>> using COCCI=3D in combination with M=3D<relative or absolute path>.
>>>=20
>>> It works when I either use COCCI=3D or M=3D, but not with both.
>>=20
>> Using the absolute path of the cocci script fixes my problem, but =
this
>> used to work with relative paths too.
>>=20
>> $ make coccicheck =
COCCI=3D$(pwd)/scripts/coccinelle/misc/flexible_array.cocci M=3Darch/
>=20
> M=3D looks a bit weird for the upstream code, but
> I think using the absolute path is the right thing to do.

The documentation[1] uses M=3D and also COCCI=3D with relative paths and
some of the examples don't work anymore.

Could you try this one?

```
export COCCI=3Dscripts/coccinelle/misc/irqf_oneshot.cocci
make coccicheck DEBUG_FILE=3D"err.log" MODE=3Dreport SPFLAGS=3D"--profile =
--show-trying" M=3D./drivers/mfd
```

I get this:

$ export COCCI=3Dscripts/coccinelle/misc/irqf_oneshot.cocci
$ make coccicheck DEBUG_FILE=3D"err.log" MODE=3Dreport =
SPFLAGS=3D"--profile --show-trying" M=3D./drivers/mfd
make[1]: Entering directory '/home/fedora/linux/drivers/mfd'

Please check for false positives in the output before submitting a =
patch.
When using "patch" mode, carefully review the patch before submitting =
it.

grep: scripts/coccinelle/misc/irqf_oneshot.cocci: No such file or =
directory
grep: scripts/coccinelle/misc/irqf_oneshot.cocci: No such file or =
directory
coccicheck failed
make[2]: *** [/home/fedora/linux/Makefile:2089: coccicheck] Error 2
make[1]: *** [/home/fedora/linux/Makefile:251: __sub-make] Error 2
make[1]: Leaving directory '/home/fedora/linux/drivers/mfd'
make: *** [Makefile:251: __sub-make] Error 2

Thanks,
Thorsten

[1] https://www.kernel.org/doc/html/latest/dev-tools/coccinelle.html


