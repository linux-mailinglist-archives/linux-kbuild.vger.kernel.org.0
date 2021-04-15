Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2CB3609A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 14:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhDOMmy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 08:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbhDOMmx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 08:42:53 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BBCC061574;
        Thu, 15 Apr 2021 05:42:29 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 82so25968029yby.7;
        Thu, 15 Apr 2021 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fg1M3JraqfPDjiabkJVNqyxhu8/Pp6Uz2D3T2HiqLvQ=;
        b=kpmqvZ16cOjL1qmF50hdCBJJl/SH0b5eS3d35WnCRAcH3TNBYEYghwBNxfcF8SdyvP
         YBuJeOq6e5TenRxL14f+MQcSmeAe1QCGJzsVLD/6e/dM7STmQdV4M2vCipvbi23SgjN5
         zuPOj3BXYixygBdg/ZirIIOmoynp8f7URe4mAIkQ9GwcJxP8jQviEPTDstrAihADSGIz
         V4alt5N2ZfwPCJWb+wB79+XEuO8IZ+ysRNtDliVZjBd/H4io5SV8YEm1RNVEBSe/BNEY
         1+neJHgpQLDHzSgJCmc1XBTMqTfvqG1hFphLuubccVGFqXqtCLRtYXQv8QYlGC7nNRxy
         e5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fg1M3JraqfPDjiabkJVNqyxhu8/Pp6Uz2D3T2HiqLvQ=;
        b=PhBfW1U1SLvjymmF+2gIZhCig6RQnKiAuDAOsjrptilTfaVjqjWpwQ3gxreqbX+rR8
         JJZEk6Z3qBkGdW6OJaolOrDdx47xlXO7yAocfVkzq6WpmK0fD+h2A60FznMhqnyQ6s3a
         sm9GxYoicRzn3e+8OTsTwG2Bove+br3aP5rNlXp9idhL2FqGkJA1WPfLyP++wJ58V+Ef
         /s/bN2ERNfXEFpjHHx+YuqQndjdbpOcqQ1kAPP3aGuwBnB76TlDOYoSCq8xrtYvOLQqR
         990L8CKMw/WksYob1rlCKam+jvFmziKYt7f4n8GBOALaJPAuFXoTt2/eKnzdLeMfAjHp
         xngA==
X-Gm-Message-State: AOAM531VCiI3QEeKy2+hoII+sHpOZqBbQJNSQYIuxXjug8l/gRQOA9cz
        NQnqg2rV/YSci9EHzfLplwgf64hSRTWZWDR++Pnl36e3HS/feA==
X-Google-Smtp-Source: ABdhPJxE7dhcBCOERrKV8ouMZMA94c5LX/odP9YslP9ixiCAWlsBt5oMnCvxCgG8e/ljQ1sYiDcdxDQuEaQVnG1Yn70=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr4331260ybg.26.1618490549378;
 Thu, 15 Apr 2021 05:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com> <YHfm+tCYp+I1C5I/@kroah.com>
In-Reply-To: <YHfm+tCYp+I1C5I/@kroah.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 14:42:18 +0200
Message-ID: <CANiq72mSdao=r5f-6nS8E_hgOy=+Rwedtbs-m4CmGbnoEtV+KA@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 9:10 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Let's see what happens here, this patchset is a great start that
> provides the core "here's how to build rust in the kernel build system",
> which was a non-trivial engineering effort.  Hats off to them that "all"
> I had to do was successfully install the proper rust compiler on my
> system (not these developers fault), and then building the kernel code
> here did "just work".  That's a major achievement.

Thanks a lot for the kind words and for trying it!

Let's see if we can make this happen.

Cheers,
Miguel
