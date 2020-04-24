Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08311B81FF
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2020 00:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDXWWT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Apr 2020 18:22:19 -0400
Received: from ex13-edg-ou-001.vmware.com ([208.91.0.189]:32761 "EHLO
        EX13-EDG-OU-001.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725874AbgDXWWS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 18:22:18 -0400
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 24 Apr 2020 15:22:10 -0700
Received: from localhost (unknown [10.129.220.242])
        by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 2124C4049C;
        Fri, 24 Apr 2020 15:22:15 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:22:14 -0700
From:   Matt Helsley <mhelsley@vmware.com>
To:     Sami Tolvanen <samitolvanen@google.com>
CC:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <20200424222214.GC9040@rlwimi.vmware.com>
Mail-Followup-To: Matt Helsley <mhelsley@vmware.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200424193046.160744-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200424193046.160744-1-samitolvanen@google.com>
Received-SPF: None (EX13-EDG-OU-001.vmware.com: mhelsley@vmware.com does not
 designate permitted sender hosts)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 24, 2020 at 12:30:46PM -0700, Sami Tolvanen wrote:
> When compiling a kernel with Clang and LTO, we need to run
> recordmcount on vmlinux.o with a large number of sections, which
> currently fails as the program doesn't understand extended
> section indexes. This change adds support for processing binaries
> with >64k sections.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Feel free to add

Reviewed-by: Matt Helsley <mhelsley@vmware.com>

> ---
> Changes in v2:
>  - Switched to unsigned int for (old|new)_shnum in append_func.
>  - Added set_shnum and find_symtab helper functions and moved
>    the new logic there.
> 
> ---
>  scripts/recordmcount.h | 98 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 92 insertions(+), 6 deletions(-)

<snip>
