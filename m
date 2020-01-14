Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800FB13B3A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2020 21:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgANUa4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jan 2020 15:30:56 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36281 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgANUa4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jan 2020 15:30:56 -0500
Received: by mail-qk1-f196.google.com with SMTP id a203so13501180qkc.3
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2020 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=GM2cmKJLGIw00BnTkj1dcmxxtlMk1WYpnp+HW9nEczc=;
        b=qfNdLg3kkuNI6cLLk03N289br06VFc6cqXJqoyJLg1KprL1vXCIrhjDgtVLFvs1Lwb
         AGCRxsxBhq8RqUyn380ItGPioew6bRYplCRy7vK2et+jGpulMqjnLkOTPeNz/33eXrDq
         0vFaoz7vDSh5K80ynQpMr5rMy8tA7f6nYDRq/e+wt1l6rr9+6nNEBxx8MmmB3Qm7R4Cl
         TNl5xvJuy5W6ApqyVP/ggRMHAYLrtnXI4E8Xv7pyFWREaYmrxqRLCzpVXVmBV7MZyEXE
         U3rJZrXfsMTvsHDdbHIlb8doOnexZCFIYMkSwEi0SRMSCJOxOWAm5Dg1RaK67s/foSTo
         ZGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=GM2cmKJLGIw00BnTkj1dcmxxtlMk1WYpnp+HW9nEczc=;
        b=EgURVC4VmJo+nbJ6EqhSNAN7FrHW76yBxbjCxMIAT19gi1cO1+ltmu0NHMvy19Tfl5
         uAodrRdmzgwNQql1B11yBu0Gedlf8mVwgTk8KJYyfs5QVYrLXz22nn7fg/VpKJ0h09Ck
         Y2WiI/qq6FR/8nlzNPuE1IPMxbsj+fAmaZ17e9zVAyHie9CqCEgh3ewuCs9HBs7uXssA
         p2dkr7hXMhs0X8BI6G3LS1DZUAbd3LEeW6nHoUrfEhBUyXlYvLHH45GVL5zkb3rIoD4a
         s4DLqyy3ytdFnnVCHOjajZW0yFzMCllVQUVfbJGDP0fdcmnSPZNrBQkDYeB7kybZM/n3
         ZStw==
X-Gm-Message-State: APjAAAU8BfEPCdi0FfiHFst9MwiBCOx2DSDFSNh4FQ0hyZgc+MFirYKF
        QoYrniXfC2u35XsefUDT7NSNCw==
X-Google-Smtp-Source: APXvYqySWPhc8cNWPW6ZR1czJUmUILrXAmHD502QnwiMjSkfcnjRHGogwSncB5M2bJhCbEL2kLY/AQ==
X-Received: by 2002:ae9:c104:: with SMTP id z4mr18665764qki.418.1579033855079;
        Tue, 14 Jan 2020 12:30:55 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id 68sm7357546qkj.102.2020.01.14.12.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 12:30:54 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 01/10] kcsan: Add Kernel Concurrency Sanitizer infrastructure
Date:   Tue, 14 Jan 2020 15:30:53 -0500
Message-Id: <F185919B-2D86-43B6-9BEC-D14D72871A58@lca.pw>
References: <20200114192220.GS2935@paulmck-ThinkPad-P72>
Cc:     Marco Elver <elver@google.com>,
        LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Potapenko <glider@google.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Daniel Axtens <dja@axtens.net>,
        Daniel Lustig <dlustig@nvidia.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        the arch/x86 maintainers <x86@kernel.org>
In-Reply-To: <20200114192220.GS2935@paulmck-ThinkPad-P72>
To:     paulmck@kernel.org
X-Mailer: iPhone Mail (17C54)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jan 14, 2020, at 2:22 PM, Paul E. McKenney <paulmck@kernel.org> wrote:
>=20
> Just so I understand...  Does this problem happen even in CONFIG_KCSAN=3Dn=

> kernels?

No.

>=20
> I have been running extensive CONFIG_KSCAN=3Dy rcutorture tests for quite
> awhile now, so even if this only happens for CONFIG_KSCAN=3Dy, it is not
> like it affects everyone.
>=20
> Yes, it should be fixed, and Marco does have a patch on the way.

The concern is really about setting KSCAN=3Dy in a distro debug kernel where=
 it has other debug options. I=E2=80=99ll try to dig into more of those issu=
es in the next few days.=
