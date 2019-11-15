Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B3DFE3E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 18:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfKOR0g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 12:26:36 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43922 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfKOR0g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:26:36 -0500
Received: by mail-lf1-f66.google.com with SMTP id l14so1912988lfh.10
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XLj1dfIKxogyDDXoUc0X1kvOTnU5AxFa1BHQ47BK0E4=;
        b=QFx8fqWi/LJ9Aw6indkqkKEdnpPusGnvxTfcuIs91Xw/fZqCtRllpS8J2beDtUgoQp
         4j0zHq2AN6RL+bkxHfwg6JNyG3jFUGdEkBZ4VvCMfALvcgS/XUUBE/yMs5J3Hhb6QGF4
         2K93EGkgQIkivY+nck0sC5eaiknNVpMPVdIxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XLj1dfIKxogyDDXoUc0X1kvOTnU5AxFa1BHQ47BK0E4=;
        b=a6LGZ/paHFMgKnfpAU1yUE0ybGFXE29a6lvCK2cQoDl1pSpDV/1tHXri7LksiZKBny
         ZuQQni6SJv1GdX2lq0jwf/MXZDhzbwMYV+mOMtZd4+Dy5QJu5nYfmOHNhtxLmI476Cs3
         cKPly/dQRK4K7/L+8vNGlR865AVpvdYipOUHKvHGl05Zs0iS9JL1iUq8d6GPtjCvM4DP
         BKJyBEUbmAlrPwX9Tjomad7XI4xzqnSCgczjLjaS+eEfnyHG1foVJflV5nBxrJwaM4sP
         FTLjmM6Oe+ziEla2HoNTIwvjaGPvjFT+NXu9YVmsecEzERveeVMTlzufaepX1SGST94Z
         QNeg==
X-Gm-Message-State: APjAAAWq+U3+qwva2riJ81qor+JkJBqsG1Y7y+9Eu1Pm0Vjjg84tgyP0
        N8syYuLg5Ez2SNfKwVTBPxI2+sbtu8Q=
X-Google-Smtp-Source: APXvYqyUBFZObq3BlKb+ifzBsuTSDr3J0sjA11PuXGeGHcIshRPZ63DP6ZqvbPbWfudE9k/m86SBXw==
X-Received: by 2002:a19:7612:: with SMTP id c18mr950677lff.122.1573838792784;
        Fri, 15 Nov 2019 09:26:32 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id m28sm4346491ljc.96.2019.11.15.09.26.31
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 09:26:31 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id e9so11485071ljp.13
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 09:26:31 -0800 (PST)
X-Received: by 2002:a2e:2c19:: with SMTP id s25mr12005111ljs.26.1573838791152;
 Fri, 15 Nov 2019 09:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20191114223036.9359-1-eugene.loh@oracle.com> <20191115114708.2a784f8d@gandalf.local.home>
In-Reply-To: <20191115114708.2a784f8d@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 15 Nov 2019 09:26:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
Message-ID: <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules and
 symbol sizes
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     eugene.loh@oracle.com, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, jacob.e.keller@intel.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 8:47 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> [ Adding Linus, Andrew and Greg as this is something that needs higher
>   level of approval for acceptance ]

Is a new config option even needed?

Honestly, I think the "add the module name even when built-in" could
be done unconditionally with no backwards compatibility issues.  It's
not a new syntax, and shouldn't break anything, and looks like a
useful extension of the existing format - and one that existing tools
already have to be aware of.

The size thing is obviously different, but I find that much more
questionable. What's the use-case? If it's just about the occasional
big jumps, then adding a dummy entry for those (rare) cases sounds
like a much better option, and wouldn't break any existing code.

I don't see any upside at all in showing the "exact" function size
instead of a size rounded up to the usual 16 bytes or whatever.
Padding is real, and doesn't change anything.

              Linus
