Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC793707C5
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 May 2021 17:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhEAPxY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 11:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhEAPxX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 11:53:23 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6C4C06174A;
        Sat,  1 May 2021 08:52:33 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 130so1869681ybd.10;
        Sat, 01 May 2021 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=;
        b=blRUIoJdCmVMNiQDMHNaVJve98qPVFj9/24WjJdA429iQkxxVreNispe+BqiBA3d8W
         Acr7BVauP7zkcs15L+68w5EqDvJuqgqAQiUpqTLpjFrGI4w60FlbBjkAovszT+DhAO2Y
         tHmFz//OpI0cdY7Ho2lJ17ud/C/jzzNtemRy5ooBS5sildh6tdH/JXdOSWzcu0kUHuRk
         sWuz3sEcBwnrjw3SmYkDYCFW6/LI+qbeU5bNDNEyCV8lhk15528w6zCTI7qv8GD3C2Qr
         /6S1azORvcFztQ4nBtiPy2tzzOKKF9suofex4xX1vd9C6oVASMofpqqBqVOFa9w2DOS8
         wBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=;
        b=Qj0cytMwHKa+C54soxDSPJ5wpqoLVQ1LfQJzoTvUYUrzzdUtdCgD5Aef9RswQZoMDr
         A4gS5edmePtzHAK3/8XQEIqf+V5qwSzdcrFH2EKYMpg44W/Oyhrb+zfBhahWVKIxu+Gx
         O2jfkt23hC35bI8LAhi1CrUU6Fdrk4r3Q8RJKDPTy2xl5EpfO4P6fdeo8ibwpW70NHgR
         Sz35tIInhEYDc8UvA7KnXW1/kY+ozKVu2JcdVWd0xfBeaidN3QaHhYyCsw/0z/TQ/cHn
         nrtAFhSpf5Rkp0RE+9SUcJ45srDpqd2TkEGEKe09r7at8DERI5C5dN6ggfoJKdhfKhC1
         jNqA==
X-Gm-Message-State: AOAM530ypY12b3kzT1eHOB5GQX++QSbkTDLHI1UIrenT2XtHMom/YH/3
        kAM+6ADqOK4I+hPNo8UzFjV05meQtvpcpUtbma8=
X-Google-Smtp-Source: ABdhPJwv4Dai1oxa4I+vtOog2Hw6tEyYe4CX42qPfvaPtHahj/3ak3VQm5m0KU7mUuftqlcL6+PQQToSr4CzLa32hoM=
X-Received: by 2002:a25:c444:: with SMTP id u65mr14862039ybf.93.1619884352129;
 Sat, 01 May 2021 08:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 1 May 2021 17:52:21 +0200
Message-ID: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> More cleanups will be possible as follow-up patches, but this one must
> be agreed and applied to the mainline first.

+1 This will allow me to remove the __has_attribute hack in
include/linux/compiler_attributes.h.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
