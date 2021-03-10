Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9527E334160
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 16:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhCJPUP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 10:20:15 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28181 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbhCJPUF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 10:20:05 -0500
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 12AFJZuf017579;
        Thu, 11 Mar 2021 00:19:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 12AFJZuf017579
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615389575;
        bh=GxApZPXoYou1fxvWGS97/MEPVr6v/IPteIgbS9v7Xog=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XT8jbNZMjyn7UHoFVpeEVsZcfc7eShjCl63TM5l2p4CvDryB5jM94E0K1WVrwizdv
         L4x6y3u/o3SY6RRcp/gvBEdFFUrrGvQPRJkpDarx7buC3d/RI/0bs5jv4ChgZrh4pW
         kyYHfOoghEyWJ+a0QQ8vC6V+wgHoFERmBwkgA254pbJX7UU5SE9TjEOj/FfpJXHS+v
         AQneRKx6ItkMNlo2G+y9Lv52UPUZ+JcJmHxbYkcAOIJGPhAovY7QxMzhWyGjaigkTo
         6LhCE/V7DtWVkRX5AFbA+72IRQiouM4+14CjuZLKGMg0HYD7VDH35g4KNAUNlS718U
         x9qtkitR0nYsw==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so7400691pjh.1;
        Wed, 10 Mar 2021 07:19:35 -0800 (PST)
X-Gm-Message-State: AOAM531l+R6L9N0WTDEIntyw0TkGMAuYLh7KDSh6KUNXq0RtV8sN9zhY
        3Vl4Xu3XzGq6B+OQ3aaE4S5EDgUyzRHeT2JzbDo=
X-Google-Smtp-Source: ABdhPJyE+MhCrJ1nRyki5mODpYGDgERcoghQQc0HcFjo9EH3RcdMQm3lkP1vnI1fqIxu1HNWElrEMQFXVhZN9FDwTl4=
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id
 a9-20020a170902b589b02900e62875aa4cmr3448032pls.71.1615389574861; Wed, 10 Mar
 2021 07:19:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615354376.git.viresh.kumar@linaro.org> <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <CAK7LNAST04XTt7Y0DnSADHgAw-zy61HUcRJSyYRvy2rGHMdn4A@mail.gmail.com> <20210310144837.hxz3nbwonvwi3j5c@vireshk-i7>
In-Reply-To: <20210310144837.hxz3nbwonvwi3j5c@vireshk-i7>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Mar 2021 00:18:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBtrG3nF7YtuRhog+ZZpCRGg22b88VkCga7-em57NyDg@mail.gmail.com>
Message-ID: <CAK7LNAQBtrG3nF7YtuRhog+ZZpCRGg22b88VkCga7-em57NyDg@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 11:48 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 10-03-21, 20:29, Masahiro Yamada wrote:
> > BTW, is the attached patch good for DTC?
> >
> > I do not know when '-O dtbo' is useful,
> > unless I am missing something.
>
> It is useful if we are sending the -O option all the time (I have
> already given more details to your patch) as outform will not be NULL.


"-O dtbo" was useful to make your buggy patch work.

That is not justification.


.yaml   ->  -O yaml
.dtb    ->  -O dtb
.dtbo   ->  -O dtb

is the correct if you want to give -O explicitly.



-- 
Best Regards
Masahiro Yamada
