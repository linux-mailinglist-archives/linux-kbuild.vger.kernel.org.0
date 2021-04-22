Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709823686CE
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Apr 2021 20:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbhDVSyi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Apr 2021 14:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbhDVSyh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Apr 2021 14:54:37 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D4DC06174A;
        Thu, 22 Apr 2021 11:54:02 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id o5so47406715qkb.0;
        Thu, 22 Apr 2021 11:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8IWAEfyI2PXcv9oLTm41TbJTcMQt1Y19HZbbnmNLpXo=;
        b=TWDMlK2hINdwlgTlhHGziGWtwe6gTTlF3sb1vVFKjVVFILa/+/CpOSkKVT/KcelOJm
         Z0ABTTmNu6QJ7odFPNkV2LCmClqNup4KDI2NchD1tSo3b0NykoCLL3rpfdBZmk8QEwbL
         i+p1z9HDvOWcPtRBS1WneDHrKKBxU/5hkCrhxsUsi7R3cQdn6z6GWAqVMdTRlDLGKP4v
         sguPOMsjSkPBFdC7diksYEDjd0XmI1YDNoOuDIhxOZaTXlyrf2XKHhfNtadFeyq29w+a
         CX/q1FcZtzgSjwGf1k1MeM5FOZFZ1EwdWcUfEqDdnTQA1EqTChS0c2x5ym+thjgVZvaB
         MVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8IWAEfyI2PXcv9oLTm41TbJTcMQt1Y19HZbbnmNLpXo=;
        b=dV49WaT6zQjySSXqa9KLxxxKrTVNeQcL/UEVFho/yWEioX70p8egeWZHM0KRwKkIG0
         SD5PDox6vzf0pt76Je+IaiUxXk5FiW/YmEMIfJ1xRMoon0VeabN+ORadCK/5hjH1R0xk
         MdhVUDoKon52NYOZwpx7skFNywqnh3rq7fF2wbPTbHpVgJBKz8gHlfcdzI3rtmed+/8f
         LxUYJUTElGjwx5pT8JEDFSOYBtJBGGARevDKuk01y6rtk4GtIQOeYvlpz32J3t8ooCSC
         GGhGhy4/NjbK2U4yM4Pq7563Gd95qVbWQG0rzw35FMSyhi+nlgHC0MaQDPSE59/0G9fE
         H1xA==
X-Gm-Message-State: AOAM530YmsHvw9Kx7Ki72yKjf7LkYNocvw8w4xRWm1NMuLCLl672wS2G
        1jpV2svuWMA2oKagerEtXkS1iu/WNNnnzg==
X-Google-Smtp-Source: ABdhPJzNBUgSIeBU1+9Sa2ktkuxVreCDVZdxo6G5W386qxoAws2idezxMv40/0oPFS/Q5BJLwaaCOA==
X-Received: by 2002:a05:620a:1475:: with SMTP id j21mr220816qkl.118.1619117641660;
        Thu, 22 Apr 2021 11:54:01 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id o130sm2796003qke.121.2021.04.22.11.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 11:54:01 -0700 (PDT)
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org>
 <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
 <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com>
Date:   Thu, 22 Apr 2021 13:54:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
> Hi Frank, Rob,
> 
> On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
>> On 3/27/21 12:40 PM, Rob Herring wrote:
>>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>
>>>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
>>>> source file.
>>>>
>>>> Rename unittest .dts overlay source files to use .dtso suffix.
>>>
>>> I'm pretty lukewarm on .dtso...
>>
>> I was originally also, but I'm warming up to it.
> 
> What's the status of this?

I was planning to resend on top of the upcoming -rc1.


> v5.12 (introducing the concept of dtbo) is around the corner, and it
> would be best to decide on dts or dtso before its release.
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

