Return-Path: <linux-kbuild+bounces-269-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66288074E6
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 17:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FC341F21185
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 16:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123694654F;
	Wed,  6 Dec 2023 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPpKGr02"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77DD46547;
	Wed,  6 Dec 2023 16:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3FFC433C7;
	Wed,  6 Dec 2023 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879995;
	bh=ZXweG10khDuRddPxSqk8fVsgPKqy4X0Se3jxAunEMa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPpKGr023RclkgsGoII8sIoCNnXaC2ssQ35SGFTCKqdR3YMjzbPi0X+2ySU5Qfx8H
	 OvAXFitLBtncNinJxD5nBJvo4pyqi0FwtJl2l/fdFUTbDsqupaezmtWhJXgaACXEnC
	 OABSvB6hvmFG+LBNVPmiNUPOcSHRZ5uDzv5QQEGKPjknWToS2L/irVOcsUGNsjhlR6
	 KV4shOhjOe15tBCZ9swrE9mUjwRSwYYLmFS+1H4nfK6dU7MTa0tuoD/jkx1JcWrZpY
	 vyPAJg1Z75gKsABz7o9I1etD9lfVEM60CLkFkHVQERNgdtOJHUD9PuEzmdR7hsP0RO
	 jobcLHiZvdfcA==
Date: Wed, 6 Dec 2023 09:26:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: masahiroy@kernel.org, ndesaulniers@google.com
Cc: nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: Disable clang's
 -Wformat-{overflow,truncation}-non-kprintf
Message-ID: <20231206162632.GA809535@dev-arch.thelio-3990X>
References: <20231002-disable-wformat-truncation-overflow-non-kprintf-v1-1-35179205c8d9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002-disable-wformat-truncation-overflow-non-kprintf-v1-1-35179205c8d9@kernel.org>

On Mon, Oct 02, 2023 at 12:52:28PM -0700, Nathan Chancellor wrote:
> Recently, clang added support for -Wformat-overflow and
> -Wformat-truncation. When building the kernel, it was discovered that
> clang's implementation of these warnings handles the '%p' specifier,
> which differs from GCC's implementation. This results in false positive
> warnings due to the kernel's various '%p' extensions. Fortunately, the
> clang developers placed this warning difference into a separate flag,
> allowing the kernel to turn off the warning for '%p' unconditionally.
> 
> This is not currently an issue for a normal build, as -Wformat-overflow
> and -Wformat-truncation are unconditionally disabled, which includes
> this sub-warning. However, ever since commit 6d4ab2e97dcf ("extrawarn:
> enable format and stringop overflow warnings in W=1"), these warnings
> are in W=1 and the goal is to enable them in the normal build once they
> are all eliminated. Disable the warnings for W=1 to avoid false
> positives. This block should move with -Wformat-overflow and
> -Wformat-truncation when they are enabled for a normal build.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1923
> Link: https://github.com/llvm/llvm-project/issues/64871
> Link: https://github.com/llvm/llvm-project/pull/65969
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78512
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.extrawarn | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 2fe6f2828d37..bad1baa2cfb4 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -106,6 +106,13 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
>  KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
>  KBUILD_CFLAGS += $(call cc-option, -Wformat-overflow)
>  KBUILD_CFLAGS += $(call cc-option, -Wformat-truncation)
> +# Clang checks for overflow/truncation with '%p', while GCC does not:
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
> +# The kernel has many extensions to '%p' that clang does not understand, so
> +# always disable these warnings when '-Wformat-truncation' and
> +# '-Wformat-overflow' are enabled.
> +KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
> +KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
>  KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
>  KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
>  
> 
> ---
> base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
> change-id: 20231002-disable-wformat-truncation-overflow-non-kprintf-033e8d8b4de8
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

I am going through my outstanding patches and I noticed this was not
picked up. Masahiro, would you like me to resend it? It still applies
cleanly to the current kbuild tree, although there will be a conflict in
-next because of commit 89741e7e42f6 ("Makefile: Enable
-Wstringop-overflow globally"), but there is not much that can be done
about that.

Cheers,
Nathan

