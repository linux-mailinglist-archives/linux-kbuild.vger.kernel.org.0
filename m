Return-Path: <linux-kbuild+bounces-2398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAF3928C7D
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 18:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D947C284948
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 16:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E1116CD00;
	Fri,  5 Jul 2024 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW0tPlR+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D713A88B;
	Fri,  5 Jul 2024 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720198344; cv=none; b=L1cMvHVWgumtaiUsqf7dtqvU7gsUqsoIOSvKvMin3NtLDL+S30SG5R1FqChvLb/57Uy2vixHCRGJ1CjSZbF9av0/pgWuT3zD8koa9vyRBxd0gIrCq4h5V5vthgsa9Nsn5y+QO4qQ0+2TyGizIq9uGLkeYnYHirtjy79EdGKOCkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720198344; c=relaxed/simple;
	bh=U+TV3vLj/FyrjVFqViUNzlZIdGi+09fonAZB5klvcWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2y5ucVHz66uY9aZ4725kJUAMYDg3QM/VfnKZ3HIK7AUgJh4NctiVE0W/GvCdoYQEVCttYc8FWuomKKJ2DAMzx4+SCQGr9cFJo0FRhjE5umvug8VMnYKwNSdo9/7gZnd7hOC4OqXAWRPMkK9LaP5jKjYMlubfTkAdoXl14lApDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW0tPlR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71914C116B1;
	Fri,  5 Jul 2024 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720198343;
	bh=U+TV3vLj/FyrjVFqViUNzlZIdGi+09fonAZB5klvcWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW0tPlR+1AYOyf1sdQNoZMIvQfZRxAYrlvITUWwS6UxP5flpYQzofefp5qZlsfqMo
	 O56fr0u8QpAQQNfBhzp3cOWeV4GR/kBAVmGExyY9fXhXwxPNxrHo+GDShvaKz8f7xz
	 EnxzAAmR/496R0NqvELi2T52cExMOJQgbhheQ47IAO44Y0Q0XOHs1nkw7uYR6R3EXc
	 0+dfZtjpxjyYSkBiYaNGMW9jauyNhv/uEcRGz7DJ6ffZXyTkQ5W2BJcJCN54DYUUk5
	 BnOt/ksxB3VAeuUMFZdXgA8NzSk77dkIzaAycFFq+8DcwXRI6Wm2c8ILYY4gfRx+2g
	 Dgy0yFhexb/GA==
Date: Fri, 5 Jul 2024 09:52:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH 1/3] kbuild: raise the minimum GNU Make requirement to 4.0
Message-ID: <20240705165221.GA987634@thelio-3990X>
References: <20240704134812.1511315-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704134812.1511315-1-masahiroy@kernel.org>

On Thu, Jul 04, 2024 at 10:47:55PM +0900, Masahiro Yamada wrote:
> RHEL/CentOS 7, popular distributions that install GNU Make 3.82, reached
> EOM/EOL on June 30, 2024. While you may get extended support, it is a
> good time to raise the minimum GNU Make version.
> 
> The new requirement, GNU Make 4.0, was released in October, 2013.

Seems reasonable. If someone gets bit by this, I think they can just
build make from scratch if they really need to keep building on this
distribution.

> I did not touch the Makefiles under tools/ because I do not know the
> requirements for building tools. I do not find any GNU Make version
> checks under tools/.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Documentation/process/changes.rst |  4 ++--
>  Makefile                          | 22 +++-------------------
>  scripts/Kbuild.include            |  2 +-
>  3 files changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 5685d7bfe4d0..415ac8eeb46c 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -33,7 +33,7 @@ GNU C                  5.1              gcc --version
>  Clang/LLVM (optional)  13.0.1           clang --version
>  Rust (optional)        1.78.0           rustc --version
>  bindgen (optional)     0.65.1           bindgen --version
> -GNU make               3.82             make --version
> +GNU make               4.0              make --version
>  bash                   4.2              bash --version
>  binutils               2.25             ld -v
>  flex                   2.5.35           flex --version
> @@ -111,7 +111,7 @@ It depends on ``libclang``.
>  Make
>  ----
>  
> -You will need GNU make 3.82 or later to build the kernel.
> +You will need GNU make 4.0 or later to build the kernel.
>  
>  Bash
>  ----
> diff --git a/Makefile b/Makefile
> index 06aa6402b385..c90d408c825e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -11,8 +11,8 @@ NAME = Baby Opossum Posse
>  # Comments in this file are targeted only to the developer, do not
>  # expect to learn how to build the kernel reading this file.
>  
> -ifeq ($(filter undefine,$(.FEATURES)),)
> -$(error GNU Make >= 3.82 is required. Your Make version is $(MAKE_VERSION))
> +ifeq ($(filter output-sync,$(.FEATURES)),)
> +$(error GNU Make >= 4.0 is required. Your Make version is $(MAKE_VERSION))
>  endif
>  
>  $(if $(filter __%, $(MAKECMDGOALS)), \
> @@ -93,15 +93,7 @@ endif
>  
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
> -# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> -
> -ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> -short-opts := $(firstword -$(MAKEFLAGS))
> -else
> -short-opts := $(filter-out --%,$(MAKEFLAGS))
> -endif
> -
> -ifneq ($(findstring s,$(short-opts)),)
> +ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)
>  quiet=silent_
>  override KBUILD_VERBOSE :=
>  endif
> @@ -201,14 +193,6 @@ ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
>  $(error source directory cannot contain spaces or colons)
>  endif
>  
> -ifneq ($(filter 3.%,$(MAKE_VERSION)),)
> -# 'MAKEFLAGS += -rR' does not immediately become effective for GNU Make 3.x
> -# We need to invoke sub-make to avoid implicit rules in the top Makefile.
> -need-sub-make := 1
> -# Cancel implicit rules for this Makefile.
> -$(this-makefile): ;
> -endif
> -
>  export sub_make_done := 1
>  
>  endif # sub_make_done
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index faf37bafa3f8..ed8a7493524b 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -68,7 +68,7 @@ kbuild-file = $(or $(wildcard $(src)/Kbuild),$(src)/Makefile)
>  # Read a file, replacing newlines with spaces
>  #
>  # Make 4.2 or later can read a file by using its builtin function.
> -ifneq ($(filter-out 3.% 4.0 4.1, $(MAKE_VERSION)),)
> +ifneq ($(filter-out 4.0 4.1, $(MAKE_VERSION)),)
>  read-file = $(subst $(newline),$(space),$(file < $1))
>  else
>  read-file = $(shell cat $1 2>/dev/null)
> -- 
> 2.43.0
> 

