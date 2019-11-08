Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5315F4E00
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 15:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKHOXm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Nov 2019 09:23:42 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45688 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfKHOXl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 09:23:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id z10so1941443wrs.12
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Nov 2019 06:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cE0H/lLtUQTdWA4Vcuht2GzWTV6rZlF0FP9RhMPfa+4=;
        b=ory/CuML+B+1tukFzKeXnY81XBcGq1vwfIl7kbFAQz+tbADKR+CJPKZy/BESKMtLlE
         cfe4lPBu0aHoQMgFg3wqNkUUXcZSPOuiHfl+Dp4nenLqnPmRz1Fq9OqGOF3xosOU1zA1
         S1Ma9nEpT1N8PhAFz5NQZu3UirsZc6RXdSlnH602I62QBX0NM2NGcSf4hdG9Drm93xJ5
         o92Bli0UhHpFi4zTUBHMYr900Pj+qAzWq0/Jn4peXOKpbsgWDJiSk2XL6Y1btlzEP3BO
         T6T7qIwCGl/ExdpiwKN+PwjdTw4s7MmCYwCu5XqG94A58Z1uzvF1jFnhoOlKEc3iWoal
         2JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cE0H/lLtUQTdWA4Vcuht2GzWTV6rZlF0FP9RhMPfa+4=;
        b=QJocjGEOI5KIWh6DcfDNJYAmF7Gdh2yoEos01OwE3ydC7+jaVsrJ8HcCO6VFjRDZAU
         8Gn9Zo2WVkHXE7acNt6X63VnCVWNHAugkFrSNjyqvssA6UfFbyrWyhlCj8ujocpto/M1
         SlriilR76X2+kNKvCWG7ByOJXPP8g2Sqa7grWsWkfVLltBR72S6lezvbjWO3ev9H7zmW
         8JPPIO69jVTOCpNJzQcBBSTt0hGGOJlygt+fUBlTEr3Iu7W0bCa7/lkcPKyyN+KcQ2lP
         IQkvhdvOZEk7xpy82LSs5lYzMHtsFEz1JSPYBc++VOQW6S0rLntn8IgyPg+m5A+nSVxx
         eCrg==
X-Gm-Message-State: APjAAAXnPJHga0m9tjEmV0QEq7zoQi/CntWLSGuIdYECYuPUvzcDVWJU
        hNRY2lRpyt4ZdDK4afdQvpbZIw==
X-Google-Smtp-Source: APXvYqz6emxsafgwEh4kYnaj0O+HdDcno9ONkicjP+nqCSK6nZWbJAM5LqbPHf/CTE/PLeuiqFCJBQ==
X-Received: by 2002:adf:df09:: with SMTP id y9mr6302486wrl.25.1573223018529;
        Fri, 08 Nov 2019 06:23:38 -0800 (PST)
Received: from google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id d4sm5377200wrw.83.2019.11.08.06.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 06:23:37 -0800 (PST)
Date:   Fri, 8 Nov 2019 15:23:31 +0100
From:   Marco Elver <elver@google.com>
To:     Bhupesh Sharma <bhsharma@redhat.com>
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu,
        Alexander Potapenko <glider@google.com>,
        parri.andrea@gmail.com, andreyknvl@google.com,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
        Borislav Petkov <bp@alien8.de>, dja@axtens.net,
        dlustig@nvidia.com, Dave Hansen <dave.hansen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>, luc.maranget@inria.fr,
        Mark Rutland <mark.rutland@arm.com>, npiggin@gmail.com,
        paulmck@kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v3 1/9] kcsan: Add Kernel Concurrency Sanitizer
 infrastructure
Message-ID: <20191108142331.GA201027@google.com>
References: <20191104142745.14722-1-elver@google.com>
 <20191104142745.14722-2-elver@google.com>
 <CACi5LpMt1Jp3zi3dQXe-x=nZ4ikADoD2Sr4-6t4HKaarLs7uxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACi5LpMt1Jp3zi3dQXe-x=nZ4ikADoD2Sr4-6t4HKaarLs7uxw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Bhupesh,

Thanks for your comments, see answers below.

On Fri, 08 Nov 2019, Bhupesh Sharma wrote:

> Sorry for the late comments, but I am just trying to understand the
> new KCSAN feature (which IMO seems very useful for debugging issues).
> 
> Some comments inline:
> 
> On Mon, Nov 4, 2019 at 7:59 PM Marco Elver <elver@google.com> wrote:
> >
...
> > diff --git a/include/linux/kcsan.h b/include/linux/kcsan.h
> > new file mode 100644
> > index 000000000000..bd8122acae01
> > --- /dev/null
> > +++ b/include/linux/kcsan.h
> > @@ -0,0 +1,115 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _LINUX_KCSAN_H
> > +#define _LINUX_KCSAN_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/kcsan-checks.h>
> 
> For the new changes introduced (especially the new header files), can
> we please try to keep the alphabetical order
> for the include'd files.
> 
> The same comment applies for changes below ...

Done for v4.

...
> > +void kcsan_disable_current(void)
> > +{
> > +       ++get_ctx()->disable_count;
> > +}
> > +EXPORT_SYMBOL(kcsan_disable_current);
> > +
> > +void kcsan_enable_current(void)
> > +{
> > +       if (get_ctx()->disable_count-- == 0) {
> > +               kcsan_disable_current(); /* restore to 0 */
> > +               kcsan_disable_current();
> > +               WARN(1, "mismatching %s", __func__);
> 
> I am not sure I understand, why we need to call
> 'kcsan_disable_current()' twice and what the WARN message conveys.
> May-be you can add a comment here, or a more descriptive WARN meesage.

This branch is entered when there is an imbalance between
kcsan_disable_current and kcsan_enable_current calls. When entering the
branch, the decrement transitioned disable_count to -1, which should not
happen. The call to kcsan_disable_current restores it to 0, and the
following kcsan_disable_current actually disables KCSAN for generating
the warning.

> > +               kcsan_enable_current();
> > +       }
> > +}
> > +EXPORT_SYMBOL(kcsan_enable_current);
> > +
> > +void kcsan_nestable_atomic_begin(void)
> > +{
> > +       /*
> > +        * Do *not* check and warn if we are in a flat atomic region: nestable
> > +        * and flat atomic regions are independent from each other.
> > +        * See include/linux/kcsan.h: struct kcsan_ctx comments for more
> > +        * comments.
> > +        */
> > +
> > +       ++get_ctx()->atomic_nest_count;
> > +}
> > +EXPORT_SYMBOL(kcsan_nestable_atomic_begin);
> > +
> > +void kcsan_nestable_atomic_end(void)
> > +{
> > +       if (get_ctx()->atomic_nest_count-- == 0) {
> > +               kcsan_nestable_atomic_begin(); /* restore to 0 */
> > +               kcsan_disable_current();
> > +               WARN(1, "mismatching %s", __func__);
> 
> .. Same as above.

Same situation, except for atomic_nest_count. Here also
atomic_nest_count is -1 which should not happen.

I've added some more comments.

> > +               kcsan_enable_current();
> > +       }
> > +}
> > +EXPORT_SYMBOL(kcsan_nestable_atomic_end);

Best Wishes,
-- Marco
