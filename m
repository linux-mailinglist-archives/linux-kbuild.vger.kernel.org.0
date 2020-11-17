Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F452B5672
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 02:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgKQBym (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Nov 2020 20:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQBym (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Nov 2020 20:54:42 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70E9C0613CF;
        Mon, 16 Nov 2020 17:54:41 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id m65so14588852qte.11;
        Mon, 16 Nov 2020 17:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NTtCzB5VIaFDrBNNNZ7NaHNKVBpJ8Hadb4R3oCLX97k=;
        b=rtx/RU+s+8cPVIrxRCrElV7tpyND3P0XAg2TofP4rT0WDB7pYRXWgCN0tPwwytBqzm
         dQiiSC8vlen4ulMHSLlnPMzExAzkL6dtKyTO1aF34lWSB54q67cx5AsGAA6vVYx4xTG3
         o1CCon4XTtNcfJkxdg4qxQeqx6YXpLey84hDTajAudYBngKt9IxD3lqQz7yaOv2iNRfE
         pF4ZQyQP+C+x7DWc/knwsv6HNK36wcCcVwLEs04rQ/30YGHjF1IPZ0zmchERdoem/XKA
         qqI8xfpGXe6HuxEj+ltWDXovggWLBZaST43NW4VJugRHzyUBOyYqGKSh2hKRmtr14HHt
         vGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NTtCzB5VIaFDrBNNNZ7NaHNKVBpJ8Hadb4R3oCLX97k=;
        b=S1j3J/UcTwd5FrCbQ9PB67qxIDaFnApJKqXf9V62PEf3VjghZUC4FBTNXif0uNFhDx
         OVYUQSTVpZbA0ipUTo+kxHtl8nwEdX+2z+XEl/IhxzO43i3lDDZesLUFyvQIktSUnb0K
         czzDVFh+0uCy5qf4WP7H0z0XJ4I+mEbxS4YOOChfJQzYhePSK2zIUi80bL7bh4sUMI68
         whlL6dM8omh/MzYWpxExSSQX2axbZjA/3HaIWhMcjUwzZaW5Nj3G/Lzj7Tv6oteLfzI2
         DfPva/bR1VZUHRGf5B+n4RQqxOuDv47L7FtBVNMTTQaWVUm5Hesj/7lQmzqNJuhemxca
         dXzQ==
X-Gm-Message-State: AOAM530yjASSnFzxJ5IDY4crLibgvtiTbb0NubNLdBr0kAFjANgDO7Vk
        QfNVt077AUt1c/Oz+PsFays=
X-Google-Smtp-Source: ABdhPJyuFuM/Nr8VHJEMu8p4WFcxiSTMgMKAz+9tvCAPF267qYflO/YfHmr2Gr/AgEALLCEUyJl0CA==
X-Received: by 2002:ac8:6b06:: with SMTP id w6mr17145176qts.6.1605578081016;
        Mon, 16 Nov 2020 17:54:41 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id f27sm3258802qtv.95.2020.11.16.17.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 17:54:39 -0800 (PST)
Date:   Mon, 16 Nov 2020 18:54:38 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <20201117015438.GA299247@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 16, 2020 at 05:41:58PM -0800, Nick Desaulniers wrote:
> On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Currently, '--orphan-handling=warn' is spread out across four different
> > architectures in their respective Makefiles, which makes it a little
> > unruly to deal with in case it needs to be disabled for a specific
> > linker version (in this case, ld.lld 10.0.1).
> 
> Hi Nathan,
> This patch fails to apply for me via b4 on next-20201116 due to a
> conflict in arch/Kconfig:1028. Would you mind sending a rebased V2?

Hi Nick,

This series is intended to go into v5.10 so rebasing it against -next
defeats that; please test it against v5.10-rc4, where it still applies
cleanly. The conflicts will be handled by other entities (Stephen Rothwell
and Linus).

If you want to test it against -next, 'git am -3' will allow you to
easily handle the conflict.

Cheers,
Nathan
