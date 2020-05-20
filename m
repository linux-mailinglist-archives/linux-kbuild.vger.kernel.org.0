Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DE91DB305
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2020 14:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgETMSt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 May 2020 08:18:49 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41287 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgETMSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 08:18:49 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 04KCIMJ9022097;
        Wed, 20 May 2020 21:18:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04KCIMJ9022097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589977103;
        bh=g0zQPGJX5aE8iJ6qIRev+jPwAR5NWJr805RkASX1zTI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zJCoavnr9CixnplYluA9RyMAFjamyvoqQIyAE+p+amiGPrfqveVZHLzxsYL3jBM0Z
         pqC+OQRHyzu4cxF5TvQZUsh09zyAdPU4uM+pl0Yi5qtnG+Y9YqLOoE7razAEK0gbb/
         sZsG2u58E0UJknDCzuT1V5y7p4h8dOItt/Twd7Ti3VHw7yvAZqcpHGQDkZRZxjqbQ/
         F6P48TyibU63KS87UtN3umI0cpbz8fNqIoUR8s0B/onheyh5rZmZbzbmB2ZaYZjwq7
         dyeGsbBr7jGYBMabATN9MYcB4YKoE4CSww3k1X0jtbZY33zKQUp5tzsSGfg0RRb6CY
         F9JLfnNEConGw==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id 1so1661502vsl.9;
        Wed, 20 May 2020 05:18:22 -0700 (PDT)
X-Gm-Message-State: AOAM531N5abF0iWdqDlqQVdE+bW7qYnS9GN4a4jiY9/H8XqCbTJwkEqI
        crYYGtSc7kmovWw9m+dmOR9xRL7fttcu0vqRkbQ=
X-Google-Smtp-Source: ABdhPJwS8xCBVayubCaHlqPYv6nB0mPqnUm6GC4Vnnq6e4EwAfmP7hY7SDE4Ws5oW5RVzm9M3oIuNl09taV32lbtlB0=
X-Received: by 2002:a67:d016:: with SMTP id r22mr2799400vsi.215.1589977101116;
 Wed, 20 May 2020 05:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org> <20200519102133.GA279905@hirez.programming.kicks-ass.net>
In-Reply-To: <20200519102133.GA279905@hirez.programming.kicks-ass.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 May 2020 21:17:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com>
Message-ID: <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com>
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line() helpers
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 19, 2020 at 7:21 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, May 17, 2020 at 06:48:33PM +0900, Masahiro Yamada wrote:
>
> > +char *read_text_file(const char *filename)
> > +{
> > +     struct stat st;
> > +     int fd;
> > +     char *buf;
> > +
> > +     fd = open(filename, O_RDONLY);
> > +     if (fd < 0)
> > +             return NULL;
> > +
> > +     if (fstat(fd, &st) < 0)
> > +             return NULL;
> > +
> > +     buf = NOFAIL(malloc(st.st_size + 1));
> > +
> > +     if (read(fd, buf, st.st_size) != st.st_size) {
>
> Is this sensible coding ? I've always been taught read() can return
> early/short for a number of reasons and we must not assume this is an
> error.
>
> The 'normal' way to read a file is something like:
>
>         for (;;) {
>                 ssize_t ret = read(fd, buf + size, st.st_size - size);
>                 if (ret < 0) {
>                         free(buf);
>                         buf = NULL;
>                         goto close;
>                 }
>                 if (!ret)
>                         break;
>
>                 size += ret;
>         }
>
> > +             free(buf);
> > +             buf = NULL;
> > +             goto close;
> > +     }
> > +     buf[st.st_size] = '\0';
> > +close:
> > +     close(fd);
> > +
> > +     return buf;
> > +}


In theory, I think yes.

But, is it necessary when we know
it is reading a regular file?



The specification [1] says this:

"The value returned may be less than nbyte if the number of bytes
left in the file is less than nbyte, if the read() request was
interrupted by a signal, or if the file is a pipe or FIFO or
special file and has fewer than nbyte bytes immediately available
for reading."


This case does not meet any of 'if ...' parts.

[1] https://pubs.opengroup.org/onlinepubs/000095399/functions/read.html


-- 
Best Regards
Masahiro Yamada
