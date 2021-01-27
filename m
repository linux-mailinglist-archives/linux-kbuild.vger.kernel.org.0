Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5153062F8
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 19:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344298AbhA0SE3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 13:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344305AbhA0SE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 13:04:26 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B459CC06174A;
        Wed, 27 Jan 2021 10:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yZJEao2ShlmAoR9wMLYwCT4iNNCSKsH/zjEe/CBCFJE=; b=mzsA/tceqA4Q/x5rBDRm39TMWX
        jeXLBFw6JWrbm5yDSLw0IHFDOXS0wxrTG2lC8uEah3aw8fgrgIgdXC/36a0In29bVKPuAwoEIHsnB
        8Ns+YpqBBVBmAyL9Lt8nEJeyPWjCprAvyPdrokNtWn38g5tlHRFWXlEPqu9GeK36FzviYZVWHK7Ek
        CrZ/amitysHDY4JPK6nVhHUKCfweGQqReaItalSlOqWtXq8Zk7eu0V3igSPdhoki53ClsSB8XwV71
        iql+Ro9+0NMmvn1UPQE02Ca01Up//iIY00Oy9pBDImLcHgm8IKRVkQyRV/0PxVSG2fbzsw0un3jkM
        mzia5B0g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l4pA4-007KKz-8U; Wed, 27 Jan 2021 18:03:28 +0000
Date:   Wed, 27 Jan 2021 18:03:24 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Justin Forbes <jforbes@redhat.com>
Cc:     Greg KH <greg@kroah.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210127180324.GB1745339@infradead.org>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 06:44:44AM -0600, Justin Forbes wrote:
> Support and enforce are 2 completely different things.  To shed a bit
> more light on this, the real issue that prompted this was breaking CI
> systems.  As we enabled gcc plugins in Fedora, and the toolchain folks
> went through 3 different snapshots of gcc 11 in a week. Any CI process
> that built an out of tree module failed. I don't think this is nearly
> as much of a concern for stable distros, as it is for CI in
> development cycles.

And the answer is trivial: don't build out of tree modules.
