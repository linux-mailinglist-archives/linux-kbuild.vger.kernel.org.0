Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBC81FBE42
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2020 20:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgFPSis (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 14:38:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgFPSir (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 14:38:47 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBF9F207C4;
        Tue, 16 Jun 2020 18:38:46 +0000 (UTC)
Date:   Tue, 16 Jun 2020 14:38:44 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Matt Helsley <mhelsley@vmware.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <20200616143844.5599804d@oasis.local.home>
In-Reply-To: <202006161101.34B26E6@keescook>
References: <20200422232417.72162-1-samitolvanen@google.com>
        <20200424193046.160744-1-samitolvanen@google.com>
        <20200424222214.GC9040@rlwimi.vmware.com>
        <202006161101.34B26E6@keescook>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 16 Jun 2020 11:03:18 -0700
Kees Cook <keescook@chromium.org> wrote:

> > Reviewed-by: Matt Helsley <mhelsley@vmware.com>  
> 
> Hi!
> 
> Can this patch please be applied and sent before -rc2? FGKASLR, LTO, and
> link time improvements[1] all depend on this fix, and I'd really like
> them all to be able to sanely rebase for the development window.
> 
> Thanks!
> 
> -Kees
> 
> [1] https://lore.kernel.org/lkml/CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com/

The patch seems to have fallen behind in my patch stack (unfortunately,
it's most recent first!)

Anyway, I'm putting together now a set of patches for -rc2. I'll
include this one in it as well.

-- Steve
