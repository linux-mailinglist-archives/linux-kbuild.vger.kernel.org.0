Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DDECE9DE
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2019 18:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbfJGQy3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 12:54:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfJGQy2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 12:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=t/yQUf+EtdNPtNNx+uvRr8fK6YdYLYWGcWajnVQ+Rwo=; b=GPiD9U91/v8Zp2mE39SHfatZx
        8o9xcA0Jg0EzwnrBfepGwwl6Yqubc6qRjpPMrgTj89Pr2Gw6mrnSMN2C3lYKBfGYMROyiQev90z7q
        THbX00UMWOblg3GDzWUeSba/kWirrm2wENvHjzSXTVD7Vn+XcPbi/+CnApoPF8qJ8tN2NTVdlnW/0
        XI37hsVstGn1YzG60Y14pLTIdkyoZrGyCB6YXAflXwbwPvU2PraNRVVCzPOL80tLqJfswCT4QSnam
        Z6Fhf1QD40808vOLT65Ut9PyTvyZdVlCw4xHBGa+7dCcD+S8+I8q5QzHRGdyks6tBYCMJqCEaDLuI
        Nezh0jN8g==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHWHE-0008Bc-0a; Mon, 07 Oct 2019 16:54:28 +0000
Subject: Re: 'make help' br0ken for @echo ' valid values for SPHINXDIRS are:
 $(_SPHINXDIRS)'
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>
References: <416a61e8-e40a-6266-3f6a-bdbadf9a10c3@infradead.org>
 <20191007094143.3a4d8a09@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <084a5009-bb2a-b043-6c16-5b08e5a87d5c@infradead.org>
Date:   Mon, 7 Oct 2019 09:54:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007094143.3a4d8a09@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/7/19 8:41 AM, Jonathan Corbet wrote:
> On Wed, 2 Oct 2019 16:16:07 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> It seems that _SPHINXDIRS is empty.  I'm getting (short extract):
>>
>>   make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
>>   valid values for SPHINXDIRS are: 
>>
>>   make SPHINX_CONF={conf-file} [target] use *additional* sphinx-build
>>   configuration. This is e.g. useful to build with nit-picking config.
>>
>>   Default location for the generated documents is Documentation/output
> 
> Hmm...it looks like that broke with 9fc3a18a942f, which got rid of the
> various conf.py files.  Something like the following seems to do the right
> thing?  (It also shows that we have way too many top-level directories, but
> that's a separate issue...)

true dat.

> Thanks,
> 
> jon
> 
> From d402c2de65bb9353e6222a05095f32929ae62373 Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Mon, 7 Oct 2019 09:38:58 -0600
> Subject: [PATCH] docs: Fix "make help" suggestion for SPHINXDIR
> 
> Commit 9fc3a18a942f ("docs: remove extra conf.py files") broke the setting
> of _SPHINXDIRS in Documentation/Makefile.  Let's just have it look for an
> index.rst file instead.
> 
> Fixes: 9fc3a18a942f ("docs: remove extra conf.py files")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index c6e564656a5b..ce8eb63b523a 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -13,7 +13,7 @@ endif
>  SPHINXBUILD   = sphinx-build
>  SPHINXOPTS    =
>  SPHINXDIRS    = .
> -_SPHINXDIRS   = $(patsubst $(srctree)/Documentation/%/conf.py,%,$(wildcard $(srctree)/Documentation/*/conf.py))
> +_SPHINXDIRS   = $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst))
>  SPHINX_CONF   = conf.py
>  PAPER         =
>  BUILDDIR      = $(obj)/output
> 


-- 
~Randy
