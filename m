Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75F077715E8
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Aug 2023 17:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjHFPaO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Aug 2023 11:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjHFPaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Aug 2023 11:30:13 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11470171B
        for <linux-kbuild@vger.kernel.org>; Sun,  6 Aug 2023 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=V5h75oyMfXf6Cb0LaVm3frUppb/P7SCVv6RLXsAeQ9A=; b=QoC0iIahWAsz7LP/ybK358ZC7g
        gAymaIDmiS8VO9LDkzLyZBCYeXwkWeL6DQbkbeWyszpCV8Yuo5mhjOhDER7K2hn0scaTK2VOrM4f5
        rwLyWZRFvjteSddKW7NQIdtjkfL3L5LEzcFsyaib+YwFatsXbPAcHWJlG1PDw6hAZh2zngIHtHPDE
        c+ZZdnWoDwCMUL6/5HoBFoTD+AojTanAVdSZBq3z6qnzunQhi1acilENJtZKmANi0+WJ4PjubSUtK
        GJ42ONMLr5ommnbrc+7qnPNmBqQvToCWXUjUn+8QDXuVzOXZjMhKY0VYnSpRWxAhYkVpkP9h34oZF
        HfiyGBow==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qSfhq-00FZy1-2y;
        Sun, 06 Aug 2023 15:30:10 +0000
Message-ID: <9c86c832-9a2c-0500-292f-5449e21be7e3@infradead.org>
Date:   Sun, 6 Aug 2023 08:30:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1] kconfig: nconf: Keep position after jump search
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20230806032026.1718752-1-Mr.Bossman075@gmail.com>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230806032026.1718752-1-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jesse,

On 8/5/23 20:20, Jesse Taube wrote:
> In this Menuconfig, pressing the key in the (#) prefix will jump
> directly to that location. You will be returned to the current search
> results after exiting this new menu.
> 
> In nconfig, exiting always returns to the top of the search output, not
> to where the (#) was displayed on the search output screen.
> 
> This patch fixes that by saving the current position in the search.
> 

This patch fixes the reported problem. Thanks, Jesse.

> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/r/20230805034445.2508362-1-Mr.Bossman075@gmail.com/
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Now I have another issue. :(

Here is my test case: x86_64 defconfig.

SymSearch (F8) for MSR.
Page Down to #3. Select 3.
X86_MSR is about 7 lines below the highlighted line in the menu,
which is confusing and sometimes it's not obvious what the correct
line for the symbol is.

In menuconfig, the highlighted line is precisely on X86_MSR.

Can nconfig be more precise about which menu line it highlights?

Thanks for your help.

> ---
>  scripts/kconfig/nconf.c     |  3 ++-
>  scripts/kconfig/nconf.gui.c | 12 +++++++++++-
>  scripts/kconfig/nconf.h     |  1 +
>  3 files changed, 14 insertions(+), 2 deletions(-)


-- 
~Randy
