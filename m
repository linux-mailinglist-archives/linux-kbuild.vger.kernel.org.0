Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A3534D80A
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Mar 2021 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhC2TXF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Mar 2021 15:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhC2TXC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Mar 2021 15:23:02 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5B8C061574;
        Mon, 29 Mar 2021 12:23:02 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id o5so13589854qkb.0;
        Mon, 29 Mar 2021 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3aAg/cWdAj4lRmlMtK4LkLX6r/m6JweeUeBCVUAgBV4=;
        b=QuW7m2EWanQSPCJesyGh0kNW6T5woKO4zsnh1/mzyCrQFz73EuPo9mndgyJCT1MrX6
         YA/q5OCIJ9yTsF41T5r2I86K8GVY3sjuSkBMFuju8CRiG5CtFTWELJoisqDLGHb+4oxH
         OwYbHCOuwqMiY19SwpLtqnZ0pxjYlFU9RmqVdVUN5G11UlhDBr9Q0aXB5YJT5oRzEIIy
         e8kovT7oun4aUc2lCwEjFdgzV5/E0C93vW3g6QnDgMgR0aMeYe5vbf0AnB92ta5g6wEH
         5baEyT48PfH+r8BpasFfXqqPkKzZRtrEhEHv5ds+ZVYVZj/7h9K4I1329pZ0ETFEZg0J
         p/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3aAg/cWdAj4lRmlMtK4LkLX6r/m6JweeUeBCVUAgBV4=;
        b=SjzHvF+Mj7ErIqMqTdSBgM9R7zWPVZwhZofPlJmKJOYPMMq20vdGKp9ozR97GZK0ry
         ECkLd5arLmruFbCZUHz5ACh2OCtdF1MC1WeFAiigRxF73leCdoEqm5ypsQ9G80e3dUyu
         VEaZP1yj3LtJ/Zzz4onIcZokMd/3pMuUSOxIxdT9T10Y0lJRmEG4YbwBzJDlPa/KjM4m
         BeddjKUfMwEUwIoEXkDfXcwVk5jUi2elAAPxWQAmJdM2FKaLexaV/RckAwaz5YBjPszv
         xkeFb5pE3tnR7JtMEbxauRRAaw1VsDxJgbLI2x9TmPu0B1cWUdLqTy94ae/SMUX9z/8a
         TQCA==
X-Gm-Message-State: AOAM5306kLJ4Ud+CvZ6N2Q2kj61QPbix4flD7x4k57qtt7urgyHZWKsG
        9m1FMV/JG0pt+2y3lA+bcaY=
X-Google-Smtp-Source: ABdhPJwg2Q7NNiixwEvKlISU8+d3yTPZja/yZbNVoce24fBi5ZiUC2pphQJhAWpMhy67b0Kg5iU3rg==
X-Received: by 2002:a37:6887:: with SMTP id d129mr26732247qkc.252.1617045781812;
        Mon, 29 Mar 2021 12:23:01 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id i14sm11734313qtq.81.2021.03.29.12.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 12:23:01 -0700 (PDT)
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
To:     Rob Herring <robh@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
Date:   Mon, 29 Mar 2021 14:23:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210327174035.GA291160@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/27/21 12:40 PM, Rob Herring wrote:
> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
>> source file.
>>
>> Rename unittest .dts overlay source files to use .dtso suffix.
> 
> I'm pretty lukewarm on .dtso...

I was originally also, but I'm warming up to it.

> 
>>
>> Update Makefile to build .dtbo.o objects instead of .dtb.o from
>> unittest overlay source files.
>>
>> Modify unitest.c to use .dtbo.o based symbols instead of .dtb.o
>>
>> Modify Makefile.lib %.dtbo rule to depend upon %.dtso instead of %.dts
>>
>> Documentation/devicetree/of_unittest.rst was already out of date.
>> This commit would make it even more out of date.  Delete the document
>> instead of continuing the maintenance burden of keeping the document
>> in sync with the source.
> 
> This should be a separate change. It's also going to collide with my doc 
> improvements.

I'll split it out.

> 
> Improvements here would be better than just deleting.

OK, I'll make the document more abstract so that code
changes will be less likely to require document changes.

-Frank
