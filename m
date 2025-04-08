Return-Path: <linux-kbuild+bounces-6525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF74A8196A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 01:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D92D5885CD9
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 23:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3872566E3;
	Tue,  8 Apr 2025 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULrhmzZ8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C123FC4B;
	Tue,  8 Apr 2025 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744155225; cv=none; b=jWVoE+AeIKwg/NG7NZPMmfHVrIgYUGHXxOHRyBlNM1X1tnKiCz73PQG9TgtHTAvDqYyhXf6SZfOj3W9ewQO4EjVPvLUQLjfqBCISnG2qMWfHPeaKZYWN0SFe86Uxh+ghg6gk79/+VuN7VzkIytIa8c1+BEqlEYdA+zimkvtOez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744155225; c=relaxed/simple;
	bh=/ch1wD6o2Vl0FXPYL+F9372/FrXWZmbfesdlSP688wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjGjvG/zf1BnGTuFlSntdRIfPDYN3Ggg7rehXmzcLQ73ot9U0W05Yk1Dpsurx1ckNFGOeRYSS3+iFK0cBqHIBTrrVJp0YI3gP3E3Ln1DVEIfDxtW/w5gymD8daBrAEOiTytjHGSwo7ocOsNnrfuETrROqBpuCtGaQtPitRpAtQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULrhmzZ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5C6C4CEE5;
	Tue,  8 Apr 2025 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744155225;
	bh=/ch1wD6o2Vl0FXPYL+F9372/FrXWZmbfesdlSP688wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULrhmzZ8tFu65Uf/S9eYFLeouWcrXOr3pHX1lkdpfLcET3XCdrIBqGXcPDGkIKD8A
	 rUpKpnf/RCcHKUk1thFwNtW/ZamTngoGZZjAWyTX0kEmib2nhT1zwLco+tskHfAVBo
	 /0QcGtrXTFeoJyqYFAx87uH5XGcsfs4ov9E+BU5bRJ8de0LnGazmHZ58VFXYaLFOom
	 Kc3tE/6xRPg4aHPc4OrJ68KMkjC/Fo3BTYqcPEf81GDPryt0Z+vquFjb3Wki/OvHUY
	 RHN2erKiiiyBwZiUhW5BzrfZQUzIzsIUYbv9ty6D71AkfIRs9dRueP6KI2hGYA/eC5
	 3htlonFoMaG2w==
Date: Tue, 8 Apr 2025 16:33:42 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Add '-fno-builtin-wcslen'
Message-ID: <202504081632.00837E7921@keescook>
References: <20250407-fno-builtin-wcslen-v1-1-6775ce759b15@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-fno-builtin-wcslen-v1-1-6775ce759b15@kernel.org>

On Mon, Apr 07, 2025 at 04:22:12PM -0700, Nathan Chancellor wrote:
> A recent optimization change in LLVM [1] aims to transform certain loop
> idioms into calls to strlen() or wcslen(). This change transforms the
> first while loop in UniStrcat() into a call to wcslen(), breaking the
> build when UniStrcat() gets inlined into alloc_path_with_tree_prefix():
> 
>   ld.lld: error: undefined symbol: wcslen
>   >>> referenced by nls_ucs2_utils.h:54 (fs/smb/client/../../nls/nls_ucs2_utils.h:54)
>   >>>               vmlinux.o:(alloc_path_with_tree_prefix)
>   >>> referenced by nls_ucs2_utils.h:54 (fs/smb/client/../../nls/nls_ucs2_utils.h:54)
>   >>>               vmlinux.o:(alloc_path_with_tree_prefix)
> 
> Disable this optimization with '-fno-builtin-wcslen', which prevents the
> compiler from assuming that wcslen() is available in the kernel's C
> library
> 
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for chasing this down. :)

Reviewed-by: Kees Cook <kees@kernel.org>

Since I have stuff queued for -rc2, do you want me to snag this too?

-- 
Kees Cook

