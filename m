Return-Path: <linux-kbuild+bounces-5416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25469A08882
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 07:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140233A8312
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 06:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190DB1BDA91;
	Fri, 10 Jan 2025 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="y+gNSacO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0F19AA63
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736491480; cv=none; b=cP40y7VFPn2QE3FqLs7Yf6cZ3wnaRoeyKpqJQo6s3V+YuXTk9pgs/HWSxPHjGkTGNCA1khjMQZvJtZ4wcfIEtOpPKi502Sj0HWtdXOegs4kCZqHdwYDY0G4bDV8PQ3/YpXOveFrwJIl4m9ghWWabFAm7BjELLF/0VEtVaI5kghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736491480; c=relaxed/simple;
	bh=/GBMHCVQTGCNLC4DrtYer5X0Kp7g8RzASQu5t+Qz/hE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=gVAr/2GD2OqsKMtHRU0S0xghvL6Z5LU1tCyNwj6QoxZqvbSQ2yNwbRV57dxio78wLtQqqNt0+0vvKXpGwQk3D5Mtb5yoc79MiJZWZmQXkJaPQupNAC733vLFwiqk7iNf2c6lHJzkrXkofar+5iQJ71R14rpISnS2Q+JWwNKe1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=y+gNSacO; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 39CDD20896;
	Fri, 10 Jan 2025 07:44:29 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjPsMZ1rZ7Pd; Fri, 10 Jan 2025 07:44:28 +0100 (CET)
Received: from cas-essen-02.secunet.de (rl2.secunet.de [10.53.40.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 9B9DF2085A;
	Fri, 10 Jan 2025 07:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 9B9DF2085A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1736491468;
	bh=9okHSh+7gD+TTyULOLYaQrutB3AekVVj+Dv80Wmfqv8=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:From;
	b=y+gNSacOewFI70xq8YYe1i6igZqyYbX+YwdHIkGNtm6NJ/ZHeMxq0YqqarUJl9jXx
	 4Bz950HKSSTPxIrgNeMSrMHMAFtzUpkdJwWsobjyrD3MasJjULuTmkcv+Y+WhpoE0Z
	 cnosKZDr2Qt5TmU2jFwmFHg88PqSs7URJ3V3V/ljxBqfw8q5QZL31qONNfX5gEWWJ5
	 dH5hTH6ev9Y/DAgJ8peOmAZfpP4K8443nJ8AzUT5y1bQ/lN1Z0EpIG4MIdsX2cpdK2
	 oGqdSPoaq/d0cBqNcxO6pOnN8L41BRoBnuGyH8OZyarP8YAD2Q6jOF5LlIFy11DGuD
	 tgMYu0LHb+giw==
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 10 Jan 2025 07:44:28 +0100
Received: from [172.18.150.65] (172.18.150.65) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 07:44:28 +0100
Message-ID: <4915d245-4419-43cf-abbe-b28cd27c869a@secunet.com>
Date: Fri, 10 Jan 2025 07:44:26 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: v6.13-rc1: Module signing stopped working for external modules
From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <linux-kbuild@vger.kernel.org>
References: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com>
Content-Language: en-US
Autocrypt: addr=torsten.hilbrich@secunet.com; keydata=
 xsBNBFs5uIIBCAD4qbEieyT7sBmcro1VrCE1sSnV29a9ub8c0Xj0yw0Cz2N7LalBn4a+YeJN
 OMfL1MQvEiTxZNIzb1I0bRYcfhkhjN4+vAoPJ3q1OpSY+WUgphUbzseUk/Bq3gwvfa6/U+Hm
 o2lvEfN2dewBGptQ+DrWz+SPM1TQiwShKjowY/avaVgrABBGen3LgB0XZXEH8Q720kjP7htK
 tCGRt1T+qNIj3tZDZfPkqEVb8lTRcyn1hI3/FbDTysletRrCmkHSVbnxNzO6lw2G1H61wQhw
 YVbIVNohY61ieSJFhNLL6/UTGHtUE2IAicnsUAUKR8GiI1+3cTf233O5HaWYeOjBmTCLABEB
 AAHNL1RvcnN0ZW4gSGlsYnJpY2ggPHRvcnN0ZW4uaGlsYnJpY2hAc2VjdW5ldC5jb20+wsB3
 BBMBCAAhBQJbObiCAhsDBQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEJ7rXZh78/h8+tIH
 +QFYRQH4qh3WagcmjbG/zCe2RmZZePO8bmut2fAxY04aqJZGYUBxb5lfaWaHkstqM5sFD8Jo
 k1j5E7f1cnfwB21azdUO8fzYL889kdVOzatdT/uTjR7OjR59gpJMd4lx7fwFuZUg8z6rfWJ3
 ImjxxBgaJRL6pqaZ9lOst82O0qJKEFBR+HDUVvgh4n8TTOfKNv/dGPQhaed+2or98asdYRWo
 S/zc4ltTh4SxZjLd98pDxjlUyOJoMJeWdlMmLgWV3h1qjy4DxgQzvgATEaKjOuwtkCOcwHn7
 Unf0F2V9p4O7NFOuoVyqTBRX+5xKgzSM7VP1RlTT4FA9/7wkhhG+FELOwE0EWzm4ggEIAL9F
 IIPQYMx5x+zMjm8lDsmh12zoqCtMfn9QWrERd2gDS3GsORbe/i6DhYvzsulH8vsviPle4ocU
 +PaTwadfnEqm0FS7xCONYookDGfAiPS4cHWX7WrTNBP7mK3Gl1KaAOJJsMbCVAA9q4d8WL+A
 e+XrfOAetZq5gxLxDMYySNI1pIMJVrGECiboLa/LPPh2yw4jieAedW96CPuZs7rUY/5uIVt0
 Dn4/aSzV+Ixr52Z2McvNmH/VxDt59Z6jBztZIJBXpX3BC/UyH7rJOJTaqEF+EVWEpOmSoZ6u
 i1DWyqOBKnQrbUa0fpNd3aaOl2KnlgTH9upm70XZGpeJik/pQGcAEQEAAcLAXwQYAQgACQUC
 Wzm4ggIbDAAKCRCe612Ye/P4fEzqB/9gcM/bODO8o9YR86BLp0S8bF73lwIJyDHg5brjqAnz
 CtCdb4I+evI4iyU9zuN1x4V+Te5ej+mUu5CbIte8gQbo4cc9sbe/AEDoOh0lGoXKZiwtHqoh
 RZ4jOFrZJsEjOSUCLE8E8VR1afPf0SkFXLXWZfZDU28K80JWeV1BCtxutZ39bz6ybMbcCvMS
 UfwCTY0IJOiDga1K4H2HzHAqlvfzCurqe616S4S1ax+erg3KTEXylxmzcFjJU8AUZURy/lQt
 VElzs4Km1p3v6GUciCAb+Uhd12sQG2mL05jmEems9uRe3Wfke/RKp8A+Yq+p6E0A0ZOP+Okm
 LXB2q+ckPvZG
In-Reply-To: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

On 09.01.25 07:35, Torsten Hilbrich wrote:
> Hello,
> 
> after testing v6.13-rc1 after successfully using v6.12 I noticed that 
> our external modules are no longer building correctly.
> 
> - Module source: /build/client/devel/addmodules/vtx/work/vtx
> - Kernel source: /build/client/devel/kernel/work/linux-2.6
>    Symlinked by build-source
> 
> We run the module_install step:
> 
> ----------------
> make -C build-source M=/build/client/devel/addmodules/vtx/work/vtx 
> modules_install INSTALL_MOD_PATH=/build/client/devel/addmodules/vtx/_ 
> INSTALL_MOD_DIR=extra
> make[5]: Entering directory '/build/client/devel/kernel/work/linux-2.6'
> make[6]: Entering directory '/build/client/devel/addmodules/vtx/work/vtx'
>    INSTALL 
> /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
>    SIGN    
> /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
> /bin/sh: 1: scripts/sign-file: not found
>    DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+
> make[6]: Leaving directory '/build/client/devel/addmodules/vtx/work/vtx'
> make[5]: Leaving directory '/build/client/devel/kernel/work/linux-2.6'
> ----------------> 
> The problem here is that before calling cmd_sign (scripts/sign-file) the 
> build system now changes to the module source.

As workaround I used the following modification:

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 6fa9af4a25b4..67f081a68364 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -105,7 +105,7 @@ else
  sig-key := $(CONFIG_MODULE_SIG_KEY)
  endif
  quiet_cmd_sign = SIGN    $@
-      cmd_sign = scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-key)" certs/signing_key.x509 $@ \
+      cmd_sign = $(srctree)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-key)" $(srctree)/certs/signing_key.x509 $@ \
                   $(if $(KBUILD_EXTMOD),|| true)
  
  ifeq ($(sign-only),)

I first fixed the sign-file invocation, then I got errors like the following:

   SIGN    /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
At main.c:189:
- SSL error:FFFFFFFF80000002:system library::No such file or directory: crypto/bio/bss_file.c:67
- SSL error:10000080:BIO routines::no such file: crypto/bio/bss_file.c:75
sign-file: certs/signing_key.x509
   DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+

Adding $(srctree) for both the program and the signing key fixed the issue.

I assume the root issue is a different beast but I was not able to find it.

Thanks,

	Torsten


