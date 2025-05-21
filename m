Return-Path: <linux-kbuild+bounces-7194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A8ABEDB8
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 10:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919D13ABFAD
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB93233D85;
	Wed, 21 May 2025 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhfaCwbz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4440122D4F2;
	Wed, 21 May 2025 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815699; cv=none; b=dsmBNfhKHEugpfnaiEIfiJcDsYvKtRmx+L5B7kPD5KIYNUAcWfUaOs1fxk4S8+R3Si+S3zbScNegzUAzfb6/m46zyRIWuYTyZnwXt8XRwuLvzvV1XnqaNTJoqnBbzJA4wIZq+Wk/DQRwX+y+UNlw+R5gO5hFz08hgajAYwupvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815699; c=relaxed/simple;
	bh=1yr88d78dbJoyHseY0iODvxbYn9iaROa07uhiiSB3bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEoXrH/GvRhgx6fLljyj3CxR1GgCg4AGhUnxRl3gj8NtVm/WALv0SRj/n3uEf0e5PpcHu9JmQ4J6iVvLZHgks1k2YNSGt3yXnyIor0iFRazekMrjQAzV9p3D0KtCpQqiozYnX6Um1O6eGnXDfMexmi9avE2Zzpb434nfW1U4UBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhfaCwbz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so2968321b3a.3;
        Wed, 21 May 2025 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747815697; x=1748420497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvSWvwLBzxHWGi3TMvGZ02bO771wE+TwCy5ipwia7RY=;
        b=MhfaCwbzEva9vmd8e4cyvzFD24DxDIt2bFQOsUH8xbz1VqAkIxFDaLmM/vdH21FYQL
         zJLGzb+MExX3HqJkCeyDuYJ0IdfADwCDRXqtuBd8DTnXSghyTJEmKxeTaxbjJo5FynBR
         W2DgnC0UItIKDXFs+cTDHgp7b1kxFtYsrWapGOSuAg+CyjCaToU4Wa/6W5lnYdYplVIS
         2tqhpUQY4NgGdaeoEp99Ww89DOvOv7r+LJSFJa70lsc1l0pOKpjznEJvXbmUuUl5qsT6
         Yan+slabl7l1FECFBuHMv6edKvDXKm/dKmuM8h9T/2FN+dtQdLM5jmfs5nNC0e9bxKRh
         aEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815697; x=1748420497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvSWvwLBzxHWGi3TMvGZ02bO771wE+TwCy5ipwia7RY=;
        b=Fg5aPvvi9G8FX01A+MrQklFJ4iCzr86n1Unfe7v0YBJMzv05+UXGrJqoBXLnHpFFTo
         G+3Sf2QidP5dR07m5GwPBYbLzeZJ8hGtWZRMRJ7WJOdD6kDEuBSxRjoG3Wz2EXG0M39y
         Wqkk7hJ5PZla2vS+MeCtfu7ecz7KoX5mmjo3Hzbu7mKNEheFFQWWLLadScUPGlP3STbP
         HnjqeK+CvdEzeUlJPj+862SeR+Oyvd51i0Rt5m6PqzVNq2qWLi3b2s3gWYAxPppOrUQX
         +rp5+eVrdS1kDM9GOnRL8azslHjOME2w7/IJdGydADt/SKS8PHSs++Lppe+CrOwKVLmN
         omNw==
X-Forwarded-Encrypted: i=1; AJvYcCV4g92X+Tr+08lCVYUf761UtHGPAWRigo8kqjAOY8wmKPrqxHdFFsex3iBsXY+KCxXPxuZnKVHwEgyzZJ9z@vger.kernel.org, AJvYcCW6Fgs/PcQt8M6Wcfu/YSfyzq2zI2rSPocA+1YvZLV679GoRI7V0QOlpk05dhtCxC1KtGDlgvdwxP8=@vger.kernel.org, AJvYcCW8LfGOKVUNhMK0l9cOrXgsA4zxH0iR7Qwce1uaFIK9M/37gr9TZLeb2ETweOp9K3/NlMmMwY8uuXvN0bRc@vger.kernel.org
X-Gm-Message-State: AOJu0YwAEiyUzG2ayICqMbC6T9tyRYv/6Vbw6ofiAnoOAIjC2Gf7YnYl
	uZW6Sg0hv0fPgXc8UujCnawdFTsof30oQlh8Sf4LHn/viwJuRzIp87Zc
X-Gm-Gg: ASbGncs0w5eIoJydbBnFY6fhipXW/pxuhZs0+gRJiqd95ql87eN3I4cCAFW+qjfV0jp
	O4dewaFbffvtiJTusoq1oplatZYTIM6/K+epFj8VacIH6dRgCLonK91zNOxWYCKXEHDHvE6Yl1X
	XT5OXX0dzQKILgaYxdT1Lia2Jb4sdF/05gRxjwGulNp1cqqeoOOoszyfW35WMPjhrymcoQGJ/t/
	7dWeC3bRjagJlbyUF83x6DLvPpdPEAD1qvZPJto9AiqNplJj/r+qhISaf9tA5AS5Ri9cdy70IJd
	XIFNI57A7/vYf8E0xWvMoM43FJZQn4eEUgWv/Kx9nnXUO8B0FAq+2rZKnPcVJC8TlYD+mUCB8a0
	SViAhSO9lcrH4M94/tuOuxw==
X-Google-Smtp-Source: AGHT+IHkPdOHdo6U5XKzLsO4vBkhhMBqed8AsqpMrklD9moN1gb+50YL+ATTD9IqOwaDP88IxFcHEg==
X-Received: by 2002:a05:6a20:1591:b0:1f1:432:f4a3 with SMTP id adf61e73a8af0-2170ccb2dccmr28533558637.23.1747815697375;
        Wed, 21 May 2025 01:21:37 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829af3sm9477246b3a.94.2025.05.21.01.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:21:36 -0700 (PDT)
Message-ID: <595c820a-e14c-4152-8ece-efeb72a49bbc@gmail.com>
Date: Wed, 21 May 2025 17:21:31 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] MAINTAINERS: update linux-doc entry to cover new
 Python scripts
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1747810691.git.mchehab+huawei@kernel.org>
 <e1199a4ae39daaf191c166332ba65bb632935024.1747810691.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e1199a4ae39daaf191c166332ba65bb632935024.1747810691.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On Wed, 21 May 2025 08:59:31 +0200, Mauro Carvalho Chehab wrote:
> Changes to ABI and kernel-doc need to be c/c linux-doc. Update
> the maintainer's entry to cover those files.

See below for a couple of trivial typo. 

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 20e07e61a148..a668808769b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7173,7 +7173,10 @@ T:	git git://git.lwn.net/linux.git docs-next
>  F:	Documentation/
>  F:	scripts/check-variable-fonts.sh
>  F:	scripts/documentation-file-ref-check
> -F:	scripts/kernel-doc
> +F:	scripts/get_abi.py
> +F:	scripts/kernel-doc*
> +F	scripts/lib/abi/*
   F:	scripts/lib/abi/*

> +F	scripts/lib/kdoc/*
   F:	scripts/lib/kdoc/*

>  F:	scripts/sphinx-pre-install
>  X:	Documentation/ABI/
>  X:	Documentation/admin-guide/media/

Regards,
Akira


