Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D50370EF2
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 22:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhEBUB2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 16:01:28 -0400
Received: from smtprelay0141.hostedemail.com ([216.40.44.141]:45368 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232427AbhEBUB1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 16:01:27 -0400
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id E5F31837F27B;
        Sun,  2 May 2021 20:00:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 7C6732448B6;
        Sun,  2 May 2021 20:00:30 +0000 (UTC)
Message-ID: <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
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
Date:   Sun, 02 May 2021 13:00:28 -0700
In-Reply-To: <20210502183030.GF10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
         <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
         <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
         <20210502183030.GF10366@gate.crashing.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.40
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 7C6732448B6
X-Stat-Signature: 71ockug33zmqd9a3epysnu3hfs3ubiyr
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19QpxupLlF/RmMAnwgGtoo8JZ2oBi/jlKM=
X-HE-Tag: 1619985630-933791
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 2021-05-02 at 13:30 -0500, Segher Boessenkool wrote:
> On Sat, May 01, 2021 at 07:41:53PM -0700, Joe Perches wrote:
> > Why not raise the minimum gcc compiler version even higher?

On Sun, 2021-05-02 at 13:37 -0500, Segher Boessenkool wrote:
> Everyone should always use an as new release as practical

[]

> The latest GCC 5 release is only three and a half years old.

You argue slightly against yourself here.

Yes, it's mostly a question of practicality vs latest.

clang requires a _very_ recent version.
gcc _could_ require a later version.
Perhaps 8 might be best as that has a __diag warning control mechanism.

gcc 8.1 is now 3 years old today.


