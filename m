Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4022B7C5
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 22:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGWUav (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 16:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgGWUau (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 16:30:50 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF7AC0619DC;
        Thu, 23 Jul 2020 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=Q1ZP2oivZh/ampu/bcHg40l20KbZv+vd3MDES1+Kr1Q=; b=uNlTis3DrybH3g4I51H3gnCa49
        aXJyBNL1QKujmrclRYWBVPCJogx06tbeXTaUjL5tJJ6YSihHvKM4wd1ZFDoMYJTQnYembfigvn5ZU
        7IkGRK2kkX9dk5odSN+SHt6/QP6gZsNhFiu7GFArawdjv8OQ02rtWnmeV4xkOH+Hq1ThVtAViZw9v
        t7NQ1ZoZIFWUz0DsO0z2DlN3cEf2htVYEbBexpEN+2rU9gxAe9F0tnOQbPndbY4y0y1MlnGSRJ1PE
        DdC3LqeonXVXPPQgrlaaQ6buAKgWR5NRKxMSG0aQ1LdT8/61ra3Nvb0zp+cSHGU4gD+piN07XZhRE
        X6sYQvpg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jyhrM-0002c6-CG; Thu, 23 Jul 2020 20:30:33 +0000
Subject: Re: [PATCH v8 3/7] init: add support for zstd compressed kernel
To:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-4-nickrterrell@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9ff49261-f5fd-b8dd-949a-0b8eab75369b@infradead.org>
Date:   Thu, 23 Jul 2020 13:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723192801.351114-4-nickrterrell@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/23/20 12:27 PM, Nick Terrell wrote:
> +config KERNEL_ZSTD
> +	bool "ZSTD"
> +	depends on HAVE_KERNEL_ZSTD
> +	help
> +	  ZSTD is a compression algorithm targeting intermediate compression
> +	  with fast decompression speed. It will compress better than GZIP and
> +	  decompress around the same speed as LZO, but slower than LZ4. You
> +	  will need at least 192 KB RAM or more for booting. The zstd command
> +	  line tools is required for compression.

	       tools are required

-- 
~Randy

