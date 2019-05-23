Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05562741E
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2019 03:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfEWBui (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 May 2019 21:50:38 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39938 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbfEWBuh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 May 2019 21:50:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id j12so6665975eds.7;
        Wed, 22 May 2019 18:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oddqsgNWczkwuqesv95qBJ9yXTJN46R5PDwAq1KqSuY=;
        b=aE9PiYEX2wy7ssVosroTZOHl5CLF18ef5dLFUsUxW7VXYfkRWTQpUVsHCtIQkKECVy
         gs9zjwxwuhO82pf3HxwXR914wP/Hqd1CS33Ijeq/daQRLm9OBjB4/LNOL/Q6Ul27iTB5
         etZQ6F12cvvuLLITHuLIpt+WgNj+rD0bcMPuD2k/0Rf0X+FH8+l8qRn7IonGfQmkGhCO
         xxujw6AZohVLMNmjpY3LkmnFvyNY3/hFhNk6hwkTGCDBd/uM5rBddYPIrPCud/M32oTM
         iaN38FJB0vUczQeq9FiLo85H/Sb3QpokKQMRaEXyAuG8m35gWI5gyv1m+wQdZSYYCWHT
         mheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oddqsgNWczkwuqesv95qBJ9yXTJN46R5PDwAq1KqSuY=;
        b=emXY3Pd1cMIHS5roZ1me/qzK0kia1bIvUVNC5h8IUW+0tJy7Yisf5tJvVty6oJ6jMw
         tg3bG2NtjY412QUvqznq1wJsrbC9OX+wFb8rTAoQTjmeKVcEPoUsLkoVTdeZ08wdMuka
         5Po2zsE0P3RR7pyZypHVYr3BV/V9mPtBEBmdtn7IW9HcZj/JEXaoRBUIFj4hHbWWscO0
         XpQd2PHPFH8uUBwlDHfYNo+VyQa+C28LZsbDa9CtOpMbqkBvg/YW54qQMUb5kqJCJBI7
         dI2YFsqm01xNC7i9truzUxfhlK8pvlbfSLJB1cLv+kt3C5QMF+75kHdc75GIocm8Ma6f
         G1ZQ==
X-Gm-Message-State: APjAAAUn5V+2Fgnkwfu5T2TZr2U8XWKvFCqx9ncuUooAU8Cqf2uyteeK
        tBtdSw6/bJDIt8MnDroW6l0=
X-Google-Smtp-Source: APXvYqxlc2ObsoICzqRuCzVUcSOIlUeAnFw3Oc1DNP5vA/vmgYQyFR6QQt3lUtJnhCZxePDQ9W1XYg==
X-Received: by 2002:a17:906:a302:: with SMTP id j2mr58441900ejz.155.1558576235977;
        Wed, 22 May 2019 18:50:35 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id e9sm7293965edq.39.2019.05.22.18.50.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 18:50:34 -0700 (PDT)
Date:   Wed, 22 May 2019 18:50:32 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Message-ID: <20190523015032.GB17640@archlinux-epyc>
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
 <20190430093352.GA16941@archlinux-i9>
 <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 30, 2019 at 11:46:44AM +0200, Arnd Bergmann wrote:
> Ah, I thought they were all fixed, as I don't see any remaining warnings
> in my tree. It seems that I never send this workaround for
> DECLARE_WAIT_QUEUE_HEAD_ONSTACK:
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index 5f3efabc36f4..cbe1ea0fce84 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -68,8 +68,15 @@ extern void __init_waitqueue_head(struct
> wait_queue_head *wq_head, const char *n
>         } while (0)
> 
>  #ifdef CONFIG_LOCKDEP
> -# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) \
> -       ({ init_waitqueue_head(&name); name; })
> +# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) {
>                  \
> +       .lock           = __SPIN_LOCK_UNLOCKED(name.lock),
>          \
> +       .head           = ({
>          \
> +               static struct lock_class_key __key;
>          \
> +               lockdep_set_class_and_name(&(name).lock, &__key, #
> name);       \
> +               (struct list_head){ &(name).head, &(name).head };
>          \
> +       }),
>          \
> +}
> +
>  # define DECLARE_WAIT_QUEUE_HEAD_ONSTACK(name) \
>         struct wait_queue_head name = __WAIT_QUEUE_HEAD_INIT_ONSTACK(name)
>  #else
> 
> Are there any others you see?
> 
>       Arnd

Hi Arnd,

Were you planning on sending this out for review? It would be nice to
get these fixed so we can get this warning enabled.

I am bumping the other patches/inquiries I have sent now.

Cheers,
Nathan
