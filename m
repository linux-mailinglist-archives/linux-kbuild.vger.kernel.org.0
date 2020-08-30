Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC06256BC8
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 06:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgH3EyZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 00:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgH3EyZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 00:54:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A2FC061573;
        Sat, 29 Aug 2020 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=MFqiM3hTwV/fkTjmipGxqNOxLLgA3iwwXkUUehMy8qg=; b=bLc/XhveXRAuGg14wNB8lRn0UP
        5ZOGfYtKqW1DzbwqjzenMhl6yEdIYWJW/AsNFDDq8yBZoefIlmMdIvXq5iqjlhr6TX4Y+64vtEjOD
        bSCuNbDTv3widKza3Re2tb8SWVabLdF8XpJnGZHvh1BQvOeOzV4g1958drtJvPrTgi428Omdr0XzV
        dNMlTRiJFDo1xtHBRiLK7HJEZaQ0UyF1f0bcFbpt1FsgglpzH9Xqy50BssNLncArJq9U2STkAmLf2
        VlHc5A6ZFJahyMN/kdkl0jJMO7GUKkaGmvNRp/Us+FasX0GDVl+u8Vyu6BGg/ikqvznYVCWH5Od4P
        23Bg+btg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCFME-0006Y2-VA; Sun, 30 Aug 2020 04:54:23 +0000
Subject: Re: [PATCH 06/11] kconfig: qconf: allow to edit "int", "hex",
 "string" menus in-place
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200829081417.725978-1-masahiroy@kernel.org>
 <20200829081417.725978-6-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bd8696df-72b7-fb92-d53a-edff715fe5a0@infradead.org>
Date:   Sat, 29 Aug 2020 21:54:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829081417.725978-6-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> Previously, when you double-clicked the "int", "hex", or "string" menus,
> a line-edit gadget showed up to allow you to input the value, which
> looked clumsy.
> 
> Also, it was buggy; the editor opened even if the config option was not
> editable. For example, just try to double-click CC_VERSION_TEXT, which
> has no prompt.
> 
> This commit sub-classes QStyleItemDelegate to allow users to edit
> "int", "hex", "string" menus in-place. Just double-click (or press
> the F2 key) in the data column. Then, an editor widget is placed on
> top of the item view.

The F2 key doesn't work for me. I guess that's a desktop environment
issue (I am using Xfce).

> The two methods are overridden:
> 
>  createEditor - process only when the data column is being accessed
>  and the menu is visible. Otherwise, return nullptr to disallow editing.
> 
>  setModelData - take the new data from the editor, and set it to the
>  addressed symbol. If it was successful, update all the list windows.
>  Otherwise, (the reason for the failure is possibly the input data was
>  out of range), set the old value back to the editor.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 93 ++++++++++++++++++++++++++++++++--------
>  scripts/kconfig/qconf.h  | 15 +++++++
>  2 files changed, 91 insertions(+), 17 deletions(-)
> 


-- 
~Randy

