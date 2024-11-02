Return-Path: <linux-kbuild+bounces-4480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EA49BA27B
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D986B21E6A
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC421AB6F8;
	Sat,  2 Nov 2024 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="IShHWLwU";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="H2E0Zi3e";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="V46Jvjlf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795F14AD3F
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581729; cv=none; b=QG4oFGwTDzygZ/lHRmyP5zXnWvkiiLc/bWNMc2GdHh2BvFKstEFc+wKiIFMv3PkpKO9htXg35hPiBASjJcWnaCPU7uMO5cx0N5joqaxstvrQ3juw4OsuxHXqgSHRPyvjao98jCMolOnxi+gWiJuyrb0n8swJ2BApEPfwb1BNpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581729; c=relaxed/simple;
	bh=S6N9ZGM2cfU20hr9WOcviqXD5oXVjBqaHStnNBvwVnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz3Zg5eXFVwtEb2B8yIamK3PcVB915ro10XCJsSdykwxjYdPIsGDA1n2/YO4eDzSej1bW3ccpUrgNBAGOC+bu2sw4E3C1H/Sca1ZDYRn1RRnyab910bA2YS7HW6Nt5pEHhFyFpp1cZKbczlGsNWvTEzQZXoXI1yHMbk+kms9ojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=IShHWLwU reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=H2E0Zi3e; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=V46Jvjlf; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582624; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=HLrkWZmy37z2+q6UvAJjqEXBZQvEVug9IkxNqJcixI8=; b=IShHWLwUZpx0n78l/Dzz8Ls/e2
	KtNwfFIUiFb+GDggEapCpo7Wobt4a0dN5N1jg9y4pDn3jmi3InRaE+xvLUZJiWy9NWQxige6R5Wyc
	49hzwqXMhOMC3ZjcGPc4TI4eXPN9nzea+8MNQkTbT7tQsPVE373tswyQr5DrgV/onpVuevaJgYCug
	ceKvAbQX0v3ir/krx89CSqFaFgMladnrIxp/Fks1O79+UE3fFUiYg1WAW31XCCm7WCWwjC9tY4DMx
	KwQpGB2hXcSl/YBB0+s+E0kLY83LRUelv4PhT9Pldlz/46lBpP2UFLeA5dGG1ajc+o84qOkrsVNV0
	P/g6HG/A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581724; h=from : subject :
 to : message-id : date;
 bh=HLrkWZmy37z2+q6UvAJjqEXBZQvEVug9IkxNqJcixI8=;
 b=H2E0Zi3e66yE0rFT9OU2I/uypVcW98kq7MinZOQLw+6sngjyL/z1bmaGik+gZxueWrq0J
 N3TL5ifd2y3g6+lCFBz0d5finniBfRF8tfE3uf8QzAdy1ND9PhBTdks3qpBG9hbieXBXpC2
 XopR2wgS0VWYbps7l8pKU98hDLej01gXE1slFZWs81dH8vD4gkc+6QHYq+THU+5uamiTufB
 dvj0jpuOBSk2WrivPDN0fo4yC0HQVLbrdiqwI0oZkTPxT6uSbI81yU9lLc4IJYcOAtiQJfC
 7qbvIsM4wcKJDQSWU9+mixMLM9wjQqRpKeJwrV8lKwgyK7vam/y3DCGpGs2A==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LLV-qt4DSG-Eh; Sat, 02 Nov 2024 21:07:45 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LLU-AIkwcC8v3t7-KDch; Sat, 02 Nov 2024 21:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581664; bh=S6N9ZGM2cfU20hr9WOcviqXD5oXVjBqaHStnNBvwVnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V46JvjlffE0FnQAi51MJR4LGCSgDKR3d3n8bNdPfvkttAFMBl3EKiYVsPEa4v/1zG
 tByg80SaewjkEYADd33G1q/czS+0ScSWI4+MitbOP5D0tuUzGdPkXPLGRCZThvpKRD
 SYTEL0TRoVB/Mb/VIVXYSq/NE59Vss1EpK3LrlWI=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 39AFA3D7A3; Sat,  2 Nov 2024 22:07:44 +0100 (CET)
Date: Sat, 2 Nov 2024 22:07:44 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Morten Linderud <morten@linderud.pw>,
 Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
 Kees Cook <kees@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 02/11] kbuild: document some prerequisites
Message-ID: <ZyaUoGqu6bXDX26s@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-3-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-3-vegard.nossum@oracle.com>
X-UID: 186
X-Smtpcorp-Track: ZzCt4OoVQ7WF.ADMJqxmXicpv.n1MUXAT8wW4
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286shYHl4XWV8
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Aug 19, 2024 at 06:02:59PM +0200 Vegard Nossum wrote:
> When running 'make --dry-run', make will invoke itself recursively for
> recipes using $(MAKE), but otherwise not execute the other commands in
> a recipe.
> 
> However, if a prerequisite is missing and 'make' does not how to create it
> (which will be the case when running 'make -n'), it will complain with an
> error message like this:
> 
>   $ make -n
>   ...
>   make -f ./scripts/Makefile.modpost
>   make[1]: *** No rule to make target 'modules.order', needed by 'modules-only.symvers'.  Stop.
>   make: *** [Makefile:1868: modpost] Error 2
> 
> In this case, the top-level makefile has reached a recipe that ran 'make'
> recursively on scripts/Makefile.modpost, which itself has a rule with
> modules.order as a prerequisite. Since the file doesn't exist, and make
> doesn't know how to create it, it errors out.
> 
> We can document such prerequisites (which are expected to be created by
> the parent Makefile) by adding them to the PHONY list of each respective
> Makefile.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  arch/x86/boot/compressed/Makefile | 6 ++++++
>  scripts/Makefile.modfinal         | 5 +++++
>  scripts/Makefile.modpost          | 4 ++++
>  scripts/Makefile.vmlinux          | 7 +++++++
>  scripts/Makefile.vmlinux_o        | 3 +++
>  5 files changed, 25 insertions(+)
> 
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index f2051644de943..ccef6f0e04bc7 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -80,6 +80,9 @@ quiet_cmd_voffset = VOFFSET $@
>  
>  targets += ../voffset.h
>  
> +# We don't know how to build this

A comment for documentation is a good idea, but I think this one is not very
helpful to those who don't know the patch description.  What about something
like this?

# Provided by a recursive-make predecessor


Kind regards
Nicolas

