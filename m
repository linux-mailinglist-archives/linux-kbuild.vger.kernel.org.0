Return-Path: <linux-kbuild+bounces-6993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F1AADDFD
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10A027BC9FC
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D972580D7;
	Wed,  7 May 2025 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DIzxHI8e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1068623;
	Wed,  7 May 2025 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619377; cv=none; b=FHV+vBTV9L83d7sSv7dNtaAY+ehRWy3nyulMQhUzQeHR3vNedDSlJ0E1lZnoOLrnhFpABGrQtzowCjTPS3gXdg87JcUWa8gK4QYYhmmd1YcPM/RpvLnFvrB/cyQo3kuma2wDtVhug7tSZUwauMLInO0erat+6alaPU39qrR5r4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619377; c=relaxed/simple;
	bh=RP5a2DXYCc4NkXftdYvHqTpKJQbNZ20V9GPvzZyBXLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1ZXtwnG2KyTfg2JL08hApQqg1xAGYXTwcn+qldzNei5cpNOVlUc/idvmBTa8USYBchTRSfxlh48IK49FTYFpPQpSYarel0hX4l9rUjMS1uPkpL9MRYb+cNKv6sRdGqA0JIh/Dr6UoIR+UzCMfRRxabNv2r4ACqVMtEORjcvXdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DIzxHI8e; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 7 May 2025 14:02:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746619372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lHpBgnMWGjdZKdQrg4rQ9wQFeDbCjxDr7o/BymUk+1Y=;
	b=DIzxHI8e+tNQs5EzOib3d/NvXOcIOCYvnv5u2uU6y2k2vJQ7QVKcw5MbVhMxdIr29E1/D0
	aKuDWXfz5kVpcquPcCsxUob8d4zaG+G9K2pt8xE40Lqmtf/uEXOtfbmCGNCsluP/iGxPtd
	TZt0a5EbRPl3pKVBDmfitITi2NVODcU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/3] Detect changed compiler dependencies for full
 rebuild
Message-ID: <20250507-mature-idealistic-toad-59c15f@l-nschier-aarch64>
References: <20250503184001.make.594-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503184001.make.594-kees@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Sat, 03 May 2025, Kees Cook wrote:

>  v3: move to include/generated, add touch helper
>  v2: https://lore.kernel.org/lkml/20250502224512.it.706-kees@kernel.org/
>  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org/
> 
> Hi,
> 
> This is my attempt to introduce dependencies that track the various
> compiler behaviors that may globally change the build that aren't
> represented by either compiler flags nor the compiler version
> (CC_VERSION_TEXT). Namely, this is to detect when the contents of a
> file the compiler uses changes. We have 3 such situations currently in
> the tree:
> 
> - If any of the GCC plugins change, we need to rebuild everything that
>   was built with them, as they may have changed their behavior and those
>   behaviors may need to be synchronized across all translation units.
>   (The most obvious of these is the randstruct GCC plugin, but is true
>   for most of them.)
> 
> - If the randstruct seed itself changes (whether for GCC plugins or
>   Clang), the entire tree needs to be rebuilt since the randomization of
>   structures may change between compilation units if not.
> 
> - If the integer-wrap-ignore.scl file for Clang's integer wrapping
>   sanitizer changes, a full rebuild is needed as the coverage for wrapping
>   types may have changed, once again cause behavior differences between
>   compilation units.

I am unsure if it is too much detail, but I'd like to see some of these 
infos in include/linux/compiler-version.h, too.

Kind regards,
Nicolas

