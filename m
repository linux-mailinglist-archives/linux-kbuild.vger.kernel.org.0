Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFA036ECFC
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 17:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbhD2PHY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 11:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbhD2PHW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 11:07:22 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0768AC06138B;
        Thu, 29 Apr 2021 08:06:36 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lc8F5-009J9w-Rq; Thu, 29 Apr 2021 15:06:16 +0000
Date:   Thu, 29 Apr 2021 15:06:15 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Mariusz Ceier <mceier+kernel@gmail.com>
Cc:     Kajetan Puchalski <mrkajetanp@gmail.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YIrLZ8Siip0C0d9b@zeniv-ca.linux.org.uk>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com>
 <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 29, 2021 at 02:06:12PM +0000, Mariusz Ceier wrote:

> > You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, *to be licensed as a whole* at no charge to all third parties under the terms of this License.
> 
> 
> The issue here is, non-GPL tools enable development and distribution
> of GPL-compatible yet proprietary versions of the kernel, unless I'm
> mistaken.

And?  For your argument to work, we'd need to have the kernel somehow
locked into the use of tools that would have no non-GPL equivalents
*and* would be (somehow) protected from getting such equivalents.
How could that be done, anyway?  Undocumented and rapidly changing
features of the tools?  We would get screwed by those changes ourselves.
Copyrights on interfaces?  Software patents?  Some other foulness?

I honestly wonder about the mental contortions needed to describe
something of that sort as "free", but fortunately we are nowhere
near such situation anyway.

I don't like Rust as a language and I'm sceptical about its usefulness
in the kernel, but let's not bring "gcc is better 'cuz GPL" crusades
into that - they are irrelevant anyway, since we demonstrably *not*
locked into gcc on all architectures your hypothetical company would
care about, Rust or no Rust.
