Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16832C1234
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 18:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388030AbgKWRjb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 12:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732739AbgKWRjb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 12:39:31 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D259EC0613CF;
        Mon, 23 Nov 2020 09:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=6I83eQr1qdTwoxzgYyEt6LKWaZkdwdrxnn+llmNtCe0=; b=Q7W/DvSxsagLoDukplAq+8VNYf
        VCvixkn8hMr1vJ78WZP+TmOAmh4G7b9kjS38+gDlIKlQzR65YC/9ksL8uu2UUr7UqFu6ifTqnT1nw
        10Cwh+OIm4FFyt/qng6vqP82Xh/BdeNp5aL9XWCtulT6RaNJ1pCOI+/MIj3/WiKGN3Wu+iIFQ39Wk
        1G0FBjIo7itxxO16WQe0QlIODGpROBZWpwV/8iV5/89uH8ZvI8HPCXQytMKR93tgXxG85SRnVY3Fq
        p5MfDtwt8GDEkysJ2bXmv7LYbE19hmZ7uPfpRifjSEzeK5qmg/y+3t+5z0M8kR/9y3H8aIzH4vvOe
        KAOQl4gg==;
Received: from [2601:1c0:6280:3f0::bcc4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1khFoF-0003yF-H9; Mon, 23 Nov 2020 17:39:27 +0000
Subject: Re: [PATCH 2/7] kbuild: doc: replace arch/$(ARCH)/ with
 arch/$(SRCARCH)/
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201123045403.63402-1-masahiroy@kernel.org>
 <20201123045403.63402-2-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3f9e520c-9902-b91f-4276-1a6b37aecb1d@infradead.org>
Date:   Mon, 23 Nov 2020 09:39:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123045403.63402-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi-

On 11/22/20 8:53 PM, Masahiro Yamada wrote:

> ---
> 
>  Documentation/kbuild/makefiles.rst | 61 +++++++++++++++++-------------
>  Documentation/kbuild/modules.rst   |  2 +-
>  2 files changed, 35 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index a7b874097a91..2a5232b321af 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst

>  
>  9 Kbuild Variables
>  ==================
> @@ -1564,6 +1561,16 @@ The top Makefile exports the following variables:
>  
>  	    make ARCH=m68k ...
>  
> +    SRCARCH
> +	This variable speficifies the directory in arch/ to build.

	              specifies

> +
> +	ARCH and SRCARCH may not necessarily match. A couple of arch
> +	directories are biarch, that is, a single arch/*/ directory supports
> +	both 32-bit and 64-bit.
> +
> +	For example, you can pass in ARCH=i386, ARCH=x86_64, or ARCH=x86.
> +	For all of them, SRCARCH=x86 because arch/x86/ supports	both i386 and
> +	x86_64.
>  
>      INSTALL_PATH
>  	This variable defines a place for the arch Makefiles to install

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
