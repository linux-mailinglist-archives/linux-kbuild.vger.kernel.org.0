Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B29770D9A
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Aug 2023 05:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjHEDyl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Aug 2023 23:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHEDyj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Aug 2023 23:54:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9116813E
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Aug 2023 20:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=HeQBKBZEgIiPDqFfpP9r8+RR+4OnEJ3n4KP4EScTbcI=; b=jA6ghfSRhyzRJgO5DeKBVKH4M8
        i3zXlxwCZE0Z4fi2tbAqAEs8qvi2tnfB2zuTovzThmCtRrkGEzStgoNTAVaBz4gedEiVW0KyFIULh
        WtZfmLCfVhOYphWXA8J6Ipy5KBM8nnhHJkSI76iXvyQEv3351bJqyLgIh0b5VSd/TbJveU1D26vVN
        Zv9aXELB6cFC6GEn9IOSAm4KbL8JbLj07apti4VwhNwnmFgD811hIX1qe4KGuXZucxC8U13ljedhj
        OesdhoNcPxfPfYbfQ6LiKj0zJ8E4lSZdixb66abW7MqjiPzIGYH+lS4oNQMIlwZhPCHq/ODaMOkBv
        Kv8PbebQ==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qS8NC-00Dex1-0W;
        Sat, 05 Aug 2023 03:54:38 +0000
Message-ID: <1df1527b-6929-eca1-9e6d-8a4d9a2f8b1e@infradead.org>
Date:   Fri, 4 Aug 2023 20:54:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] kconfig: Alias mconfig to menuconfig, qconfig to
 xconfig
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20230805034256.2478162-1-Mr.Bossman075@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230805034256.2478162-1-Mr.Bossman075@gmail.com>
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

Hi,

On 8/4/23 20:42, Jesse Taube wrote:
> All the other menu-based config tools have a one-letter prefix, and
> are named the same as their respective file,
> except for mconfig and qconfig. This commit adds an alias for mconfig
> to menuconfig and qconfig to xconfig.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  scripts/kconfig/Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index af1c96198f49..319cd623acb9 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile

> @@ -45,7 +47,7 @@ PHONY += build_$(1)
>  build_$(1): $(obj)/$($(1)-prog)
>  endef
>  
> -$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call config_rule,$(c))))
> +$(foreach c, config menuconfig mconfig nconfig gconfig xconfig qconfig, $(eval $(call config_rule,$(c))))
>  
>  PHONY += localmodconfig localyesconfig
>  localyesconfig localmodconfig: $(obj)/conf
> @@ -118,7 +120,9 @@ help:
>  	@echo  '  config	  - Update current config utilising a line-oriented program'
>  	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
>  	@echo  '  menuconfig	  - Update current config utilising a menu based program'
> +	@echo  '  mconfig	  - Alias to menuconfig'
>  	@echo  '  xconfig	  - Update current config utilising a Qt based front-end'
> +	@echo  '  qconfig         - Alias to xconfig

Seems to be missing an ending ' mark above... if we need this.

>  	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
>  	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
>  	@echo  '  localmodconfig  - Update current config disabling modules not loaded'

-- 
~Randy
