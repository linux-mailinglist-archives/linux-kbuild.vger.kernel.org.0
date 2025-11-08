Return-Path: <linux-kbuild+bounces-9459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 425EFC42BE6
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 12:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC21734997C
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 11:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123A6209F5A;
	Sat,  8 Nov 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOGF5M0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10C61FBC8E
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762601469; cv=none; b=Ny5Hg2ldCet0U5vDc0dYFGXyRR3TPbJgTLdG58gVzmDdv9rpjAGDKqRM3Xgd0Xh1LqHZ7C5/MXkEYiGsOgAyqFQH4q7oGwWdZzp4zj76Sjf069jguF/+scBmRrtIkmnE2w1zWTXTuAUqiuYEkrmXyq43KVvsaHf3P3n6Fdp2Gwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762601469; c=relaxed/simple;
	bh=pv9u/ERe5H1KfJiuB0O5cY7cauH+qxt598dIjMYV5a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLkS/pK7esM8McR0wZfRjtjI1THTs/DiR72LUTLbI+L/fkAyff5+srJRV0COSupZ7fnY8S4mgF/VfdhzgMSxfNrveqTgpWqUVm5St1hzL8Nmfg0qIBk1qA9pDOpZX25++EVJAs9rzq70qVUtLQPnKDBnYf+0INVNM8zKjUWyXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOGF5M0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA940C4CEF7;
	Sat,  8 Nov 2025 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762601469;
	bh=pv9u/ERe5H1KfJiuB0O5cY7cauH+qxt598dIjMYV5a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOGF5M0hobUuwJBw/paHZUf+ZahaCOgl4ooaAME0lpy1mQ2/PytZodDhXl8X2BZoH
	 XrY9e8M0CqrI1snTFvq9wWD1APTI3XAuatoKmquLeVIqGPCjXyJTgI4mlChPw1K3X/
	 +yKwszZhqns51Cl6TZXBBMYSxMjMImyMUCJtoCvOYeK4FLOhdbNFbTzAwWqCDm5GeT
	 Z6g28tYQFvHfcpCGoQOEDwXlSAWOKvz6TxTuwRSj5HOXaPt8ezbr71Opc9Bf9Rtrl5
	 pwetbJjsCIzJmcakemMqSok8dDYxMGX1JF8b0UdgYp/zaWQqZqWrkFeqfzr2Lt2vsi
	 VxjfQSlNbLijg==
Date: Sat, 8 Nov 2025 12:20:35 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <aQ8ng6lp2jxfr6bw@derry.ads.avm.de>
References: <20251107192933.2bfe9e57@endymion>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107192933.2bfe9e57@endymion>

On Fri, Nov 07, 2025 at 07:29:33PM +0100, Jean Delvare wrote:
> It is possible to force a specific version of python to be used when
> building the kernel by passing PYTHON3= on the make command line.
> However kernel-doc.py is currently called with python3 hard-coded and
> thus ignores this setting.
> 
> Use $(PYTHON3) to run $(KERNELDOC) so that the desired version of
> python is used.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> Changes in v2:
>  * Leave KERNELDOC alone and patch the calling sites instead.
> 
>  drivers/gpu/drm/Makefile      |    2 +-
>  drivers/gpu/drm/i915/Makefile |    2 +-
>  include/drm/Makefile          |    2 +-
>  scripts/Makefile.build        |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Thanks.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

