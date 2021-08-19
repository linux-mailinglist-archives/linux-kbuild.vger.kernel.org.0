Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BFC3F22F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Aug 2021 00:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237525AbhHSWU4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbhHSWUj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 18:20:39 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E79C061575
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 15:20:00 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a13so9690074iol.5
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p67N2HxCgAHqtnjLzPV50i8kOoXMocmzpIDJp5XC/LM=;
        b=b3hDKsn1ZAmmfhhPsjXI8T4HHkC5/nPHxLIWZ+yR4htUWbM/lyaIncNtuOEYZS7R7z
         FJf20Otut3YwIjqDwDMvUG7RsPnlDyswIUC6BK+egIbvVKZsFcta15oG1xUVAAZKznSP
         R0+Qp+b/zVQf/fhphLJG8uDUzQ8oURY7ZrCCXI4AFMAXXzCv6YrXwexUEm70AUK/PY6K
         o7GTII7bwHkv9adV0NVc8k9J9RbYykklrfWdgCCkxOz49Pya76lf1gF/TWMHKVNxdcf9
         UfuSzHY1cDrcQRBVbKs9CiiaXocoWMEcra0G7k2x5Zo6UKddpojP4gWPZsvWHOVXiTA1
         8xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p67N2HxCgAHqtnjLzPV50i8kOoXMocmzpIDJp5XC/LM=;
        b=nibjXxQQbsLiZctqjJbjeKNypRAI6JXh6Dw+ODR39HD1WIPZvFPHW1TXUQqmRbUlpC
         8jmQASmWuUdLeeKL3PqDiwK+HripX4pDSoehpcoKrfZSeeNP1PaNGlbCOwx0a18ewmdp
         bAYlQTCJU2IA3QVgvqjnzemjAnevpaWSkZf1I2VMmEJZfb+M9k3gXa1eHAufatysA8Kn
         wT0aR+p8fhKulsPMujm5CIFdU6LpH56TtlFf5Eev6dTbQNKOLmpIpm41p7U5LxdQnwtA
         ML5lGF/7lR1WQ3G6YBbAV6EDzNa+Xio8LBFMCwJI3hYom0OSHZhLsHwe6vqqlPZRB0ml
         RM2Q==
X-Gm-Message-State: AOAM532DcW5upLLx4m2iovuP2XCRzF4iofffAGg0ebhnS0i/wUe3YT/t
        lj3+GCrUBTQ3Er9bMotWOiBHklFJk95UHTp0U3k=
X-Google-Smtp-Source: ABdhPJxw0TCE8pTtSyR+aCsViE6d2MJ6C7lKCZtndCk2gpx+O1RbtQyId7XrG8zP4EtGM+y7HH+RxX/bqxjejWezQi0=
X-Received: by 2002:a02:c80e:: with SMTP id p14mr15127917jao.8.1629411599484;
 Thu, 19 Aug 2021 15:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com> <20210817002109.2736222-6-ndesaulniers@google.com>
In-Reply-To: <20210817002109.2736222-6-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 20 Aug 2021 00:19:48 +0200
Message-ID: <CANiq72n7=B=j94Oge7OiV9tpjspbBJr_0kEQCeB89cK4-zDQ3Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] x86: remove cc-option-yn test for -mtune=
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 2:21 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> As noted in the comment, -mtune= has been supported since GCC 3.4. The
> minimum required version of GCC to build the kernel (as specified in
> Documentation/process/changes.rst) is GCC 4.9.

Yes, please!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
