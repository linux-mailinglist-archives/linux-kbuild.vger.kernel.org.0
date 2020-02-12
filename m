Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF55215A928
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 13:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgBLM2y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 07:28:54 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38362 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgBLM2y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 07:28:54 -0500
Received: by mail-pj1-f66.google.com with SMTP id j17so837564pjz.3;
        Wed, 12 Feb 2020 04:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o6YHmTmd7GelSUnBu81RYSqne6glWPQqZ5iKt8T5eF4=;
        b=g8U/Fx8wOh6YZnfn4GfBs3/ZWT2ZsOkiSx4Nu6I52ueuzKY7+C1AXLqU76GHn/94m5
         LF2VLfB41JcZzqs/NGHZJ2sJA5AQXB4sX0BLdBgcHGlClGEDdGIZWubiXmzrUXlo4rZd
         f/qaXOcpAhvE2H8vhUf4c5PqVMXigYkrzctJupL+ki3oqng1TuEq6g33S73SlrUktME1
         0Dio3bUBb7OIX7AjywQTfHqt1c4b1sZPhNn/C2LQu5MEfFG7VTJYD8oCY75qVth8J7lZ
         kdzfPqXd/X8EI7CmIMr94e92/0BDUmta8Zh9PD5HgFVMhB1jDIirP0EjLUyEXiuPlGof
         4ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o6YHmTmd7GelSUnBu81RYSqne6glWPQqZ5iKt8T5eF4=;
        b=kL2ZoXL6azH5cARflJTpKkcVlIkls3wi7bQVQG9O7rOPeF59cGhtJawEoROSltvtX2
         t+tWizx876L9FyARtcxNyOfltaYkoTYF0KO65VEt1j+u6mm6mwReuhlTUJY8/12udYX+
         lr81MjhQb3kjqOUOSRRZLetvUB46UShrM/bMCeYXyCD5CDPW6KAgilmoqpWQ4Urp04kR
         77suFssTNI+rRypnS6+h0LEvTERD3EnnWoqN9PQGTw91avKwr93oeQ2Esru55W56Ug/x
         bDmkj4ujr/KurIQAO5tn9rM6y7TZ2t1f+yG/gNjspl3bOp25xYxrL2M3gt04Muj5sOAQ
         T2Sw==
X-Gm-Message-State: APjAAAXadDAK/WVRb887ObxuQy4HPEqHLKTVko4eQdjG9pWkwjxlFH4u
        XX5d87fk0NSNZt6mtS/XXgpY0+LCIBndyA==
X-Google-Smtp-Source: APXvYqzgDNJ68+G9or86b3sOYFLL0hLe5xSeJtl038OZMcSSm/cPagZ7IYU+SZkzkwUUaqYtLRY/HA==
X-Received: by 2002:a17:90a:de05:: with SMTP id m5mr5540219pjv.10.1581510533922;
        Wed, 12 Feb 2020 04:28:53 -0800 (PST)
Received: from mail.google.com ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id y1sm293953pgi.56.2020.02.12.04.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 04:28:50 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:28:42 +0800
From:   Changbin Du <changbin.du@gmail.com>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SANITIZE_xx.o & SANITIZE and apply them to x86
Message-ID: <20200212122840.5p3kvijii3qboltt@mail.google.com>
References: <20200201062459.7150-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200201062459.7150-1-changbin.du@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello, Any comments? Thanks.

On Sat, Feb 01, 2020 at 02:24:57PM +0800, Changbin Du wrote:
> These two patches add SANITIZE_xx.o and SANITIZE to disable all sanitizers for
> specific files, and apply them to x86 booting code.
> 
> We need to disable UBSAN for some of ealy stage code:
>  o For code which could operate in one-one mapping mode. In this case,
>    kernel would crash at accessing data parameter when invoking UBSAN
>    handlers.
>  o Since UBSAN handlers are instrumented by KASAN, so invoking UBSAN
>    handlers before KASAN is initiated also is not allowed.
> 
> Changbin Du (2):
>   sanitize: Add SANITIZE_xx.o and SANITIZE to disable all sanitizers for
>     specific files
>   x86: Disable both KASAN and UBSAN for some booting code
> 
>  Documentation/dev-tools/kasan.rst | 12 ++++++++++++
>  arch/x86/boot/Makefile            |  2 +-
>  arch/x86/boot/compressed/Makefile |  2 +-
>  arch/x86/entry/vdso/Makefile      |  3 +--
>  arch/x86/kernel/Makefile          | 10 +++++-----
>  arch/x86/lib/Makefile             |  2 +-
>  arch/x86/mm/Makefile              |  4 ++--
>  arch/x86/realmode/Makefile        |  2 +-
>  arch/x86/realmode/rm/Makefile     |  2 +-
>  scripts/Makefile.lib              |  4 ++--
>  10 files changed, 27 insertions(+), 16 deletions(-)
> 
> -- 
> 2.24.0
> 

-- 
Cheers,
Changbin Du
