Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6ACC3618E0
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 06:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbhDPE0H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 00:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhDPE0G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 00:26:06 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D508EC061574;
        Thu, 15 Apr 2021 21:25:42 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lXG2w-005fpW-7A; Fri, 16 Apr 2021 04:25:34 +0000
Date:   Fri, 16 Apr 2021 04:25:34 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHkRvhIeO2794f7v@zeniv-ca.linux.org.uk>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHj02M3jMSweoP4l@google.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 03:22:16AM +0100, Wedson Almeida Filho wrote:

> > HTML is not a valid documentation format. Heck, markdown itself is
> > barely readable.
> 
> Are you stating [what you perceive as] a fact or just venting? If the former,
> would you mind enlightening us with some evidence?

How about "not everyone uses a browser as a part of their workflow"?
I realize that it might sound ridiculous for folks who spent a while
around Mozilla, but it's really true and kernel community actually
has quite a few of such freaks.  And as one of those freaks I can tell
you where exactly I would like you to go and what I would like you to do
with implicit suggestions to start a browser when I need to read some
in-tree documentation.

Linus might have different reasons, obviously.
