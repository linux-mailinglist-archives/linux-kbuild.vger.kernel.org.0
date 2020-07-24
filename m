Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A1D22CC43
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 19:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXRiZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 13:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXRiZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 13:38:25 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42227C0619D3;
        Fri, 24 Jul 2020 10:38:25 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id b25so7477131qto.2;
        Fri, 24 Jul 2020 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h8OuBoVZmHodgrk7eqmJs9JJJjcEJ28E47aC8vkxwwo=;
        b=vB3CC7n5Xa7O59rda13o05LkCVplcDIXtKw8FfwyDBXsQgAr0kzWH0yuZ00rn2o2rz
         lfv+ZRS9WzBnfyzNjZ1CzryL6SZZnOi+GIJ5QMFH3tIjsbyxR1F3M03bO1ucF1qnK5kN
         VayWVup6hfzpnsGvt/UDfAr01UIxuzBWF4Zty7nog8kK+2m7ErIq0eE1Tjgjel1wnuJf
         bkrxzwFzxXlQ+iErOlEpfRpBJq4vC/KQgcxMCuvmjWPxV0m30Uzih35Q+UrMl7Jyz4QW
         K2vRH/LxpGmhbzTtEQ2YKGhc8QIn6qVYwj3GO7xcOk4ocurPCArFuqbJi0OUwF9KBjD2
         0rwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=h8OuBoVZmHodgrk7eqmJs9JJJjcEJ28E47aC8vkxwwo=;
        b=U14Isikqu8+iDZfGNY5ESXsxDIeAA6M4KEnzlAm9oUq7F32/fFW90gdG5NAqfSXTbT
         Yf2YkQRU8ELoj2FEyRqXF1GHVEb0sLJgp+Ddh8S0MagJtR3ZZ5rpBjHX5nm2JdXQ+cuV
         enA+sNYV3OBj9F7oq6j6jlyi0dycQ6m2E0OooZKOxvdRBm+bGVMiaQbUKHgfLDJeMsgF
         G2nB0FVd9GgR16t8aK2lFWNraPXJ7DuL4UJF05QoRbcBCGEM5RxN0oPxHfV6liiUU2rN
         yN57gOT+wC4pY48pZyXw/O5Hn15zPVn54FyNkJVcHWkQbOEtpi+qsEz/Z/3cxlx6Nux3
         xj6A==
X-Gm-Message-State: AOAM532AgP3VaceUXpkuWpWGpOhgcpgOe1/iNKPGaP71QNlJK31pX/Jm
        waGu99BbA4wG/y55ZByriwY=
X-Google-Smtp-Source: ABdhPJw/5lim3mSHtfyJ24xyiR90y8hVgwgsR6QqUYYaWpmZio1qvRaaKjRG/P/hiWEVrqcozmk4TA==
X-Received: by 2002:aed:3b0e:: with SMTP id p14mr10681881qte.149.1595612304359;
        Fri, 24 Jul 2020 10:38:24 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id s127sm6865632qka.85.2020.07.24.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 10:38:23 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Fri, 24 Jul 2020 13:38:21 -0400
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <nickrterrell@gmail.com>,
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
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Message-ID: <20200724173821.GA675116@rani.riverdale.lan>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com>
 <CA+icZUWV3ANmBj08QZKBtEE38Y-iyCGGxLWtiFkdpKqkGP7ZqQ@mail.gmail.com>
 <20200724143022.GA601509@rani.riverdale.lan>
 <CA+icZUWr0FBO1dpu-PPXJDSFzemoD7zniq+eQQrWXA_uGVKVAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+icZUWr0FBO1dpu-PPXJDSFzemoD7zniq+eQQrWXA_uGVKVAA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 24, 2020 at 04:48:36PM +0200, Sedat Dilek wrote:
> On Fri, Jul 24, 2020 at 4:30 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > On Fri, Jul 24, 2020 at 02:50:34AM +0200, Sedat Dilek wrote:
> > > On Thu, Jul 23, 2020 at 9:30 PM Nick Terrell <nickrterrell@gmail.com> wrote:
> > > >
> > > > From: Nick Terrell <terrelln@fb.com>
> > > >
> > > > * Define __DISABLE_EXPORTS in misc.c
> > > >
> > > > __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
> > > > kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
> > > > duplicate definition warnings.
> > > >

> > I'd have added it to the Makefile and just dropped the definition in
> > kaslr.c -- should be no reason for anything in here to use EXPORT_SYMBOL.
> >
> 
> I cannot follow - this is no more needed as this was due to some of
> your local changes in kaslr.c?
> 
> - Sedat -

That part was meant as a comment on the patch, i.e. avoid the duplicate
definition warning not by putting it in misc.c instead of the Makefile,
but by dropping the definition in kaslr.c.
