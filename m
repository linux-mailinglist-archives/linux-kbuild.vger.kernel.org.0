Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34F93BE805
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 14:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhGGMhB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 08:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbhGGMg4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 08:36:56 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39522C061765;
        Wed,  7 Jul 2021 05:34:09 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id l5so3093034iok.7;
        Wed, 07 Jul 2021 05:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chmQa5IpeIt4IXkO2YYlm4kIQAbHAUBT40W34N6HK+c=;
        b=FP3iUiQfP/icEI4LbjBSI3DkoLml9ckJxyc3w37066XsHA2hBFKv0vpOp9C6DKCxho
         Z4Vjfii2LyVLsjfCJ8u5FQawVcj+A0f/1VQF3sgThoUYad8xOAY+QL7ArDizjgI4edP6
         cgHxw5nj6fO5yn8OIWb6OjbCm0TvBokvL/qsj14b2dPgausuhyHtdlVf9C4ayvPCR0NT
         UrnX0scoQOt0ICkCnenl6NfddAYfvgxn+VQs0BrEweAk/j/v/hEJzWrMVKAjousYkLmJ
         FWXw0qA4i++fd3BFeBc3qlH7+A4QKI1TN0TbDdzlKf5qldDbHDC7J1jUAS48Kxrbyt5B
         SC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chmQa5IpeIt4IXkO2YYlm4kIQAbHAUBT40W34N6HK+c=;
        b=gj2MRW8IrTR/6C0r+L+NXFpAEMPwuqjtxphZPXrpIE2DCi6nSBUhMfZ8biWK+NKP5B
         2D/lRn9xXhXJXO72MHmAxinZZSrFWOLD8keA6e+G3T36Az3YyWoJX8ogacwHV1Wc/j7w
         wBrzUABCe/UkssfcdCLJgyTAp3eMoIvqJQAekve/yd0NRHqqlIxno0dY9/HPbTfpLXUm
         2SI3EB2se+Axk5JkZGEoSgmB0yUcQleJV47h0z/q8DE+HMjTIpjghHDsUE49c7jnFQ5A
         +UjZmZYZqbXGG+sng8xUeUVUJokzsNMxP0gcOYAACbRhQZNzfs1mkIv0gca/ywdVDp5l
         AOXQ==
X-Gm-Message-State: AOAM533N6NU/3hHtIfe9U3us/FAli0hk1hB25O3arF7951jq8IV55+VH
        WyEQbr2rsoNjSjg8DLlKNmaj2odbN6lDFSlbDdg=
X-Google-Smtp-Source: ABdhPJxL3YLMtrMJcDPXmd0E/oNsIRCPtEGtMJDT6uaORil50lerHGgUucLM4nPUYLTm0OKfWDkk2TWjYDIeI2rYa48=
X-Received: by 2002:a5d:8c9a:: with SMTP id g26mr11524818ion.121.1625661248643;
 Wed, 07 Jul 2021 05:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <YOVNJuA0ojmeLvKa@infradead.org>
In-Reply-To: <YOVNJuA0ojmeLvKa@infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 7 Jul 2021 14:33:57 +0200
Message-ID: <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
Subject: Re: [PATCH 00/17] Rust support
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 7, 2021 at 8:44 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> Not sure if this is just a state of the union post or if you actually
> want to submit it.  If the later I strongly disagree with merging it,

We are submitting it.

> as you should refined it and prove it actually is useful first.  Where
> useful would be a real-life driver like say nvme or a usb host
> controller driver that actually works and shows benefits over the
> existing one.  Until it shows such usefulness it will just drag
> everyone else down.

It is "proven" in the sense we are already starting to get users
downstream and other interested parties have shown support.

However, others are more conservative and will only start investing
into it if we are in mainline, i.e. if the decision of having Rust or
not is already taken.

But it is fair to ask for a hardware driver to see how it looks like,
which is why the cover letter mentions we are working on one.

Now, if you are OK with non-hardware modules, you can take a look at
Rust Binder (last patch in the series) which is a non-trivial module
and it is already working.

Cheers,
Miguel
