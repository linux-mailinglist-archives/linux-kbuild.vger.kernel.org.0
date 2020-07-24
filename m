Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F45122C75B
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 16:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgGXOJl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 10:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOJl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 10:09:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FF4C0619D3;
        Fri, 24 Jul 2020 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=OvEbCg7ckzbXNyo/gMjDATQvRtip48YcOlEFAJEKOQs=; b=q+FMKU2mxdMDch9CB8GR20xtLq
        uRUTjTd9nZjxatLRB9TbVqVVLttl5cPzaPu3ix+ZFzgZtQTVATaNmF5fnAOf2nCE6KmOCygLYKzrT
        BCNQRh2N2sxE3XAvDN+4+T9cpJWS2CnNGbe984/lWfpDXIfYlWfeqdT2ZV7sueypsLxvX4mjTVpvU
        bxeYscndiS79nII1KxUy+y1Qr7EDxaSingOHc1eA35cx/aJJXSid48jNVbFvSqXRnf9+mcsy6jqRn
        NMmNAlkNwQLCJ/yiV3RoIWh0PMULhfLM7dDAmsfZTv16dCKhl84aMsN3W08W5Z2cpVyKEzjqAY+ys
        2gJ9KaiA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jyyO4-00031c-KH; Fri, 24 Jul 2020 14:09:25 +0000
Subject: Re: [PATCH v8 3/7] init: add support for zstd compressed kernel
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-4-nickrterrell@gmail.com>
 <9ff49261-f5fd-b8dd-949a-0b8eab75369b@infradead.org>
 <20200724121716.GB632343@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5a93016a-2b88-b762-1569-c47472fe2a24@infradead.org>
Date:   Fri, 24 Jul 2020 07:09:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724121716.GB632343@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/24/20 5:17 AM, Ingo Molnar wrote:
> 
> * Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 7/23/20 12:27 PM, Nick Terrell wrote:
>>> +config KERNEL_ZSTD
>>> +	bool "ZSTD"
>>> +	depends on HAVE_KERNEL_ZSTD
>>> +	help
>>> +	  ZSTD is a compression algorithm targeting intermediate compression
>>> +	  with fast decompression speed. It will compress better than GZIP and
>>> +	  decompress around the same speed as LZO, but slower than LZ4. You
>>> +	  will need at least 192 KB RAM or more for booting. The zstd command
>>> +	  line tools is required for compression.
>>
>> 	       tools are required
> 
> Since 'zstd' is the singular tool required for compression AFAICS:
> 
>    LZ4            = lz4c
>    XZ             = xz
>   +ZSTD           = zstd
> 
> "The zstd command line tool is required for compression" is the 
> intended wording I'd say?

Sure, that works.
Thanks.


-- 
~Randy

