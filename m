Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A8F2C2D85
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 17:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390578AbgKXQ4I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 11:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390522AbgKXQ4G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 11:56:06 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D342C0613D6;
        Tue, 24 Nov 2020 08:56:06 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id l2so910830qtq.4;
        Tue, 24 Nov 2020 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jILiRm90aRamE5lAw9+1J2GPv0RPdczvsdZoWEuZtDA=;
        b=t9uqfSPkGQorJHk83AYZCoPhOfPB2i15+puOuSZ+B8pxg1R13JrOiwV/Hj2klgfoNL
         QTFmc3xatFu4zJXNodSosWT0imdS7dKinjwtQ7rqaqWI6JIcmRbfuKWzGrrSQqAMUhVl
         aVmAvj5KdR004ZKvncrXERZpKoH9JRk0IDyEmjdXj236q/x4FikSA48MKVnbxLuJMxiv
         nhMG6FbdnZdUAW9QDfwpyOR6GGNp+0xUYF3bl5NUpnERidh86dT/PPskNz7stO/hbAJY
         XIPiEFgVx/ZQgZdy04o1CAlrWdSCqeekckn/qIIa6QtzQ1Bzy2LCSPYnr1ZnV5/igveN
         9XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=jILiRm90aRamE5lAw9+1J2GPv0RPdczvsdZoWEuZtDA=;
        b=NLu+bfk2roq+od7Jhm6Sfn1O8Xl05f12ZMCoI5NX/ZL+KeWlhBoypPijIosh1isfDH
         Xluwh2ckFi5lx1QKtxYqgXhc/8eYSYjb80+tk/ssJEGhip+l2ZHKZ5iSXUekpkCj/o9M
         RocisIwHOset6xi2dkeKjd36D/LmQaTX0cdaE9Zs5qfq7CslZiblHx/Ty7IDGfSzUk0c
         lEKXSrhZR6ap3SYqscaqw67vEzxINjBZ1IiiK+QLAAHyW5dYdtIbj5GlXMKyY9YGUDmz
         6H2Ntx0/n2Cdd4kTZrdZOA+xgwTOOEGQsJQZjWQ1w+YT+N7lvhjJ7f2Y1kyVKIXNCfKD
         X0QA==
X-Gm-Message-State: AOAM532DeFdxe3RYpq/3XNX1Jw/9MjGS1Fjlr+bE3z+ldYzTZVIuF4B/
        SPFrqK0PFO9AtrgcxX+sdsU=
X-Google-Smtp-Source: ABdhPJwuDLAFgxM7V8uGeYcdy1rpCCjQ9myt1Y1Lrf6Fez8dO+gorLgSMuMRJe7inuFW4yVp7b8Gxg==
X-Received: by 2002:aed:204c:: with SMTP id 70mr5086384qta.92.1606236965390;
        Tue, 24 Nov 2020 08:56:05 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id c79sm13210905qke.69.2020.11.24.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:56:04 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 24 Nov 2020 11:56:02 -0500
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
Message-ID: <20201124165602.GA343230@rani.riverdale.lan>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
 <20201104005343.4192504-4-ndesaulniers@google.com>
 <20201123232210.GA208735@rani.riverdale.lan>
 <20201124003357.GR2672@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124003357.GR2672@gate.crashing.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 23, 2020 at 06:33:57PM -0600, Segher Boessenkool wrote:
> On Mon, Nov 23, 2020 at 06:22:10PM -0500, Arvind Sankar wrote:
> > Btw, is -gsplit-dwarf at all useful for assembler files?
> 
> If you invoke the assembler via the compiler, with that flag it still
> creates separate .o and .dwo files (via objcopy invocations as usual).
> Whether that is useful depends on if you have any debug info that can
> be split :-)
> 
> 
> Segher

Right, the latter was what I was really asking :) We don't currently
pass -gsplit-dwarf for assembler and I was wondering if that mattered.

Thanks.
