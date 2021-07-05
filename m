Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6037B3BC398
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 23:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhGEVYt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 17:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhGEVYt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 17:24:49 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868EFC061574
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Jul 2021 14:22:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y40so10007390ede.4
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Jul 2021 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qj1RjVkM55kHvOSn6n0LxTZwImwi8n8u+WJ7wOE6JEY=;
        b=OiX2AOEwia1UKszON4vbQSLCiR8eU3kGF0ykE24SYRu7s5N4NGuNXlsiRL4iXr3bzx
         DpQjADv59Rfax4Wz1sq4Zm10Ft8o2gU5TZAqrXZdL4dWQUnVahuGSSExd5BYvojzu5Ph
         KjLGkU4WydKtW0EgYF4tDCltg/EZk1rDTtHFd+ieDURrFNw1+XGDwH+n8GtusNcrRbGb
         Dh4Y2qW91Oi9/QERfJiwimrEniaX+ygYWDpmp2foqV52kFZsdi24AVhsk5flk0iF+4r6
         YJ1VBVM/5tSprXIUwzGMRJm9Sn2z4Zxpgth0Jppony+5ppAdYFIE/uIMDjzgy7XwTUpR
         S0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qj1RjVkM55kHvOSn6n0LxTZwImwi8n8u+WJ7wOE6JEY=;
        b=sfcEluzEFmDbMnKCJ9K3Z4nsYuNOOt628rr7vrKmDg8PSm8NEXHzUvJd83Js5asI/w
         IIcYUXfM7sQTGlyIeqXQM+70AIFCCILuY0HYgn483UV2fW3h6uuWGoe+1rcKv0kDsrOM
         BUf9tcdMklNtjxTf3tpzUsgEnzJNQlWMMU7UEnOx7lSGIad5IpHhvcMAb8O0INieoE78
         oh5iLk9jwyrXkJPMCSrtB0kAHOuSIJyMb7yVoW85vORAHy9B/hHqQG7DP3OYeNdgREbN
         xgYMiZ23wPfz3vfCQ69J6hxBZWuC8F1ksHsce24/GSnRDIQUIkxZ11EdCIgyQZaTHBqH
         VSqw==
X-Gm-Message-State: AOAM5338v8yDf9XIzHEKCmjqkSdCYrctuq9Dky7AOkB/oO7Z2nta0I4k
        DS1/kxGWCntU+TDjTY5Npw==
X-Google-Smtp-Source: ABdhPJzPlcCMH4fPtuBWWuLjtPTu20vaqy/0ciAe8sBIGblwACc4mq5dUbUmxs+Uye85nLxzZZdlEw==
X-Received: by 2002:a05:6402:c91:: with SMTP id cm17mr18438889edb.123.1625520130104;
        Mon, 05 Jul 2021 14:22:10 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.122])
        by smtp.gmail.com with ESMTPSA id n11sm4964879ejg.43.2021.07.05.14.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 14:22:09 -0700 (PDT)
Date:   Tue, 6 Jul 2021 00:22:08 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] cc-can-link.sh: check for linking capability in a more
 robust way
Message-ID: <YON4AKdi9ISn3gvk@localhost.localdomain>
References: <YOBIRA8oXQh4Antq@localhost.localdomain>
 <CAK7LNASnUV7i17QKAULLVmbS4=fBE1Lcm=8uH6rfwmT-CAkY2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASnUV7i17QKAULLVmbS4=fBE1Lcm=8uH6rfwmT-CAkY2w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 06, 2021 at 01:33:45AM +0900, Masahiro Yamada wrote:
> On Sat, Jul 3, 2021 at 8:21 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >
> > Compiling "printf("");" doesn't necessarily check for linking capability
> > as printf can be optimised for constants strings even at -O0:
> >
> >         0000000000401106 <main>:
> >           401106:       push   rbp
> >           401107:       mov    rbp,rsp
> >           40110a:       mov    eax,0x0
> >           40110f:       pop    rbp
> >           401110:       ret
> >
> > Pass something from the command line to disable optimisations:
> >
> >         0000000000401126 <main>:
> >           401126:       push   rbp
> >           401127:       mov    rbp,rsp
> >           40112a:       sub    rsp,0x10
> >           40112e:       mov    DWORD PTR [rbp-0x4],edi
> >           401131:       mov    QWORD PTR [rbp-0x10],rsi
> >           401135:       mov    rax,QWORD PTR [rbp-0x10]
> >           401139:       add    rax,0x8
> >           40113d:       mov    rax,QWORD PTR [rax]
> >           401140:       mov    rdi,rax
> >           401143:       mov    eax,0x0
> >           401148:  ***  call   401030 <printf@plt>
> >           40114d:       mov    eax,0x0
> >           401152:       leave
> >           401153:       ret
> >
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >
> >  scripts/cc-can-link.sh |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > --- a/scripts/cc-can-link.sh
> > +++ b/scripts/cc-can-link.sh
> > @@ -3,9 +3,9 @@
> >
> >  cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
> >  #include <stdio.h>
> > -int main(void)
> > +int main(int argc, char *argv[])
> >  {
> > -       printf("");
> > +       printf(argv[1]);
> >         return 0;
> >  }
> >  END
> 
> Ah, right.
> 
> But, we should not merge a bad coding example.
> 
> argv[1] may contain '%' format string, and
> recent GCC versions warn about it.
> 
> 
> 
> $ cat test.c
> #include <stdio.h>
> 
> int main(int argc, char *argv[])
> {
>     printf(argv[1]);
>     return 0;
> }
> $ gcc -c -o test.o  test.c
> test.c: In function ‘main’:
> test.c:5:5: warning: format not a string literal and no format
> arguments [-Wformat-security]
>     5 |     printf(argv[1]);
>       |     ^~~~~~

> I think replacing printf("") with printf("a")
> (or any string you like)
> is enough.

I get putchar() for "a". puts(argv[1]) works too.
I think argv[1] should be used to defeat optimisers, current and future.
