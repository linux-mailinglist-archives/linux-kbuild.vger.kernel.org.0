Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2952835FBAF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353415AbhDNTe5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353413AbhDNTe5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:34:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7BFC061756
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:34:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 12so34971571lfq.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+qlBpfKKNNSmiIVDWZAwm2J5XBPYb6crTXEI3M0nwo=;
        b=VgiHLTWI3FosiEpCVUDwPU9YJez9f9/W7OcDyGRWAVmbGZSYPWyC/lw/A8EwBL9ftK
         liArfTuPen3tkf1eQSyheZ4w4SwmZAyOVnVWF6E8SqyJGlCejb7Dr9Y8seU8GmIElaDu
         glo7f1q5erTsGKyDwy5UyrL8uODJ+xbE+9wDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+qlBpfKKNNSmiIVDWZAwm2J5XBPYb6crTXEI3M0nwo=;
        b=Vyka/co5r8SbWCjqScGVsceKMJXGgW+k0qQbNIMrsrVviOP1aHnprRcVD4u7NdLx9+
         vboJNZPx5qW7X8TP8mPZ8bMIDFqFG4goxDtRLP091qR6lC1w9TgO7UsxzqLWdiYKBI4j
         8BizyNSqG1ky77ZLsj0ASa8qR2+y7UWCWWidCZ8VB5IqnseSm1HKHNLN3rrLtSFtc9nn
         S5WutX9oKmibapy5QXERMPrCbSPI2MpII9cBs2E2635kECYaJDpg/smkGV/cplJ03O6A
         geRYw2PBdrsEr5TZbM/pXEJjwivOwxBdDME/eKZowpiVcU5VE/jsjoU6+clN92ggb499
         oiKg==
X-Gm-Message-State: AOAM533Nv1i/wgHWENMu0zLa8QgDeGYZ/w71HFhae2PoubJnCY8sSng1
        qrLKEWOny3YdWIYjtFFZZpDFyQ/JoIkes0Id
X-Google-Smtp-Source: ABdhPJyaMT8VRei0L8fSvgxDlS96NED/t5NvHi/YtV09N5emEXD6kwc9E9SVogujHJtqChbl2P5Q8Q==
X-Received: by 2002:a05:6512:208d:: with SMTP id t13mr24188975lfr.417.1618428873573;
        Wed, 14 Apr 2021 12:34:33 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id g7sm163125lfh.110.2021.04.14.12.34.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:34:33 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id r128so8104680lff.4
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:34:32 -0700 (PDT)
X-Received: by 2002:ac2:4947:: with SMTP id o7mr22894176lfi.253.1618428872725;
 Wed, 14 Apr 2021 12:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-10-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:34:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
Message-ID: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> A set of Rust modules that showcase how Rust modules look like
> and how to use the abstracted kernel features.

Honestly, I'd like to see a real example. This is fine for testing,
but I'd like to see something a bit more real, and a bit less special
than the Android "binder" WIP that comes a few patches later.

Would there be some kind of real driver or something that people could
use as a example of a real piece of code that actually does something
meaningful?

               Linus
