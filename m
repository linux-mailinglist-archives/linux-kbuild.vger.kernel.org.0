Return-Path: <linux-kbuild+bounces-9386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A2C2DC3F
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 19:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A4C3AAE4D
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 18:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35892356C6;
	Mon,  3 Nov 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fw1RZDIC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE63A218AB9
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196173; cv=none; b=aQwkDnGnqxV6j/oxcUKJrTtm4idCmBkqbCmZFwLeSaNHUM67LDszwvH72WMnxzRrg5oPCy1lDMdeCYW7AbubGR3l+05SAFFw01wmMbUqY6Tn4TT9SQVQuByWCU6k+2UkWzVzytplp2owHDLETGB86r9oTxma4AocN/V/STWNfr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196173; c=relaxed/simple;
	bh=ecgjKAQVyq2Q06Esle+EyB5KPHIbr12Fjw5saQVQ4pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqj1U8bkElSSu6JVHt6G2alsV1kYfIi9LcYXiA6AJV8M0bSaAHdGib+Wyc3YbY88B5dcOblNOutpUbmBlwxPMB14s9J8a66d+r8tGjy1xpWFqMBDJgo9n6bILRZvvZ1+StyR8NtTxNL4wNToQbMHfk8/2j6da2zLX6kLZHCuPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fw1RZDIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ECFC4CEE7;
	Mon,  3 Nov 2025 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762196173;
	bh=ecgjKAQVyq2Q06Esle+EyB5KPHIbr12Fjw5saQVQ4pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw1RZDIC+E7cl0pf/zlrE52F3mlfnz9R1YGx4PRc2gXCJhCkXqyUxkXXh5hS6NPuc
	 7xZgxicyvsF0FMpMc81OMLw0IzFxywxLqZaFhv13F8AvEpVq35rogxG5IFE0H/EsdZ
	 TnCOc8fso2eDRF3s8UvKoKYqudfPWr5XgYqarIWMlh6cgtasKqttlX1Hjf78V2JAMJ
	 DhKqR/YrI/haBwHhaTe5ONBktn6PD9oTtOdvXWmOsp4GrWlbSU696CqWUlIfrzk7br
	 Q/vuj7dzjxeYMi1PEyjvRYofKEjIBwrGzZ/rmcEoF2Mtq25Gpvt36WICdy7F39o8fu
	 CVa9PaZcuLDbw==
Date: Mon, 3 Nov 2025 11:56:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251103185609.GB672460@ax162>
References: <20251103131419.5e504ae2@endymion>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103131419.5e504ae2@endymion>

On Mon, Nov 03, 2025 at 01:14:19PM +0100, Jean Delvare wrote:
> It is possible to force a specific version of python to be used when
> building the kernel by passing PYTHON3= on the make command line.
> However kernel-doc.py is currently called with python3 hard-coded and
> thus ignores this setting.
> 
> Use PYTHON3 to call kernel-doc.py so that the desired version of
> python is used.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

I see one use of KERNELDOC in tools/docs/sphinx-build-wrapper that would
appear to break with this change? Does it matter? I am not familiar with
the docs build. Otherwise, this seems like the correct thing to do.

> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-6.17.orig/Makefile
> +++ linux-6.17/Makefile
> @@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
>  
>  # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
>  # has a logic to call it
> -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> +KERNELDOC       = $(PYTHON3) $(srctree)/scripts/kernel-doc.py
>  export KERNELDOC
>  
>  KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support

