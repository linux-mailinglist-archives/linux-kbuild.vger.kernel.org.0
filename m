Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D5922C721
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 15:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXNzg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 09:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgGXNzf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 09:55:35 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AEAC0619D3;
        Fri, 24 Jul 2020 06:55:35 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a1so7077279edt.10;
        Fri, 24 Jul 2020 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bmFz7cHe6FXncDvQc9pcir1rKoTqKWeDI3/7YT3MhQw=;
        b=mvFJOEB4reBPoVZNhFMX0sz/P47ysC3LXwOpKC53C3V3a/n5FUk6LJQwDfD3qqTEFN
         UAtu50snoubFDkeqeeEA6g2QILZWsFsh7Uu+GXbmB39r/bD2WHQAynF+hd75KaiHkDy7
         8P8bmkjuF3OnZ4PUWK7j2maGdV3SRxdvIar2kq7t7Awj4WswaEM4iGdWd7a8kEx1+k72
         NXkjhcc+oxLoIeyj+e4cYkuq8IyxS07SCPH6YyZCLELVtIL5dh1e4HRsyfSrpH/N48dF
         I+oCXLNnu4tCazuvWruKtHgH9PjcE5ywp9Hnbx9C+PjrdtHzjvRM9M0/guU6+4DAPgUc
         5UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bmFz7cHe6FXncDvQc9pcir1rKoTqKWeDI3/7YT3MhQw=;
        b=R8qtMgFoovM5UQHfK2NZtNlozxGd1Rh0s13JUtwJjNTilMgT9Tvt+W6+5cdLz8Pzqo
         XRffXzPs1EDRih2s0PK8rvup3w+Tan8RpmZz0EnTIEy7Rw+W9BNbrkJyKeoTksyuvs+d
         +etbPm9HKOaWgvNYZ6epNX3xYtNacQSAkGuXd1GZdEGPOQ+pMF3tMlrwft7tYavPuL/H
         ix5RTqs7F7aeursFI9Z18EYyBtuc83UtLvAA6SkrgTluka3ggfkjFJZ8NV4K2yOTXvjw
         s6FZVdNjpLGPUcJO1StgWRI9J7nHwWyfixtgf3hVB4wpDna/X1c7uhx/LghCVdFLajAr
         vNRQ==
X-Gm-Message-State: AOAM530HZBTEqCg7xqxoBFuvHw4rIeagDAQaeqi55zNhHndL/TJUA+zX
        kTh4QsdMb2zLCLFRZJfKq10=
X-Google-Smtp-Source: ABdhPJy1S3uyp9RG31NrgjgypWQdqbo8eySe/kk3lS+aH9O2qTBtvNLiRVmi5VzrWW0hZojtqZx56Q==
X-Received: by 2002:a05:6402:319b:: with SMTP id di27mr9180215edb.133.1595598934297;
        Fri, 24 Jul 2020 06:55:34 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id cc9sm809400edb.14.2020.07.24.06.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 06:55:33 -0700 (PDT)
Date:   Fri, 24 Jul 2020 15:55:31 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Huaixin Chang <changhuaixin@linux.alibaba.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     jpoimboe@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: Re: [PATCH 1/3] scripts/sorttable: Change section type of orc_lookup
 to SHT_PROGBITS
Message-ID: <20200724135531.GB648324@gmail.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200723034643.33537-2-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723034643.33537-2-changhuaixin@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Huaixin Chang <changhuaixin@linux.alibaba.com> wrote:

> In order to edit orc_lookup table via sorttable, type of section
> orc_lookup needs to be SHT_PROGBITS instead of SHT_NOBITS.
> 
> Linker script doesn't seem to allow manual specification of the section
> type, so just write a byte into the section instead.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
> ---
>  include/asm-generic/vmlinux.lds.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index db600ef218d7..49f4f5bc6165 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -826,6 +826,8 @@
>  		. += (((SIZEOF(.text) + LOOKUP_BLOCK_SIZE - 1) /	\
>  			LOOKUP_BLOCK_SIZE) + 1) * 4;			\
>  		orc_lookup_end = .;					\
> +		/* HACK: force SHT_PROGBITS so sorttable can edit: */	\
> +		BYTE(1);						\

Cc:-ing Masahiro Yamada, maybe there's a cleaner solution to this?

Thanks,

	Ingo
