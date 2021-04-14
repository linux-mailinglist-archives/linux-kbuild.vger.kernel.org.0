Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6FA35FBB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353427AbhDNTfJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353424AbhDNTfI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:35:08 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1429AC061574;
        Wed, 14 Apr 2021 12:34:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y2so21332049ybq.13;
        Wed, 14 Apr 2021 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OuYCRH1SziDsj1kqjHDWxqQ5BotcKF1FQqzVQmKFEPE=;
        b=mweODhNrb9PpKwieuzoTUwAKqnwWNCJrjuokkP0kSU1eRO3k96fFb7EjFpJq1ByFio
         JvpGmSiV5XK1f2Y/lbbcQHwn2gxOJeFPYyAsQT/krJQEPw/iFp9iV9JzGSxHuDLGAhih
         NTI/Kaq83cCFu6CwdkupcJ5BlPV6QMRR+XxM2Grq4bb8lbTCCwcskOEa2b63Do8mP7hy
         vE2NupWXNGtinfXftEl4pavEVzXpIBMDCUnI9E9PhP3UySwyrhrMg6ErlFco3QZc5mK4
         nIW5MB3d3HN/gL4iLJNi7R1Xb41Wqgc1MVjSpUE4uBoIHvoX6GgglLleBpxnA2LBS8q+
         /rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OuYCRH1SziDsj1kqjHDWxqQ5BotcKF1FQqzVQmKFEPE=;
        b=cgA16AMEexYVwL0ripVI4D7gTcftX/cL//DJVKVkSe8YakCL4yz1N+DzF0At6mHVlg
         d6rOPHwSa0hW+SN3Pz3PsNFNm+KUNJ7dM49ZitxppRcYhBIyHUc8hQyDx9rQXQQ5n4PB
         6yKLGS82IoLSsimgamzOB6u4iy0lvTAAbqxGKUNAb7pwzxNJoM04md1tZN64jcJNdmsl
         kfhZ3e3OmbE8U6aW4yPiY0+xKfmttrCKLBBjMqS2pszqTACbj5luLECMVHhB20Bvqk5j
         wpE4bGiM6hszuRgXleh6vV0KbbHcOB6tSNzdEz2+srBnwC6xe6LglyIDdb51ImBlEdhM
         xtPA==
X-Gm-Message-State: AOAM530cEBhPMKs9vLAdJJa/Id4tDTdMe+hdWWViffpxsxg5Z/BuXq9T
        QYCK0CaRpPWOHmUThQTgLTUjM4EbmvrNb1LtV/8=
X-Google-Smtp-Source: ABdhPJz7Vf42HaV9DOfIazplTpP9FDXuP3CgXZS0T3Zwfe6G0QIN2Msfcj8RfMYnteo3Ozd16Skn6LyXT/ZnxNhVLgk=
X-Received: by 2002:a25:7909:: with SMTP id u9mr54142916ybc.22.1618428886475;
 Wed, 14 Apr 2021 12:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-6-ojeda@kernel.org>
 <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
In-Reply-To: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Apr 2021 21:34:35 +0200
Message-ID: <CANiq72=PakH-25ZAhC-TKNq7ti76cKt-coS4UahUjsGxNVWRAQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] Rust: Compiler builtins crate
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Wed, Apr 14, 2021 at 9:19 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Not being a Rust person, I can only guess based on random pattern
> matching, but this _looks_ like these "panicking intrinsics" panic at
> run-time (by calling BUG()).

Your pattern matching works well :)

> Is there some way these things could cause built-time link errors
> instead, so that if somebody uses 128-bit shifts, or floating point
> ops in the rust code, they show up as build failures, not as run-time
> ones?

Yes, we should definitely make this a compile-time error if possible!
This was the easy way out for the moment.

In general, there are some things that are currently unneeded from the
Rust standard library. When we get to remove those, many of those
intrinsics should go away, and then we can leave it as a link error.

Cheers,
Miguel
