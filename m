Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FBF19A8B0
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 11:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbgDAJdQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 05:33:16 -0400
Received: from mail.skyhub.de ([5.9.137.197]:58780 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727541AbgDAJdQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 05:33:16 -0400
Received: from zn.tnic (p200300EC2F0BCE001428728FF98D3445.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:ce00:1428:728f:f98d:3445])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E4F391EC013F;
        Wed,  1 Apr 2020 11:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1585733594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=vUv/lbJ4IeUM8v6YQUNQdmYTTdjt5W9ALsyTWkj5050=;
        b=cvdIZiUlXVMwZAWWu+rebyz6DuUQgk418JgIURTEFPeDyUFSFYnJyD+nmj204a50rLQH3F
        an6+bBJyJvt3fWIWgkmrp5vNY8OoluShWL7YZHP5xBMNRjejEerUNZ2i2pihKIU6FEWtrS
        IM63WzlbD0+JKpoZr3TOVqrwb/4glZI=
Date:   Wed, 1 Apr 2020 11:33:10 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org,
        Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org,
        x86@kernel.org, gregkh@linuxfoundation.org,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Message-ID: <20200401093310.GA13748@zn.tnic>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401053913.216783-7-nickrterrell@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 10:39:11PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Bump the ZO_z_extra_bytes margin for zstd.
> 
> Zstd needs 3 bytes per 128 KB, and has a 22 byte fixed overhead.
> Zstd needs to maintain 128 KB of space at all times, since that is
> the maximum block size. See the comments regarding in-place
> decompression added in lib/decompress_unzstd.c for details.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> ---
>  arch/x86/boot/header.S | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> index 97d9b6d6c1af..b820875c5c95 100644
> --- a/arch/x86/boot/header.S
> +++ b/arch/x86/boot/header.S
> @@ -536,8 +536,14 @@ pref_address:		.quad LOAD_PHYSICAL_ADDR	# preferred load addr
>  # the size-dependent part now grows so fast.
>  #
>  # extra_bytes = (uncompressed_size >> 8) + 65536
> +#
> +# ZSTD compressed data grows by at most 3 bytes per 128K, and only has a 22
> +# byte fixed overhead but has a maximum block size of 128K, so it needs a
> +# larger margin.
> +#
> +# extra_bytes = (uncompressed_size >> 8) + 131072
>  
> -#define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 65536)
> +#define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 131072)
>  #if ZO_z_output_len > ZO_z_input_len
>  # define ZO_z_extract_offset	(ZO_z_output_len + ZO_z_extra_bytes - \
>  				 ZO_z_input_len)
> -- 

So why is this change unconditional if only this compression alg. needs
it?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
