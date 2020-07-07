Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B8F217AE2
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 00:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgGGWLd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 18:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728764AbgGGWLd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 18:11:33 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6621CC061755;
        Tue,  7 Jul 2020 15:11:33 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i3so33015721qtq.13;
        Tue, 07 Jul 2020 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xy9G4OGBzN14/6tq289iIZpWrMB6jBijjEQf6wY1dhQ=;
        b=LbPHDEVLdQoiUZFqiu7OHTpaJdG/SZ+It/oqO2Dt64ru/aa5pf/8DvDRmH+Ur12loI
         +GRbd2591j5Ged2yr6pWHnlU+mAZxtl3/hUyf0urDhOdNHoIDNcTFlZwxUV4a5SszcOa
         5DB6cFnHGPBVvxtpFUpki9RyaIYVS41mWc1OUkwRiudc9D7VLmRR5dmJxAaPv4pkjB9m
         oTq6O3mtx4LHu2O0FpELIyNoncGAGoFuS34H5Y/gRfPMH3NH9kkgpSSsChcCDRpuus0E
         2zv99AIQUfvFqCSxgMqo9NB2iooPrJE/XWPAxmMOXRpMF3xYs4+AQ5GmqYr9OBHGMsni
         BgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Xy9G4OGBzN14/6tq289iIZpWrMB6jBijjEQf6wY1dhQ=;
        b=SWfNB0cLDTY3eTEMvxVit302IkrYtI72D1hylaZzGmSlEN6h02W5Zkmu13ZtH0sMTj
         jZGz+tfyZlPL+ynz6jZdA5iIlwKCUAd6mk7ICxceojH2GVEjWepvLMcbWP54BkHjxYR7
         qP44JtVzoejT5OquEeyUHAX+ryHcvDR6V+T32noe44RkLW5TZ8Y6CyzL9avvtrh6glPq
         duco/eBferzMHik98WjmXa0O6auyiryRt3Wpx45gerpcK2UKKkQPOAeIoobMDj/q81fi
         4uhywarCY2idaMzGzp1nAtCfcWrgtpVZ4tBMVxGyyMD3u5JG/ib4qr4M6awY/z6StJLq
         Odkw==
X-Gm-Message-State: AOAM533lBdT8W/Q5sXDuS5W3UBBvTJO8Kw60B1W9np0IQQ+Va8W3SsR9
        1sgMHokU0n0GapagYGJHo1w=
X-Google-Smtp-Source: ABdhPJxpHcuxJwRbskwJch1SOb6DiRp87yFjhqLbqz5Rgxtb1H7uOa4RM2l7vYjqp2KdbsCQoxpb0Q==
X-Received: by 2002:ac8:430b:: with SMTP id z11mr56717266qtm.73.1594159892580;
        Tue, 07 Jul 2020 15:11:32 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id o5sm29469514qtb.26.2020.07.07.15.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:11:32 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 7 Jul 2020 18:11:30 -0400
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
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Message-ID: <20200707221130.GB1591079@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200707034604.1539157-5-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 06, 2020 at 08:46:00PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> * Adds the zstd cmd to scripts/Makefile.lib
> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
> 
> Architecture specific support is still needed for decompression.
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 916b2f7f7098..d960f8815f87 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
>  quiet_cmd_xzmisc = XZMISC  $@
>        cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
>  
> +# ZSTD
> +# ---------------------------------------------------------------------------
> +# Appends the uncompressed size of the data using size_append. The .zst
> +# format has the size information available at the beginning of the file too,
> +# but it's in a more complex format and it's good to avoid changing the part
> +# of the boot code that reads the uncompressed size.
> +# Note that the bytes added by size_append will make the zstd tool think that
> +# the file is corrupt. This is expected.
> +
> +quiet_cmd_zstd = ZSTD    $@
> +cmd_zstd = (cat $(filter-out FORCE,$^) | \
		   ^^ should just be $(real-prereqs)
> +	zstd -19 && \
> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
	   ^^ size_append does not take arguments. It's used as just
	   $(size_append) and will always output shell code to print the
	   total size of $(real-prereqs) -- see other compressor command
	   definitions.
> +	(rm -f $@ ; false)
> +
>  # ASM offsets
>  # ---------------------------------------------------------------------------
>  
> -- 
> 2.27.0
> 
