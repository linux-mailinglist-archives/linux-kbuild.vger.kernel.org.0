Return-Path: <linux-kbuild+bounces-8622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771EB3748C
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 23:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B7D4361F66
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 21:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75205283FCB;
	Tue, 26 Aug 2025 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GW7uBFTf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BA279DC5
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Aug 2025 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244982; cv=none; b=osU8+d343gg3MmQitHFVxXtMqjwnL3uZvE+uf0JsKIJpamed3NQqaZTptY6eDMAk/ivTH5FQ10TJBOxreCcVfAt1StmOcQgr7bL+uqXQi8R8H1GfCbqPIQk0F3jq+hnFq140HXLu7MxcoryEi8WXxTLQMcUehkUJ/H2zzXCyZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244982; c=relaxed/simple;
	bh=m0WVLtEMOLSm9zDk1d3O6jTHTPnftcVbrMs10BE0Kzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqRWfYEu/FQ453ztmVLCIPXb9O+EozbhhRmIt2FKluh2BchgocNGW18ufQtMchgFUYBN97Ot/LniIHxMYFAkLjzrGtWUxHR4m2rydHOI+TeHd56NxVGyOK1Moh02Q3L47MwmFx/W66mQxcEQCoSiuWH8ngUJfIT1wqcik5Sowmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GW7uBFTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDf8TO031511
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Aug 2025 21:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=; b=GW7uBFTfEjLK1VD+
	jvcelJdkc9D6ELm3oQep1HEk63GXjAQGze8wezUoodAtkr4xi+hm1vjmixN0eaoo
	ZMdPJozGh+tGniRlZKtVl1AlZMYsRqESV39zfdp1M7UVc6BAF/suWs0gP1ub7YkE
	np1pOHkTc03QgmcyS7QXDEDKdem4JpdwM2KBuaXvGuMZ2qw5gZWnIjcAIGJKrLNt
	HcWp8bTgc+WvN+ghBCrIIMgeZuUh+pgZkyxL/b9Ta1rHtyYYrb4IqkyvIG3grCN2
	HnEpw+GWEEP+WBzz3K4tDfZmphSbo8b4397190wUll7OR044RLWLhULiGcQ1ItOT
	koFGAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16sg5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Aug 2025 21:49:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b49ddcdd5e9so4159561a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Aug 2025 14:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244979; x=1756849779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=;
        b=lzOrJ+KF2pKIkwI8dHy1hMRn/PA8NoJv091R8M9e28Bm9xQ1OJU/9ssEsFVYAbi2AF
         BhJPJlz4fe84gr6C8cz0Gpp1limznNmzhgUvSGoL+JQFKadBC2GZ68uginkRRilCiigU
         9p5r6boXSd/A3VIfNnQ5IfH3ZnctNVr/1yhBPZgS2gc1pgLZnwqXOOQxpnLyOxV/0rdD
         J78GT59D+e57xnYjTPzwZNcuhHRGhuH9frYP9WEjnEGzKlf5vkx0QJUtca6UyMbyXf/1
         xLkUHhg1QJYX88q+rsHFDPvH9qjygnlW+t2PAXh+8tvZZcDFl7OltD3M3q13EdAOBYlQ
         mSyA==
X-Forwarded-Encrypted: i=1; AJvYcCXM7BgvEMvRvWn6doC70QsXMPcZomZrsvkRNwBchqHnBFcLIVqKLeZp7pwps4nQ9tpeXpP9NHrCcKQFl9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBTdL4IAjtAqTX1hfYl5ONCtQH6d05S96pe7SmT5bB7hrwfim
	7hsrOmJqL7vYX15WgwopgAmhLo647hqb3Qlaejarzya8Uo8Sxw3i35SMyE+wX6oaxT6HwVhzZkL
	kdrwPgBWsyo+GeB+AwYB+uwm865e/MvA7viPwGGvre61V5Lggd4X/GGid0idS/AxNwtOmxlV58u
	0=
X-Gm-Gg: ASbGncvcaAhhyYFuSoDdH3RReVJfpklM2JH9B0XCwqM0etdfqx/x2EYkrBjoZEIyHk0
	NCj6IBUfcQ1S9YRLXjYhzI5XNHmWaIX9Ty5seRfZWfT0pm+uC5DRdNeFfoT2d6RBYwlmo++28rU
	kEcaH1ZlqkGgAATfmMUgphmAL8uVTr7eQT8Foi8Xkcuu+7VCjdqeDgEPzF0WaqY1apzkLzjUfF7
	4XV6dQ5E9G1a1JGQOfGeJW1OWRol+h4tRu+mio+I5DocgpY77QyILtej+/hgTdhw2+YSSUfyxLj
	yhHuNTk5HAiIeQLBTMaegRjSBQFiD9oM7jN3tWiwIhrvIset1qp79dZAbJ+iBz+U3AdNl3j3XUk
	/DK8ARzKUkFIgVT6hgDiYvlVZPjYTwKs8
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163087637.1.1756244979113;
        Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvW96AUyv4NFuLjcj/uDmOR3GBBgYMnkq5H/IYhcNWvdPPtmf37a1KlGOYrRmV7mrjTboe3Q==
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163064637.1.1756244978686;
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4c1b2f5a3csm5860905a12.4.2025.08.26.14.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Message-ID: <e43ffda6-4d25-4874-99b0-6a65fea4a261@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:49:36 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zGIDTqOhBoqe9rcjejzwc2zLYUiJIwTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX79NZh7Hm2mvA
 f7smI+bxiLQd33ujcWPSjUm1fWsMW+qQ+ExujBghfn8nZ/XE7GryCojWPx6mC1bPDF4Jo1l8hUF
 LvIOKpdLm4ewNP2RzvIibdMIqW/uY8mHi4x7THHrXFU5HcseUpqkJ/EnV2pMeGkGOAmopBOtnzi
 is/tU0dDJlFilWGvV9rnHv9mzzsMXVwKLBRTz4cBXhVLwm3F35G5h1LrkN3o7PJF+05yT7eV+Ib
 TbFcupVUaPfLaZVrXILHUAKVqGLEDCJZWWVTHVWq5XIFPMcHdHPSzIe64xNgKOVtvoMcO1jD9/6
 BoNWrb5JqU1nftpIobP0QUUVopgoDRXial5OzTJUEJyDpWvA6ggnn0yavFP6WUCjYV/GYfcxlrg
 GX6lRZeZ
X-Proofpoint-ORIG-GUID: zGIDTqOhBoqe9rcjejzwc2zLYUiJIwTF
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae2bf4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ZGSs6mt8D-bwwmi9yLIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On 8/25/2025 7:25 AM, Kees Cook wrote:
...
> -config ARCH_SUPPORTS_CFI_CLANG
> +config ARCH_SUPPORTS_CFI
>  	bool
>  	help
>  	  An architecture should select this option if it can support Clang's

nit: Do you want to replace the mention of Clang in the help text?



