Return-Path: <linux-kbuild+bounces-5731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC1A33412
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 01:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A700D3A71F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 00:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777D63232;
	Thu, 13 Feb 2025 00:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5PCn/4x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD7146434
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739407070; cv=none; b=VwfyYZGBIpKewlSojb5OnbU9ERRPnTR8mxhMcmquKbtfetiQ3hZGYHuc4HJajvnI8MqZjrbLWs1mpeVlh22XeRN1NNddaWgRnCbmoBMD88TOrd0RoJ7+2OqF8QcHQ7ZSgA3CWfITqVHrs3h6iqyHAIcy+7q52Ahb03DmLd6k/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739407070; c=relaxed/simple;
	bh=3UCX6Hsfe9hvkmewiUtQfpVawUQHJmc/WEbyr96ily4=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=djxEN2V5YrhEkSjcdWE1BCsFxz0quS3cNA8apWfB4x6nkr0ed84d4QZ8k2l58wqXaErr6iTIO/3xLYfFftCL5fk0gOtlg/Zo3D5U8YF9uEtIyUVpdc/6qU2cFQF1kOCtB4wdSETzh9tuyw+mzWDsAPnRbu+TM6n2WWzhCFhrVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5PCn/4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CLAKGQ026628
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 00:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0hvkYm56xAIF42DBmwkzbj
	pLEk9HtoNBL/vVhJk1KPI=; b=Y5PCn/4xoDY6ghvGdydwgmuIlG+6nqLtDHGiqN
	8LZrNcmICfxw3jhXAMW8HFEXvgiLppY0Kye5jFEm6gZL6kwNNxzEPnCfsmxi3L2V
	SFzBeDAwgeQLGZzcWleXwB15AdGXNgHvaA3Quy49euhVjwvUXD5hHk4o96IMB9qW
	W+OSwbv8dn2xLk5E0dTrtfo2bU/PixMN9W4h0aG7fBpJ7EHmu7UJbtH3SjjaxJu+
	eYnqf0X2vwoWrOmg0RqoPdRKXnxpStQHQeOiempBelTf+tWeFlkmdsxGS1dWxqJ6
	0QMm4Rz+OoO7rcrdVLcPIXBxP/aDmxhgas7hF1RxbLG2NqlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5dcq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 00:37:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa514fa6c7so754897a91.3
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2025 16:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407066; x=1740011866;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0hvkYm56xAIF42DBmwkzbjpLEk9HtoNBL/vVhJk1KPI=;
        b=WDfm1WZCE9nJJf/rQHkeFRrQe23TViSXk6nm9xDEmGgq9jPwunKmrmPIbzwi8LsAAh
         0ZCRwEqyVzJXn1R7o8A/WWqGX/X/UYoon/Y0stRwxtU2/gW1wwYSYzqg0CYwh4elWIbc
         r2CDYUTWCxKef0yetdIuqwY3TxkYXR2lIkr51nmHemzmFt4GmD5tLJgT6yheqkY2dOJU
         mHEYLjbIriq6ckJ/7xfXdvgTfxrrcgnVhhIvtr6joG7HlpTHqxRgE5s9+KLqJ1f3nv8G
         NpsAnBFp4vU828GcQ3zzwh8AUVWidvFYmhxQX/31eV8AZt0nyDsXHRJsXrWKb8JQ+htJ
         xBzQ==
X-Gm-Message-State: AOJu0YxjJxZ768ykGTopl+qR8XBsHpSKH7G5vqQOHkug40r18aa4vXWw
	zgPrFwaPrO8gPI2RF5KwgMBtxG6jofMUWN1PrgMUx65yztzcvx+OmA5BMp8yaktAu9una17Or59
	hJS8cvLV/DpKfJ1VUKsfiEdXF7z4aPnDIQ2wvEWZikVEf8YIEsdaycWFH3nI0UoCiiaxgHT0=
X-Gm-Gg: ASbGncvRcN4Ws1QoPKpdUPGuoMRRJzB6gT+rRcmByraby2aUppwRpTR8KpfLi08gRUF
	duczsTa7sOTGi8In+2alyPOv2dt43LjU3BxghU8hjELuy5wLFshdffzENuw/MBZF9fmG5RSTjJq
	Xhe5w7eqmHJFH3Ryv7GKds2dLPyEJHVINL1DMjJc+58hzkIncuQXM0d2SCNc/ggE/OoouXwhOYT
	v8CgPDOXvMcz1ixX1BXq7NlgNvy0KhJL2qn4pxtNnYU9uBo20t6klWvyI/7qJ7IpMWlfJFuVPSL
	vuz9Y8VQcIhSvrZ6CSpa7hXzm7lgUWy9iUq0MDIngq/hiYpZq+4cDH16jl990TU+5oDgElY7kA=
	=
X-Received: by 2002:a17:90b:23d0:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2fbf772f5eemr7608477a91.0.1739407065927;
        Wed, 12 Feb 2025 16:37:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpgVVLn/0als/kHHIOJ1WiV7FRQKsVt0RQAYuQfLEc+a6xRvoJh3VHjTtJsnPiNeCvo/LkEw==
X-Received: by 2002:a17:90b:23d0:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2fbf772f5eemr7608442a91.0.1739407065396;
        Wed, 12 Feb 2025 16:37:45 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf9ab0d6csm2283500a91.49.2025.02.12.16.37.44
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 16:37:45 -0800 (PST)
Message-ID: <e7a76bba-38f9-4c40-9d4d-94f27cf22bab@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 16:37:43 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-kbuild@vger.kernel.org
Subject: make bindeb-pkg failing with v6.14-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MaBS8j799eUCTmr7aKiOaHBzJlOfjOIR
X-Proofpoint-GUID: MaBS8j799eUCTmr7aKiOaHBzJlOfjOIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=644 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130002

I'm having a build issue when I move from 6.13 to 6.14-rc1

I'm cross-compiling on a corporate VM targeting a laptop.

I use a local GNUmakefile with the contents:
export ARCH=x86
export CROSS_COMPILE=/local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/x86_64-linux-
include Makefile

I then:

make C=1 W=1 oldconfig && make C=1 W=1 -j`nproc` bindeb-pkg DEBUG_INFO=n

With 6.13 this is working fine
With 6.14-rc1 I get:

  DEPMOD  debian/linux-image-6.14.0-rc1/lib/modules/6.14.0-rc1
dpkg-deb: building package 'linux-image-6.14.0-rc1' in '../linux-image-6.14.0-rc1_6.14.0-rc1-240_amd64.deb'.
dpkg-deb: building package 'linux-image-6.14.0-rc1-dbg' in '../linux-image-6.14.0-rc1-dbg_6.14.0-rc1-240_amd64.deb'.
  HOSTCC  debian/linux-headers-6.14.0-rc1/usr/src/linux-headers-6.14.0-rc1/scripts/basic/fixdep
/local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/gcc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find crt1.o: No such file or directory
/local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/gcc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find crti.o: No such file or directory
/local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/gcc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find -lc: No such file or directory
/local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/gcc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find crtn.o: No such file or directory
collect2: error: ld returned 1 exit status
make[7]: *** [scripts/Makefile.host:114: debian/linux-headers-6.14.0-rc1/usr/src/linux-headers-6.14.0-rc1/scripts/basic/fixdep] Error 1
make[6]: *** [scripts/Makefile.build:465: debian/linux-headers-6.14.0-rc1/usr/src/linux-headers-6.14.0-rc1/scripts/basic] Error 2
make[5]: *** [Makefile:2123: run-command] Error 2
make[4]: *** [Makefile:2123: run-command] Error 2
make[3]: *** [debian/rules:61: binary-headers] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[1]: *** [/local/mnt/workspace/jjohnson/kernel/laptop-debug/Makefile:1627: bindeb-pkg] Error 2
make: *** [Makefile:251: __sub-make] Error 2

Is that "HOSTCC .../fixdep" using the CROSS_COMPILE toolchain instead of the host toolchain?

Any idea what is happening here?

/jeff

