Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E761891CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2020 00:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCQXLG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Mar 2020 19:11:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39674 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgCQXLG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Mar 2020 19:11:06 -0400
Received: by mail-pg1-f196.google.com with SMTP id b22so6560591pgb.6
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2020 16:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=655SZyZ4kTa0wHYVMzoiHvAnRif4SDxsc5wkKB6CdU4=;
        b=eUMPbzAqzrqQXlybEnzx167u/1i1iSQsa7u7QfhXmBEvhSkw8D+L0/TR8sOAEwOfIg
         XuAaujrRbieGgO0/qr+EvIWua1i6z8ZvoplH1M5dXL6LAPgDXaFFCLzr41m0i1ZHiWWz
         H8U8U9DHtdBdgdQ/u2EWN1hOn5e0xjJuGohPBJKgDSKjH7w95GZBs/sOWTTDXco39T2t
         cTP631HOxnCKgBY+Cv74mEaRxLg85+5Wv62YbfVHxZKll7CsMkCz3CTTEsteQhDOee23
         v474oNfv+rwexWppcw+5NzUx5z7W9BU+O4T233jnqRISbv9YLBcCTH2ByBQyKawclyel
         MMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=655SZyZ4kTa0wHYVMzoiHvAnRif4SDxsc5wkKB6CdU4=;
        b=NaNHSgXXk9RaXQ56C1kgVUh/bu6LUqcHyUg+ewJxSGLhGQIvvk/sWCZyU3MomVN8or
         rr/IdVe+HcDJQMWlgST55lWtFS5C37mYCX3/ivIejVicj7r0qhYrRs9BZIu4rhBycUzf
         32OxhAtJzcVScP/6REdZ/qeuiPIN1K1iL0E3ZwG+d/9h0BTbMZukuvACA7ugzAuLVg2p
         0qD5jPnKRkMtQCoDPaN7OUlJHVj/nhSX0eqfVdovZJ6c7eGh2JoiE3QuDiEjUxp9JHt2
         HEnZflbDwSFGpycmImAPg2bLIn3RiFvDxfKLdmSEGuHAHmJB4/u6F/Gi5aYzIPBrmmV6
         Mb3w==
X-Gm-Message-State: ANhLgQ0Z5a5OSB5L3y8s9LxtYvl9D6TJMt06WaRPOiMSbFSs4Gc7hMvA
        pHUKhCCEtzGeuh/R6hLJzO7fyecAtkC1pwQFFiEhnw==
X-Google-Smtp-Source: ADFU+vvE1FXbmVfwZP+3e+8/+pgDo9ls3qIGPgKOg4hXyHLB8+yMmGdmETbmaY842qrOS5HGBT3syYeBGVngysMxZJM=
X-Received: by 2002:aa7:8b54:: with SMTP id i20mr1155834pfd.39.1584486664473;
 Tue, 17 Mar 2020 16:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200228002244.15240-1-keescook@chromium.org> <20200228002244.15240-8-keescook@chromium.org>
 <20200317215614.GB20788@willie-the-truck> <202003171558.7E1D46AED6@keescook>
In-Reply-To: <202003171558.7E1D46AED6@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 17 Mar 2020 16:10:53 -0700
Message-ID: <CAKwvOd=9JHM4yhfCWEa-8OhZ70v_pChjgKj=TSGZgxZrhS5a_g@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64/build: Warn on orphan section placement
To:     Kees Cook <keescook@chromium.org>
Cc:     Will Deacon <will@kernel.org>, Borislav Petkov <bp@suse.de>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        James Morse <james.morse@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 17, 2020 at 4:01 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Mar 17, 2020 at 09:56:14PM +0000, Will Deacon wrote:
> > On Thu, Feb 27, 2020 at 04:22:42PM -0800, Kees Cook wrote:
> > > We don't want to depend on the linker's orphan section placement
> > > heuristics as these can vary between linkers, and may change between
> > > versions. All sections need to be explicitly named in the linker
> > > script.
> > >
> > > Explicitly include debug sections when they're present. Add .eh_frame*
> > > to discard as it seems that these are still generated even though
> > > -fno-asynchronous-unwind-tables is being specified. Add .plt and
> > > .data.rel.ro to discards as they are not actually used. Add .got.plt
> > > to the image as it does appear to be mapped near .data. Finally enable
> > > orphan section warnings.
> >
> > Hmm, I don't understand what .got.plt is doing here. Please can you
> > elaborate?
>
> I didn't track it down, but it seems to have been present (and merged
> into the kernel .data) for a while now. I can try to track this down if
> you want?

Yes, the presence of a procedure linkage table makes sense for symbol
interposition and lazy binding in userspace executables with runtime
shared object loading support, but not so much the kernel, I would
think.  (Though someone did just recently ask me if loadable kernel
modules could interpose weakly defined symbols in the kernel, and if
so what happens on unload.  I have no idea and suspect kernel modules
cannot do that, but I have looked into the kernel's runtime relocation
support.)
-- 
Thanks,
~Nick Desaulniers
