Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30D6A8CC4
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 21:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731675AbfIDQRU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 12:17:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44734 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbfIDQQU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 12:16:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id u14so13648874ljj.11
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Sep 2019 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3OkOI3j0Oo0CjA3trKCkMR2MwBR7d8kErbi/HKpfcyM=;
        b=TUlK0rc196VsjDYABXU7yCCcQ4sTNOl47V6TQt/Z6Y4FZj6TevmCuFWT9dKCaAnTkd
         ii+pt9kyT4tMSieTNWDBUkxJWxisf3YEfmljgf/j7puwe7joaJGEU4O2426wowD5IuNU
         CQLeaZs18KcpY8ipXZwRFzvDYcdReO/oyNEP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3OkOI3j0Oo0CjA3trKCkMR2MwBR7d8kErbi/HKpfcyM=;
        b=osanCcYVmyiiBohFlP8jHObAUfDmWYa19p8otDRdIXtGmjH3YJN607zh1OB9iv1Taw
         WmB7yAeU1CMJXYlF9Gq2SHWVah5AdFAh4ZVRWxwli1MZyLlXRbkAJNps8mMGOLM81VXz
         jpBPAiHgbfWB6dbl7eYBkrNW9Viil2iaRdt2Ixgdyrf4TtTL6M4REDUdiBtKWFQWerAv
         OcP/FPoLOk3GAiYlvgXQCBZcV68gwlMJlrFzd0dJcmmI6I6l3PCQD9rNTmWLuCc0Fgi9
         wRC78ztF58BAZrdDmzO/KMpXdDr2OSC+/StRjAPPaC1+PwB84Q++hTNgPymmUlJKWSX/
         UdTQ==
X-Gm-Message-State: APjAAAWZSl1l1rxWoulol2K/erAYvfafIoEubijepsmsyD2uh84K49cJ
        tqPGYMOyaF6svRS9ywDqx59PjSBs6Db8M47yTFjC/A==
X-Google-Smtp-Source: APXvYqwjBs0W5/qIegdlz+i6Wn/+JSt4M3u1OfLNwPhUCj4In1akz/3V+ycUi8EU6qZzBMs2ICtcju1RZEnxtZQrP/k=
X-Received: by 2002:a2e:9ad4:: with SMTP id p20mr24178237ljj.49.1567613778648;
 Wed, 04 Sep 2019 09:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com> <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
In-Reply-To: <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
From:   Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date:   Wed, 4 Sep 2019 09:16:07 -0700
Message-ID: <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        USB Mass Storage on Linux 
        <usb-storage@lists.one-eyed-alien.net>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Note that I don't object to the patch set in general. There may be symbols
> which only need be exported in the context of a single subsystem or even
> driver (if a driver consists of more than one module). For example, a mfd
> driver may export symbols which should only be called by its client drivers.
> In such a situation, it may well be beneficial to limit the use of exported
> symbols.

I can appreciate this benefit.

> I am not sure what good that does in practice (if I understand correctly,
> a driver only has to declare that it wants to use a restricted use symbol
> if it wants to use it), but that is a different question.

I think this question implies that you are coming from the perspective
of "security" or wanting to restrict access to the underlying
functions, rather than wanting to clean-up the way symbols are handled
for manageability / maintainability purposes (which is the goal, as I
understand it).

HOWEVER, I have one question:  If these patches are included, and
someone wants to introduce a bit of code which needs to use two
symbols from different namespaces but with the same name, can that be
done?  That is, if driver A has symbol 'foo' and driver B has symbol
'foo' (both in their respective namespaces), and driver C wants to use
A.foo and B.foo, can that be supported?

Matt


-- 
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux
