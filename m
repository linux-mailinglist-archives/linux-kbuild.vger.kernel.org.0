Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD216DB3BB
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 20:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234150AbjDGS46 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 14:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234328AbjDGS4k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 14:56:40 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC6B113F4
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 11:54:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nh20-20020a17090b365400b0024496d637e1so4947344pjb.5
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 11:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680893633; x=1683485633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9ArRqSV5SRqeXqGCzuFDgnuLZ2HlQmnSNgQMk0X0JQ=;
        b=XZmNIEfaOfoytXSKBcqIs+UXYwm5WSHC8RdsWMdW+gwVaIpsuTtD+xygjwxoGfHA9F
         FN3QUJciwb4anYn2AYBEDmd3CyqMvU+sX36UINaIMvkmM4ZMCVojPClm/PqF2OykHo2T
         +nz6ajMZvp3fL+E6OmZTYXJnliQPMhFGGZDar0Qo3BI1moucw64R+3/zbJgK5NJuxy2Z
         FEsRxyJoVjlBCWaciqafdJx9AFKv8IX8Bu5d73KjiO6RhLaYL5mqTBGvsPISNzAiJU0D
         ONG7wU0OyYs+yhFLkCtSc9O4hKmQb3x85zEIetCDujaGb/igsWLt9Kdoo45M/mvJBnOc
         vS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680893633; x=1683485633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9ArRqSV5SRqeXqGCzuFDgnuLZ2HlQmnSNgQMk0X0JQ=;
        b=yQhRNfYrZt6XAMjMCFAPxHG+cMMBoMdtt5dOA1Fy9VqLK1vTjFtlwk4V2Uq7MRwOJm
         MCjvLb65V6J9rV4pJNcFJUbrmcW1xzJK4PuiaNrCqTP68fVVn/S0W5qd+owvuTWefrZ6
         oLqGl41zK+rxrC5Eo2bnkRJZEvVrv2lghHOgfaFZQLSKZQjeVmuKD47JV8D+MDHKTXgY
         ti22RJpz3FC/yg7wuF7LYqAfd6YRHBZFxS6IhYlitiFG5vOfljKpbTKQ2WPOE1bX1w1f
         94vONXpbO4kC8l9t4Ju6UtHFQr3s79BY1TqimQEB0PSY/tZNRxm8UCSBiqs0l2Br4hAr
         KHQQ==
X-Gm-Message-State: AAQBX9e8FdIxpylG8/sH+y5X8NQRx/5SrU72wV0LdkXY0nHx54XnvtK+
        JSkbhG51HfNO0b5DbHy5rDWduHZhwjadBG2HOn20JA==
X-Google-Smtp-Source: AKy350bE6Sr/qt9sQNhiAt1xYCTdZWhbeCmsI2i5UJ1BOiMK8pOcyms6ZzBaIGsYpNeyXwvV5YBXog==
X-Received: by 2002:a05:6a20:65b:b0:da:2fdf:385e with SMTP id 27-20020a056a20065b00b000da2fdf385emr3419174pzm.49.1680893633081;
        Fri, 07 Apr 2023 11:53:53 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:5eb4:e720:fec7:a2d3])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78dc8000000b0062dba4e4706sm3362453pfr.191.2023.04.07.11.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 11:53:52 -0700 (PDT)
Date:   Fri, 7 Apr 2023 11:53:48 -0700
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/8] scripts/kallsyms: remove redundant code for omitting
 U and N
Message-ID: <ZDBmvJh46Z+k05PR@google.com>
References: <20230308115243.82592-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308115243.82592-1-masahiroy@kernel.org>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 08, 2023 at 08:52:36PM +0900, Masahiro Yamada wrote:
> The symbol types 'U' and 'N' are already filtered out by the following
> line in scripts/mksysmap:
> 
>     -e ' [aNUw] '
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> 
>  scripts/kallsyms.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index ea1e3d3aaa6b..8148e880f78e 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -178,10 +178,7 @@ static bool is_ignored_symbol(const char *name, char type)
>  			return true;
>  	}
>  
> -	if (type == 'U' || type == 'u')
> -		return true;
> -	/* exclude debugging symbols */
> -	if (type == 'N' || type == 'n')
> +	if (type == 'u' || type == 'n')
>  		return true;
>  
>  	if (toupper(type) == 'A') {
> -- 
> 2.34.1
> 
> 
