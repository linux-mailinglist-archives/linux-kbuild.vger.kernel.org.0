Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 742C04F1CCD
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Apr 2022 23:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380417AbiDDV3A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Apr 2022 17:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379544AbiDDR3I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Apr 2022 13:29:08 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F112A24BF9
        for <linux-kbuild@vger.kernel.org>; Mon,  4 Apr 2022 10:27:11 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n9so4030458plc.4
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Apr 2022 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VYvPl145gx1NnQ2E3OJKFVQPxapHGXttn5rOGVj8YXo=;
        b=hd+vUeBK2jke4Z79gSu5EYlGJK/30+8ZPm5vusOwihjccMo+JYQaFziQAAtCID0e5b
         qiLbaSXJpB5nRDykwDoLmPmHeyaA4U3mO1aNEDIrpBI1y7KWpUIIYaKFkz1sQOFACAOc
         aM6lCqWr9wZwWsklSOxLwTatnC3eKJ1E18Cyxx8CEA5zLgAe9sm4oTFjzF7SzNxlrSY7
         5YCfCpDy23ULHUPSewKuWau9wE833jCsfozeqx9dNss7+g86jPjfaK+eh0C/KKY3VLXw
         f3jp5vi8jNmhQOZlIPVusBowj6XA96wM7engEJdtxH6nw+nNIUhWc7hzzmvwmP0aO5k+
         ThIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VYvPl145gx1NnQ2E3OJKFVQPxapHGXttn5rOGVj8YXo=;
        b=4sOSZcjueK4thJh70+AmFwE+FFlIfV3GBrsSYCTtwA73JlQtq+BEI9LyMPl+yEH1DW
         xc1R1KstwR/99JnWVx4HeP93PiYNaPbUhoGQ+a+RDVD83722c3MfXVF3TLxmR7IXbcKz
         EuzaVGJ/W6Fz9n65IM3yjzuXsw7QHZxZVl1uLph/vaNuqZmZQNEz49r7GShMljAed4UQ
         KIc3sVkajlHtgwN0pKYcz+ToDz5bGYbXyd45d784ZR8jgpZVyffL4n6sbihPEr0yBWlo
         twvaqaZS8ri0z9V6z3kEXx5YyVpqeknZCWFBIUVWkwZxUlz8nKHBVGYqiPPpOAaiJf04
         9DPQ==
X-Gm-Message-State: AOAM533RyUqE+rt6ba86Q53XVOi63bxbYWxa09x7/kGKyFIgXyi5xh/i
        TGX6KJkZdDB4M1wlur6GXWUQAYQlptpXx/G+
X-Google-Smtp-Source: ABdhPJzIn8VUPSw0kXUgBANdTlP1KbT/bIOfaGMgMZZeENIi+FbBiFh+hZ3dFMto7+s4V24GWdOQ6w==
X-Received: by 2002:a17:90b:1c07:b0:1c7:5324:c68e with SMTP id oc7-20020a17090b1c0700b001c75324c68emr255680pjb.202.1649093231294;
        Mon, 04 Apr 2022 10:27:11 -0700 (PDT)
Received: from google.com ([2620:15c:211:202:9d5:9b93:ffb4:574a])
        by smtp.gmail.com with ESMTPSA id gt14-20020a17090af2ce00b001c701e0a129sm73834pjb.38.2022.04.04.10.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:27:09 -0700 (PDT)
Date:   Mon, 4 Apr 2022 10:27:02 -0700
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 1/8] agpgart.h: do not include <stdlib.h> from exported
 header
Message-ID: <YksqZv5IqECbFB7a@google.com>
References: <20220404061948.2111820-1-masahiroy@kernel.org>
 <20220404061948.2111820-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404061948.2111820-2-masahiroy@kernel.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 04, 2022 at 03:19:41PM +0900, Masahiro Yamada wrote:
> Commit 35d0f1d54ecd ("include/uapi/linux/agpgart.h: include stdlib.h in
> userspace") included <stdlib.h> to fix the unknown size_t error, but
> I do not think it is the right fix.
> 
> This header already uses __kernel_size_t a few lines below.
> 
> Replace the remaining size_t, and stop including <stdlib.h>.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> 
>  include/uapi/linux/agpgart.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/uapi/linux/agpgart.h b/include/uapi/linux/agpgart.h
> index f5251045181a..9cc3448c0b5b 100644
> --- a/include/uapi/linux/agpgart.h
> +++ b/include/uapi/linux/agpgart.h
> @@ -52,7 +52,6 @@
>  
>  #ifndef __KERNEL__
>  #include <linux/types.h>
> -#include <stdlib.h>
>  
>  struct agp_version {
>  	__u16 major;
> @@ -64,10 +63,10 @@ typedef struct _agp_info {
>  	__u32 bridge_id;	/* bridge vendor/device         */
>  	__u32 agp_mode;		/* mode info of bridge          */
>  	unsigned long aper_base;/* base of aperture             */
> -	size_t aper_size;	/* size of aperture             */
> -	size_t pg_total;	/* max pages (swap + system)    */
> -	size_t pg_system;	/* max pages (system)           */
> -	size_t pg_used;		/* current pages used           */
> +	__kernel_size_t aper_size;	/* size of aperture             */
> +	__kernel_size_t pg_total;	/* max pages (swap + system)    */
> +	__kernel_size_t pg_system;	/* max pages (system)           */
> +	__kernel_size_t pg_used;	/* current pages used           */
>  } agp_info;
>  
>  typedef struct _agp_setup {
> -- 
> 2.32.0
> 
