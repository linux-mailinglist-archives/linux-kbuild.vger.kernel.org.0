Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1941EB173
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2020 00:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgFAWCC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 18:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgFAWCB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 18:02:01 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D1DC061A0E;
        Mon,  1 Jun 2020 15:02:01 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id a13so6150957ilh.3;
        Mon, 01 Jun 2020 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Hj7ELZtZm9lw0D/3kPs7+cW31yJJTtnBtL85zk+iG0o=;
        b=luGNV5sSqhz1IJ4/jPKxrytn56cyHV7NYbaXPIoSGzliOGmyYwQ5d7pyWnnGfrr+mn
         SDARAUCceAAW+QUOIyPP9+0YJBg5INwi4+McE4whzYP70gPiCig23vbpN0Mz3N45mtA8
         JsNVdxkc4WEd0IHV5Om+lHPYLlDYKHfNcQe0vINMFDhAMZEk+oXQDU/F7zuXx/2S/6n2
         dmKAzPzimVGCylaaHN/kGEZhIaiyZj5lEsco9eWfwAnkEbdxRc1mBX522vUOOrA4Wpvy
         Z/861hw3VPE5jpYGhujHrKZn/2yytcLPexMO+Dcu2FNjQ2lwqNomgw7bNU1yD2+FvASR
         6kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Hj7ELZtZm9lw0D/3kPs7+cW31yJJTtnBtL85zk+iG0o=;
        b=lwMhuYHGgfNPyyejnBzYMBCqKnyLWAUIK1YUGowb4VV6CyF4KHEA5XVlAeODbnSy9W
         2dxA2TxHNGKIwJ2P7fBrkbCBW2t9BeclDozkjAZeaDnRdvKcouJVCTi9IRucfLDihzP0
         Ubhus84VHclvRRpvx+vH3W5cUt7O93L2MN71htwPSqYDY8WATgdDc52pqa6o6g7fqv2F
         T0kKEbiV8Z9OKCiT2S9N3PCxgHNTNk4usQwYKKMK5dG/zYr+qlFxSfnWtS2/NEBeb4Qp
         SPZ6EzP8GwRRy19v3y2lcB4SLVDAi0N2UIkgrQFOFoovpKHAnd/PTpkdLwuv5ysn6/oc
         wl4Q==
X-Gm-Message-State: AOAM533RsTSHCbJhvQ7XOoJAgqsgy2zQytyttrKM/vI8SaBcazjnNqrU
        PmSvTxrqmFJF0qDdA0MurGp8oIo7F7lCnVCiAaSjg4t4
X-Google-Smtp-Source: ABdhPJwcYcZ8hiCw2ngTG3vvtLD1dhiGSubSON8d2lrMJSF3d9j/3b1GaJnwiHYryCRN9HeviD56ItFpycRguwnRsvk=
X-Received: by 2002:a92:898e:: with SMTP id w14mr22581052ilk.212.1591048920282;
 Mon, 01 Jun 2020 15:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com>
In-Reply-To: <CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 2 Jun 2020 00:01:50 +0200
Message-ID: <CA+icZUUtjD3HbaRGdcaK4kxRzu=cJi32xmE6kZjz741xViMv1w@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel
 and initramfs
To:     Norbert Lange <nolange79@gmail.com>
Cc:     nickrterrell@gmail.com, akpm@linux-foundation.org,
        Kernel-team@fb.com, clm@fb.com, gregkh@linuxfoundation.org,
        Kees Cook <keescook@chromium.org>, kilobyte@angband.pl,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@kernel.org, oss@malat.biz, patrick@stwcx.xyz,
        patrickw3@fb.com, rmikey@fb.com, terrelln@fb.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 1, 2020 at 11:59 PM Norbert Lange <nolange79@gmail.com> wrote:
>
> The series seems to be stuck in limbo, and I got the hint to bring
> this to Andrew's attention [1].
> Hope this will finally end in upstream, been using these patches for ~2 years.
>
> Regards, Norbert
>
> [1] - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955469

Hi Norbert,

I am using v5 since Linux v5.7-rc+ with modification to Debian's
initramfs-tools.

Thanks for bringing this up!

Regards,
- Sedat -
