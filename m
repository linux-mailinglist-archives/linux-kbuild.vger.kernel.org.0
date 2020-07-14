Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAEC220037
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 23:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgGNVmw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 17:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgGNVmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 17:42:52 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFA9C061755;
        Tue, 14 Jul 2020 14:42:51 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so108241qtg.4;
        Tue, 14 Jul 2020 14:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dch/WtmoKPQg8SRn/xT9XuWPxCjeN6BPw/5vBDMLPao=;
        b=rHWw0+X+zL9ddXJHGLNV7xjzS0eiiSQzcypjCMxbHGz22QkSRGXXtGnRd5MDjvk7/w
         yqnU0NnbElreflfaS590bj4ZlPOfQscv9mmhaLuVFnjCnnX70y93TcNWen9KB9qA3j6v
         5k5zMDHrlXQtdJev+EzUYEg+wSUacBRYApl4QSD7d5UsB+Pz9ekk4+G1TEvXZI6WctXq
         mzuyNHyN5CBkVGUnVqAPJHAlOqVM/pngl0NgtFvLyiOIgHpmzhu1Hub6OG/TkCjExFRo
         Oc2xQIjZmNemXiXFrUkSzaIN9xnFuR1cD4FUPOSS4OOBE2IiALEb0VieY+zVzgse88y5
         gCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=dch/WtmoKPQg8SRn/xT9XuWPxCjeN6BPw/5vBDMLPao=;
        b=qKTt6KyquWNTXQJfh/zwxaHVpnQ0FQbVG/4bKxNaA5PBXaatmOHh55NsgyanQ/BNBP
         AmfEJb7LxqTItFa9IoIh7uxP0MhCb2NwHJ5shZR4TF+CDs0h8X2AN5fT5UlziOz59Am6
         AooPg/Vr30ePKouPXspyvyandYusdJirLb8HUdzdkRGHVpn8bJ8neo+Fk2LOM+8J1NrC
         Pwra3QNajB5qLVJf1tI3oQPvL+gM23KgEI5KiC6bT2FayB6InHuskLDN5krDg+JAjNsa
         6QOEYOY23+3pF/YHOR2XtQnIKpIE1nR6LeBhSsUkbTovHnsj5m3gcuAUgfA46Uhx/LNZ
         NijQ==
X-Gm-Message-State: AOAM533L7uaUhsEa0SkpL18TvjXTL/+nqma/6pQE2Pc7PcWVMzC7Y6aZ
        Gt0jW+DELYFnPpW7XK47VrE=
X-Google-Smtp-Source: ABdhPJzqJXUtDidVRHkXV4qNzeWa0YUAEGGmGN/8NWsY3UrCM6YCDQc4K/5yU4yxaXRn7gQCKKxL2A==
X-Received: by 2002:ac8:4ccb:: with SMTP id l11mr6786726qtv.18.1594762964831;
        Tue, 14 Jul 2020 14:42:44 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id q28sm377002qtk.13.2020.07.14.14.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 14:42:44 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 14 Jul 2020 17:42:42 -0400
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
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v7 2/7] lib: add zstd support to decompress
Message-ID: <20200714214242.GA1000731@rani.riverdale.lan>
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
 <20200708185024.2767937-3-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200708185024.2767937-3-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 08, 2020 at 11:50:19AM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> * Add unzstd() and the zstd decompress interface.
> * Add zstd support to decompress_method().
> 
> The decompress_method() and unzstd() functions are used to decompress
> the initramfs and the initrd. The __decompress() function is used in
> the preboot environment to decompress a zstd compressed kernel.
> 
> The zstd decompression function allows the input and output buffers to
> overlap because that is used by x86 kernel decompression.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> + *
> + * __DISABLE_EXPORTS stops zstd and xxhash from declaring themselves
> + * as modules by disabling the EXPORT_SYMBOL macro.
> + */

Hi Nick, this doesn't actually work, because misc.c includes export.h
via
	"misc.h" -> <linux/linkage.h> -> <linux/export.h>
and EXPORT_SYMBOL is already defined before __DISABLE_EXPORTS is defined
here.

Adding -D__EXPORT_SYMBOLS to KBUILD_CFLAGS in arch/x86/boot/compressed/Makefile
fixes that, and then you don't have to define it here.

Also, __DISABLE_EXPORTS does not currently inhibit MODULE_INFO, so a
.modinfo section gets emitted into misc.o. I *think* this is harmless
and it will get discarded when building compressed/vmlinux, but thought
I'd point it out.
