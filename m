Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF456AE3A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 20:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388346AbfGPSN3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 14:13:29 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55808 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388036AbfGPSN3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:13:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id a15so19589647wmj.5;
        Tue, 16 Jul 2019 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cO9ZL0i67Vukhw2LdJBrDmr+WYcSvzyDUA+M3BuQ40Y=;
        b=RGrU02ZJmMduNCev725DAVHxTclHIDTyI84FFsXfSCSHWRqj7d+e5QS3dmYfmWKmJt
         +DNl5W40yi4JLBp7OqRxt/Hc4nftNWMqaXWYfPp3hfDNKFkRx13Nnlu0EozkjpIVkkib
         Vl4C8m9Gcit+4s9U7pAoYmxkM49OVdEv5uOPP65BB4yiPfS4z3AsioVjL2DciQ86fIPU
         w808ewPimfN2Gp7+C5pjEvu0sbepzOe6PM6IOsT3cndmo2DA5I36TZKsI3C0JzXBUj8M
         cuWNfO2wqAmBfSxGYwAviIY4Q2KJ+wBxejLWGmGp2Vxf+ZEMoDmWII5/FN98CpnWC9f0
         mkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cO9ZL0i67Vukhw2LdJBrDmr+WYcSvzyDUA+M3BuQ40Y=;
        b=qiLTYsagb07Ij+sNOTZgf/SrZGgZhyq3KZvNW+3qa/cbtaJ0Vm0PX2Ya3muJBkYkT3
         8NipT+l9beUEppwDK8bLoDo9QMlgAZyv8zFMkX3Jv8yQDtSc2KR9hVfywOobhoNuzxvx
         lFA0hmrDXXjhzyPec71fhK1Es7WiFEDM7i0A9juGCmrBfXqxOO9oxFJA3PBRw7jJaMDy
         D0l/mayxqAUJG4DWzoOyvRt1TjxyQM0Rj0LN6siDKTF3coowMmgAApb6xAfQJJv4RAt+
         Z2Gd9nO30BeKRmKfcRxR8qqvXfoH19ZWJC70MO110QXcAqFAgLk35MyRxpNJgd63D39J
         QD2Q==
X-Gm-Message-State: APjAAAUjC3VKmi7bRzpuTsiEIFz450+9UuhCTu7MQ6RHENtf4YvoQ2Mg
        mKELsCF6CeHssJKNoK4N5kc=
X-Google-Smtp-Source: APXvYqyNrWzxnTRcAKS3SdgR5aVs8UouqJKVnSqqE1D5kZY1arihYpBoN1S9MD/hAXsNyLPmsKat7Q==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr33109434wmi.78.1563300807026;
        Tue, 16 Jul 2019 11:13:27 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id g8sm19208079wmf.17.2019.07.16.11.13.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 11:13:26 -0700 (PDT)
Date:   Tue, 16 Jul 2019 20:13:24 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716181324.GA41555@gmail.com>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com>
 <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, 16 Jul 2019, Ingo Molnar wrote:
> 
> > 
> > * Thomas Gleixner <tglx@linutronix.de> wrote:
> > 
> > > The gold linker has known issues of failing the build in random and
> > > predictible ways. H.J. stated:
> > 
> > s/predictable/unpredictable?
> 
> No. It fails randomly, but also predictable. Enable X32 support on 64bit
> and it fails the VDSO build. That's been the case for years.

Then please make this a bit more apparent, such as:

 "The gold linker has known issues of failing the build in random
  but also in more predictible ways."

or so?

Thanks,

	Ingo
