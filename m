Return-Path: <linux-kbuild+bounces-5404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1A4A06E56
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 07:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F841887240
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 06:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CD219F489;
	Thu,  9 Jan 2025 06:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="od/ORC7f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ED119CC14
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Jan 2025 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736404555; cv=none; b=RayePx6dpsdw5nqSp1uW+cS92FKtMx2lmjb5Z/LqkJshLqSK+oULeXziji2TrdTN3mwqcSZC+BdvJWioGDkQGzd+a6mjAdJC832SJJCBBKURMj4wW9qQJkwuQ1sh5SKrUGs564Vfw1VGWFYDVo4ZU/auNIZwLGrhPRSba0+Tv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736404555; c=relaxed/simple;
	bh=yHDcNcpHtlF4OmqVziiYHOBW+klbswN5ElURkd1/8w4=;
	h=Message-ID:Date:MIME-Version:From:To:CC:Subject:Content-Type; b=c3prqg4XrzfuUOtqKLRHLOfCjsyVTptk5l7iSSKL/joaQRZNJoFCiTsDP1cDbrZvZtxGDP0YCkFDJDkLFdmMEspwef87adJPsOjeBEf7VVXilARPhh12zT2bbCIoRWUkwug38htn+uOFB68nNSVhE4jgy/qbj5iAcopKtATFcBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=od/ORC7f; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 0BF0F207A4;
	Thu,  9 Jan 2025 07:35:44 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfbgHpR17L44; Thu,  9 Jan 2025 07:35:43 +0100 (CET)
Received: from cas-essen-02.secunet.de (rl2.secunet.de [10.53.40.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 7052F20799;
	Thu,  9 Jan 2025 07:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 7052F20799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1736404543;
	bh=WsKrLqMJRPS9afIcwKyumxFJ1TU45qWuk2JQVF/y+6o=;
	h=Date:From:To:CC:Subject:From;
	b=od/ORC7f555ja6B8tOL4jE8g4sGHirczbXseBhgelsXHDfC1rJ3iphiCYxuSigNv7
	 QbGmqvUR7qhpC+FeeSbkWFyeZh8GRy+V2i/xKN0R19OZ/r16BXeDpeeKOLQEPEBhYQ
	 FNyxeX9/wVk/Ba659D6WVJhatB6j9L/kgLVdqJMxCF3t3mI6IUhZVQ0pGCyCuaFT8a
	 HZmiVdYByYj66ZwzKpcPTwsrBqNlRmWAqL3VQzFVs5UbMBtXpMx7wIecZawapdyrMJ
	 4hs3e+aBuUZgrcJ2BjHhQGm1mw06J47LGLbaUnlEKYYfM3OJ+owJDW6PPentIng5Lh
	 rtVu8fPKJegrA==
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 9 Jan 2025 07:35:43 +0100
Received: from [10.36.110.53] (10.36.110.53) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 07:35:42 +0100
Message-ID: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com>
Date: Thu, 9 Jan 2025 07:35:41 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <linux-kbuild@vger.kernel.org>
Subject: v6.13-rc1: Module signing stopped working for external modules
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
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

Hello,

after testing v6.13-rc1 after successfully using v6.12 I noticed that our external modules are no longer building correctly.

- Module source: /build/client/devel/addmodules/vtx/work/vtx
- Kernel source: /build/client/devel/kernel/work/linux-2.6
   Symlinked by build-source

We run the module_install step:

----------------
make -C build-source M=/build/client/devel/addmodules/vtx/work/vtx modules_install INSTALL_MOD_PATH=/build/client/devel/addmodules/vtx/_ INSTALL_MOD_DIR=extra
make[5]: Entering directory '/build/client/devel/kernel/work/linux-2.6'
make[6]: Entering directory '/build/client/devel/addmodules/vtx/work/vtx'
   INSTALL /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
   SIGN    /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
/bin/sh: 1: scripts/sign-file: not found
   DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+
make[6]: Leaving directory '/build/client/devel/addmodules/vtx/work/vtx'
make[5]: Leaving directory '/build/client/devel/kernel/work/linux-2.6'
----------------

The problem here is that before calling cmd_sign (scripts/sign-file) the build system now changes to the module source.

In v6.12 the build system was still in the kernel source tree when running this command so "scripts/sign-file" was found.

Here from a build log with a 6.8.12 kernel (/build/client/daily/kernel/work/linux-2.6 being the kernel source here):

----------------
make[4]: Entering directory '/build/client/daily/addmodules/vtx/work/vtx'
make -C build-source M=/build/client/daily/addmodules/vtx/work/vtx modules_install INSTALL_MOD_PATH=/build/client/daily/addmodules/vtx/_ INSTALL_MOD_DIR=extra
make[5]: Entering directory '/build/client/daily/kernel/work/linux-2.6'
   INSTALL /build/client/daily/addmodules/vtx/_/lib/modules/6.8.12-grsec+/extra/vtx.ko
   SIGN    /build/client/daily/addmodules/vtx/_/lib/modules/6.8.12-grsec+/extra/vtx.ko
   DEPMOD  /build/client/daily/addmodules/vtx/_/lib/modules/6.8.12-grsec+
make[5]: Leaving directory '/build/client/daily/kernel/work/linux-2.6'
----------------

Here the sign-file call is made with cwd being the kernel source.

I also tried the new method in v6.13 by invoking "make -f /build/client/devel/kernel/work/linux-2.6/Makefile" with the same result.

Here is the relevant part of our Makefile for building the module:

----------------
TARGETS = vtx

obj-m := vtx.o

vtx-objs := main.o intel.o amd.o
subdir = extra

KERNEL_SOURCE ?= build-source
BUILD = $(MAKE) -C $(KERNEL_SOURCE) M=$(CURDIR)

.PHONY: all install clean

all:
     ln -sf $(KERNEL_SOURCE) build-source
     $(BUILD)

clean:
     $(BUILD) $@

install:
     $(BUILD) modules_install INSTALL_MOD_PATH=$(DESTDIR) INSTALL_MOD_DIR=$(subdir)
----------------

KERNEL_SOURCE is suppliced when running the all target. DESTDIR is supplied when running install.

The module_sign target fails as well.

I already consulted the updated documentation but couldn't find any problem in that invocation (which still works in v6.12).

Thanks,

	Torsten

