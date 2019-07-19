Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968D06E40D
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2019 12:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfGSKOG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jul 2019 06:14:06 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34076 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfGSKOG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 06:14:06 -0400
Received: by mail-qt1-f195.google.com with SMTP id k10so30410160qtq.1;
        Fri, 19 Jul 2019 03:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEA/qYrslnJQSaGGlFD67XDakglb2NrPc4LdtRzasUM=;
        b=S1oS7rABdAEOFS9JfqV/L4sngaCmiBEzl18rCQWH0Tr9zowRB3RTOpw5DSX1W/HHwp
         p5rtnvAdoP4i0PM1N74DXHzL9QksXFUG9lLnRdmsxGqsA7c+daY0qttUGayKzr6Euc2F
         U87UMPV3mfaTBd/K1/od1YKQWEGhrCOEXjgkXadKqxi+Y9/mXI1SJdMZLeVa3w5vecCq
         l5GIfkQ+vjL/U7oTCekF89a2LlIcjXb17h07+eQWHoy4Hdja1qg2uh7Lj8AFxzqt/O6S
         7CKLlwrSSIRWgjCPwIr8oNd2nVFZMayrUyGwGj59cYI2UG02rdmkYcjZ5rjw9BclAgFQ
         qpjA==
X-Gm-Message-State: APjAAAWlqYZJxxNQb5Q5BZN4U8Hf8kqLSPs7n+vEzI/U1L4HLt1Ftb7s
        V6dOO2EhvKIQEW5Fd13XaqGVLZtC03uuGxY1f1Y=
X-Google-Smtp-Source: APXvYqwx+hz1jgDJSNdK+FPtkfEYjlkByMGj0qO/PIQ8lNunHQmzt6oVVr/kPQZSfG2Cnl5IgmmSIuzKVVlzBnQSFQw=
X-Received: by 2002:aed:3e7c:: with SMTP id m57mr36413863qtf.204.1563531244937;
 Fri, 19 Jul 2019 03:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190719100859.11227-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190719100859.11227-1-yamada.masahiro@socionext.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 19 Jul 2019 12:13:48 +0200
Message-ID: <CAK8P3a13WKoDCTRk-PpF5Efi2JUu-e-hMt2vmgrnvuybO-sROw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: disable compile-test of kernel headers for now
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 19, 2019 at 12:09 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This compile-test started from the strong belief that (almost) all
> headers should be able to be compiled as a standalone unit, but this
> requirement seems to be just annoying.
>
> I believe compile-test of exported headers is good. On the other hand,
> in-kernel headers are not necessarily supposed to be always compilable.
> Actually, some headers are only included under a certain combination
> of CONFIG options, and that is definitely fine.
>
> This test is still causing false positive errors in randconfig.
> Moreover, newly added headers are compile-tested by default, sometimes
> they catch (not fatal) bugs, but often raise false positive errors to
> end up with making people upset.
>
> The merge window is closing shortly, so there is not much I can do.
> Disable it for now, and take a pause to re-think whether we should
> continue this or change the course.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

FWIW, I only saw occasional failures for one file (linux/iomap.h)
when doing many randconfig builds across x86, arm32 and arm64.
I think those are fixable, but disabling it for the 5.3 is clearly the safer
option.

       Arnd
