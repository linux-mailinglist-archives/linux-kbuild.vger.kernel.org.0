Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E170636DEFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Apr 2021 20:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239667AbhD1SfF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Apr 2021 14:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbhD1SfE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Apr 2021 14:35:04 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38EFC061573;
        Wed, 28 Apr 2021 11:34:19 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id z1so75140982ybf.6;
        Wed, 28 Apr 2021 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=IpwMZWX9MMsh2XzRMAHNnBtuqO5Gz5Ebo8LaLSW9Frs=;
        b=bvgQyBXggfPL9PXPDfc4k6JiPuuR23ONCaADQxIpPw/GkcNPql7NWRxhRDyx1b9rkw
         ot+pr/abV7T1IAEEOSp7zKZqDhik+f4WSZyYDwevPszbi5kkV9HwE7BvAlNO6/Fle+o2
         2LkdrEsu4DPGrbZBqre1JeqxNVIfICWLZOsIIng17gipwhFMZSTBibXLTUlT6cGBPc1D
         tCMrd65ixfIJWJAwoB5MUuFmn5ebkbDld7Ln2GI6+0DqVaIHueL0Ezj3VItBTwt+yybh
         tV5TZE7LSkM6fUqNf5+LtP2bh2mMRB6yHYfg8DifZxXlTQYEzpj/v19uAswUJukWqI2b
         0FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=IpwMZWX9MMsh2XzRMAHNnBtuqO5Gz5Ebo8LaLSW9Frs=;
        b=LOXmFeW9e0eDpyesgZGTnttW3NGohkOEDRXkSbrVPMVqblgzTXlQbx1hR+pTO+e5fy
         5a8Ft41eetmKfOBlJc5OCsmr2mEQmKyPaoyQnW6sLpBzZik4EHL/BqbT7+N+wlmLl0Jd
         2DwyU/cb20bmPcnLF3yfFAT6hqnyO9g+icI7UCv7rWkEqBpJGc79okFVNLsGkHnuzQ/5
         g4/HMa14ppEdZN+N53oKqKIHOtSKgSzYjy3Lm0eG0WJP9rPS4SaIBWXOXsnjMwX3mmKP
         /V+kEMI+QyIHKKH9jsSMNK/XJJWZ08jAZ4QBwcMDl82Bkv7CKfhdCs76E+zURm8ridqg
         uW9Q==
X-Gm-Message-State: AOAM531EBHShT3XccTOMBQJx/M4CiI4u2b7FvBZbyErUd3wIHAGVAD53
        iYeqI3h4kVhVko0IRIjcSD5GgHHhd4WGmOzJnIo=
X-Google-Smtp-Source: ABdhPJwf3NV+/9n1wPI5jRTOuJtRASDvQIfToSaSJiBU9Z3yKngNiIQ6FAtr30VsUqSnxo05g0Ac2WWGJBjXP8vj3Bs=
X-Received: by 2002:a5b:303:: with SMTP id j3mr39601718ybp.433.1619634858689;
 Wed, 28 Apr 2021 11:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
Reply-To: mceier+kernel@gmail.com
From:   Mariusz Ceier <mceier+kernel@gmail.com>
Date:   Wed, 28 Apr 2021 18:34:07 +0000
Message-ID: <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,
  First of all IANAL, so I might be wrong regarding the issue below.

On 14/04/2021, ojeda@kernel.org <ojeda@kernel.org> wrote:
>
> ## Why not?
>
> Rust also has disadvantages compared to C in the context of
> the Linux kernel:
>
>
>   - Single implementation based on LLVM. There are third-party
>     efforts underway to fix this, such as a GCC frontend,
>     a `rustc` backend based on Cranelift and `mrustc`,
>     a compiler intended to reduce the bootstrapping chain.
>     Any help for those projects would be very welcome!
>
>   - Not standardized. While it is not clear whether standardization
>     would be beneficial for the kernel, several points minimize
>     this issue in any case: the Rust stability promise, the extensive
>     documentation, the WIP reference, the detailed RFCs...
>

After reading the interview referenced by https://lwn.net/Articles/854740/
I think there might be issue with licensing - few quotes from the interview=
:

> And on the other hand, I've seen a lot of BSD (or MIT or similar) license=
d open source projects that just fragment when they become big enough to be=
 commercially important, and the involved companies inevitably decide to tu=
rn their own parts proprietary.

> So I think the GPLv2 is pretty much the perfect balance of "everybody wor=
ks under the same rules", and still requires that people give back to the c=
ommunity ("tit-for-tat")

> So forking isn't a problem, as long as you can then merge back the good p=
arts. And that's where the GPLv2 comes in. The right to fork and do your ow=
n thing is important, but the other side of the coin is equally important -=
 the right to then always join back together when a fork was shown to be su=
ccessful.

Rust compiler license doesn't require for people to give back to the
community - corporation can create their own version of rust compiler
adding some proprietary extensions, develop drivers with it and even
if the drivers code will be GPL'd they won't be buildable by anyone
but that corporation. The rust compiler license doesn't require
sharing changes when you modify it. The similar problem has flex and
openssl required to build the kernel, but so far no one thought about
abusing them afaik.

That "single implementation based on LLVM" uses a mix of MIT, Apache,
BSD-compatible and other licenses. It doesn't use strong copyleft
license in contrast to almost every tool required to build the kernel,
except for flex (BSD, no (L)GPL alternative afaik) and openssl (Apache
license, gnutls could be used instead).

I suggest to wait until featureful GPL implementation of rust language
is made (assuming GNU Rust is on the way) before merging any rust code
in the kernel and when that implementation is done make a requirement
that all rust code must be buildable by at least GPL implementation.

Maybe it would also be worthwhile to make the requirement that the
kernel must be buildable with free software (not just open source
software) explicit ?

Best Regards,
Mariusz Ceier
