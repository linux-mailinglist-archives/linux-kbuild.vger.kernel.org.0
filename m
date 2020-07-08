Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C0A217D86
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 05:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgGHDZS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 23:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgGHDZS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 23:25:18 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582F1C061755;
        Tue,  7 Jul 2020 20:25:18 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id j80so40278245qke.0;
        Tue, 07 Jul 2020 20:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=daQ8gUWBpYYT1qafV7i/DiWXDPi9W6AWiRJiDyr1/RU=;
        b=RwWYMuKItMH+819vpkH0giibIr9s5TFI8wiLHMGHBuTMQCS0v1awyv0B45wuApyQEV
         lbpkY4Ta3HWxs/upFHE5c+Yt7xxS8Mn/YulNOJ7cRwgHo06aLaam2H7esSbsqox2qYK0
         tEVAKxN7A4xbZH1fJ1ApvLxGQ6wYdNVqOBPocBJJ4LAjekG/YI6RVLnAey9r7Cit6zAY
         FtlI//KmmkqCDtLsmpBzMsd+X0egxxZgl9hplVnG/NuI2EdbNlmPHciGQydg/j8k4kCP
         JA46tnFryDoGB2zfRx5XkD7C6vil1H0b3C3zq702G3BRhpWOFgqA8uWdpL/5sDFqd9/I
         67qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=daQ8gUWBpYYT1qafV7i/DiWXDPi9W6AWiRJiDyr1/RU=;
        b=OAezdDDczOpNDQ11K3gx4D6mHOoaCZN3naiF/5Pf3N/V9BiaDNH5+RXFnConbF/q61
         pNKB5epE2ew29Dp42Y88wUv5spMi5h8ZmOdHqv44fMFJuuH+PRsTQSM4MwNjc5pH0S4N
         aP18tY6cmrckPX9nj2yfHb9f2XG0SAovjL6sX16CTE9QzQwskDwG9CeK+O9ULsh6OUXO
         sHoxXjgYFAFeQ70dHAGQNg7/TJZT8T6g+G7jJoPudafcqj60kGBmQIYeJuA8f8l1dHqS
         vta7O8YkfHD3nh33xdk9Ku3VU17V8bHufpCJfedFswPkxWEuIDxrLz3MEGCPm9Lyz1kE
         nfzQ==
X-Gm-Message-State: AOAM532FRhqSnE4ovuMl2Ijs8stFfQvJI3OkYTUYe32KE9KGSRHybl4V
        ljYV/dTKSN5tnSSIB4ZBFrA=
X-Google-Smtp-Source: ABdhPJxE7Apo5utCPfPNqOReD3RwdGBnP99rRfIFSjSoGSt0GKCBZTSYR/bmLMQqPZ0khXMGWLROJQ==
X-Received: by 2002:a05:620a:81c:: with SMTP id s28mr52427342qks.133.1594178717573;
        Tue, 07 Jul 2020 20:25:17 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id v10sm29103488qtk.14.2020.07.07.20.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 20:25:17 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 7 Jul 2020 23:25:15 -0400
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Nick Terrell <terrelln@fb.com>,
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
Message-ID: <20200708032515.GC1847378@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
 <20200707221130.GB1591079@rani.riverdale.lan>
 <BFD3E8B0-4BAA-4E3A-AF16-FB17E88BECFE@fb.com>
 <20200708030939.GA1847378@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200708030939.GA1847378@rani.riverdale.lan>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 07, 2020 at 11:09:39PM -0400, Arvind Sankar wrote:
> On Wed, Jul 08, 2020 at 02:01:50AM +0000, Nick Terrell wrote:
> > 
> > 
> > > On Jul 7, 2020, at 6:11 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > > 
> > > On Mon, Jul 06, 2020 at 08:46:00PM -0700, Nick Terrell wrote:
> > >> From: Nick Terrell <terrelln@fb.com>
> > >> 
> > >> * Adds the zstd cmd to scripts/Makefile.lib
> > >> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
> > >> 
> > >> Architecture specific support is still needed for decompression.
> > >> 
> > >> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > >> index 916b2f7f7098..d960f8815f87 100644
> > >> --- a/scripts/Makefile.lib
> > >> +++ b/scripts/Makefile.lib
> > >> @@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
> > >> quiet_cmd_xzmisc = XZMISC  $@
> > >>       cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
> > >> 
> > >> +# ZSTD
> > >> +# ---------------------------------------------------------------------------
> > >> +# Appends the uncompressed size of the data using size_append. The .zst
> > >> +# format has the size information available at the beginning of the file too,
> > >> +# but it's in a more complex format and it's good to avoid changing the part
> > >> +# of the boot code that reads the uncompressed size.
> > >> +# Note that the bytes added by size_append will make the zstd tool think that
> > >> +# the file is corrupt. This is expected.
> > >> +
> > >> +quiet_cmd_zstd = ZSTD    $@
> > >> +cmd_zstd = (cat $(filter-out FORCE,$^) | \
> > > 		   ^^ should just be $(real-prereqs)
> > >> +	zstd -19 && \
> > >> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> > > 	   ^^ size_append does not take arguments. It's used as just
> > > 	   $(size_append) and will always output shell code to print the
> > > 	   total size of $(real-prereqs) -- see other compressor command
> > > 	   definitions.
> > 
> > Yeah, when I wrote this code, this was how the rest of the compressors were implemented.
> > I noticed that they had all been updated when I was responding to Norbert Lange earlier.
> > I will submit a v7 shortly with the updated command.
> > 
> > Thanks for the review,
> > Nick
> > 
> > 
> 
> Looks like it changed in 5.1. I guess this patch has been floating
> around for quite some time :) Here's hoping v8 is the last one!

Err, I meant v7. Hope I didn't jinx it.
