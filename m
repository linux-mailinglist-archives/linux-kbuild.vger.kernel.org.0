Return-Path: <linux-kbuild+bounces-6073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44AA5CFFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 770E03B9948
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4241122256E;
	Tue, 11 Mar 2025 19:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGefwrkS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AFD23774
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722853; cv=none; b=oULfvly+kMIonAWQO9KKF7aa0cJiElN94abaL3YMd4yb7wpAavtgPmGf2d8r5E+Ml08YBPivkx6SZ4T1V3WA+MjdvYxS1crX3GCVOmZzFulTMXKYbWa3INcXf8YE5HNPtB8TlAlXfmOHy0JquQbYHw8dmQKCsnf3kpb0XRBTXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722853; c=relaxed/simple;
	bh=Entolay+VAXdxyC0CH6yST+s5QzAg2i+syp/vkY4tBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhhrsEj293pwjwseTYLdgEPrabO7DKEAfWYgzoQmO3gBn/HE0i3P1lnDZVcLTksiNVWxPXpiyBkAV1EAuI9fsyUOiyQNAo304pMmNRH7K88GsqPWL65cg76WuBFi1EcM7BKFdNZxtssybsGIHXGKS2mYJws3B87H7jVwzv8m1+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGefwrkS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJ8OCP027051
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LvrzCoyRcnokqfWsWAyaCE8ZZEx0wnVjTTpDK4H0Gs=; b=lGefwrkSrMT01Brn
	MZPMWKB8cKXXo3GtRDh6P4ksGFvg0+vM91zxHe2ejzoLIQ03OrGGYOrGTYG/LuHS
	XRQmUWfMIO/5X6ZNzfR1UonNp49hShVkog6q0ihPi6b/xC68d71qlggu6/HKL9Go
	jWmQPP/jOxvFTSQmPbzMvUo6yqJGzJWSoEYtZ+aMYHZy6hLlG/z94gJL/TwKHdra
	cG5xCs5+g/zUA6y43JSRH8SSkn0zxdgnANDYTc9TpcPBPCMJ2AwpZBRpLGJ2g2CI
	mhQZm6QBX5k67g25JcXceB+gWsvg7kW680D32oVJJolxqZQOlY6cKfsRBi3fqJ9b
	UTXn6w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pr36h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 19:54:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224364f2492so61167365ad.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 12:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722850; x=1742327650;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LvrzCoyRcnokqfWsWAyaCE8ZZEx0wnVjTTpDK4H0Gs=;
        b=r2ixb9ZvCSsOqPElJzPWba/zAMmrALA+pBBP0W0GVgORkXO/2s9ub1w1vV2RQD+rfS
         99RwV/R0dS+FasNGV3gCbp023eyFOTp14uCrfxxt2wpVO/wqF0IbT+3NWFyVDa8a4UIO
         Zuqn2G5Ydyb/oszDIJssVGI8m8OLFZ50yJSAdn85TV+EXa3sC8/nX31vg3BNH1YGlyn4
         PnllIPCmOLUqlmnTb8J3nd/5ejvr6eXfcGs69ECeHULWFnM0a3uxlIHFdVUX45DxMmaJ
         GbYJor0G1eC/ALi4K+adJJ4IJJIUWkHvi9McjEINfiP6YaD2F22fSXFKxj0JQLGIiIws
         ta5Q==
X-Gm-Message-State: AOJu0YyhLOMgzIbz43wH0YS2vvuNyxPQRKHidKZlPu8K0ZiAeSLs+zES
	I0efKRQQyyrB/v0KcsP3mFRrGqWyaNLmDEZbuPIoCkOLFr4N4cXo94mDMSWTtNOtPvgs1csZ4ej
	Ag6Zq0CEQFU4/jqw8XbTg9Y8+8ta2RBMXCLG3JzJxu2pDdJiwdv2KUHuvGw6TsJE=
X-Gm-Gg: ASbGnctTa12DOBZIdrVHkFwlFkszxWKO8JM5Ng1NW+tA0PPB/nux8a+yWUAox0DUMGv
	p6N+OjWhQHDE4rYx5KXCnxSHT77IARSW6hkt/L8UvkEqBOFanx1M6tSA8phaJEGgL0NElT5tUTr
	xoyvF2mTIYX4/FCVTbbHWFihYmPlZcx/7LicBlxyoe/42obPW8hqyD6HmUKdofh0xQnAxmmkOn1
	oVbkdM9tZAT4RRHk1Z1DPXLUKmHd/3ig/yxKx4ONPa/7qLFUVOpvVYn1A5zAwsH8xmJ7gyf+gIl
	wgQPNxj6bDjlc6yDmsAJd+EX9oCa4YZDnFZ6xsip62g/so0GJPOq/SX/HAOAyqb8kNSb1iE=
X-Received: by 2002:a17:903:40cb:b0:224:10b9:357a with SMTP id d9443c01a7336-22428c05724mr298846855ad.32.1741722850018;
        Tue, 11 Mar 2025 12:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECJkBAlenpxOBydMU08uTw8PQlAnpehdDmaEUFLZl6XGgFg92N2EQoE2/07x+B2J6JCPdWJQ==
X-Received: by 2002:a17:903:40cb:b0:224:10b9:357a with SMTP id d9443c01a7336-22428c05724mr298846635ad.32.1741722849669;
        Tue, 11 Mar 2025 12:54:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa5cdbsm101668195ad.230.2025.03.11.12.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 12:54:09 -0700 (PDT)
Message-ID: <ffa8d0d4-269a-4bae-9dea-adc221819b17@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 12:54:08 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
To: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d094e2 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=s7k5bkaZ1l7C4rbi0KoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: eelAQAkLptBoHAaX3Rbpp7RquHKaD3X7
X-Proofpoint-ORIG-GUID: eelAQAkLptBoHAaX3Rbpp7RquHKaD3X7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503110128

On 3/11/2025 12:49 PM, Jeff Johnson wrote:
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() has
> resulted in a warning with make W=1. Since that time, all known
> instances of this issue have been fixed. Therefore, now make it an
> error if a MODULE_DESCRIPTION() is not present.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
> did my treewide cleanup for v6.11, Arnd had a few more stragglers that
> he was going to fix. I hope that by posting, some of the 0-day bots
> will pick it up and hopefully provide some feedback.
> 
> Note: I'm not really sure if *all* of these have been fixed. After I

guess I should have done another 'b4 send --reflect' after I modified my cover
letter <blush>

Pretend this line is immediately after the cut


