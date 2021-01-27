Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8468B306370
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 19:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhA0Skg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 13:40:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21651 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233909AbhA0Ske (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 13:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611772748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=d2rMYmo2UwD4uaWOo5SKb6vyc3lGMIqAZMPDaC/xidk=;
        b=LzDcf+G9MW/QJnFQFxVhh/HgRz3DclQZrwa70YhaQM7hRcFcnyDJGUqWtO4oSp9t07dZ6s
        S8nBbCg1B8JNqnLk1+XLQ5b6gw+knblS4PVg0o0iNxk7LxrYA4KmZLr4GAlflRzOQ+TLkE
        qQJl1I/FbRxRBf6gfRsH3iWe73DulOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-5VeLYatqN-i0XPBTIP5ksQ-1; Wed, 27 Jan 2021 13:39:06 -0500
X-MC-Unique: 5VeLYatqN-i0XPBTIP5ksQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1FD910054FF;
        Wed, 27 Jan 2021 18:39:04 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DEA8100AE2D;
        Wed, 27 Jan 2021 18:39:03 +0000 (UTC)
Date:   Wed, 27 Jan 2021 12:38:56 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210127183856.moe3p5pxw6bbtunk@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210127180215.GA1745339@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127180215.GA1745339@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 27, 2021 at 06:02:15PM +0000, Christoph Hellwig wrote:
> Please don't add all this garbage.  We only add infrastructure to the
> kernel for what the kernel itself needs, not for weird out of tree
> infrastructure.

This isn't new, the kernel already has the infrastructure for building
out-of-tree modules.  It's widely used.  Are you suggesting we remove
it?  Good luck with that...

Either it should be supported, or not.  Make the case either way.  But I
can't understand why people are advocating to leave it half-broken.

-- 
Josh

