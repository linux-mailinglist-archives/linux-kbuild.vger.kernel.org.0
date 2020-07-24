Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C241D22C859
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 16:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXOss (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 10:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 10:48:48 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577D9C0619D3;
        Fri, 24 Jul 2020 07:48:48 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id q3so7415430ilt.8;
        Fri, 24 Jul 2020 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=AfTbl+xYnSMnr2dDiDoDcPiQOlraklTTHYcmYhyUnOg=;
        b=HiEu5S/7+v33uYgp7Yy4N5KJQWU46qvkheSu4OxEeyWGCGYKoVn3tYCw/URpePmCWC
         P9Sc1Gyf897uYvdoecbrMUInjQs434jXcvWwiePIajv6zsSJS0Gx7Sp/vsZYwwLuvoJH
         1jhvHxLj/aGt0gkuLefzXVW3as5pCUp8ZNcj9aReIDN5rrLX2k2AkM43pgw1wcqNYZcz
         7rOzxbYJQJ67iP3ybkxtLhG12iLJfmWhN8AJ6ugufemno1ihbWP6Mlq4lVG+FTwdob6A
         YjFfkI9ju2+jtYo1fKPz/EPuAodonpTCxmqwJqYtqNAHCiOlHjR7VEHidlMhrEgkFmZK
         GrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=AfTbl+xYnSMnr2dDiDoDcPiQOlraklTTHYcmYhyUnOg=;
        b=YEVvdvfgX+yIZNoenfP/9XkbheoIibMxasJ9toLaFpACfxPSEl/rAXXYNd30EXGyxM
         WfOUXwUNhXNPOQ3wb72FmgVN8nMQXRXPlpanWFiHQ8cW750hJUJQQJ5Ro2ky8tmiVHh8
         OwppjQCxR/gszb6ZuW30lAqAeX+e0gbP85D5ddhYdf2E20KHj+qOnltLDSskoLQlQipT
         vnBnHk/vCuNXGP9odnX8QrRv474dYofuae6wQLRfouK5zKBH7S/GfhggngAXBQ9jUmV3
         3jHP9N6vBkUFLIVgIa5y+BX6cwmpBwOXNFTr/hXveAg1A96MaDvZzpvA4E2kOHdS2dSO
         jVpQ==
X-Gm-Message-State: AOAM530CFYNtL3Wf+Mx6TxHZIhJXpMHpgevg9DtM6Q8feD3/3l0SLXIH
        6Pt0msP7Yz8F5nE2myibvtkrpET/Tjo90ovs8UY=
X-Google-Smtp-Source: ABdhPJx82953GvUn4UMlNxBZ/swHYEqZz9F+hAPkCEURlD4RRr7tkUILpIDrIiYQ7XzxxZ6AHYDXKwM/tq9Zc9iXYkc=
X-Received: by 2002:a92:290a:: with SMTP id l10mr11127609ilg.204.1595602127620;
 Fri, 24 Jul 2020 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com> <CA+icZUWV3ANmBj08QZKBtEE38Y-iyCGGxLWtiFkdpKqkGP7ZqQ@mail.gmail.com>
 <20200724143022.GA601509@rani.riverdale.lan>
In-Reply-To: <20200724143022.GA601509@rani.riverdale.lan>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 24 Jul 2020 16:48:36 +0200
Message-ID: <CA+icZUWr0FBO1dpu-PPXJDSFzemoD7zniq+eQQrWXA_uGVKVAA@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
To:     Arvind Sankar <nivedita@alum.mit.edu>
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
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 24, 2020 at 4:30 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Fri, Jul 24, 2020 at 02:50:34AM +0200, Sedat Dilek wrote:
> > On Thu, Jul 23, 2020 at 9:30 PM Nick Terrell <nickrterrell@gmail.com> wrote:
> > >
> > > From: Nick Terrell <terrelln@fb.com>
> > >
> > > * Add support for zstd compressed kernel
> > > * Define __DISABLE_EXPORTS in misc.c
> > > * Bump the heap size for zstd.
> > > * Update the documentation.
> > >
> > > Integrates the ZSTD decompression code to the x86 pre-boot code.
> > >
> > > Zstandard requires slightly more memory during the kernel decompression
> > > on x86 (192 KB vs 64 KB), and the memory usage is independent of the
> > > window size.
> > >
> > > __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
> > > kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
> > > duplicate definition warnings.
> > >
> >
> > That was reported by Arvind - feel free to add a Reported-by: ...
> >
> > - Sedat -
> >
>
> It's not necessary to add Reported-by's for problems encountered while
> developing the series. Especially as it was my drive-by suggestion to
> use __DISABLE_EXPORTS that introduced the issue in the first place :)
>

It is up to you with credits.

> I'd have added it to the Makefile and just dropped the definition in
> kaslr.c -- should be no reason for anything in here to use EXPORT_SYMBOL.
>

I cannot follow - this is no more needed as this was due to some of
your local changes in kaslr.c?

- Sedat -
