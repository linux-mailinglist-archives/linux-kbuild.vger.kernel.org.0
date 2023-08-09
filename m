Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC64D775209
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Aug 2023 06:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjHIEtT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Aug 2023 00:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjHIEtT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Aug 2023 00:49:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6221729
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 21:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=Frzc1UHSOlEF0B7O8yJpJ/vukOrK3xJLDw1MvsQKuvc=; b=WCHAQVU66sCe9xsocLbr4fJd0g
        e7b5NOp6LngAmNcLCmBebqnTz2FS8ZHtgR96ZyxIRfqTapJEzg83Mi+cEMbR0CmGvSZ4YUgxgEk0g
        ZHUi3bCcUeELohZgh+E1eXHjzqFne4esDNCvovW8lh+vDpZnQr9jbz9u1ASKkIESsX1erhXHnYU7J
        qEeOstRctW8K08AzfHESzTU6YpfvOtGTovBvP8r3Hhj24Ne7qOLvoXF0VfxzIa2LvE2dUss9Sh513
        hrPOg6Hf5LnpbgVpE1msLNlZkuUKCTVi/2uF5kHLGIcoLMaTLRlEUPhGugEYD8/11MfNXDP3QWGRi
        M79DFyDA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qTb8I-0042MP-0P;
        Wed, 09 Aug 2023 04:49:18 +0000
Message-ID: <f39f6fd0-2c72-c0fe-ed78-5c87f734cc15@infradead.org>
Date:   Tue, 8 Aug 2023 21:49:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4] kconfig: nconf: Add search jump feature
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20230809004220.1884118-1-Mr.Bossman075@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230809004220.1884118-1-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 8/8/23 17:42, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Menuconfig has a feature where you can "press the key in the (#) prefix
> to jump directly to that location. You will be returned to the current
> search results after exiting this new menu."
> 
> This commit adds this feature to nconfig, with almost identical code.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> v1->v2:
>  Add selected_conf to go to menu and select a specific option.
>  Use get_line instead of creating new function.
>  Use Masahiro Yamada's new jump search implementation.
> v2->v3:
>  Change `start, end` to size_t and move scope to if
>  Removed redundant assignment of `again` to false.
> v3->v4:
>  Remove unnecessary size_t cast
>  Use ncurses to find line index in selected_conf
> ---
>  scripts/kconfig/nconf.c     | 113 ++++++++++++++++++++++++++++++++----
>  scripts/kconfig/nconf.gui.c |  37 ++++++++++--
>  scripts/kconfig/nconf.h     |   5 ++
>  3 files changed, 140 insertions(+), 15 deletions(-)
> 

I'm not discovering any issues with this version.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
