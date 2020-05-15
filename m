Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9974C1D49CE
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2020 11:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgEOJkL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 May 2020 05:40:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38225 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgEOJkK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 May 2020 05:40:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id e25so1528939ljg.5;
        Fri, 15 May 2020 02:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+P2dAtopuclk+4iXve56bNYfu6aJzuQ3SNxV2vXhclk=;
        b=BQIMwYCHcpORRr3i64TYXmhqIgL5Mw3K6649PHSXQwNz9M+JfB23JyAQZTRTc/gbxs
         VrIaa665H0ZgxcNqnB9hVscEMX3yYLyVJtAp072b5/n6F+y3EzOsh3xJ6DV3GXKNUOMW
         A+LMmG5trVVA9qelQOsqqcf0rJtBu0oWcyEHgIGOekeP01+3pqNHJWiOlpJoQjdHYahb
         +VQskmMg3fvHjWtVMn3v5ZpIOutUmq9/k6Jrop+kDZACdWzBt6qpSTsg+oniXEl+5s8u
         4SzeIPvgeQytceaLlF9R583srZMP7AtR2R0fvRnCJGVNe8gEofCev+EMFIvOz/lgH4VE
         LAMQ==
X-Gm-Message-State: AOAM533RPSeywx0cYKvHM7GWEj1p0stHSGZ0RlAHfMp1g7lZ/5VRTe3X
        aHI6T8mPJfj7K0HTSFKCRQE=
X-Google-Smtp-Source: ABdhPJxwZ7otS2V0bepF0Yw+ss2Bvduc9TlnF3Q1h3FXMqrgcnKBI6hnnwC+Ln5sHvscJacgIxUu9Q==
X-Received: by 2002:a2e:9d8c:: with SMTP id c12mr1773656ljj.67.1589535608006;
        Fri, 15 May 2020 02:40:08 -0700 (PDT)
Received: from [192.168.1.8] ([213.87.130.150])
        by smtp.gmail.com with ESMTPSA id h20sm995837lfj.26.2020.05.15.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 02:40:07 -0700 (PDT)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>
References: <20200514131234.380097-1-efremov@linux.com>
 <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
From:   Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Subject: Re: [RFC PATCH] kbuild: add variables for compression tools
Message-ID: <e26a1565-e770-0e5e-c730-60cc6fa16a4f@linux.com>
Date:   Fri, 15 May 2020 12:40:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It seems that I missed a couple of tar commands in the patch:
scripts/Makefile.package
scripts/package/buildtar

On 5/15/20 5:20 AM, Masahiro Yamada wrote:
> On Thu, May 14, 2020 at 10:14 PM Denis Efremov <efremov@linux.com> wrote:
>>
> 
> commit 5054e88a7934d5ff5ec14231c8b8676161bb45fa
> Author: Paul Eggert <eggert@cs.ucla.edu>
> Date:   Mon Mar 16 14:25:17 2015 -0700
> 
>     gzip: make the GZIP env var obsolescent

Other implementations can depend on this.
pigz still parses GZIP env var:
https://github.com/madler/pigz/blob/master/pigz.c#L4346

> 
> Some possible options I came up with:
> 
> 
> [1] Use KGZIP for now, but BZIP2, XZ, etc. for the others.
> 
>     (Then, rename KGZIP to GZIP when the time comes)
> 
> 
> [2] Do not take this patch
> 
>     The whole build process is parallelized
>     by 'make -j $(nproc)'.
> 
>     If you are still eager to use pigz instead gzip,
>     use a symbolic link or a wrapper shell script.
> 
>     $ ln -s /usr/bin/pigz  /$HOME/bin/gzip
>     $ PATH="$HOME/bin:$PATH"
> 

[3] GZIP at frontend, KGZIP or _GZIP internally? Something like:

$ cat Makefile
GZIP=gzip
override KGZIP=$(GZIP) # optional overrdide. Used to force GZIP value
                       # in case: make KGZIP=test

unexport GZIP
export KGZIP

default:
	@env | grep GZIP

$ make GZIP=test
KGZIP=test

Thanks,
Denis
