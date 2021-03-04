Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4904532D61E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 16:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhCDPKM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 10:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59384 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234095AbhCDPJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 10:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614870502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=J4QN7pJNOT2nEwbuXXNMrgWnor3HdWmiWZzK0wAUEE8=;
        b=AIUBtdm+YprneLrzr9WMrKPFU/G7Pg6DwXJfOwOq5vkktTgolL/L7EqG2Z6LGe3URs43UQ
        ajxwC+fod2W9HfZEks/HXPKNu0Sx+n4N292D3wQ6KD7FETrClMEaR85ZbuP17yic4/zW0B
        DIJ4Wr6tNfGQcnRowawooTFNhnT2Bes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-rfYOv58sPAWr7JRDNWBm3g-1; Thu, 04 Mar 2021 10:08:20 -0500
X-MC-Unique: rfYOv58sPAWr7JRDNWBm3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB29E8143F0;
        Thu,  4 Mar 2021 15:08:17 +0000 (UTC)
Received: from treble (ovpn-113-161.rdu2.redhat.com [10.10.113.161])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 43F9117CF0;
        Thu,  4 Mar 2021 15:08:15 +0000 (UTC)
Date:   Thu, 4 Mar 2021 09:08:12 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210304150812.rzya7ewmerwhe4m4@treble>
References: <20210302232649.y2tutffhxsblwqlb@treble>
 <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble>
 <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble>
 <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble>
 <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble>
 <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 09:27:28PM +0900, Masahiro Yamada wrote:
> I agree with rebuilding GCC plugins when the compiler is upgraded
> for *in-tree* building.
> Linus had reported it a couple of months before,
> and I just submitted a very easy fix.

Hm?  So does that mean that a GCC version change won't trigger a
tree-wide rebuild?  So you're asserting that a GCC mismatch is ok for
in-tree code, but not for external modules???  That seems backwards.

For in-tree, why not just rebuild the entire tree?  Some kernel features
are dependent on compiler version or capability, so not rebuilding the
tree could introduce silent breakage.

For external modules, a tree-wide rebuild isn't an option so the risk is
assumed by the user.  I posted a patch earlier [1] which prints a
warning if the compiler major/minor version changes with an external
module build.

[1] https://lkml.kernel.org/r/20210201211322.t2rxmvnrystc2ky7@treble

> Rebuilding plugins for external modules is not easy;
> plugins are placed in the read-only directory,
> /usr/src/linux-headers-$(uname -r)/scripts/gcc-plugins/.
> 
> The external modules must not (cannot) update in-tree
> build artifacts.  "Rebuild" means creating copies in a different
> writable directory.
> Doing that requires a lot of design changes.

Ok.  So it sounds like the best/easiest option is the original patch in
this thread:  when building an external module with a GCC mismatch, just
disable the GCC plugin, with a warning (or an error for randstruct).

-- 
Josh

