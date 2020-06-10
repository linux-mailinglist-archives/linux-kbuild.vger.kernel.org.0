Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72A51F5C5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2020 22:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbgFJUEd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jun 2020 16:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgFJUEc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 16:04:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E72C03E96B
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2020 13:04:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 23so1571183pfw.10
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2020 13:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DXoJ3aLq9uhplWhtB2O8RgTDmA73SlXyMWG4MRv/Ld0=;
        b=Les6gM1utqz0wgQgKhZ4Nfpc6QS2e+nlg1Z/E14+jR0X69Sr3LwW3Zm/3lj8osjycK
         p6DUplVPD/d8Rthsbcyt2ZdYdwH3RELL5O74k3dxdMf4kX7zka4VtVliwa5J4nSVuu9e
         CL0gdKwiiV/4hvJM+5XPBMzv9WqFgKyQV9MGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DXoJ3aLq9uhplWhtB2O8RgTDmA73SlXyMWG4MRv/Ld0=;
        b=Rg/MvErj0DtAsUBC0Z/gFNTAzyrVHHhnLjh6reqMY9Pa0xQpM6araoqE6OT/7obytn
         bfQb5GMkQ3MjPxbPtc8ddIyh107OFybbcwXB3ZYXMbbG3DP1iRWZEcywY7XIsfuD965M
         FU/wZ1mIPqSkqQ7+V3tuZsi8vr7yk6roCDQ5hlG5tkfE5XOBEicjBx/PeeKD57vgyXVP
         BMvE4XIEDDvq8KE5M3Z/1bbHxTxrTr4AwuNOYR3RdPw9b3UineTZa8MBusjOlynOYxx4
         NdTVquxog+ynMBUKjXK6W7z5U/6hUx0nmOy+5lnqq6in1/F3Gai0rXV9q2NPrIEEF+4U
         kW0Q==
X-Gm-Message-State: AOAM533U4+R8S2Yt3vj69ee4fvb3BqIjXqvA92edCmFYyZ35pVeZWIEJ
        4H31XOWPCdc4T3fM9BMWEkrAhA==
X-Google-Smtp-Source: ABdhPJwC9KNAXjpOXoR+vUMW+1gcz/392CyELM73At2IMG3pDZxxAs+wEHjca9ODW8LTFHMHIMEw8g==
X-Received: by 2002:a63:df48:: with SMTP id h8mr3947452pgj.411.1591819472188;
        Wed, 10 Jun 2020 13:04:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w190sm723093pfw.35.2020.06.10.13.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:04:30 -0700 (PDT)
Date:   Wed, 10 Jun 2020 13:04:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org
Subject: Re: [PATCH 3/5] gcc-plugins/stackleak: Add 'verbose' plugin parameter
Message-ID: <202006101303.71B51BF1@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-4-alex.popov@linux.com>
 <202006091147.193047096C@keescook>
 <fb051386-4913-9442-f051-23ed25802c9e@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb051386-4913-9442-f051-23ed25802c9e@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 10, 2020 at 06:52:10PM +0300, Alexander Popov wrote:
> On 09.06.2020 21:47, Kees Cook wrote:
> > On Thu, Jun 04, 2020 at 04:49:55PM +0300, Alexander Popov wrote:
> >> Add 'verbose' plugin parameter for stackleak gcc plugin.
> >> It can be used for printing additional info about the kernel code
> >> instrumentation.
> >>
> >> For using it add the following to scripts/Makefile.gcc-plugins:
> >>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
> >>     += -fplugin-arg-stackleak_plugin-verbose
> >>
> >> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> > 
> > Acked-by: Kees Cook <keescook@chromium.org>
> 
> I see that I will change this patch after leaving alloca() support.
> I'm going to add debug printing about functions that call alloca().
> I have to omit your 'acked-by' for the changed patch, right?

If it changes dramatically, drop my Ack, yes. But since it's going via
my tree, my Ack is mostly just a quick email marker to say "yes, looks
good". :)

-- 
Kees Cook
