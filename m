Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572813709B3
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 04:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhEBCvv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 22:51:51 -0400
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]:37046 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230409AbhEBCvu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 22:51:50 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 May 2021 22:51:50 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id ED2E51801511B
        for <linux-kbuild@vger.kernel.org>; Sun,  2 May 2021 02:42:11 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 2E2581822186F;
        Sun,  2 May 2021 02:42:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 0D7D518A5F1;
        Sun,  2 May 2021 02:42:04 +0000 (UTC)
Message-ID: <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From:   Joe Perches <joe@perches.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
         <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Date:   Sat, 01 May 2021 19:41:53 -0700
MIME-Version: 1.0
User-Agent: Evolution 3.38.1-1 
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.59
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 0D7D518A5F1
X-Stat-Signature: cq9jpwmborrqawmiw8kjkakc3j6bmyct
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19KtPWcnnFB2QBxLpInpQtqjaFCZ/4pjzg=
X-HE-Tag: 1619923324-584352
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2021-05-01 at 17:52 +0200, Miguel Ojeda wrote:
> On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > 
> > More cleanups will be possible as follow-up patches, but this one must
> > be agreed and applied to the mainline first.
> 
> +1 This will allow me to remove the __has_attribute hack in
> include/linux/compiler_attributes.h.

Why not raise the minimum gcc compiler version even higher?

https://gcc.gnu.org/releases.html



