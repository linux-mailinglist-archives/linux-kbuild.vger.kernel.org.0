Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4404F33A351
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Mar 2021 07:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCNGQv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Mar 2021 01:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhCNGQP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Mar 2021 01:16:15 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E7BC061574;
        Sat, 13 Mar 2021 22:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=0wAEjMxzCdnBr/rRsbY9kpqjVxTUbyGe+wiENA+FzUY=; b=ev2NUNZBX5ZECS2yw4gKel195B
        GLm+m1YXVkbQHvtAnKa4kY6/3EMsDnTCYNZ2qq9EOxl3MpnJ38eKdZxwPnoSpvYkevb2ojESnRimb
        6f+/h8c3nG16TuI/GQWk8rO5/JAjnUYiNk0s6GAIja15pO8dFZgbk+rGjJbUZTU8WVHLxWKHXeJVZ
        t4nqwVEPHRiwwHJ2kuGQLHvT59r4VKKDCBasyJke3+OHsnpU7/qRb27DZhmHE5KXcLuH0oXW9uCa7
        cI3fAZXL37TLnCeefgqUPR6BR0JfkontliZVgjFD2LO6ivURc34CDY0uH7jJULaQx+8HbMw/p4mj9
        YoSJkQEQ==;
Received: from [2601:1c0:6280:3f0::9757]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lLK1o-001B6q-E3; Sun, 14 Mar 2021 06:15:07 +0000
Subject: Re: [PATCH] docs: kbuild: Fix a typo in the file
 Kconfig.recursion-issue-02
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, masahiroy@kernel.org,
        michal.lkml@markovi.net, corbet@lwn.net,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210314043044.15926-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ad52ed1d-92b1-8320-ff70-bc9d1a9b8991@infradead.org>
Date:   Sat, 13 Mar 2021 22:15:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314043044.15926-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/13/21 8:30 PM, Bhaskar Chowdhury wrote:
> 
> s/sematics/semantics/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/kbuild/Kconfig.recursion-issue-02 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
> index df245fd7670d..0034eb494d11 100644
> --- a/Documentation/kbuild/Kconfig.recursion-issue-02
> +++ b/Documentation/kbuild/Kconfig.recursion-issue-02
> @@ -6,7 +6,7 @@
>  # make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
>  #
>  # The recursive limitations with Kconfig has some non intuitive implications on
> -# kconfig sematics which are documented here. One known practical implication
> +# kconfig semantics which are documented here. One known practical implication
>  # of the recursive limitation is that drivers cannot negate features from other
>  # drivers if they share a common core requirement and use disjoint semantics to
>  # annotate those requirements, ie, some drivers use "depends on" while others
> --


-- 
~Randy

