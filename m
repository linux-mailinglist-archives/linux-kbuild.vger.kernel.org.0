Return-Path: <linux-kbuild+bounces-5442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A609A0AF0E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 07:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5661B161244
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 06:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6D81C3306;
	Mon, 13 Jan 2025 06:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="GvPtVP7q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF489629
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748102; cv=none; b=qv14y6u1HFPRF6ai3LDSd3WufJFK/CzojdRGQHVB6hnDMDBQfjqhoDoOH3h0HljsOPjXlmwYIN1Aps6OvewZHglHSpjHjzlS8fMqxg5XHYo450HELI26gBa3J7jeEptfxxqpjHND1OxVQUTOsWUMTO9Gdy1fDLLk16DWwWgPXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748102; c=relaxed/simple;
	bh=lNC8gNckYid4BKB+f7xTZa51dLqOhDIwMC8NbB0Hor8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:CC:
	 In-Reply-To:Content-Type; b=kFQWlx3GJeEGfXjQHRKioF7tJdfmrYt98RHyqOm/HSMLmG6//97vGSwiAMQb5YliYFFFVPhJBwJcCVoLefy00Vd/JayaC+muYqKXZ798Vx2Q9GCDN72iuPy52m0PCu8t7wDAgH5neiD79d+PcacLUnb/3mYfySTCBKuVMIgTqHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=GvPtVP7q; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 331792076B;
	Mon, 13 Jan 2025 07:01:32 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwkSYGMYWJap; Mon, 13 Jan 2025 07:01:31 +0100 (CET)
Received: from cas-essen-02.secunet.de (rl2.secunet.de [10.53.40.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 50AE42064C;
	Mon, 13 Jan 2025 07:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 50AE42064C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1736748091;
	bh=b5cKEwQAH/ea8iuMyR+Yj6/OKgbkVGihsvDoVnoBMMI=;
	h=Date:Subject:To:References:From:CC:In-Reply-To:From;
	b=GvPtVP7qS5yz5ShOgA2oy+lX1M4uRd4jj0Ugugs6BkCyaDq34njnYz5a37uDC2MbI
	 Uj67l/qg0NP3CnY2h577V5W0e0FbJm3zZDv3sJKGNP/wLjIS2IweZZflO2+GhL+wng
	 15/bP9Na7xLKKTK43xxQzcb7XFdIx2RYWfszUQd6ZUhNfzVaT9mV5TXVXRnLSxH8y9
	 nOhPNVfd1+2oZK4Rb6JAOTkOd2lDg3nLRIZQ0wlA6raYfsJO4v4aNkL6MH4doS2Yku
	 89llckiwOcis8KzVaPoHAe5AVK0MBlI+6UHKPm+El+CaUVPJRfLuidz7wF1al4Ldbg
	 NqHypJnwWz/5w==
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 13 Jan 2025 07:01:31 +0100
Received: from [172.18.150.65] (172.18.150.65) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 07:01:30 +0100
Message-ID: <4cce9f70-71ef-4bd8-8517-ab4086386555@secunet.com>
Date: Mon, 13 Jan 2025 07:01:29 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] kbuild: Fix signing issue for external modules
To: Masahiro Yamada <masahiroy@kernel.org>
References: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com>
 <4915d245-4419-43cf-abbe-b28cd27c869a@secunet.com>
 <CAK7LNAQi0ZbVF9BLMCkHKufim43qH7MULW5iksoLK_sxYhRjkg@mail.gmail.com>
 <be81c0ac-fac7-44bf-9062-018bf47e7bbe@secunet.com>
 <CAK7LNAS5ZrLNeV=_gjbbJvKWLsdPaCHM=KgOevxKe_dRFCnUEw@mail.gmail.com>
From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Content-Language: en-US
CC: <linux-kbuild@vger.kernel.org>
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
In-Reply-To: <CAK7LNAS5ZrLNeV=_gjbbJvKWLsdPaCHM=KgOevxKe_dRFCnUEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

When running the sign script the kernel is within the source directory
of external modules. This caused issues when the kernel uses relative
paths, like:

make[5]: Entering directory '/build/client/devel/kernel/work/linux-2.6'
make[6]: Entering directory '/build/client/devel/addmodules/vtx/work/vtx'
   INSTALL /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
   SIGN    /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+/extra/vtx.ko
/bin/sh: 1: scripts/sign-file: not found
   DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+

Working around it by using absolute pathes here.

Fixes: 13b25489b6f8 ("kbuild: change working directory to external module directory with M=")
Link: https://lore.kernel.org/linux-kbuild/302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com
Signed-off-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
---
  scripts/Makefile.modinst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index f97c9926ed31..1628198f3e83 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -105,7 +105,7 @@ else
  sig-key := $(CONFIG_MODULE_SIG_KEY)
  endif
  quiet_cmd_sign = SIGN    $@
-      cmd_sign = scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-key)" certs/signing_key.x509 $@ \
+      cmd_sign = $(objtree)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-key)" $(objtree)/certs/signing_key.x509 $@ \
                   $(if $(KBUILD_EXTMOD),|| true)
  
  ifeq ($(sign-only),)
-- 
2.39.5


