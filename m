Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4A1250DBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Aug 2020 02:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgHYAik (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 20:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgHYAik (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 20:38:40 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC5AC0613ED
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2020 17:38:39 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id u131so2879966vsu.11
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2020 17:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7P6WkRur/Wi1nF0hQV3VdSO9RWelS35A2+LFPlb/Uw=;
        b=A4dLEmZsScgkGVFoBW/ZD/K+W5FlpYsKMIOncqMhANo9TeioVu6heRzICP8VIjCOej
         X13V/SiFz0gPIZiIuNnsTArDIufgYzWQxLyhszvX/HQ2WdhufUrqfWBvFoXNfaPEFq9R
         AKm/U+0B9Cl9HksWRnDPx/i8nBlvVajpBfkp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7P6WkRur/Wi1nF0hQV3VdSO9RWelS35A2+LFPlb/Uw=;
        b=ZWH5fdYtkwC609mrnE1xcSAeg3gG+cxkjb5M0v3gEjt5UWofVcw72+IYznuF6aRm02
         3i6wz4Q2CgR5kLxqXi4GjlybasHTnc7LPXssJI3HIjFL3TutzXw5Qpbt+1NY+Z1P3hDl
         XDMyFkH84RkvJ/6+C1atZ6gUyFwocwsiFd+tRV0vhwds1tM+3A68jIn2nuLSDNxcmn6K
         wrMTLXeIvM/yiBVt/Q8YrQJmaBjliupYQ64RCisWK7NRBSwsyrJ8VjIFM9zu58/b0bzk
         rdN5kv1oRgHJGNWKts90WW1LdJZJiAzpkO85E/+MHXZUSgMVHotIWRt3K2VngmcNIXk+
         G0Pw==
X-Gm-Message-State: AOAM5332ZE9pq0iPj8g+Fm7yRM9swbPaZ1gTPmaLKb4sipJ1Jgb/zRYI
        CTWuJiXmkuHF21yCebL6/jvw7g/osX7ZzNNC6BpSElYY7S32Pw==
X-Google-Smtp-Source: ABdhPJyGrJQ3BTXk72neawiE/wop5TF/z06m1M/EvRmFPlgVpgNQcH1fZn4GuY31+fa2UfdmPKqLjnOVR07AkeRgA/g=
X-Received: by 2002:a67:bb06:: with SMTP id m6mr4308771vsn.54.1598315918860;
 Mon, 24 Aug 2020 17:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
 <20200824093020.073ae8d8@oasis.local.home>
In-Reply-To: <20200824093020.073ae8d8@oasis.local.home>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 25 Aug 2020 08:38:27 +0800
Message-ID: <CANMq1KCQjX1632qyo5+8kv8TXNu_Onh4gz7oMx3rx79XQX2fqg@mail.gmail.com>
Subject: Re: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Will Deacon <will@kernel.org>, Yue Hu <huyue2@yulong.com>,
        linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 24, 2020 at 9:30 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 24 Aug 2020 10:59:13 +0800
> Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > ---
> >

> > +ifeq ($(KBUILD_DISALLOW_TRACE_PRINTK),1)
> > +KBUILD_CFLAGS += -DDISALLOW_TRACE_PRINTK
> > +endif
> > +
> >  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> >  export DEBUG_CFLAGS
> >
>
>
> There's one more thing we need to do, is if you build without this option
> then build with it, you should trigger a full kernel rebuild.
> Otherwise, if you build without the option, then build with it, and it
> doesn't rebuild the tree, it wont catch anything.

This already works. I'll be honest, I'm not 100% sure why (and if
fully intentional)...

The CFLAGS end up in 3 generated assembly files:
# grep -R DISALLOW_TRACE_PRINTK * | grep -v ".cmd:"
arch/x86/kernel/asm-offsets.s:# -imultiarch x86_64-linux-gnu -D
__KERNEL__ -D DISALLOW_TRACE_PRINTK
kernel/bounds.s:# -imultiarch x86_64-linux-gnu -D __KERNEL__ -D
DISALLOW_TRACE_PRINTK
scripts/mod/devicetable-offsets.s:# -D DISALLOW_TRACE_PRINTK
(along with all *.cmd files)

and I suspect some/all of those force a complete kernel rebuild.

> -- Steve
