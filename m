Return-Path: <linux-kbuild+bounces-9583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E0C4FF72
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 23:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0169D3AACC4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 22:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A332335CBCB;
	Tue, 11 Nov 2025 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0W0FVR4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9742C11C4;
	Tue, 11 Nov 2025 22:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762899674; cv=none; b=R4JdkywqfPm7X3JZPvsKH0SZ6R+Hf5PnaSk0syPdZAzs541D+Zuc7lYEkvnqIsqpt8pDHXYBSrWcoUNk7rHfBnMnxJnHP/12glQpsO3QwPem3oMu31vAr5lz3Jv8ZteQDPsqQfPDk64LzDwK+axdTWFhwQxPso6rZE0N0XFkJn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762899674; c=relaxed/simple;
	bh=EupUZ0Y97IkAYfyj1mCfWDcBjmbbyIF9p1kivmfAjN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejH/k7lE7O1XE3qPZsJNXbbYYrS/KN803s05vgoglU6NApbvKJr9YgTENZESs9qxwxguiR3+zPBrZFucHvX7qYnfwBfi4eAVB3gCXOLt8tTKDaju8hPeog9JIhmx6bf2ug/CoBiTfH9oimYuM7dVYEAVq5fddlhtjOis9FdS2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0W0FVR4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABLlVZA3502223;
	Tue, 11 Nov 2025 22:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PZe1+0R61+e
	l68af10hP/F4jsBL57RyNvY7hU56XRXA=; b=Z0W0FVR4E2tuoknwaEwU4PferiQ
	CvMRsjcoHO8b34Nwo1Zc9x7+wtxNZDnmmRql+NaycDc69yCv6FtYdD+bMlMMDHDm
	96sORZAAL7E6w3/PBjJ9qDROOx7r6AjNTtI9RSek0FsHzTdY66Qb3uYYPYOT8WCO
	UUg3wlMBf4EtAxepRhx6mfpcs5nNYXFOu/ywavRCgJEUXevS/WC5iMp9Jtenbdlp
	RO9xc69EqrXrMAOD4BH/yeMP/bksCU8+tuPKxcowAz3kljeOVMr7vdf5jNx0MEkY
	OcA7JREBKXorvr82dAmIuWGfdi6h0rEIkhvCg5HT0uY4oJfdm2j1AVsQZ6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc022r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 22:21:05 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABML4lB030393;
	Tue, 11 Nov 2025 22:21:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 4ac0nkfyvt-1;
	Tue, 11 Nov 2025 22:21:04 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5ABML4EO030387;
	Tue, 11 Nov 2025 22:21:04 GMT
Received: from hu-grahamr-lv.qualcomm.com (hu-grahamr-lv.qualcomm.com [10.81.26.100])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 5ABML3o8030383;
	Tue, 11 Nov 2025 22:21:04 +0000
From: Graham Roff <grahamr@qti.qualcomm.com>
To: jani.nikula@linux.intel.com
Cc: corbet@lwn.net, grahamr@qti.qualcomm.com, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, nico@fluxnic.net, nsc@kernel.org
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
Date: Tue, 11 Nov 2025 14:21:03 -0800
Message-Id: <20251111222103.3322795-1-grahamr@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e5ef3c59bc100cb44adae6ef624da83af8bce299@intel.com>
References: <e5ef3c59bc100cb44adae6ef624da83af8bce299@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wN65WCwl6FsPj7fXFwPZDHMFi8SZpJ4n
X-Proofpoint-ORIG-GUID: wN65WCwl6FsPj7fXFwPZDHMFi8SZpJ4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE4MiBTYWx0ZWRfX9F5dJdC+CtdL
 fnpseWA7FDgZCwo4kkg1v6pWoIFbNHAw8xx0GGftzgI1JLzwqmpGW3jCi5flwW2eIX0wpn7NY9J
 C/ERRGs7B2Sz9RVxMHcKVi7SlYrRgjG9EIHcHnT6MQ04aWeg3RpLOQObvRknwFMwtEjBCdP2NUS
 WdA/VYdR164SzlXf1x5AprE7/zO6xwIt4AiVi444z3hBEkg7Yjl2Jbea3vQymj64fSLThsBbFKF
 JpeRmyiuvBTAQwelCJ8BDYuffleK9bU7NlnOkEgc+MiJTZZIKISDolcCQ433Ov2NSZqCEyuzxE8
 oBZsLNxz8EyK/FfOhwrMjdsJUKgmYnJgZ+T34zyA/FZbfizCQwnZihD3rfU/T5oXH07FAUedT33
 RSb2eeShFogABvViCog1XRXN8QAu5A==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=6913b6d1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7ZdoGrH5h-tKuaFDneoA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110182

Jani,

> Right. I guess it takes a while to get used to the idiom A || !A. But
> then is it counter-productive to add an alternative that is apparently
> not much more helpful? And then we have two ways to express the same
> thing.

I think that expressing an optional dependency using "depends on
A if A" is easier to read and understand than "depends on A || !A". And
it is certainly easier to follow "depends on A if B" rather than
"depends on A || !B" - even realizing those are equivalent takes a
class in boolean logic ;)

Also, most other Kconfig attributes support the trailing "if <expr>"
so this makes the language more consistent.

> So the follow-up questions:
> 
> - Can we come up with a more obvious alternative to the specific case of
>   "A || !A"?

Meaning an entirely different syntax rather than "A if A"? Something
like "optional_depends on A" (just a made-up example to make the 
question clear)? That seems to be adding unnecessary syntax when the
conditional dependency covers both cases ("A if B" and "A if A"). If
there are any suggestions for a clearer way to express the purely
optional dependency case then that is worth looking at - but honestly
the entire concept seems a bit weird (even if widely used). It may 
just naturally be hard to express the concept in a simple manner.

> - Can we have examples of conversions from "A || !B" to "A if B" in
>   kernel Kconfigs? As in, don't add features without users.

(In the Zephyr pull-request I listed a number of examples from that 
project as well.)
You are correct that most commonly conditional dependencies are used
for *optional* dependencies, but there are a lot of other conditional
ones as well. Note when grepping for examples look for both "!A || B"
and "!B || A" - both forms are present in many places. A few examples:

arch/arm64/Kconfig:
  depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52 -->
  depends on ARM64_64K_PAGES if ARM64_VA_BITS_52
arch/mips/Kconfig:
  depends on SYS_SUPPORTS_HOTPLUG_CPU || !SMP -->
  depends on SYS_SUPPORTS_HOTPLUG_CPU if SMP
arch/riscv/Kconfig:
  depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C -->
  depends on CC_HAS_MIN_FUNCTION_ALIGNMENT if RISCV_ISA_C
arch/x86/Kconfig:
  depends on X86_64 || !SPARSEMEM -->
  depends on X86_64 if SPARSEMEM
drivers/acpi/Kconfig:
  depends on ACPI_WMI || !X86 -->
  depends on ACPI_WMI if X86
drivers/bluetooth/Kconfig:
  depends on USB || !BT_HCIBTUSB_MTK
  depends on USB if BT_HCIBTUSB_MTK
mm/Kconfig:
  depends on !ARM || CPU_CACHE_VIPT -->
  depends on CPU_CACHE_VIPT if ARM
kernel/Kconfig.locks:
  depends on !PREEMPTION || ARCH_INLINE_READ_UNLOCK -->
  depends on ARCH_INLINE_READ_UNLOCK if PREEMPTION

Are you suggesting an update to the commit text to call out the 
optional dependency use-case explicitly?

> My point is, there are like 10x more "A || !A" than there are "A || !B".
> Feels weird to advertize and document the thing for the latter, when the
> former is the more prevalent case.
> 
> $ git grep -E "depends on .*\b([A-Z0-9_]+) \|\| (\!\1\b|\1=n)"
> 
> I'm not at all opposed to the change per se.

The Kconfig documentation will cover both cases (in next patch). The
"A || !A" case is covered already in a special "Optional dependencies"
section which I will update to use "A if A" as a preferred syntax. I 
still suggest having the definition section for "depends on" using the 
easier to understand example of "depends on A if B".

Thanks, 

Graham 


