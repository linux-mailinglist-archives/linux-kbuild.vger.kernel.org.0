Return-Path: <linux-kbuild+bounces-10039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7FCB17C0
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 01:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88188302866B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 00:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468F6199385;
	Wed, 10 Dec 2025 00:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IX20C6Nd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8B77260F;
	Wed, 10 Dec 2025 00:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326529; cv=none; b=RHA5f2UWnQJZBWopQDiL2rAa9sSfh9HBWbpvJzHvbgleTLvVsedJCGjLKQ1ZzF4/0lx0GLNY9j1L3MITNLKDJqU+VyGS1T54MfZ0bPu9iztnlymhyCzgQUADPOK7AFhoLJ8kGBdWz4o+WAcWsKn+eJ8muWWjapynuuroyFiU4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326529; c=relaxed/simple;
	bh=k+3/C1s1DKKJnGuLzDKigusspipj91iCUM411FA/pdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ1jDmijZj7EquLaXHH+jMIRk4iukEyhZO95tWErySarjMNEHvhvSw/za7cqgECYsr9dHvA1zNJbInjeUywCWObD1lKu5TWElpzySUXlsX6bePUiab7380Sl01iM/BgemRrhdNlylfy4oF2bcMYeQjYYZ9VSm/1YiYqG5Vt5G1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IX20C6Nd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE8AC4CEF5;
	Wed, 10 Dec 2025 00:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326527;
	bh=k+3/C1s1DKKJnGuLzDKigusspipj91iCUM411FA/pdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IX20C6NdM8/HAkgb/9bw0uWnlJni+OhJeOWgUXZIzaInQJU/uLY/hRUtkd1vacCng
	 uBYPRgBOrMyvG9M22V/cydjl69mqv/FMhCTGQA00Xz62ci3su0T+etmNcd5rXGEeTw
	 j2y4oaPXFfLJtqdHEy8eT9OAcSCcMuLPOui5JesWh28dF9OfbrffF9znu51sxTJV5A
	 7vGQ4h3p+zXmlQ1z2dygmWns7DGJlqMRQLOZKiqZXCR4MqzhFpbpK6Lu4Q1l6C5Kby
	 6TOwT6RfM08201jfcR1McIhZ9YH5dCr8GQZmsOil5V3T+8Nj+ZUG6cxXjrerlQNCYc
	 LJV9+xuNRTbEA==
Date: Wed, 10 Dec 2025 09:28:43 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix modules.builtin.modinfo being executable
Message-ID: <20251210002843.GA597239@ax162>
References: <20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de>

On Tue, Dec 09, 2025 at 04:59:45PM +0100, Fabian Pfitzner wrote:
> Since commit a26a6c93edfe ("kbuild: Strip trailing padding bytes from
> modules.builtin.modinfo") the resulting modules.builtin.modinfo file gets
> copied by objcopy resulting in an executable file.

objcopy has been used to generate modules.builtin.modinfo since its
introduction in commit 898490c010b5 ("moduleparam: Save information
about built-in modules in separate file"). This would seem to indicate
some issue with the sed command in that change if it is indeed the
culprit of introducing this behavior? Or is there something else going
on here?

> It seems, that objcopy detects this file as executable even though
> the file is not executable at all.

This section comes from vmlinux.unstripped, which is executable, perhaps
that is related?

> This problem arises on x86_64 and arm-v7a, but for some reason does not
> happen on aarch64.

This file is executable for me on an aarch64 machine:

  $ uname -m
  aarch64

  $ ls -al /usr/lib/modules/6.18.0-next-20251205-00002-g8e6af29eba24/modules.builtin.modinfo
  .rwxr-xr-x@ 197k root  5 Dec 09:39 /usr/lib/modules/6.18.0-next-20251205-00002-g8e6af29eba24/modules.builtin.modinfo

> Fix this problem by removing the execution bit afterwards.

This seems obviously correct since there is no reason for this file to
be executable but does this result in any other problems?

> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> ---
>  scripts/Makefile.vmlinux | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index cd788cac9d91dadcf4e83a39142f9d7bc61ffed0..7ee6aad760495ac5357132954c32ff879d24f72e 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -113,6 +113,7 @@ vmlinux: vmlinux.unstripped FORCE
>  # what kmod expects to parse.
>  quiet_cmd_modules_builtin_modinfo = GEN     $@
>        cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> +                                    chmod -x $@; \
>                                      sed -i 's/\x00\+$$/\x00/g' $@
>  
>  OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> 
> ---
> base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
> change-id: 20251209-modinfo-executable-2d2af74150c0
> 
> Best regards,
> -- 
> Fabian Pfitzner <f.pfitzner@pengutronix.de>
> 

