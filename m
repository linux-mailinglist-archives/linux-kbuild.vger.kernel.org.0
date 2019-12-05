Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65556113A80
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 04:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbfLEDgf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 22:36:35 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41096 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbfLEDgf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 22:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uA8qdYUY/WlI1NyihsW/y2NRPNtIlPbJremcOrIeCmU=; b=QewMc9bCiS/dK894Y8pt17kDe
        afDW8/WAHpIXExgn9DoNlklkrmrnlSqi6g17i6uxxWr3v1xLhaBhrdUZByt63bINxKgh5Hdg5kvf9
        R5HjdxBEleCSLwQ0e5yeDv0UV2Y9Yp79/momOuuxE6ftqvgYJsXzFFWW65bjZoVGukfBTtCjW0ZwM
        PWogwktMzqz3cQipb3xjkLP1ARjK/2ihIh6zL/tgtyY8g32IGoNnUOg5SX+qlVW648qZlp8J6GuJ8
        bsXLZu/qP2gaNx8mMgh+Vsv9B8/jwlQY5G4i7IifsbvAPaNlZNY0btLmykXdniyT5aLSM5kTsmUKM
        l+XfYAu8Q==;
Received: from [2601:1c0:6280:3f0::3deb]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ichwQ-0004vz-2e; Thu, 05 Dec 2019 03:36:34 +0000
Subject: Re: [PATCH 2/2] fix the SPDX syntax and bash interprester pointer
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191203095339.615774-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <56303cd3-fcf8-49cd-f66a-4db7e382774c@infradead.org>
Date:   Wed, 4 Dec 2019 19:36:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203095339.615774-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12/3/19 1:53 AM, Bhaskar Chowdhury wrote:
> SPDX syntax was complining by checkpatch fixed it,added space before it.
> And add bash interpreter to find by the env .
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/kernel_modules_info.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
> index f005c47a3aa6..3a9b00988ed3 100755
> --- a/scripts/kernel_modules_info.sh
> +++ b/scripts/kernel_modules_info.sh
> @@ -1,5 +1,5 @@
> -#!/bin/bash - 
> -#SPDX-License-Identifier: GPL-2.0
> +#!/usr/bin/env bash 
> +# SPDX-License-Identifier: GPL-2.0
>  #===============================================================================
>  #
>  #          FILE: kernel_modules_info.sh
> 

a.  There is no good reason for patch 2/2.  Just merge the 2 patches.

b.  The big header comment in patch 1/2 is not needed and is unwanted.
Just put some or all of that in the patch description/comment message.


-- 
~Randy

