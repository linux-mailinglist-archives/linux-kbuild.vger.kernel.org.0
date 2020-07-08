Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156A7217D64
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 05:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbgGHDJn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 23:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728208AbgGHDJn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 23:09:43 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A5EC061755;
        Tue,  7 Jul 2020 20:09:42 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id j10so33446871qtq.11;
        Tue, 07 Jul 2020 20:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KPrpyQ4PYdwinThunQb5pMY5ogA3yjRamkNNtP4Zjac=;
        b=lKfC25bOhHHun/7T/lo81Lztl6OKtE0xy8tpxApDTivHNeNW8WhvyFd3KT+HDVAa1G
         ZPlRpINBaf/lrge3vk+ElidZ5zm18Ghr0gkSiTd7vO2BVwu30bsS6x5PJBmulWQedjWL
         K6ignwHlO6TBYaQfHn/3agsKBP6QU6u83JCGXK7+MBxsSVtauXLSxE1R5WSXZEqZrUWj
         eFnb95xhVjNk2TvHhsL8WW8R2TQCUdY0h8ru4gOS+eeuxbUyR4i0B3GZ8baR43PLq5MH
         4o3WESAwuq6g+nr1qyD5tqOx8u7dxa8a5WU8oRAGqFnUkpmqeiahOrsB0Fpofl7eHCxh
         g4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KPrpyQ4PYdwinThunQb5pMY5ogA3yjRamkNNtP4Zjac=;
        b=nkA0VV/relAIm6zyPT9Ui6HKA2k5k9do6dIbCUoiQSzkMem60OePDCdlD3mSSDnC97
         BpD9+fv977hDPvR8xLpsDNlZJDkGq8ECb6TdsZ6dyKDGMgcnOXuny3aYA5nr/ezlWDCp
         uLyrEVZCL86WfJNIPc2LCL/c3BY7E7OMk0/e5Eydlb2vawsYtSI5qguoxe4qPiulTTGy
         KI8tVridzjSOsnu8RDdAtDRjZ01G/+Tav2IaynpZYA1iD6sT670fB0K++nLGPBYnL1fz
         1zw4J2Wc3l0Qd0Vg+Tc2gm73DQrbmqglFJiXLhY0exQQj7we2MEj9CHnRU/4ABwVL4dK
         hWXQ==
X-Gm-Message-State: AOAM5315xwO5h/mi56F+kEdGaJI3rDb6UBrBmrwxaioMcbsXEVZaImy9
        UgkFRAPo9qqYqsU+m1CYNOmY5rpiDsLD2g==
X-Google-Smtp-Source: ABdhPJxDrIIVmuknjiZ2Xk5MOt1DJP4D2uuvo17G6/BZDTBxpmcDh7YmHvpx6aoWxZSCCMRxNXYgRA==
X-Received: by 2002:ac8:3777:: with SMTP id p52mr56819936qtb.31.1594177781911;
        Tue, 07 Jul 2020 20:09:41 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id i10sm32425815qkn.126.2020.07.07.20.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 20:09:41 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 7 Jul 2020 23:09:39 -0400
To:     Nick Terrell <terrelln@fb.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Message-ID: <20200708030939.GA1847378@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
 <20200707221130.GB1591079@rani.riverdale.lan>
 <BFD3E8B0-4BAA-4E3A-AF16-FB17E88BECFE@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BFD3E8B0-4BAA-4E3A-AF16-FB17E88BECFE@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 08, 2020 at 02:01:50AM +0000, Nick Terrell wrote:
> 
> 
> > On Jul 7, 2020, at 6:11 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > 
> > On Mon, Jul 06, 2020 at 08:46:00PM -0700, Nick Terrell wrote:
> >> From: Nick Terrell <terrelln@fb.com>
> >> 
> >> * Adds the zstd cmd to scripts/Makefile.lib
> >> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
> >> 
> >> Architecture specific support is still needed for decompression.
> >> 
> >> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> >> index 916b2f7f7098..d960f8815f87 100644
> >> --- a/scripts/Makefile.lib
> >> +++ b/scripts/Makefile.lib
> >> @@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
> >> quiet_cmd_xzmisc = XZMISC  $@
> >>       cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
> >> 
> >> +# ZSTD
> >> +# ---------------------------------------------------------------------------
> >> +# Appends the uncompressed size of the data using size_append. The .zst
> >> +# format has the size information available at the beginning of the file too,
> >> +# but it's in a more complex format and it's good to avoid changing the part
> >> +# of the boot code that reads the uncompressed size.
> >> +# Note that the bytes added by size_append will make the zstd tool think that
> >> +# the file is corrupt. This is expected.
> >> +
> >> +quiet_cmd_zstd = ZSTD    $@
> >> +cmd_zstd = (cat $(filter-out FORCE,$^) | \
> > 		   ^^ should just be $(real-prereqs)
> >> +	zstd -19 && \
> >> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> > 	   ^^ size_append does not take arguments. It's used as just
> > 	   $(size_append) and will always output shell code to print the
> > 	   total size of $(real-prereqs) -- see other compressor command
> > 	   definitions.
> 
> Yeah, when I wrote this code, this was how the rest of the compressors were implemented.
> I noticed that they had all been updated when I was responding to Norbert Lange earlier.
> I will submit a v7 shortly with the updated command.
> 
> Thanks for the review,
> Nick
> 
> 

Looks like it changed in 5.1. I guess this patch has been floating
around for quite some time :) Here's hoping v8 is the last one!
