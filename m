Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE6102E5B
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2019 22:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfKSVma (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Nov 2019 16:42:30 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33839 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfKSVma (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Nov 2019 16:42:30 -0500
Received: by mail-qk1-f193.google.com with SMTP id 205so19366726qkk.1
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Nov 2019 13:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=QB4SUVhpavfDd836jssG/dIvVknUQvs1rkhBHGx6mVo=;
        b=fwZ3JQdGRF+MfMR4OTzPIKz33coTxmwMczqTMp1zgcU9vBAQTT49Lyi3EpmBIp0wef
         tEJMyTvj/+RtuA+1K3IwMfEffYlP0HdS6jLuAz7BTerdJIY9GJv85HfAQbejgurnaa+u
         /0nJrzt2D6JSFpTwCmgUpVRtXuqYqgQeNUf8MHJbI3dP3j8mZ+rEN0+j0vXnPZdrQxbB
         quT+m7nIBvcr0OjrzLU6dymwzmcC38CLbEWcGNsxP//LhERqt+Vw2RttXu28w3xfTwvB
         CmTZuar9342FqqskXbUVB1Aqc7zvW1kcHcEW/fxdHi5CzWuDjWWnBpcJbAWZwrTAHMnD
         M/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=QB4SUVhpavfDd836jssG/dIvVknUQvs1rkhBHGx6mVo=;
        b=psHafbLpB1WoK/9HlEBDMo0LI7GXBrtYTyskpK2Vwf8BLUD8N6QgJccijCq9WYlD4w
         IwbAubiZJk90vAprG2baLYbRN4Jc7XW83PGQ8hdgCML5Qg1RjQpe7Uw7HRIN2KVJm3w5
         i4rzoAc3zbJfpMwC3UFuHOKzt4Qmwseas0RC22EYO/k5LFEE3bS3KKnz161+doW/PwXv
         quLVkW8m4oHlJ3p7NkxzNr8VaI+hYpfzt5+0g5eRkIVujq6goPutqjCCMl74EOYOkRDg
         CYnj/9Y6t0rjmsbmZNYHs5kMS5/+3r2pzOQAtl/QcrnWWSmQg2mCd2iXEX3MMwMNyz9c
         g0mg==
X-Gm-Message-State: APjAAAVOogb2ilDPAu5vjUy+plRtm995KNcSKzjyptMPBIR8xrr1xu+p
        Ekfeh7OGy9cwg4Mm0fSNl9zl8A==
X-Google-Smtp-Source: APXvYqx8mO+d9bo/Rcv0JrlRBZEW7R40QjO+mH4aDpl24EGipM45Jni5and68zWWOZCWwJw0gPvq9A==
X-Received: by 2002:a37:6517:: with SMTP id z23mr32008271qkb.434.1574199749166;
        Tue, 19 Nov 2019 13:42:29 -0800 (PST)
Received: from ?IPv6:2600:1000:b079:1710:3c3b:2ce9:9489:b502? ([2600:1000:b079:1710:3c3b:2ce9:9489:b502])
        by smtp.gmail.com with ESMTPSA id a19sm13439465qtk.56.2019.11.19.13.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 13:42:28 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 01/10] kcsan: Add Kernel Concurrency Sanitizer infrastructure
Date:   Tue, 19 Nov 2019 16:42:26 -0500
Message-Id: <A74F8151-F5E8-4532-BB67-6CFA32487D26@lca.pw>
References: <CANpmjNPiKg++=QHUjD87dqiBU1pHHfZmGLAh1gOZ+4JKAQ4SAQ@mail.gmail.com>
Cc:     LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
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
        "Paul E. McKenney" <paulmck@kernel.org>,
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
In-Reply-To: <CANpmjNPiKg++=QHUjD87dqiBU1pHHfZmGLAh1gOZ+4JKAQ4SAQ@mail.gmail.com>
To:     Marco Elver <elver@google.com>
X-Mailer: iPhone Mail (17A878)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Nov 19, 2019, at 2:54 PM, Marco Elver <elver@google.com> wrote:
>=20
> Regardless of approach, my guess is that the complexity outweighs any
> benefits this may provide in the end. Not only would a hypothetical
> kernel that combines these be extremely slow, it'd also diminish the
> practical value because testing and finding bugs would also be
> impaired due to performance.

On the other hand, it is valuable for distros to be able to select both for t=
he debug kernel variant. Performance is usually not a major concern over the=
re and could be migrated by other means like selecting powerful systems etc.=
