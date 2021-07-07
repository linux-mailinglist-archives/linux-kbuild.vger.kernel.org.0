Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8BB3BF21E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 00:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhGGWgs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 18:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhGGWgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 18:36:47 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013F2C061574;
        Wed,  7 Jul 2021 15:34:07 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id g22so5736015iom.1;
        Wed, 07 Jul 2021 15:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sguAgUAI4i8x+o/Ej9MGzsI2Cy1Cs5Pf47dyU7REBVg=;
        b=U3BBsS4M1AAJ5T1e+Ng9btoTdmckXSOUWW0WSSn5ILwQoBU3HiI9OBuH0aW28BChYE
         TTdSZX3ukMJAHQx2ILnuB4Pz8XERrMUOCLhSih0efJ6wsnLQGrJUll3vqi8QnG6PJnjo
         8YMr3jzaAoCodyAraIJ+unl1DpaaPSw3c2KdAfGdp6GG+eu2YYJqE7i4G4mpAdkeVie5
         aohcWBJkA5JlkwBklpOo7HmmZQdTii2gDOmlIgG8U7RX9cW+ZCLzEmO/O5fvq4jLJKMq
         0bAQIluIRirLU+3mp4HPKW5WmsweHbK+GDmvmhDM0qIWrtMkCkKhwmhrEHlSVkO0V/mJ
         UvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sguAgUAI4i8x+o/Ej9MGzsI2Cy1Cs5Pf47dyU7REBVg=;
        b=Dt1Vjd5g045R97Urr786uV+3e2E2Is0606Do4MOenum5KeYx8HA6QrdKyZuNP987Kt
         qbu1Xq8Vxdy8JlHJR/nStwkh5scU0bPGZQQp3/XUpY1thoCckLWKcONRDClXTQBJWY0K
         9tZjediiqGAzElZiMHbByyK7fdMc8THPPF2HbOKxxmmjva3mn3RCDxfsi6Ylkhokm2wK
         yIeaESBWi+Vk1gGwEaiKowRufYn3DFJEldhyuWFescZ4f5/1ip5+oIm6pHtJFjt1tRgn
         3h+qMTX2CNJf/zZo4phmt3jhm1eOeuHRIsxek21yguN7DM/AjTaCVMSJgt5KBxFt8gFP
         zKew==
X-Gm-Message-State: AOAM531y/XofSKEwe87Kz+IHIPktWkj51Ag60YMBqYz5yYpK24vTyRGY
        8rtJtSMlXXe7tVS1SZAr64BvJeuI5aHRs3ojMD8=
X-Google-Smtp-Source: ABdhPJzAMcpVfmwUbQtBAKz2b/1EvEG3lNknXLAeGCG5/LOW2onoHQltm2OokBq1l0sVLbWJnKrPmXPjV1frxujIezc=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr21496064iom.149.1625697246499;
 Wed, 07 Jul 2021 15:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-5-ojeda@kernel.org>
 <CAKwvOdkWCgUb+G+iQ7pcvrVvrOfOaFYc6YvO1a9AKSd-oU_Kvg@mail.gmail.com>
In-Reply-To: <CAKwvOdkWCgUb+G+iQ7pcvrVvrOfOaFYc6YvO1a9AKSd-oU_Kvg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 8 Jul 2021 00:33:55 +0200
Message-ID: <CANiq72kBO5LJ8_pHmy7p6UmVYPiY1=2HugpCTen2Q3GVb_xidA@mail.gmail.com>
Subject: Re: [PATCH 04/17] vsprintf: add new `%pA` format specifier
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 7, 2021 at 10:31 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Which patch in the series adds the definition of rust_fmt_argument?
> Sorry, I haven't looked through the entire series yet, but I don't
> think it was an earlier patch in the series.  If it's later in the
> series, you may want to rebase this to be after (or combine it with
> the patch that provides the definition).  For instance, let's say the
> first half of this series was accepted/merged, but not the latter
> half. It would be weird to provide such definitions/calls to undefined
> symbols.

It is in https://lore.kernel.org/lkml/20210704202756.29107-11-ojeda@kernel.org/#Z30rust:kernel:print.rs

Yeah, perhaps it would have been better to put it in the `kernel`
crate commit alongside `include/linux/spinlock.h` and
`kernel/printk/printk.c`.

On the other hand, having C changes on other commits may be easier to
read and explain (note that compilation still works, given things are
only enabled near the end in the Kbuild commit).

Cheers,
Miguel
