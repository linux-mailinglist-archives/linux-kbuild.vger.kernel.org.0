Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101BE2F6343
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 15:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbhANOg6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 09:36:58 -0500
Received: from ms.lwn.net ([45.79.88.28]:58170 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbhANOg6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 09:36:58 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 44FAC6139;
        Thu, 14 Jan 2021 14:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 44FAC6139
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610634977; bh=F2VJ1UToobXEetmaLg/4ARcDoIjgtCQM7tPnz9vsCDU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ltgp16RWcrip2SK0lkqlmCPKozGMg1UCjeH6yHfJKRdKBK6XFaubgmXpyr8Xixznr
         TLNiCldjZl+/k0U6FXq7Nj51WUCsqg8MY9Nwq70GViyZZcqWX8BG76vOLxxLvTqVOQ
         hOvUdqlVyrVTXktD0HTXNl8UZXNhqcSv54GCYeAO3fOGtK9wYxFITcg6STCjYzVVZ7
         8gI7AVm7TwRYLNBTPyOUhtgcrcnMCXj1DlHBlG2BcG5SPmhGjm/Jg/oLCGjWO+y8Aq
         PPciU0qH+n9LnaJLyMQBXL1kPUhUd1f/6luLB9xE+Llp5MbGaaiLKCeTHEu3ehKyDQ
         I7HkGcyOWqp4w==
Date:   Thu, 14 Jan 2021 07:36:15 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported
 architectures
Message-ID: <20210114073615.6b9add58@lwn.net>
In-Reply-To: <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
References: <20210114003447.7363-1-natechancellor@gmail.com>
        <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 13 Jan 2021 17:19:59 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> Patch looks fine, but `make -j htmldocs` seems to be taking forever
> for me so I can't render it. Is this a known issue?
> 
> $ make -j htmldocs
>   SPHINX  htmldocs --> file:///android0/linux-next/Documentation/output
> make[2]: Nothing to be done for 'html'.
> WARNING: The kernel documentation build process
>         support for Sphinx v3.0 and above is brand new. Be prepared for
>         possible issues in the generated output.

Sphinx 3.x is *way* slower to build the docs, alas.  One of many
"improvements" we got with that change.

jon
