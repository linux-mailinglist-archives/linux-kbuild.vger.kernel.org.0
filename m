Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64861F5C5B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2020 22:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730479AbgFJUDd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jun 2020 16:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgFJUDb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 16:03:31 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C338C03E96F
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2020 13:03:30 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so1276338pls.2
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2020 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gMJmfBXQHkqYBkdWFgkIELmfTMw2QzimZzoX9rnpMvg=;
        b=VmhHMiuh5ohUCH3fDJnKjrDQRFL0Ji8PnJG1vfqLFDTNpxPKF/jUW6bjeiV5SjTR6o
         WXLVjXgIO5BzDsgibhA+L18doG6dCY7DA2U8R4aA2THMwHzIRdDqPqVTIOT51M5UhGjo
         pbeqxJDSxr/3GPDIEZHoH3PhBmMXdRDJJDdIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gMJmfBXQHkqYBkdWFgkIELmfTMw2QzimZzoX9rnpMvg=;
        b=mqoKa8uR2wbIyJV0vM5B2r85pRoWWJ1Nm3oBbrKkwf+8BPa2VVedLKQZrQeR/3h4o1
         /kA1s5IrcBmTcGmDH43evTonEkpCHPZUfcPhRUrjdGlct9Ei40Y0Z1I9YEBMU0duBvAy
         lSQoLUQikY0/0yIAm/DS+dJX4iHW1NrD+I0FEW7yzudUFQveKSLf+YW5Gp/3xygKsrT9
         NShDxaKgtl4uc1uZcjqrGEJQZ1OvqScbNr3jDkzMCHmJOchPTrNIGjdFj7IDie6swTq6
         XplahplUvxT2gFQ+mZh/vgC1c9NLxSfY/dI7gzZue30rbyqG+0cOoQq0cuaGQEjkjb21
         WN9A==
X-Gm-Message-State: AOAM531eL7U96xIiAGNq0uZA4sq8EFms/M5PZiD9ZML7DFhcw9F3Oynu
        PUu+7ooWRQGTrIS0uc8VEARf8g==
X-Google-Smtp-Source: ABdhPJzkqdGCWRf/l2Trk3MffvrvqWcW6Bumgrl4Vv2VZmme66jypNqah8ksfCDrx7bzuNc50pX7OQ==
X-Received: by 2002:a17:90a:cb8d:: with SMTP id a13mr4644611pju.175.1591819409470;
        Wed, 10 Jun 2020 13:03:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l63sm724636pfd.122.2020.06.10.13.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:03:28 -0700 (PDT)
Date:   Wed, 10 Jun 2020 13:03:27 -0700
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
Subject: Re: [PATCH 2/5] gcc-plugins/stackleak: Use asm instrumentation to
 avoid useless register saving
Message-ID: <202006101302.AC218FA1@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-3-alex.popov@linux.com>
 <202006091143.AD1A662@keescook>
 <757cbafb-1e13-8989-e30d-33c557d33cc4@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <757cbafb-1e13-8989-e30d-33c557d33cc4@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 10, 2020 at 06:47:14PM +0300, Alexander Popov wrote:
> On 09.06.2020 21:46, Kees Cook wrote:
> The inline asm statement that is used for instrumentation is arch-specific.
> Trying to add
>   asm volatile("call stackleak_track_stack")
> in gcc plugin on aarch64 makes gcc break spectacularly.

Ah! Thank you, that eluded my eyes. :)

> I pass the target arch name to the plugin and check it explicitly to avoid that.
> 
> Moreover, I'm going to create a gcc enhancement request for supporting
> no_caller_saved_registers attribute on aarch64.

For arm64 right now it looks like the plugin will just remain
"inefficient" in these cleanup, as before, yes?

-- 
Kees Cook
