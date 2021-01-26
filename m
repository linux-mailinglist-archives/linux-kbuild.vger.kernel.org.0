Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B46F304315
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 16:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392664AbhAZPtX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 10:49:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45869 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392670AbhAZPsb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 10:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611676025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qzu8Yi9XdW/qKp/+NlwEE61olqGo5JkdqMwkmHc/Mx0=;
        b=VGgXxlDYkXXwdT8UwDSlYt49a9UM+R4StEWMBITLB37u9DLFwnj9/m94oAzhdCmhujgWHT
        ZcbWSXq6L0KncOM24nCSDbq8lRXJaQy4Hw/j7U9SMBArouzLD0U4+WdrKrlweoF9vWr99K
        HaJ/0j6r818D1UQ4/rpw1FzfuWp5q+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-segurc8MMgCOFb4JYAA6kg-1; Tue, 26 Jan 2021 10:47:03 -0500
X-MC-Unique: segurc8MMgCOFb4JYAA6kg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF276107B45B;
        Tue, 26 Jan 2021 15:47:00 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 27F447770E;
        Tue, 26 Jan 2021 15:46:53 +0000 (UTC)
Date:   Tue, 26 Jan 2021 09:46:51 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Greg KH <greg@kroah.com>, Justin Forbes <jforbes@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210126154651.itfrnhwfistia3ss@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
 <20210126145155.kcfbnzfqg5qugvcl@treble>
 <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 04:15:37PM +0100, Peter Zijlstra wrote:
> On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> > User space mixes compiler versions all the time.  The C ABI is stable.
> > 
> > What specifically is the harder issue you're referring to?
> 
> I don't think the C ABI captures nearly enough. Imagine trying to mix a
> compiler with and without asm-goto support (ok, we fail to build without
> by now, but just imagine).
> 
> No C ABI violated, but having that GCC extention vs not having it
> radically changes the kernel ABI.
> 
> I think I'm with Greg here, just don't do it.

Ok, thank you for an actual example.  asm goto is a good one.

But it's not a cut-and-dry issue.  Otherwise how could modversions
possibly work?

So yes, we should enforce GCC versions, but I still haven't seen a
reason it should be more than just "same compiler and *major* version".

-- 
Josh

