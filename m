Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E3370F4E
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 23:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhEBVX7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 17:23:59 -0400
Received: from smtprelay0138.hostedemail.com ([216.40.44.138]:50750 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232338AbhEBVX7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 17:23:59 -0400
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id BE0F518027FCE;
        Sun,  2 May 2021 21:23:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 4FDC120D75C;
        Sun,  2 May 2021 21:23:02 +0000 (UTC)
Message-ID: <fcffe807353391339a03106f175ffa71377752b1.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From:   Joe Perches <joe@perches.com>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Date:   Sun, 02 May 2021 14:23:01 -0700
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
         <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
         <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
         <20210502183030.GF10366@gate.crashing.org>
         <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
         <20210502203253.GH10366@gate.crashing.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4FDC120D75C
X-Spam-Status: No, score=-0.73
X-Stat-Signature: 8s7n7kr6yugf5k5opoqworaztxej967t
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+fP+x9C6cIbIbx7qR6GaqDgZa7dwY1Pfw=
X-HE-Tag: 1619990582-993883
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 2021-05-02 at 15:32 -0500, Segher Boessenkool wrote:
> On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
[]
> > Perhaps 8 might be best as that has a __diag warning control mechanism.
> 
> I have no idea what you mean?

? read the last bit of compiler-gcc.h



