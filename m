Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC5E9277
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 23:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfJ2WBN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 18:01:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41612 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfJ2WBN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 18:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=u9Sf9FNHhYYBEBoltVzRgVFkWsIpASj//j6eW2ZSz38=; b=drAUjUv54IKyh1uKLZS+YnVCA
        rmQ6x9LRqH35slCBccluZ+g32eU/4hlKKYw5qagqNPtl/rPHq7JRjgJqqA+eX5NWR7ZiHu4AcUoxg
        jv0jI2R3i6keDALtgNMZZd6AVRx0EPNbDaj0Ly7tFQvv9JBhIv16ewbcvxjVTW0PnMDUR9FScVAjU
        2QzQRYhzTfn4M3dfG72vEvyPkgPJm3qWdPnDWbmZWxULwW/kgoHn9DOByr6QE/FF/P/QmLYG9vwyG
        8nccK6mAxENTwwQIORA2wZxNEM7c6SWyDJ4AhmvjrgCf6C+7DHSMgEMOhJfnOhYxlUddtNpBA/eLq
        ftya7ZmhQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iPZY9-0004gR-6j; Tue, 29 Oct 2019 22:01:13 +0000
Subject: Re: [RFC PATCH] kconfig: Add option to get the full help text with
 listnewconfig
To:     Laura Abbott <labbott@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcline@redhat.com, dzickus@redhat.com
References: <20191029181702.21460-1-labbott@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <53da077f-b4d6-c123-bcbc-ae531fdcc410@infradead.org>
Date:   Tue, 29 Oct 2019 15:01:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191029181702.21460-1-labbott@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Laura,

On 10/29/19 11:17 AM, Laura Abbott wrote:
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ef2f2336c469..aaaf1f62300c 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -66,7 +66,9 @@ localyesconfig localmodconfig: $(obj)/conf
>  #  syncconfig has become an internal implementation detail and is now
>  #  deprecated for external use
>  simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
> -	alldefconfig randconfig listnewconfig olddefconfig syncconfig
> +	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
> +	extendedlistnewconfig
> +
>  PHONY += $(simple-targets)
>  
>  $(simple-targets): $(obj)/conf
> @@ -134,6 +136,7 @@ help:
>  	@echo  '  alldefconfig    - New config with all symbols set to default'
>  	@echo  '  randconfig	  - New config with random answer to all options'
>  	@echo  '  listnewconfig   - List new options'
> +	@echo  '  extendedlistnewconfig   - List new options'

This text should also say " and help text" similar to what conf.c does.

>  	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
>  	@echo  '                    default value without prompting'
>  	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'

I can't say that I like the name, but I won't try to paint it a
different color.

-- 
~Randy

