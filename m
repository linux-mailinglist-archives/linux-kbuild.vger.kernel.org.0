Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991F63729F1
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 14:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhEDMSL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 08:18:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:33668 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhEDMSL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 08:18:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A0178AE5E;
        Tue,  4 May 2021 12:17:15 +0000 (UTC)
Date:   Tue, 4 May 2021 14:17:13 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Joe Perches <joe@perches.com>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210504121713.GT6564@kitsune.suse.cz>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
 <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 04, 2021 at 02:09:24PM +0200, Miguel Ojeda wrote:
> On Tue, May 4, 2021 at 11:22 AM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > Except it makes answering the question "Is this bug we see on this
> > ancient system still present in upstream?" needlessly more difficult to
> > answer.
> 
> Can you please provide some details? If you are talking about testing
> a new kernel image in the ancient system "as-is", why wouldn't you
> build it in a newer system? If you are talking about  particular
> problems about bisecting (kernel, compiler) pairs etc., details would
> also be welcome.

Yes, bisecting comes to mind. If you need to switch the userspace as
well the bisection results are not that solid. You may not be even able
to bisect because the workload does not exist on a new system at all.
Crafting a minimal test case that can be forward-ported to a new system
is not always trivial - if you understood the problem to that extent you
might not even need to bisect it in the first place.

Thanks

Michal
