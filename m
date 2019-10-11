Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6460BD44A4
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 17:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfJKPnR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 11:43:17 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36156 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfJKPnP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 11:43:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so10688631wmc.1
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2019 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IkvpMa/Wbpx2VqhnGR9Yn3NTs6llmrr8FmiZZgZjer8=;
        b=X3vZDG8yiduvmHkrBKdm66t60S2SmVt7Hj4fmdcMZ9LRkp8FNQ5jAnkRGJf8POzXRn
         ZEPrUuEA3sjz31G7Y9MBGEg7tTqpLOgVdDXqiEMfgQqhoQdd6vB1WyxWmXPJM+K0yepf
         ftDr+itzH0IsdPAiGU6jnb9Rp1PjWD57efySuYo06Y4A8D/xpLj+zhfX9ZXdovaI3IN6
         dBzcy/EDVFQj7UDYNh325+ZdIyxnami4RvpcuTMpwIkaw2j4OYAfXqTA6DXki7NbT/Uw
         2Dfml6WB1+tx2UD8EtcC+pFFiDQSfgST/KKkzypSFFKVKwOOhG+HvaNXU1oKtc4fkeIx
         dNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IkvpMa/Wbpx2VqhnGR9Yn3NTs6llmrr8FmiZZgZjer8=;
        b=OF0SBsfWF7taiwLAQxRP37aQUkCPPyQtFWuuX/UNrmT/jUXiSk7c8AEDsRH6++uyNs
         LmE9QxXXTQ2PdvHhw3OtKAIeH+fESCHRi2Ns1cgAdMEY+6fNDoPbritqncnjBX4TEcjt
         /P2jcPXopAIhBEcuEG4TaV4dahAfTIkGTdsNhMAE5kd9ffvZgkM/Vgj1z8UnWpIRa+uk
         uWNJHHQusYZLRtyDP5VxPU4dk9SlmTahosZs7AFPnAxIp5GGDji6ISTkHQ0OeH43qBmD
         ruaCWtFp2PURXQp+8e7ea8bM0vuEUZuspzoclxvVhE+ucTWz50w62FUkU6elEe5N5NgM
         Xqig==
X-Gm-Message-State: APjAAAXRxBwBXqi5bW5ncIwnvve/soF8TBA/dRWb0XIbhRKyZrJzApNY
        E55KzCoqiL/eLshQX8jQFv+M+Q==
X-Google-Smtp-Source: APXvYqxt3UXygeXinwIg1evC6ymRhLH+w7/H5e3CEQMemZD1O0osIhi1XeCl3mzp06xPlgUPPoUUnA==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr3785533wmc.121.1570808592952;
        Fri, 11 Oct 2019 08:43:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id r2sm13732272wrm.3.2019.10.11.08.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:43:11 -0700 (PDT)
Date:   Fri, 11 Oct 2019 16:43:11 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 4/4] export: avoid code duplication in
 include/linux/export.h
Message-ID: <20191011154311.GA192647@google.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-5-maennich@google.com>
 <20191011153127.GA1283883@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191011153127.GA1283883@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 11, 2019 at 05:31:27PM +0200, Greg Kroah-Hartman wrote:
>On Thu, Oct 10, 2019 at 04:14:43PM +0100, Matthias Maennich wrote:
>> Now that the namespace value is not part of the __ksymtab entry name
>> anymore, we can simplify the implementation of EXPORT_SYMBOL*. By
>> allowing the empty string "" to represent 'no namespace', we can unify
>> the implementation and drop a lot redundant code.  That increases
>> readability and maintainability.
>>
>> As Masahiro pointed out earlier,
>> "The drawback of this change is, it grows the code size. When the symbol
>> has no namespace, sym->namespace was previously NULL, but it is now am
>> empty string "". So, it increases 1 byte for every no namespace
>> EXPORT_SYMBOL. A typical kernel configuration has 10K exported symbols,
>> so it increases 10KB in rough estimation."
>
>10Kb of non-swapable memory isn't good.  But if you care about that, you
>can get it back with the option to compile away any non-used symbols,
>and that shouldn't be affected by this change, right?

Rasmus suggested to put the 'aMS' flags on the __ksymtab_strings section
to mitigate this:
https://lore.kernel.org/lkml/f2e28d6b-77c5-5fe2-0bc4-b24955de9954@rasmusvillemoes.dk/

I was not yet able to properly test this, so I did not include it in
this series. As I said in the cover letter, this 4th patch might be
optional for 5.4. So, we could defer it to a later time when we have
addressed that properly.

Cheers,
Matthias

>
>That being said, the code is a lot cleaner, so I have no objection to
>it.
>
>Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
