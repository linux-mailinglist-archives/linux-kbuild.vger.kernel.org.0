Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718AB1FBBAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2020 18:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgFPQ1i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 12:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbgFPQ1h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 12:27:37 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F11BC061573;
        Tue, 16 Jun 2020 09:27:37 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id m81so22604832ioa.1;
        Tue, 16 Jun 2020 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=IxlykeCdvaeRDbODx6osAE/7PpbTM/T1nmtx4tJ5JiU=;
        b=bGW9z6GGiC9FP/ZZRE7igGfTI+Jmy1EeQPcZkKxjhcyEj8+QhOxYX16HGPyvth0EV2
         D9NSXLv1PTsp/nvuEv+TkKaljjWjw/6zhcAG34q1UKUlj4a/rNh/vYfURwVS9hAO5lTU
         03IeO7WTxKo/yAO/uRzKAlqe/3BhqFK5yDxcRpx90zBc8z0xgQzjskiPfMoTVfaoycJ5
         tna+cgGVl5MaymD0MqFQvuPmKEXBjHnUt4qH1UJOnlXYazsKU283kUi8rCX8ngakwbJm
         u8t5WTZIsnSys9hbY4QsAsmV2xRgAxYDWYtT/8wQfeka9toAiWW6P/jPM4MjEfxwuJHo
         RR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=IxlykeCdvaeRDbODx6osAE/7PpbTM/T1nmtx4tJ5JiU=;
        b=rPMGPw2GplRRxduD/MF7non5GhRolJB4oz9ny4DKrxaAqxHASrHbwoz7ghN9llj1yh
         9CKcunDGhCqxsb4Wmdhb+jphvz9PMtyF9WpeZBWDlivmJl2aWS0A2cTUlqxI5ng1Tfa6
         nRroB2GffQEDPkFGALSRJQwBVQJIIFmyXqnkgVPnzTSy3avktciWqeJj1rlYNbHHZSVP
         HdZUbHQH3DEr5I++3QD1Q75mb3blgKIfBf1blLhqi6v+ApBZyC3TOigeeQjEV2TgSjGK
         nhpMg1zdXnOhyEEc+Lw6ejVJSPFBgw4J09GuaJyWQ51u813evs/5mw4+Tcj4yui496g/
         9cPg==
X-Gm-Message-State: AOAM533L3vkvdSj5A/llWADLJpnFROw3oNhQgajbhQqPRGpGPQzLZH3V
        G0BPOGV7SkNxATmO8CKCxFl1GP8oYREnM+GOQ6M=
X-Google-Smtp-Source: ABdhPJyfh9ykxsa7pmBx+zXd1nsa2zNX/K/5wpF+ENifddY9xpyjLYDocgNWsesJkqhRei2FtqbfMVr1V1Q7aVjITi8=
X-Received: by 2002:a05:6638:406:: with SMTP id q6mr27436841jap.125.1592324856681;
 Tue, 16 Jun 2020 09:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com>
 <D0196413-4195-4F80-89B3-59859C1515AD@fb.com>
In-Reply-To: <D0196413-4195-4F80-89B3-59859C1515AD@fb.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 16 Jun 2020 18:27:24 +0200
Message-ID: <CA+icZUXxjc3COFT_VUappjBQ-gBtfRq080_Ytvhu4f4YW-MSnA@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel
 and initramfs
To:     Nick Terrell <terrelln@fb.com>
Cc:     Norbert Lange <nolange79@gmail.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        Kernel Team <Kernel-team@fb.com>, Chris Mason <clm@fb.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mingo@kernel.org" <mingo@kernel.org>, Petr Malat <oss@malat.biz>,
        Patrick Williams <patrick@stwcx.xyz>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 2, 2020 at 12:01 AM Nick Terrell <terrelln@fb.com> wrote:
>
> > On Jun 1, 2020, at 2:58 PM, Norbert Lange <nolange79@gmail.com> wrote:
> >
> > The series seems to be stuck in limbo, and I got the hint to bring
> > this to Andrew's attention [1].
> > Hope this will finally end in upstream, been using these patches for ~2 years.
>
> Thanks for the CC!

Nick can you offer latest zstd (v5) on top of Linux v5.8-rc1, please?

- Sedat -
