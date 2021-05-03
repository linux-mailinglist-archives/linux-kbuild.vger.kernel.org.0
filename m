Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0343712B9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 10:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhECIz5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 04:55:57 -0400
Received: from smtprelay0005.hostedemail.com ([216.40.44.5]:33842 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230490AbhECIz5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 04:55:57 -0400
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 659F0180C2CD0;
        Mon,  3 May 2021 08:55:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 7813213D93;
        Mon,  3 May 2021 08:54:58 +0000 (UTC)
Message-ID: <de86b54eb783204ef174a05c60b0d190de7cd85c.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From:   Joe Perches <joe@perches.com>
To:     Alexander Dahl <ada@thorsis.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Date:   Mon, 03 May 2021 01:54:57 -0700
In-Reply-To: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
         <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
         <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
         <20210502183030.GF10366@gate.crashing.org>
         <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
         <20210502203253.GH10366@gate.crashing.org>
         <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
         <20210502223007.GZ1847222@casper.infradead.org>
         <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7813213D93
X-Spam-Status: No, score=1.44
X-Stat-Signature: kzayu4orffhmqaa8ff8iq8d4a8ipzp46
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1952/ks3MY8TXp5Ug6xsGLjA9GLFC3+spA=
X-HE-Tag: 1620032098-353050
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2021-05-03 at 09:34 +0200, Alexander Dahl wrote:
> Desktops and servers are all nice, however I just want to make you
> aware, there are embedded users forced to stick to older cross
> toolchains for different reasons as well, e.g. in industrial
> environment. :-)

In your embedded case, what kernel version do you use?

For older toolchains, unless it's kernel version 5.13+,
it wouldn't matter.

And all the supported architectures have gcc 10.3 available at
http://cdn.kernel.org/pub/tools/crosstool/


