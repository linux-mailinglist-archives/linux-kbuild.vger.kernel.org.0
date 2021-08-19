Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B109F3F1387
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 08:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhHSG3t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 02:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhHSG3s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 02:29:48 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A817CC061575
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:29:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso10631297pjb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1kz12NDqoO9zWoOr/K63J+3YgCfYNhAV2a4u1ChokLg=;
        b=Idc7ZRu5ncBrBaCpLn2Xo6Bb7skPL8rfWvaVplzBb2hgvlbQ+NYM4Tf6Zd697znV4L
         LXg89AMFPYj3O0Qu3wiZtzquL6NTC9fQd6cfIvXxiG4vnxzhtrt7n3xZp/00acqOPCCF
         RJ3F+00uTdrz3ONiV3ImEnLw2Tf3Q8ScGDmzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1kz12NDqoO9zWoOr/K63J+3YgCfYNhAV2a4u1ChokLg=;
        b=jq/i4reIhb+X8ocrjCJ4TYpe12tFk4QoV/o+jgSsQbTvJ0/OhI/aQtT9g3bXpOEnbR
         11r2ftjl9HcmHRpaUewoF2E6B1gsBq/UNz9qGQooK0gRezsSX0ZuaVuq3gMzK7s1SSmT
         LGQv+rOsRX6LAyvga26/wsYO9qveF8SP7EPF3ysX2j96XQoZ8hSxN2kw17ltJjawaqJs
         N6Hd2CrKN/koHr69Og1Q7TEYtKvBej5tOkWSBUdL6oEgRJzcOyl4Ly5g3LIre+hu2fdk
         sB/8CYDNhxHJFmK6xf4C32xZvSpJR9ZG47nkYOxELbbfaDIqxylve9hyiOnQL/jYVOuU
         PYXA==
X-Gm-Message-State: AOAM530/CjKYLvz9saP848xODZEYMqe8VEkv7+vuNZCPrl60bwonm8xF
        R2tqse77TcqgA4vaSBlntEgS8g==
X-Google-Smtp-Source: ABdhPJxtgT9/z655pT8mP61QVSDc1qpnlMu3N/QUCsWW/2TXN6ULFIBL7R939CsqWBxDMoInisCeIQ==
X-Received: by 2002:a17:90b:370d:: with SMTP id mg13mr12031727pjb.117.1629354552228;
        Wed, 18 Aug 2021 23:29:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d13sm1848559pfn.136.2021.08.18.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:29:11 -0700 (PDT)
Date:   Wed, 18 Aug 2021 23:29:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 05/13] kbuild: remove stale *.symversions
Message-ID: <202108182328.5CF89AC2@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-6-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-6-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:36AM +0900, Masahiro Yamada wrote:
> cmd_update_lto_symversions merges all the existing *.symversions, but
> some of them might be stale.
> 
> If the last EXPORT_SYMBOL is removed from a C file, the *.symversions
> file is not deleted or updated. It contains stale CRCs, which will be
> used for linking the vmlinux or modules.
> 
> It is not a big deal when the EXPORT_SYMBOL is really removed. However,
> when the EXPORT_SYMBOL is moved to another file, the same __crc_<symbol>
> will appear twice in the merged *.symversions, possibly with different
> CRCs if the function argument is changed at the same time. It would
> cause potential breakage of module versioning.
> 
> If no EXPORT_SYMBOL is found, let's remove *.symversions explicitly.

Ah, and this was an issue for non-LTO builds too? Regardless, nice
catch.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 279363266455..585dae34746a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -177,6 +177,8 @@ cmd_modversions_c =								\
>  	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
>  		$(call cmd_gensymtypes_c,$(KBUILD_SYMTYPES),$(@:.o=.symtypes))	\
>  		    > $@.symversions;						\
> +	else									\
> +		rm -f $@.symversions;						\
>  	fi;
>  else
>  cmd_modversions_c =								\
> -- 
> 2.30.2
> 

-- 
Kees Cook
