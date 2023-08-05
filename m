Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2E7770DA3
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Aug 2023 06:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjHEEI7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Aug 2023 00:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjHEEI5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Aug 2023 00:08:57 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D991C4683;
        Fri,  4 Aug 2023 21:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=dH1pVdDavqU3mnQ1Cm9zeQjr7ee3zTJMMAMepnEmoWc=; b=dRpxEFG5h8LtuiSsffpQIIuluA
        ekpEtiflox85Y6bx9Yx+wYCKGy+v3TVsa/oGT89/xtzenVbidHYzL0vBuSstWgOT47jdInVD8qeNO
        cP7wmEoTOAErFUCIPZeWUNWvOtB9qjYNl9qfQp/bb5cP2gqlkcqXURtzY2DiQFneD6iOz4rkFza98
        TLDUm4cDT3S/5rAlCScHbicRfnDeYDLNdps+/lGOlPWBhJrD8rio1AyV4Q2056N6aMN399HDZRJTY
        R7eJCJFGCPWWX3nzi7nQVhDWZ4MNwWj8WL2LcjDej34QO78R8bi+D+pjwxUyMFXK1VLjt9sTEZ1bh
        ro6I8wkQ==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qS8aw-00DfT1-1A;
        Sat, 05 Aug 2023 04:08:50 +0000
Message-ID: <25eadbd0-425f-403c-4359-eba79e73ab47@infradead.org>
Date:   Fri, 4 Aug 2023 21:08:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] docs: kbuild: Document search jump feature
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-doc@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>
References: <20230805034445.2508362-1-Mr.Bossman075@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230805034445.2508362-1-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 8/4/23 20:44, Jesse Taube wrote:
> Menuconfig has a feature where you can "press the key in the (#) prefix
> to jump directly to that location. You will be returned to the current
> search results after exiting this new menu."
> 
> This feature is poorly documented,
> so add it to the kconfig.rst documentation.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.


More below...

> ---
>  Documentation/kbuild/kconfig.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
> index 5967c79c3baa..463914a7fdec 100644
> --- a/Documentation/kbuild/kconfig.rst
> +++ b/Documentation/kbuild/kconfig.rst
> @@ -210,6 +210,10 @@ Searching in menuconfig:
>  	first (and in alphabetical order), then come all other symbols,
>  	sorted in alphabetical order.
>  
> +	In this menu, pressing the key in the (#) prefix will jump
> +	directly to that location. You will be returned to the current
> +	search results after exiting this new menu.
> +

In menuconfig, exiting returns to the correct location in the search output,
but in nconfig, exiting always returns to the top of the search output, not
to where the (#) was displayed on the search output screen.
This is annoying.
Is this something that you have possibly already fixed?

>  ----------------------------------------------------------------------
>  
>  User interface options for 'menuconfig'
> @@ -262,6 +266,10 @@ Searching in nconfig:
>  	F8 (SymSearch) searches the configuration symbols for the
>  	given string or regular expression (regex).
>  
> +	In the SymSearch, pressing the key in the (#) prefix will
> +	jump directly to that location. You will be returned to the
> +	current search results after exiting this new menu.
> +
>  NCONFIG_MODE
>  ------------
>  This mode shows all sub-menus in one large tree.

-- 
~Randy
