Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158AE1AE817
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2020 00:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgDQWTk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Apr 2020 18:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728470AbgDQWTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 18:19:40 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E28C061A0C;
        Fri, 17 Apr 2020 15:19:39 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id o25so3415553oic.11;
        Fri, 17 Apr 2020 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yW1rTc/fkIGCNKy5NNRXoxwqN+9iD/xtD2sA5y2Ygts=;
        b=K8PuDkELJoZhAcizFoboOzhRmWXkhFdTSZaaMf8sX6UlPapG9poyvyftZH6GH5eJCl
         pgq+BEg7YAwtqtxmzTjsx2YXgOt84mX0I3dD7OjmlrWCrqXuYbTGgL1hkgtpqp7jTGzY
         4N9rM4gjl0XTPhPi/Y7W9GptFFwxTqGfEZh2ZXSWkXhXhQokcrZqxggzEuLQmxCMzTMG
         k0bf2AcMoCs5xOpOXJLBB5Vmnn/UMKedTa7CYJLBZma7Wt+nXgBago3gwG3GaiFboU+k
         S18t78HwCnZVoo3FixR3gUFkhRsHNXkQ2Mqzi3XA5zIVajNq+8h5SjnmqW2PPTEt9HGO
         Sqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yW1rTc/fkIGCNKy5NNRXoxwqN+9iD/xtD2sA5y2Ygts=;
        b=LeWO6X8SPBXkuRuWybBNBh8MqK2YGMRAUIn2iCwyNiEy04nohtZDi4ISkxOynyyJ1w
         FR+vhasgNFaiufEdBlTgabWTBwFaYV8MQr1MzoI1nBrhMg/rb54BBMHXlGzTQh+EyL1h
         M5g8bu85UPmUI0Lv1QpAz1pO5I4Go8Lygenv5JfiGg6L69yH97pqes5FqzzD+zvhPBxh
         i83OKj/FiXLw8X/SUnn5ruIV5RO2fuhpoAO9IG5l+jQAdgKcU7lxJ2eZZi1LGEwSA9Iu
         NipTPdjnq3X+9d0WpF4k4O6+cyI2PP0tzSCQdDvJ2QcxAOdSi4ovstlN0x210iwXX3IB
         e6lQ==
X-Gm-Message-State: AGi0PuZAOai1oWWQaDqakH6NScoUkOHWaBQe78lpjW6gVA9bLlE13JAR
        96s9LHRe4ZOcRgfMWOTAKJ4=
X-Google-Smtp-Source: APiQypJROud2ynmS8ZZ+1tLghEUJwO0lE5GiqY6V2tQK0kHfEreSrGenaDr/D5lDg0PuGUoH5k9CLg==
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr223511oia.151.1587161978435;
        Fri, 17 Apr 2020 15:19:38 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id v14sm141733ooe.10.2020.04.17.15.19.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 15:19:37 -0700 (PDT)
Date:   Fri, 17 Apr 2020 15:19:36 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Alex Dewar <alex.dewar@gmx.co.uk>,
        Erel Geron <erelx.geron@intel.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] um: do not evaluate compiler's library path when cleaning
Message-ID: <20200417221936.GA13833@ubuntu-s3-xlarge-x86>
References: <20200417180455.1174340-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417180455.1174340-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 18, 2020 at 03:04:55AM +0900, Masahiro Yamada wrote:
> Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
> -Wframe-larger-than="), 'make ARCH=um clean' emits an error message
> as follows:
> 
>   $ make ARCH=um clean
>   gcc: error: missing argument to '-Wframe-larger-than='
> 
> We do not care compiler flags when cleaning.
> 
> Use the '=' operator for lazy expansion because we do not use
> LDFLAGS_pcap.o or LDFLAGS_vde.o when cleaning.
> 
> While I was here, I removed the redundant -r option because it
> already exists in the recipe.
> 
> Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/um/drivers/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
> index a290821e355c..2a249f619467 100644
> --- a/arch/um/drivers/Makefile
> +++ b/arch/um/drivers/Makefile
> @@ -18,9 +18,9 @@ ubd-objs := ubd_kern.o ubd_user.o
>  port-objs := port_kern.o port_user.o
>  harddog-objs := harddog_kern.o harddog_user.o
>  
> -LDFLAGS_pcap.o := -r $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
> +LDFLAGS_pcap.o = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
>  
> -LDFLAGS_vde.o := -r $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
> +LDFLAGS_vde.o = $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
>  
>  targets := pcap_kern.o pcap_user.o vde_kern.o vde_user.o
>  
> -- 
> 2.25.1
> 

I tested building pcap.o both before and after this change, no changes
there.

I do see the clean error fixed.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com> [build]
