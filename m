Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F6822C4E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 14:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgGXMM4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 08:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgGXMMz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 08:12:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD68C0619D3;
        Fri, 24 Jul 2020 05:12:55 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a8so6879246edy.1;
        Fri, 24 Jul 2020 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MNWc0su/JnnluaDA+8CCu6YuN01mXvydu0VWX6fHUwI=;
        b=TYl8QLioQBYmYF/e7BIhFpjG+1MonWCfI+IOfU5BxHz+b1Ycw62QsoH1U0M5QfeP2F
         k06vKn99Rwy/ZLjZu3mTPAdJMSvfTPIKjBpNMd3WcXe9gyV2Wclu7SnkwKbBazSmnHnH
         Mh5THBiwufkrdW7Cc/1lqulna+PtuQhLAVPPJ8d5UMMAQMzYSB8g01KsAX0BWNdb+SxI
         A1KCrF326yh2LNcmQnKc5z4LNVE7B1jcnzE812DvEAA7b1Jg492XW4YyFlxHSggOZ3at
         InKc7a3xf5yx/I/wVBt7A9czZY6GgxN4CDLZh+LEBn8sAGhnJNTvcL1H7ErBr3T2VarL
         +gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=MNWc0su/JnnluaDA+8CCu6YuN01mXvydu0VWX6fHUwI=;
        b=eXW8s5Lvr3I8AD/wrUhj4VCzOzQchX2dz0KRc1hNNAgMNl5DSwH6g22PN8PJ/iGYQM
         7bLgSeRDE8arhcmgB5vJV5dzKuheHAyRxiuud6cPPESMtsnmymZ2W5i4oLhfyTTPR09F
         z6K+dcIGFmc4SBj8QvGrXPZEy2za4Ug3S86V4G1RaILffuqX90dLUMecyeeRHM9m1JUk
         nzib6gowLneiYrAN1yAqzuo/eaGgqMaJgOZKSpeqXDN/grIeSkFjz7EcIXFz2NOryZSW
         efkdo+hmEAMvfG8hZsfc0p+X/01Sx6zTna2fD12+FhY6kH59rzOH4oQC0Y1PBaJr0fpY
         HOqA==
X-Gm-Message-State: AOAM530Ig0SCV6PxmKErOnx6+L1Q1UiJBzDeKjBQKbUDqjJ4zsHLJG9Z
        fX5StN4YoqYYFs+6GUJR5tFp7sTF
X-Google-Smtp-Source: ABdhPJyMHQrJpeOA+v0byFjX0VmVqWTMsvTlwH88ith1El30XY++sl2EXRmhj74L96OyHJCfw5S1TQ==
X-Received: by 2002:aa7:d049:: with SMTP id n9mr8952718edo.39.1595592774091;
        Fri, 24 Jul 2020 05:12:54 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id o15sm615607edv.55.2020.07.24.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:12:52 -0700 (PDT)
Date:   Fri, 24 Jul 2020 14:12:50 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
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
Subject: Re: [PATCH v8 2/7] lib: add zstd support to decompress
Message-ID: <20200724121250.GA632343@gmail.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-3-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723192801.351114-3-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Nick Terrell <nickrterrell@gmail.com> wrote:

> +/* Size of the input and output buffers in multi-call mode.
> + * Pick a larger size because it isn't used during kernel decompression,
> + * since that is single pass, and we have to allocate a large buffer for
> + * zstd's window anyways. The larger size speeds up initramfs decompression.
> + */
> +#define ZSTD_IOBUF_SIZE		(1 << 17)

Nit: s/anyways/anyway

Also, please use the customary (multi-line) comment style:

  /*
   * Comment .....
   * ...... goes here.
   */

specified in Documentation/CodingStyle.

Thanks,

        Ingo
