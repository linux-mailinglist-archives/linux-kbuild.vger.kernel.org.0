Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F40D706C
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2019 09:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbfJOHrU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Oct 2019 03:47:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57588 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfJOHrU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 03:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s0EYNpZgNDwByY0WfJi3InA5EJrO+lO4vHXQl/TaEIg=; b=scY7fHtCx4VoaknBVynCwMlXC
        wNUi1AYin5ebZ1VTcMe+XihF+rPUmPobROs8ZqrhG2LgjXlUQqMHCvTpQJZUr1oaz3xjpu2cICfKM
        aNSeqPBjLSddXaFXbzaaQQw6NWFQsQ4P65nZwEuwgg0fMepLkPKY7p46qKGJsQTsV5KWbKBtgFLv9
        Pgc+ZJPXO5dbhIHlAZ6dv2Dh1/F2l9Ml2sCG95dA0ylvbR5Q9enkQR1+TcyY1FqpytthLdVdbXiLo
        Y99pAwSn4Ib1J/g079mZ3g+E+3kde2Nba67FVH1dbgt+nCTgyAaAKrSeqOnWyh9dYkDGLBoA53e/u
        4b/b9iWOA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iKHY5-0004l7-Il; Tue, 15 Oct 2019 07:47:17 +0000
Date:   Tue, 15 Oct 2019 00:47:17 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Kuldeep Dave <kuldeep.dave@xilinx.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Firoz Khan <firoz.khan@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] microblaze: Include generic support for MSI irqdomains
Message-ID: <20191015074717.GB8715@infradead.org>
References: <aa6dd855474451ff4f2e82691d1f590f3a85ba68.1570530881.git.michal.simek@xilinx.com>
 <20191008154604.GA7903@infradead.org>
 <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 10, 2019 at 12:47:31PM +0200, Michal Simek wrote:
> On 08. 10. 19 17:46, Christoph Hellwig wrote:
> > On Tue, Oct 08, 2019 at 12:34:47PM +0200, Michal Simek wrote:
> >> index e5c9170a07fc..83417105c00a 100644
> >> --- a/arch/microblaze/include/asm/Kbuild
> >> +++ b/arch/microblaze/include/asm/Kbuild
> >> @@ -25,6 +25,7 @@ generic-y += local64.h
> >>  generic-y += mcs_spinlock.h
> >>  generic-y += mm-arch-hooks.h
> >>  generic-y += mmiowb.h
> >> +generic-y += msi.h
> > 
> > Please just mark it as mandatory-y in the asm-generic makefile
> > instead of requiring a sniplet for every architecture.
> > 
> 
> But is it really mandatory for all architectures?

What the mandatory-y keyword means is that every architecture that
doesn't provide its own header gets the default one, which seems
applicable here.  Maybe the keyword is a bit misnamed and should be
default-y or something like that..

But in this case I think we have a clear case of x86 vs the rest, which
is unlikely to change in a major way.
