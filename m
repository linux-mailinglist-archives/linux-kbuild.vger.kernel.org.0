Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B43336E46E
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 07:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbhD2FVo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 01:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhD2FVn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 01:21:43 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FF7C06138B;
        Wed, 28 Apr 2021 22:20:57 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id l7so1665838ybf.8;
        Wed, 28 Apr 2021 22:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=5a+doWvCrDoneaEbHIt4M6EKA+mAvMd79RmvxJp1T6c=;
        b=s6yCkN8WCq8aIDz1642ZJ25bEzQZ8H3UHdLcOc1VPYrhpC3dPMZ6aSBKna5MozQ+5/
         L9OcQs+ERFgtndAgzs1LaqFjHuUwI4TSD9EbE8YqZuufOudbQpoCn/1JrBShkL8Hixe1
         AVw0r9UmaVveLzj5tTEgX3hTcbu/oOZZObz6sf4+avQTPXwftDWLi31pMDEYxAjiiDXW
         9a2UfFmgTDMuK+yUDVizhGwyuYKrhc8PSZV1lmx7nzwg1MFtCVBgfjf/V/HjzWmfwQfN
         dtL1OKjAYDXMyLsA+lFgJ1offIU95t600c42FbR6npRrvLpXI9q8GzsF2N8IcEYJIBuQ
         Cafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=5a+doWvCrDoneaEbHIt4M6EKA+mAvMd79RmvxJp1T6c=;
        b=rZwmfXEowbBCMT0N+RP720ZKZOn0gCJiBLgN2kXYitq7t9yujBjAtPDS93TEE4pI51
         rNTbuccp53yK7qGaq4OCQGTjSBDUbgWug964z5ln4QUEymgE05lB6tuQ1mQJ19rYK7wc
         NXKPGWmr0ZBAzCi7iMcI3yVzid021GF78bFrwBiCG9rnIHzDPOBttF/6i7nSbQO6UW1L
         r840m0JlkCMYWyHv2oM9npIYKrTUF3BBXjnihLKO09q97QNwu+1f1anU1scP/dayO3aM
         9hbMwT3lKw41aUs+Dz2m1j2e63UzGy5CD/XlDxrMxoLRkx18YP0bbGtPkEpal37OTFLj
         6AXg==
X-Gm-Message-State: AOAM531UYvKsv+lKvtiGD22Y5ak+YzSBMFA59be0BSCpft+W3q5TpnkS
        WqrcB0Lg0JhBaYo0kwlyC4mmSLU6fh0+Fio53CnsfF7ZaRM=
X-Google-Smtp-Source: ABdhPJxN2YlJYzRnh9tLhWBCkbzSpy4oOA2RwR//NMHClwdCplMlSpb7S2K7o7QIJ6xaMCLKvTod1bE0WPQhTNkU4/w=
X-Received: by 2002:a25:b009:: with SMTP id q9mr46463800ybf.506.1619673656926;
 Wed, 28 Apr 2021 22:20:56 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mceier+kernel@gmail.com
From:   Mariusz Ceier <mceier+kernel@gmail.com>
Date:   Thu, 29 Apr 2021 05:20:45 +0000
Message-ID: <CAJTyqKNsh1UgpuZYoqR6BshxaEEh55WMs=S87U=jYbhQfzvF3g@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     David Laight <David.Laight@aculab.com>
Cc:     "ojeda@kernel.org" <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 28/04/2021, David Laight <David.Laight@aculab.com> wrote:
> From: Mariusz Ceier
>> Sent: 28 April 2021 19:34
> ....
>>
>> I suggest to wait until featureful GPL implementation of rust language
>> is made (assuming GNU Rust is on the way) before merging any rust code
>> in the kernel and when that implementation is done make a requirement
>> that all rust code must be buildable by at least GPL implementation.
>>
>> Maybe it would also be worthwhile to make the requirement that the
>> kernel must be buildable with free software (not just open source
>> software) explicit ?
>
> Or put the version of the compiler that works in the source tree
> with the kernel and then build it as part of the full build.
>
That is an overkill :)
Even hosting a copy of all required tools at kernel.org might be an
overkill (but who knows);
I think having links at
https://www.kernel.org/doc/html/latest/process/changes.html#getting-updated-software
is enough.

> It is enough of a PITA having to find libelf-devel in order to
> build objtool, never mind having to find the correct version
> of something else.
>
> gcc tends to be available and the version doesn't matter too much.
> But ever that gives problems.
>
>       David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1
> 1PT, UK
> Registration No: 1397386 (Wales)
>
