Return-Path: <linux-kbuild+bounces-7161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21C3ABCED0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 07:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EABA8A21F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 05:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDEF25B1C4;
	Tue, 20 May 2025 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="THsUVFOp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CFE219EB;
	Tue, 20 May 2025 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720527; cv=none; b=WRE61v0napP5ablh+HilTnfufdZUaMKQZcY7lR93f7jLXQIKV4Kz0F9wA6iKW2/Ge6dR0rrUYUWYuYmCf6aBlYnb4KqTp6ju7E3jSiT7bwR5qj/7zNQBMGSP/SGgQHtUOqlIQ41EFTtDR3DYQlofjf52YpX6mPYJ9SdOxw1Olbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720527; c=relaxed/simple;
	bh=cGIn3qHXnle+3jgkZIqozPePbjDhxWkDmHZAEgmF2ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsawCJKTAiuJsMkwOeXTCGHN9sCfv+fdaneQmj5jILo9+L7tddJNgNuMEUnvm2c2Mp2A8dZTIS6YfOz/c4oNH/vZh6hnN+RGR0PB/+IOwNcUiywfm7KKPH6ti9hdFPO1Au4VBfXuJ2y6CVGJWBAq1TMO92r3XOkWdoUIomcCuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=THsUVFOp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=hccT3TY5UMXEmSUaxvLn9gYt/Wr/YPcFRSlv30rNAdU=; b=THsUVFOp8fycCIJ6Yj6g6nXsWv
	oWvl+/8alSDG06uRlnZFR3a5ARFG13o3OupoArZcBsbGCJbGJH3rhEEa29on1hRokRfHXR5Ugrlo3
	8eNPG+ztb/VnyM0dJc1E1dmn38nHhOOnreH9dN/S18CZDdXWS8AfkYnAITABy2X8wY96THkV7/FUc
	fSWL2nOCAqol4MjqYg3dssVXowDs1cQZWIWxWLaEjDw4u/Hd8mcTfXXbMdzaXM9qaQ7RmNdE4Olk0
	VJDIwJ3JebVz2GOHFwhxjjvHDX7UI7jXx/3/NBBzcwr/9J7nPimnqKUis1twjDZG03ShfDJRpksCp
	c2oN01Iw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFwV-00000002t88-13OC;
	Tue, 20 May 2025 05:55:11 +0000
Message-ID: <7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
Date: Mon, 19 May 2025 22:55:08 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Akira Yokosawa <akiyks@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
 <6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/19/25 10:47 PM, Mauro Carvalho Chehab wrote:
> Unfortunately, currently Sphinx logger is suppressing too much, not
> allowing warnings to be displayed. Disable it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On linux-next-20250516, this gives me:

Cannot find file ../drivers/gpio/gpiolib-acpi.c
Cannot find file ../drivers/gpio/gpiolib-acpi.c
...
Sphinx parallel build error!

Versions
========

* Platform:         linux; (Linux-6.14.4-1-default-x86_64-with-glibc2.41)
* Python version:   3.13.3 (CPython)
* Sphinx version:   8.2.3
* Docutils version: 0.21.2
* Jinja2 version:   3.1.6
* Pygments version: 2.19.1

Last Messages
=============


    reading sources... [ 75%]
    translations/it_IT/subsystem-apis .. translations/zh_CN/admin-guide/mm/damon/reclaim

    reading sources... [ 77%]
    translations/zh_CN/admin-guide/mm/damon/start .. translations/zh_CN/core-api/symbol-namespaces

    reading sources... [ 79%]
    translations/zh_CN/core-api/this_cpu_ops .. translations/zh_CN/kernel-hacking/index

Loaded Extensions
=================

* sphinx.ext.mathjax (8.2.3)
* alabaster (1.0.0)
* sphinxcontrib.applehelp (2.0.0)
* sphinxcontrib.devhelp (1.0.6)
* sphinxcontrib.htmlhelp (2.1.0)
* sphinxcontrib.serializinghtml (1.1.10)
* sphinxcontrib.qthelp (2.0.0)
* kerneldoc (1.0)
* rstFlatTable (1.0)
* kernel_include (1.0)
* kfigure (1.0.0)
* sphinx.ext.ifconfig (8.2.3)
* automarkup (unknown version)
* maintainers_include (1.0)
* sphinx.ext.autosectionlabel (8.2.3)
* kernel_abi (1.0)
* kernel_feat (1.0)
* translations (unknown version)

Traceback
=========

      File "/usr/lib/python3.13/site-packages/sphinx/util/parallel.py", line 137, in _join_one
        raise SphinxParallelError(*result)
    sphinx.errors.SphinxParallelError: KeyError: '../drivers/gpio/gpiolib-acpi.c'

and then it's finished (not a normal finish).
So IMHO this patch is not sufficient.


> ---
>  Documentation/sphinx/kerneldoc.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index b713a2c4a615..314479718a01 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -311,7 +311,11 @@ def setup_kfiles(app):
>      if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
>          print("Using Python kernel-doc")
>          out_style = RestFormat()
> -        kfiles = KernelFiles(out_style=out_style, logger=logger)
> +
> +        # Ideally, we should be using Sphinx logger here, but its filtering
> +        # rules ending filtering out warnings and errors. So, let's use
> +        # Python default logger instead.
> +        kfiles = KernelFiles(out_style=out_style)
>      else:
>          print(f"Using {kerneldoc_bin}")
>  

-- 
~Randy


