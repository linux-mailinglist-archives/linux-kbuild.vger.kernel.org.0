Return-Path: <linux-kbuild+bounces-7157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD0FABCE9B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 07:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9A23A3405
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 05:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D5E2571D8;
	Tue, 20 May 2025 05:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7CFES0W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE5BE49;
	Tue, 20 May 2025 05:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718881; cv=none; b=hMEdqgIKc6IFzRifm+Bbi7MX8SFO8y270wm9z+poNWvMi1N5W0dDXSnSQ8q7OiuLw1IRWHrEASwQdOrhxmRlrVsdZfNYJ35QF/zevLlIQ7AgdTBDD+ad/4M+AJER44CUU/mr7XG/6RNT7Mths9wstJSykbIKRxj1wTwtJrB/v8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718881; c=relaxed/simple;
	bh=fjU7eHOpFbWozBHG2+7uIYALD+UBvajS8eM7dABToY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eg4SF/djx9QRsCI94peLAhNccgt3qA4rNxzls8O4oqhD0zDBl9YiTvYgRnsw88QErygEqfIzc+VMPdHrCBqp8dLuQ2Mc4QPOPjS365xtOUH6IZeAe+oU823LJP5/6zC6nR3X1RrpUdvWcyzUbGKJEsAfqoO/C5d0DmZzJpqF444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7CFES0W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D622DC4CEE9;
	Tue, 20 May 2025 05:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747718881;
	bh=fjU7eHOpFbWozBHG2+7uIYALD+UBvajS8eM7dABToY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h7CFES0WmupxLXhItzZrDa7TKBZ9wMvyb804EDGIEvXXzLcnTrx+BGHIHIJHM/oxF
	 f98xMjRCSKxzJdYlX+MSsxob9iric7D2l95DQZYY3XLeC5ELb/1fg8ad9cxFL3Rdm6
	 OaSjqTRZGs48l9pilQUVNqacQBEvpO+Xdrb+770cGQLmjU2WNQ1kdxRbF//BsQlitV
	 Y+GCjb9ATCYUkXsiwBa6iXmU5dBMcwJ3mMXD2Fpqb3mz3dEx2H+aeIGt4pYqhKC2sG
	 xxR5CMR3+dHfNotrenCq7NEU4IlCs1UbaOf5r7XrXym1/r03BZ102O0QQpbClRrZJp
	 wigJDH/ZmZdIg==
Date: Tue, 20 May 2025 07:27:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Makefile: Get back to kernel-doc.pl as KERNELDOC
 default
Message-ID: <20250520072755.2d72cf5c@foz.lan>
In-Reply-To: <d9d0ff79-a243-456e-a7ed-eaca69d2eca7@gmail.com>
References: <d9d0ff79-a243-456e-a7ed-eaca69d2eca7@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 20 May 2025 09:08:51 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Recent conversion of kernel-doc into python has resulted in a couple of
> glitches in "make htmldocs" [1, 2, 3].
> 
> This is because the python version has not gone through extensive tests
> such as fault-injection of erroneous kernel-doc comments and/or
> kernel-doc:: directives.
> 
> Python kernel-doc as it is does not meet the usual expectation of
> backward-compatibility with its perl predecessor.
> 
> Get back to the perl version as KENRELDOC default for now.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/20250508182504.418552ef@canb.auug.org.au/ [1]
> Link: https://lore.kernel.org/20250516193436.09bdf8cc@canb.auug.org.au/ [2]
> Link: https://lore.kernel.org/20250516200350.63be46cd@canb.auug.org.au/ [3]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> This one-liner is just a workaround, hence no Fixes: or Closes: tags.
> 
> Jon, it looks like we are running out of time for the upcoming merge window.
> Let's take another development cycle for stabilizing kernel-doc in python.
> 
> Additional notes on glitches reported so far.
> 
> * Depending on the version of Sphinx, the crashing message can be useless
>   for finding out what is going on [1, 2].
>   With up-to-date Sphinx, the message even suggests a *bug* somewhere in
>   Sphinx and includes a traceback to be reported as an issue at upstream
>   Sphinx [4].
> 
> * The python version of kernel-doc fails to produce warnings on innocuous
>   issues under Sphinx runs [3], which have been available with the perl
>   version.
> 
> [4]: https://lore.kernel.org/879b49f5-7350-48e8-a84e-2c580a5b0ca8@gmail.com/
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 2a05988740a9..c2c9f5af4986 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
>  
>  # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
>  # has a logic to call it
> -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> +KERNELDOC       = $(srctree)/scripts/kernel-doc.pl

If I understood well, the only issue is with regards to Sphinx
hiding logs. If that's the case, better to apply instead just
the single-line change to make kerneldoc.py extension to not
use Sphinx own logger filters.

Thanks,
Mauro

---

[PATCH] docs: kerneldoc.py: don't use Sphinx logger

Unfortunately, currently Sphinx logger is suppressing too much, not
allowing warnings to be displayed. Disable it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index b713a2c4a615..687121300291 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -311,7 +311,7 @@ def setup_kfiles(app):
     if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
         print("Using Python kernel-doc")
         out_style = RestFormat()
-        kfiles = KernelFiles(out_style=out_style, logger=logger)
+        kfiles = KernelFiles(out_style=out_style)
     else:
         print(f"Using {kerneldoc_bin}")
 



