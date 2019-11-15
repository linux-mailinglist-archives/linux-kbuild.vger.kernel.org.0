Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAAAFD809
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 09:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKOIix (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 03:38:53 -0500
Received: from mail.skyhub.de ([5.9.137.197]:50830 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfKOIix (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 03:38:53 -0500
Received: from zn.tnic (p200300EC2F0CC300B4C5AF24BE56B25A.dip0.t-ipconnect.de [IPv6:2003:ec:2f0c:c300:b4c5:af24:be56:b25a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0081A1EC0D00;
        Fri, 15 Nov 2019 09:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1573807132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=rv5YYYkfeeYLMOS+KfL6MB8+a6cDeCHbA8Z0sqPv7Ls=;
        b=IeyA7Oift+QLbdqG0oEr6y+OMdmlKXMn8PTnEgTjRRnE9dJ35AscrWY3PKrqdhMOzn7eId
        14ryLWXmZ7R37jeKOSnwv2QvaJ6eVMiv3dQ9UAootvSrFliTWJu4fjhesB+0flbwaSD5E1
        whZjY+4ZvvyMF2EzevDbJkxm3goqIY4=
Date:   Fri, 15 Nov 2019 09:38:47 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Joerg Roedel <jroedel@suse.de>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-ID: <20191115083847.GB18929@zn.tnic>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
 <20191114171231.GA21753@suse.de>
 <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 14, 2019 at 04:01:08PM -0800, Andrew Morton wrote:
> It's fairly urgent - I consider this to be -stable material.
> 
> Thomas & co, was that a deliberate skip?

More like lost in the mail flood. I'm assuming you're taking it?

In any case, patch looks ok to me - the "unmappings" naming sounds like
coming from someone with a very wild phantasy... :-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
