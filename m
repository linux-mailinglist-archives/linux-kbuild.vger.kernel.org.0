Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8952679E3DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Sep 2023 11:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239287AbjIMJh0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Sep 2023 05:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbjIMJhZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2023 05:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACBD819AD
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2023 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694597798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DJ+QIh3H2QPLinO4CDP/6iKCpBl9xv64ep1natwynMA=;
        b=X6CIjgD96s3Drp0rOP402PbxAojpwCXAUKzgcPNzTFTM4lAHC6PcEDGp3Ce6KxyBcr+WsS
        xVqd34Ppdc6oq4vNSWpkKC6QNvg2YZqKGY5eNgmiwTdEUFD2KGHb+RCj83kiIpLx159bhn
        QyNjBQpuzf94T5rYcNDuPsqzALKkW0Y=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-8yz22NuaM7Gc9_TpKBGp_g-1; Wed, 13 Sep 2023 05:36:37 -0400
X-MC-Unique: 8yz22NuaM7Gc9_TpKBGp_g-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3ac97b9577cso1494952b6e.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2023 02:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694597797; x=1695202597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ+QIh3H2QPLinO4CDP/6iKCpBl9xv64ep1natwynMA=;
        b=RlZ1RyXFknxkk9OYkElcb8kugCXv9pTRgVrIaTklPKmL+Rv7aBMXJETHdzjjaAczDp
         dEDbbxTnYogleGRo2enHF5qF6z2Ri3QzHb/jXcfLz3M4M/0O7jtditi1+2s27R6pNZ4l
         ENjLK4+rx1NXDsVkPE8/EBkuog71KxCF8HO+k7+/5Bx305fK0Y+/YwCy0YPXbAzi4kdy
         slYi2hJ5HxeL8HczOeZtnqsN7u1bCuPouFMbfXnhezjWOl6BvfwT8yoSt5J3fpn4ollT
         G5gO7r9KbU8YM4vvTUummv46aRuaQzLS9hgGy+sNABGZgohwVkKDXg29zHaX/mjrpJSZ
         KQnQ==
X-Gm-Message-State: AOJu0YwK2TBW2x/UBF11v0Uv+PTuFjzGik/W7ajxQOyYPcfrv/jnLszV
        2tgpwaPvElVxqL3j95XlO/G0IaLoDtup5UUb2SvhGDUTwcmafIHorvdJxuiJYSBW5s22h2MqMME
        xDsJtcCaXZ+DEgKh4Wd+HlKqH
X-Received: by 2002:a05:6808:3ce:b0:3a7:4914:23ce with SMTP id o14-20020a05680803ce00b003a7491423cemr2063426oie.18.1694597796841;
        Wed, 13 Sep 2023 02:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvjKOmMhtyjJ532/geuZfUf3OFFZTDFonEaSQPBLq+sck2pHXEaLfPfI857g5j08bJ8heIFQ==
X-Received: by 2002:a05:6808:3ce:b0:3a7:4914:23ce with SMTP id o14-20020a05680803ce00b003a7491423cemr2063411oie.18.1694597796633;
        Wed, 13 Sep 2023 02:36:36 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id a11-20020a05680802cb00b003a1d29f0549sm4978523oid.15.2023.09.13.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:36:36 -0700 (PDT)
Date:   Wed, 13 Sep 2023 06:36:31 -0300
From:   Leonardo Bras <leobras@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] scripts: Introduce a default git.orderFile
Message-ID: <ZQGCnwDMTQ6cH2ZJ@redhat.com>
References: <20230913075550.90934-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913075550.90934-2-leobras@redhat.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CC: linux-kbuild@vger.kernel.org
(typo on the original Cc: line)


On Wed, Sep 13, 2023 at 04:55:50AM -0300, Leonardo Bras wrote:
> When reviewing patches, it looks much nicer to have some changes shown
> before others, which allow better understanding of the patch before the
> the .c files reviewing.
> 
> Introduce a default git.orderFile, in order to help developers getting the
> best ordering easier.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> 
> Please provide feedback on what else to add / remove / reorder here!
> 
> Changes since RFCv3:
> - Added "*types.h" matching so type headers appear before reguler headers
> - Removed line ends ($) in patterns: they previously provided a 
>   false-positive
> - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
>   in any subdirectory
> 
> Changes since RFCv2:
> - Fixed licence comment to from /**/ to #
> - Fixed filename in how-to comment
> - Fix build order: Kconfig -> Kbuild -> Makefile
> - Add *.mk extension 
> - Add line-ends ($) to make sure and get the correct extensions
> - Thanks Masahiro Yamada for above suggestions!
> - 1 Ack, thanks Randy!
> 
> Changes since RFCv1:
> - Added Kconfig* (thanks Randy Dunlap!)
> - Changed Kbuild to Kbuild* (improve matching)
> 
> 
>  scripts/git.orderFile | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 scripts/git.orderFile
> 
> diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> new file mode 100644
> index 000000000000..7cef02cbba3c
> --- /dev/null
> +++ b/scripts/git.orderFile
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# order file for git, to produce patches which are easier to review
> +# by diffing the important stuff like header changes first.
> +#
> +# one-off usage:
> +#   git diff -O scripts/git.orderFile ...
> +#
> +# add to git config:
> +#   git config diff.orderFile scripts/git.orderFile
> +#
> +
> +MAINTAINERS
> +
> +# Documentation
> +Documentation/*
> +*.rst
> +
> +# build system
> +*Kconfig*
> +*Kbuild*
> +*Makefile*
> +*.mak
> +*.mk
> +
> +# semantic patches
> +*.cocci
> +
> +# headers
> +*types.h
> +*.h
> +
> +# code
> +*.c
> -- 
> 2.42.0
> 

