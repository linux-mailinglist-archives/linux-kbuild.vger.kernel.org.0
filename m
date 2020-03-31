Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0858A198B5E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 06:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgCaEi5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 00:38:57 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:53635 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgCaEi5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 00:38:57 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ec0ea55;
        Tue, 31 Mar 2020 04:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=4xA7jC+ZD8sX6wJlgYO0F2oy+Ys=; b=cl8Isx
        +KI/ZodqYOK4/BXPxvizoZBPXNXBWgoyWpdJdbKx0ZRUSSvWziYMTFCJxT+31R8r
        JJxP3MeqqNApoy+7rZ05UBB9ADTbAP9X2cdK7Ic8GkqqG4pjuX5gRHgYLoiyPfF4
        RfG3rmQS774MOQjohk7/pId3gsWNZwR9SmtglYZSc6T3Zze/hIJzHhGEr2G/4e5r
        gbKqwy1ko+Cc5aysbRY7tIhUAvRXAfz0XBUyyVqm/dc7JVFA1/XauK0/bMpqCMyg
        hb2gRkm0AWAqzJfV7vKqCdcDC67RrnhKLj0Am15C5y8mPME5GNg5xMsetcCxdNYm
        yIiuKVKPlr1GOJXQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bdfab12a (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Tue, 31 Mar 2020 04:30:56 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id 7so18166613ill.2;
        Mon, 30 Mar 2020 21:38:54 -0700 (PDT)
X-Gm-Message-State: ANhLgQ32N+zFCrnTMvB/xCZ1to6k+FhiJfPJGyFctREYOBuqiYJ5baI0
        BYNaOIo1FFmSQw7Rr3+9UeFpyC8SwgtToIogsrU=
X-Google-Smtp-Source: ADFU+vsdpGfW3V/Hfu+zZCgsdChe6aVmz5RF8UH/9swirXMwTE2kIkYwzbIYbPZKUbkvd+bF1EP9zzM5m88jPBNLRIY=
X-Received: by 2002:a92:d785:: with SMTP id d5mr14420226iln.207.1585629533774;
 Mon, 30 Mar 2020 21:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-9-masahiroy@kernel.org>
 <CAK7LNARueG4wM-_z+xDjwHci=wwAad8CqP1UF5mFJpPf8Zg71Q@mail.gmail.com>
In-Reply-To: <CAK7LNARueG4wM-_z+xDjwHci=wwAad8CqP1UF5mFJpPf8Zg71Q@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Mar 2020 22:38:41 -0600
X-Gmail-Original-Message-ID: <CAHmME9q=Ymmot+c55uQGxy+ztc6ZMgiM0340RGF8wcE3D3TtvQ@mail.gmail.com>
Message-ID: <CAHmME9q=Ymmot+c55uQGxy+ztc6ZMgiM0340RGF8wcE3D3TtvQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] x86: replace arch macros from compiler with CONFIG_X86_{32,64}
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 30, 2020 at 8:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Also, I slightly prefer
>
>    #if defined(CONFIG_X86_32) && !defined(CONFIG_UML)
>
> to
>
>    #if defined(__i386__) && !defined(__arch_um__)

I would much prefer that too.

At some point it'd be nice to see this whole mess cleaned up with UML.
I've seen this a few places -- UML thinks its x86, except where it's
not, and then there are problems. For example, a lot of SIMD related
code has this.

Jason
