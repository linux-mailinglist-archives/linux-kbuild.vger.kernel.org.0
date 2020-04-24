Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B6E1B7EB7
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2020 21:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgDXTSm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Apr 2020 15:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726793AbgDXTSl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 15:18:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C1DC09B049
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Apr 2020 12:18:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so1535438pfx.7
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Apr 2020 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jTXhU16A9f20mBuu55i1N5tKQ/YnXN5h5AIwPuslRMg=;
        b=nV1EfN6ZmE2x8RvvWY6vrJ3lW2X3dXiVzH8qROTf2wPgUd/QtmamqGhGr0UDOcbmjI
         +6rLop62QemOx9h8egpv950FpzBITun6MisOH3EnHptSlUTXV8l59wxW9EDaLA3IQBHe
         Lfge11AvQhw2vky8hRnIBXJ/9pswd8FTq3AKd+d2bPDmn1cyteXS/VwAvnSTKrthJPu4
         CRJW44nNuiemqwDbtBeTTkafXsGi/LtlLz4WGOwpeJmZeh8DBV2ZhaB2mVmTVMN3wL8S
         j2gAKGdjA89XX0JmDY+xzSjUgQKr4wEYZOIPtZ29eQaQLhToiU433biI3ilAFczq9lel
         jptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jTXhU16A9f20mBuu55i1N5tKQ/YnXN5h5AIwPuslRMg=;
        b=CZZePI+J5QWjbHu9V3zfjv+zIt/6fWmhKfPDGpAnviaxRJaOxsfph6B334bc1Ruw/h
         EAvkp5nstrMKvY8e/xEqJvWj1a1BODlYoVNkzta/Qz/jC2iYr4YmWlR0DosBE1Rw0bhH
         qaW5wc587PHBAjk7d3kqQx/VJBIqFjdkcnTWgWyKMycrl7duRule40ICi2ZYVb8RF5ie
         pA20TfCyZBWDbbfB3+rP0GVaq3gnhEVKc/jV6hmOvMRYnJ5hoQV09PueATo0Ta6urY2Q
         8vrNzok+IWoqjNttZnZ01nM2Q9MJZSHmdyDObZwtp944ZewQ93u9rWxmHENkxaOfz3f8
         k7Wg==
X-Gm-Message-State: AGi0PuY8TAyZg7o+6BVmIHWbrI/Vpw52V1elmZoUOwAJH35NjGdSclQH
        oZ1iKZ1VqLo/o0Wpj0s7QQ3dMQ==
X-Google-Smtp-Source: APiQypL3GF0IA3FPXvIB4BaH+YXLYmcQEL8UKsod6EOYXpS5VubITIDtjbXPSf2q4ZxlOxgWjuFXeQ==
X-Received: by 2002:a63:5724:: with SMTP id l36mr818367pgb.317.1587755919194;
        Fri, 24 Apr 2020 12:18:39 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id h6sm5306704pje.37.2020.04.24.12.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 12:18:38 -0700 (PDT)
Date:   Fri, 24 Apr 2020 12:18:32 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Matt Helsley <mhelsley@vmware.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] recordmcount: support >64k sections
Message-ID: <20200424191832.GA231432@google.com>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200423214734.GB9040@rlwimi.vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423214734.GB9040@rlwimi.vmware.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Matt,

On Thu, Apr 23, 2020 at 02:47:34PM -0700, Matt Helsley wrote:
> > +static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
> 
> I noticed this returns an unsigned int ...
> 
> > +	Elf_Shdr *const shdr0 = (Elf_Shdr *)(old_shoff + (void *)ehdr);
> > +	unsigned const old_shnum = get_shnum(ehdr, shdr0);
> 
> While this is not explicitly called out as an unsigned int. Perhaps we
> could just make this and new_shnum explicit unsigned ints and then...

> > +	if (!ehdr->e_shnum || new_shnum >= SHN_LORESERVE) {
> > +		ehdr->e_shnum = 0;
> > +		shdr0->sh_size = w(new_shnum);
> > +	} else
> > +		ehdr->e_shnum = w2(2 + w2(ehdr->e_shnum));
> 
> If we make the unsigned int change proposed above can we reuse new_shnum
> here like so:
> 		ehdr->e_shnum = w2(new_shnum);
> 
> So this if/else is doing the inverse of get_shnum(). I think the code
> could be cleaned up a little and prepare for moving to objtool by
> putting it in a helper function.

Sure, sounds good to me.

> > +	for (relhdr = shdr0, k = nhdr; k; --k, ++relhdr) {
> > +		if (relhdr->sh_type == SHT_SYMTAB)
> > +			symtab = (void *)ehdr + relhdr->sh_offset;
> > +		else if (relhdr->sh_type == SHT_SYMTAB_SHNDX)
> > +			symtab_shndx = (void *)ehdr + relhdr->sh_offset;
> > +
> > +		if (symtab && symtab_shndx)
> > +			break;
> > +	}
> 
> Could you break this out into a helper function? find_symtab() maybe? Again, I think
> that helper would go away with conversion to objtool.

Agreed, this wouldn't be needed with libelf. I'll send v2 shortly.
Thanks for the review!

Sami
