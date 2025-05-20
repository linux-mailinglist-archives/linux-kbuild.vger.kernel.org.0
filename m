Return-Path: <linux-kbuild+bounces-7162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C3ABD0E9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 09:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A5621891D78
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 07:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E23720E6E2;
	Tue, 20 May 2025 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fc1jYQZ+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A061DF75A;
	Tue, 20 May 2025 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727445; cv=none; b=sGYFkRhJ/QpjO7xh9BQt6MfxjkETyXjnPbSZ2FcEW/wCOy5baFP1vwRt/Ku/8XKV2uP24ad4O92RD+qgWIXrFanWEARKHBz3UUpOA35uMARKe78wuPiBfry/cUi2UT8/PSlUTJjROI5CsShFyIcq02TLPImPhe0EhTA6tAgrgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727445; c=relaxed/simple;
	bh=MY+OANI6tcNU38qQS3qyu6sNwLYVuil6JB3y5EnwBqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q52LKlDnXFaILQvVcj6g15/SFSYMCxM7f3aKO5dqXFnt1ntQ8HtrfN1w7ZIvBE/gT/1MFMi2VqpwVDG8EWLu9DwTFaApXqM/ywobWh3qJmUJi8fBJ0P+lpv3eoAFowo52cT+1szku3mmPK3cmzYH57SmOXxpZp9fupLQbU7/xcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fc1jYQZ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6FDC4CEE9;
	Tue, 20 May 2025 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747727444;
	bh=MY+OANI6tcNU38qQS3qyu6sNwLYVuil6JB3y5EnwBqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fc1jYQZ+h8gkr1CZZKSNjpxmsLh1E4J+gsA3BTdus8qKHERXEb94t+5wt8/dH2Mdb
	 HvoAtsQiLCzkmNgmVueDMTyz40ThMAADEA+Mptot1MAiJnJbJ9ybeIiOH8o3HjSRf3
	 y1nJzZXikQUSaFf3UtdgLGkoPVENkPBuIOOUGbB/RiI5ZY/7N/k1Pmw9CU6uPiJ2A+
	 9SQa2dfKCRS5xBCKMxSqxxOLZ8vCpG0tMr5C5w5U4dP7+oVQRPHxOWxNjkM0p0iGSn
	 YCyIvdm1LFzsMgzuvkfeeXntIyxnw19BqQfBsEQ8J7XL2OcBQ9qkloBSv3+fr34A3b
	 JKXgbx+yXgT9A==
Date: Tue, 20 May 2025 09:50:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
Message-ID: <20250520095037.3dc39685@sal.lan>
In-Reply-To: <7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
	<6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
	<7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Randy,

Em Mon, 19 May 2025 22:55:08 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 5/19/25 10:47 PM, Mauro Carvalho Chehab wrote:
> > Unfortunately, currently Sphinx logger is suppressing too much, not
> > allowing warnings to be displayed. Disable it.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> On linux-next-20250516, this gives me:
> 
> Cannot find file ../drivers/gpio/gpiolib-acpi.c
> Cannot find file ../drivers/gpio/gpiolib-acpi.c
> ...
> Sphinx parallel build error!
> 
> Versions
> ========
> 
> * Platform:         linux; (Linux-6.14.4-1-default-x86_64-with-glibc2.41)
> * Python version:   3.13.3 (CPython)
> * Sphinx version:   8.2.3
> * Docutils version: 0.21.2
> * Jinja2 version:   3.1.6
> * Pygments version: 2.19.1
> 
> Last Messages
> =============
> 
> 
>     reading sources... [ 75%]
>     translations/it_IT/subsystem-apis .. translations/zh_CN/admin-guide/mm/damon/reclaim
> 
>     reading sources... [ 77%]
>     translations/zh_CN/admin-guide/mm/damon/start .. translations/zh_CN/core-api/symbol-namespaces
> 
>     reading sources... [ 79%]
>     translations/zh_CN/core-api/this_cpu_ops .. translations/zh_CN/kernel-hacking/index
> 
> Loaded Extensions
> =================
> 
> * sphinx.ext.mathjax (8.2.3)
> * alabaster (1.0.0)
> * sphinxcontrib.applehelp (2.0.0)
> * sphinxcontrib.devhelp (1.0.6)
> * sphinxcontrib.htmlhelp (2.1.0)
> * sphinxcontrib.serializinghtml (1.1.10)
> * sphinxcontrib.qthelp (2.0.0)
> * kerneldoc (1.0)
> * rstFlatTable (1.0)
> * kernel_include (1.0)
> * kfigure (1.0.0)
> * sphinx.ext.ifconfig (8.2.3)
> * automarkup (unknown version)
> * maintainers_include (1.0)
> * sphinx.ext.autosectionlabel (8.2.3)
> * kernel_abi (1.0)
> * kernel_feat (1.0)
> * translations (unknown version)
> 
> Traceback
> =========
> 
>       File "/usr/lib/python3.13/site-packages/sphinx/util/parallel.py", line 137, in _join_one
>         raise SphinxParallelError(*result)
>     sphinx.errors.SphinxParallelError: KeyError: '../drivers/gpio/gpiolib-acpi.c'
> 
> and then it's finished (not a normal finish).
> So IMHO this patch is not sufficient.

Well, on next-20250516:

	$ ls drivers/gpio/gpiolib-acpi.c
	ls: cannot access 'drivers/gpio/gpiolib-acpi.c': No such file or directory

Avoiding the script to abort is a matter of adding a try/except
block at kerneldoc.py, but I'd say that, if an include file (or any other
file needed for the build) is not found, "make" should abort anyway for
the affected target (Kernel compilation or when doc building).

The only thing that bothers me is the "Sphinx parallel build error!"
message. I'll check if there is a way to suppress it.

Regards,
Mauro

