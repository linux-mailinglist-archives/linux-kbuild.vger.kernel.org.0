Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81AE2550C40
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jun 2022 19:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236653AbiFSRG4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Jun 2022 13:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbiFSRG4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Jun 2022 13:06:56 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F7721B;
        Sun, 19 Jun 2022 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=SC64/QmCqYeMEFV3qmdROlBngyB8dAv9Mi7IoYLO5DY=; b=Sk0nhD7SCc0pbktnkU+BXlEvKd
        XmECMU8noCvmMyQDUQGVRWtWlEauKsNFnXOsqyqsZopExVVu9dvx/FTeEooDW8GfClH0Z4LBWr8bT
        6nXlSTm1XMRhgr+uiInGTncILH50JphRvz+iDzIkoZZKvqytquLsj1Hw1tkBiE+oVbZpLC8Old+lk
        pR4x4MixfMPHCReAbBeJ/yYDX+dnrthQpCb0671UCm7BjTPhfyGhIVLMtP9HBlzwQj5TtLtIdYLdw
        s9AcVTEUyop6Dkh6N6EALe2wyhIbedzfZqp1hVznQdWwSPSjyBYKuUm85hjlsnXiLaTXEcKlAyXiv
        SiTf68tw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o2yNu-004Unv-D0; Sun, 19 Jun 2022 17:06:50 +0000
Message-ID: <00e76412-9145-5db5-f931-1f93c913fc50@infradead.org>
Date:   Sun, 19 Jun 2022 10:06:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Documentation: kbuild: fix typo in kconfig-language.rst
Content-Language: en-US
To:     SangYuhiter <sangyu.code@gmail.com>, linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, linux-doc@vger.kernel.org
References: <20220619170337.24743-1-sangyu.code@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220619170337.24743-1-sangyu.code@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 6/19/22 10:03, SangYuhiter wrote:
> change "default y/m" to "default y/n"
> add " should be "default y" " in default section d)
> 
> Signed-off-by: SangYuhiter <sangyu.code@gmail.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index a7173843a294..ae3add11d5e7 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -92,7 +92,7 @@ applicable everywhere (see syntax).
>   release to release.
>  
>   Note:
> -	Things that merit "default y/m" include:
> +	Things that merit "default y/n" include:

"y/m" is correct here, so NAK.

>  
>  	a) A new Kconfig option for something that used to always be built
>  	   should be "default y".
> @@ -105,7 +105,7 @@ applicable everywhere (see syntax).
>  	   "default n". This allows you to provide sane defaults.
>  
>  	d) Hardware or infrastructure that everybody expects, such as CONFIG_NET
> -	   or CONFIG_BLOCK. These are rare exceptions.
> +	   or CONFIG_BLOCK, should be "default y". These are rare exceptions.
>  
>  - type definition + default value::
>  

-- 
~Randy
