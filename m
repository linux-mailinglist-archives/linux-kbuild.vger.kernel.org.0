Return-Path: <linux-kbuild+bounces-7195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 539BDABEDE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 10:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5E01B65CE8
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBF51A3A80;
	Wed, 21 May 2025 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em7R70U+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3732DDA9;
	Wed, 21 May 2025 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816260; cv=none; b=Wnx5S/j//5kf3GF7l8QpSotRyp6mThIrTb8VvUl2cjBCIGH9FcV92gYlXGue9HnqsyohG5NXnduQcXEkBVfZ4yd113my2QkrvuKPEFqnEKh6cZk4Ome5hwaD3Sr6QS32Aybl4651KXzBiI3V2taaBVDUB8KrgbeFJWFdqX6kiqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816260; c=relaxed/simple;
	bh=MdSpC2WAyQB9cA2aJWbzgTSn77FVI9B/r8r8PaUlLX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6yFvLyP2u7HzK/PGwFrGdfaM1DBotBEbvRlpOOiaaeVNeJhCg/+vUBPVsOtiwKaCMsGoNZPcCkz1xiWuHN+apEfkh88JRC1jZh2dN14dKWghJjl+0eT69YJsY5Qc9uKiUdd1OysJz4JmfBPYYsV52j0LSubyDTxrUb1b/9D+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em7R70U+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5898139b3a.1;
        Wed, 21 May 2025 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816258; x=1748421058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2HZ79sw2e2Skhwqx6Yo4yRe8t6jNnoRzwh2fh6ICVk=;
        b=Em7R70U+cqf95tEZpigYHPP6tZzgWXUaFEbf+vxN5H82Dghm0ZmJ9pLjyHgjN4mSUZ
         G1/wjJoNVVDXrQfnhoSTTf050nREWdvfty/o5MJje5dYx8IczTykryn0lRkmXn5Vjjvl
         T4ZS4t2+aspsMiAXPk9hacq7rzrClDIvJ0CU2Mx+zWw0eo/jJBpTt5LllyPr61RMqNVS
         nI3w8FKIBUoyk9NV32g8dTkXK/gdBVnwm359fx9KDn9dpdk2/A0ECPY6iBTdc5BHNDAz
         TCUHM16gAodZ65KYEfxjlLFT653rJpWnCRxClr3x3TM3yP4gfkGUiCC5BatFtMVAVq6D
         7W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816258; x=1748421058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2HZ79sw2e2Skhwqx6Yo4yRe8t6jNnoRzwh2fh6ICVk=;
        b=MnWVxSYAfLO1xWTC+16RDOxKL8e4SiDV/wqKonvs4Up+q8bWVz33g0xQineVhTRvQa
         33LNUNvIzrJhyo3SI6UQYeWLUeWG4w+PLNGAxF+0jWmDYDrizQ0pzFPLA2KgQU5xqLm7
         s7FMjf6f8Hb39jSzlp2QcH0HcDGX+f9Jti67KGAoVrCYKpP2GhASPqdZDMmByughfLrk
         tzQDW+9A9WvULj07FFV6tBucoy6Dew3cn6aAjI42ZCLQTzCoPYPbLyDjvrFA7IbcWE6i
         TUnj6Le9zRsBFL7YKjsIIrYHK59IrFqvuW9ZhLBTvwmWCdw0D8Aso3vg8v30e197dOf7
         RfUg==
X-Forwarded-Encrypted: i=1; AJvYcCU1CmJj35Fh8f/ORe9QfgfPqQjO11fW1GFuP+Lp7clyXxbOKcGtQ9Ux4nDQjbXoD0ZWOdbuSt0pez2J9Bk=@vger.kernel.org, AJvYcCVXjKzCSTcemDxIKWoqO6/YMy4W0zJ2ySW3AYNDUIcV6Oez677Spr9mhvIIfAA8YyDy0qQAjO8V+UeMZPBs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3bccgmpYyDDiLO2n+4oKY0vmdAIHQtrEyTYi4YOKaz+2Hw6/k
	7Z+r9xSAzRsWiJUJGiRp5mLJnhnKb6jKqHA5N1U+Y7rlg+cbt3sQwh+y
X-Gm-Gg: ASbGncv9XwfxVxm5AGBINq8VGnxIG7hGutm8xaVlIhPCINkDdMJu/vw1LOMm5TTGKVj
	bWl+947n/bxWOY1CwZQtuyomo50RgXqEJ4fK1Y02ntl+uisjxykAHCCEH5itxoBypJQdF1MA4bh
	m+JEJ+LKnO4Pzmi6/4GCEVNr5C6xNGkOm8Q6P9SOKqH+lmzS+cWacezcnYFVqTwUwnfyfUV+DIZ
	hLx5vuMzchZG3rVuoUU1VynZ2MHSy62513MYd0p0IjCAJ9eI7E7nFJmxME5GnAtb8fqBGGyFTd/
	QnchE5E1VTW0nmmihqfkGMZPKRPmiAu+mntZ3fjV+c6sjsB0tNoouH+lzhOweWG2VtpWj9/hCIK
	ZK99d4FE8KdreFflR+2Pyv2L9t9v+mjtk
X-Google-Smtp-Source: AGHT+IEUUujTAz3qe3y65bWcFwtCQtGBkME2Wbj/nJTJm6s2c/Bmus5gbqUl9Tk49Gi8DL6xFvydsw==
X-Received: by 2002:a05:6a00:2288:b0:740:5977:7efd with SMTP id d2e1a72fcca58-742a97eb55fmr28222011b3a.13.1747816257931;
        Wed, 21 May 2025 01:30:57 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm9110492b3a.46.2025.05.21.01.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:30:57 -0700 (PDT)
Message-ID: <045d73c4-b418-49a4-9c17-c01e89e240ca@gmail.com>
Date: Wed, 21 May 2025 17:30:53 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Some kernel-doc fixes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1747810691.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <cover.1747810691.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 21 May 2025 08:59:30 +0200, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> That's the second version of the kernel-doc fixup patch series.
> 
> I discovered the root cause why Sphinx logger was not working: there
> was a call there for logger.verbose(). According with:
> 
> 	https://www.sphinx-doc.org/en/master/extdev/logging.html
> 
> This is a valid call, but it doesn't verbose messages. Instead, it is
> crashing with modern Sphinx versions, causing the log to not work.
> 
> I got rid of it, replacing by logger.info().  I took the time to also
> address an issue pointed by Andy: not having the same log message
> placed everywhere. With such change, we can keep using Sphinx
> logger (which produces colored messages) inside kernel-doc
> classes.
> 
> With that, we have:
> 
> Patch 1:	makes Lore and kernel-doc ML receive patches related
> 	to kernel-doc.py and get_abi.py.
> Patch 2:	cleanup try/except logic and get rid of logger.verbose();
> Patch 3:	fix a KeyError when trying to acess data from non-existing files;
> 
> If you test just patch 1 on the top of next-20250516, you'll see the
> keyerror message (in red):
> 
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -export ./drivers/gpio/gpiolib-acpi.c' processing failed with: KeyError('./drivers/gpio/gpiolib-acpi.c')
> 
> And the script doesn't crash anymore. After patch 2, the try/except
> warning gets replaced by a proper message:
> 
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	WARNING: No kernel-doc for file ./drivers/gpio/gpiolib-acpi.c
> 
> Please apply it to solve the issues that are reported by Stephen and Akira.

Other than the small typo in 1/3, this looks promising.

For the series,
Acked-by: Akira Yokosawa <akiyks@gmail.com>

Regards,
Akira

> 
> Regards,
> Mauro
> Mauro Carvalho Chehab (3):
>   MAINTAINERS: update linux-doc entry to cover new Python scripts
>   docs: kerneldoc.py: simplify exception handling logic
>   scripts: kernel-doc: prevent a KeyError when checking output
> 
>  Documentation/sphinx/kerneldoc.py | 108 +++++++++++++-----------------
>  MAINTAINERS                       |   5 +-
>  scripts/lib/kdoc/kdoc_files.py    |   4 ++
>  3 files changed, 53 insertions(+), 64 deletions(-)
> 


