Return-Path: <linux-kbuild+bounces-7164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BCABD1C6
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 10:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B77DC8A4E0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 08:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695BC263F52;
	Tue, 20 May 2025 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORNhjbdU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB829262815;
	Tue, 20 May 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729415; cv=none; b=Ttlh+BbLtT5+/Kf2sGF/JIdtvEH9TJ4h8AhW/vFoGa4My887iQKop2eCY6Pfm0oWXnHEaQzEuKtIeXtoBMD3uCjTnZFbsPeUtc1Gm5kyIBxaALondSBnmXvpcahaLMc4Lnc3uHykZQ+4Ys/FNNr8Ofl0sg594qKBDu17lk/VS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729415; c=relaxed/simple;
	bh=85eJrd8qf21lJrgf9znNNn+vgQiRAfNyHii39Y0MMB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGo2orvnWSAE8nTMPehDzTFcRPSrOyTTBYIyMmncRpnOHExJAXS+tZVqBCda5K4mGL39NxyFaRB6luj4EZwkCkpftTvrFoC6eYUsC1Joh4bLT+34Hihq35N87u25kShKlxeSfDZD39PYS0rX/94aumSVZJswj3ztu6rBJ6OHRGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORNhjbdU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231ecd4f2a5so30964635ad.0;
        Tue, 20 May 2025 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747729413; x=1748334213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EAzD/tIu0MqQ7G+EY88O64O0FaxVAHT+5gF5Zrxa8s=;
        b=ORNhjbdU+1LlF58lYLLdZMWuSAjLSSvx1hqitrP0iRjAdjWylPBphgUWpNh9RBNX0f
         NTWxEewr2pBR1/9QF3+XQnjOZOLXj5v+9Czf1GZbULhz01PzRBtVNa4ZYPcgNiEFH/Ux
         t0g0/vwLc2RFwFQUwhwwyP3/VDwIPZKBauTOM3qcTRHTIaXFQAiG3NfzOp4LDl4OaVc1
         ClSAkayxc3hN90AJuSlsZcJr0F+X5TeotU9J7X/LwhEo+nOrENbR1QkrIHFAH0vvujY8
         A/2VkT4H2D5Qp+ZBjOLOkd2pSItYNYaoKrH4UeCVPq1JZPe7Xly/b0Nil+EMCps6nR7V
         SU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729413; x=1748334213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EAzD/tIu0MqQ7G+EY88O64O0FaxVAHT+5gF5Zrxa8s=;
        b=Cg0NCvUYwu9GqIxelRPSOOFB8z0YA+MIu5pXsvz8c1y7qyavX2z1iJNlinE2ib756M
         b3AilE/18HAm5PAx/cE2WYATg1nkDooS/NNbGobFsmKy/ivaqi/J62/9R7684WPgk4mA
         Isbxkmjc92bhSZaoqH6WRgTJq14xxFy4jmMFD1sRNANkRGtgBmEgXpocYCG8o91W0j0v
         ExdMVJLVnoroXc/0idU/KvZGBFMfMgGI7VyIpmbto7vpRwYBC1KslOZlrsVIlaN72cpX
         8xhDWVydDABlpAldRt7k+pjCGdPVw6moPNDx2/FdfqNnqIp5SJY6heWcwrdW0/uLE8w8
         vyZg==
X-Forwarded-Encrypted: i=1; AJvYcCVqTr47V1hcgJ6ODJ0+mXFdbNrNLcbjpqFBfzFFX4uS43eQJmV+vOweDlD/T39zn1XYpIE+humbTBswITBH@vger.kernel.org, AJvYcCW73sSR6OgF32b/vCcBJtkutfrNFkIyre5pP/96ixN5tR6HHuRc7PIP3FiowLCdFQA5vL38uVsMQTKUwKjQ@vger.kernel.org, AJvYcCX6ux+UjGfF4j25puSlCsnsJ888R7aZpzUfDIDsyG2Bf4evrHAh3z3fGh7tSTdP5qd7q3FNtImgVrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvs4o1sWSVrjG7GQBPDtRexFCSy0PCkM/scXQCmup/clpe5h88
	0Yk3U3Xwg2lUFUd4rGWIMYI44qfa5i81o1uLkbT4YWrkXKuF5miaQygZ
X-Gm-Gg: ASbGncuMGAjq4QIIuND0ehJS1rs3uNuIUennfyScA6ZoHLuoTWE+lSQmmfT+SaseZQT
	ejdnnsqgVEUoEWQ0aEPfGObaK8nBiG56DX9xgmDDA0CvmdW42faSo9F9jqxpbKZJBI/KQXwWN/q
	W27s5BKcXdgeX5Fwh+ltJm6qL4lSl/1+WN/+CN4tPWKXxgjrvCmej6y4/ow2VdioKWnC3SIUl3I
	RonvK4oWhv0sAAmIW6FwTCrVdmq4K/QiBYYL6GC+oXsdEjWBV9balFS5qdj81jizYWpWNMtfPYY
	ONO5QieTI4tkud25QDMOH7g4mSM/YM5xv2QeX1ZtwoA3kF9DQE44KYi/+moVrvSNgd0bGVW44LK
	2MzwguHwmTlwtCUK4ZV8cTg==
X-Google-Smtp-Source: AGHT+IFuYg2ieDC3caAihREPImXBFbx/3VCQNzBF0LOiwMfF7rCLpeBZ3U/hwiCmzMCamPHp46lUGQ==
X-Received: by 2002:a17:902:f648:b0:224:f12:3735 with SMTP id d9443c01a7336-231de34468fmr236710165ad.31.1747729412928;
        Tue, 20 May 2025 01:23:32 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9713bsm71474085ad.150.2025.05.20.01.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:23:32 -0700 (PDT)
Message-ID: <590981da-4d37-464f-a52e-ba163d3ecbc5@gmail.com>
Date: Tue, 20 May 2025 17:23:30 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
 <6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
 <7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
 <20250520095037.3dc39685@sal.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250520095037.3dc39685@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 09:50:37 +0200, Mauro Carvalho Chehab wrote:
> Hi Randy,
> 
> Em Mon, 19 May 2025 22:55:08 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
[...]

>> Traceback
>> =========
>>
>>       File "/usr/lib/python3.13/site-packages/sphinx/util/parallel.py", line 137, in _join_one
>>         raise SphinxParallelError(*result)
>>     sphinx.errors.SphinxParallelError: KeyError: '../drivers/gpio/gpiolib-acpi.c'
>>
>> and then it's finished (not a normal finish).
>> So IMHO this patch is not sufficient.
> 
> Well, on next-20250516:
> 
> 	$ ls drivers/gpio/gpiolib-acpi.c
> 	ls: cannot access 'drivers/gpio/gpiolib-acpi.c': No such file or directory
> 
> Avoiding the script to abort is a matter of adding a try/except
> block at kerneldoc.py, but I'd say that, if an include file (or any other
> file needed for the build) is not found, "make" should abort anyway for
> the affected target (Kernel compilation or when doc building).

Interesting ...

So, it sounds to me you think you have the right to break Stephen's (and
possibly other devs') workflow of test-building kernel docs, aren't you?

I don't buy such an argument.

An innocent typo in pathname somewhere in the doc tree deserves a friendly
warning at most, not a fatal crash within Sphinx.  That would need another
run of "make htmldocs" after fixing the fatal error to see for other
innocuous warnings.

And your change has no effect on exposing those innocuous warnings.

On current docs-next + your change above, running:

    make cleandocs; make KERNELDOC=$PWD/scripts/kernel-doc.pl htmldocs

produces these 3 warnings:

----------------------------------------------------------------------
./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'
----------------------------------------------------------------------

, while running:

    make cleandocs; make htmldocs

or:

    make cleandocs; make KERNELDOC=$PWD/scripts/kerneldoc htmldocs

doesn't produce them.

Sorry, but I believe you have run out of time.

And let me remind you of the expectation for backward-compatibility widely
accepted our community.

Akira


