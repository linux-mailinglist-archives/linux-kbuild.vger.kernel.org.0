Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB95A624A00
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 19:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiKJS4B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 13:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKJS4B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 13:56:01 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D688C2EF3B
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 10:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=j8zW4X8+jmmeJrZnTccqwOqEYcCuAbdUJcwslYVxItc=; b=ahkWpF45s5OpT11G4uaobuvmOe
        ZtQbyIWGKu18yli6Yf9J3zQRhvamUGFpIUAywdne33RKRpjB5bJa4T5S74eE/wZZeCUctxeBlpJ9e
        PsChFiEbk2I4U81RQ3hZt2i+3TpCe+7MB6lHjebh/W6wjTB7ymHQii6xWqdzaMjp9Z5gwbeWLTeB/
        DjJqRw7eS9EOlhij1SHX+0Z9baXEc9UnzP6Q66BNn1cm71zg0Ne0jDFNh+3qNUKniDVm5p6jCCZ7l
        l8gmmYYcO2hbH131x5URU1iAMOPscfwQ9tLXTeV+h/iwVH4xFDmJhb8gPbpO436k50n94OUz1ynpE
        FEKU8E0w==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1otCiL-008NTi-2Q; Thu, 10 Nov 2022 18:55:49 +0000
Message-ID: <dfeb3422-a184-de5f-0e2a-0a1a233024ae@infradead.org>
Date:   Thu, 10 Nov 2022 10:55:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] MAINTAINERS: Remove Michal Marek from Kbuild
 maintainers
Content-Language: en-US
To:     Nicolas Schier <nicolas@fjasle.eu>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20221110150425.164386-1-nicolas@fjasle.eu>
 <20221110150425.164386-3-nicolas@fjasle.eu>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221110150425.164386-3-nicolas@fjasle.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 11/10/22 07:04, Nicolas Schier wrote:
> Remove Michal Marek from Kbuild maintainers as there is response since

                                                       is no response since
?

> October 2017.
> 
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61a6848192c5..45c88bb34b6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11083,7 +11083,6 @@ F:	fs/autofs/
>  
>  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
>  M:	Masahiro Yamada <masahiroy@kernel.org>
> -M:	Michal Marek <michal.lkml@markovi.net>
>  R:	Nick Desaulniers <ndesaulniers@google.com>
>  R:	Nicolas Schier <nicolas@fjasle.eu>
>  L:	linux-kbuild@vger.kernel.org

-- 
~Randy
