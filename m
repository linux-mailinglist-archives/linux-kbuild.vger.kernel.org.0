Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECD42CF2B8
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 18:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbgLDRGz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 12:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730100AbgLDRGx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 12:06:53 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18C2C0613D1;
        Fri,  4 Dec 2020 09:06:12 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id h19so2174410qtq.13;
        Fri, 04 Dec 2020 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kdGdxzD3ppO3x380ols5ozCLZelwGJMtEPKpgvRZ6Bg=;
        b=nm0A/vqWnv5DKKLFLy4pET2wXEfWPW5WTpbnQ3dUSF4aNuEw+WknlpOhdsyxbz+yoP
         vFH4cO7pQ2y13O7Bu48iM0ZB5v3VzR1OWwM7Iu1i9JsFY/Q/ckPnii2szVt7MtMOc+VM
         Sp4s2pGKj2CTj/gFSXoCLhF9UGxiUS4nB5LRleicQufexZeRHfw0qQ0/8npLwueFaD0n
         yCW6IQEWTY4PC21yHIVGDx5K9CxIzLEh1ATplXVX0WqKdFpGLWh9q+9Ech6ahCo7DI8w
         RoLzZlaDvrSmYzaC0IEvGYCvSHwKYoQuyBBSGCvfKizssvSZ5IUpMk/3Ya4/o9XmelPr
         Oy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=kdGdxzD3ppO3x380ols5ozCLZelwGJMtEPKpgvRZ6Bg=;
        b=tf8KFfAzQWlAI6/dZlNdaPkrlZ/dM6rDH1Jf5C9nBGW0G3T1k+oRcNIWCJMjoc7dLK
         ATwAycHvGHePRLTMD9op/MmiWKUIjsGSZGgQ0GFbflNAJ/QLTBPedypL8JnYGQ5ymeYu
         gA+evuqWCtep7GjpPakepgvQNiBS361DIhLKoYgWVNJ+WMocJ6DWnDfUm85pY49YCdoY
         ptfYcZMgK18Zx2CqLU8FrVxd0YECRHjWokBRmriaxgq8iBIFLUml/1lM5YD5yv8eSlCd
         f5tIOwaeD2SrG183PyRt43O0oqRX1mwO/bH1oiXm+1KiTG7J3E59P2NbctxVNxe06Gu5
         c/zw==
X-Gm-Message-State: AOAM532Zlv7RP4Xh4y6q+yvQcxVCR7oFP44CAoNr+vkTGHpf4OLI3h+i
        CM2mx3uNFfqLBxUHKpK+h5w=
X-Google-Smtp-Source: ABdhPJwhe09u32u4MwdUxHbEMpH2/cdMUMP6XK7zt69pSRHxs3nrAB6JBMsyBbmWz5R+40r5cyORFQ==
X-Received: by 2002:aed:2123:: with SMTP id 32mr10285888qtc.329.1607101571841;
        Fri, 04 Dec 2020 09:06:11 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id y3sm5651039qkl.110.2020.12.04.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 09:06:10 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Fri, 4 Dec 2020 12:06:08 -0500
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
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
Subject: Re: [PATCH v2 4/4] Kbuild: implement support for DWARF v5
Message-ID: <X8psgMuL4jMjP/Oy@rani.riverdale.lan>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
 <20201104005343.4192504-5-ndesaulniers@google.com>
 <20201124172836.GA346213@rani.riverdale.lan>
 <CAKwvOdkGvLrPr4pHi4LKCF5t74+wencdy7r38d3k_4pC9pQYwQ@mail.gmail.com>
 <CAKwvOdmEVM67v8PqPWHP-VyGTkQpkWv8FdOTbxQ-7ebvSummMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdmEVM67v8PqPWHP-VyGTkQpkWv8FdOTbxQ-7ebvSummMA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 03, 2020 at 03:28:14PM -0800, Nick Desaulniers wrote:
> On Thu, Dec 3, 2020 at 3:22 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Tue, Nov 24, 2020 at 9:28 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > >
> > > On Tue, Nov 03, 2020 at 04:53:43PM -0800, Nick Desaulniers wrote:
> > > > DWARF v5 is the latest standard of the DWARF debug info format.
> > > >
> > > > Feature detection of DWARF5 is onerous, especially given that we've
> > > > removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> > > > support.  GNU `as` only recently gained support for specifying
> > > > -gdwarf-5.
> > >
> > > With gcc, using -gdwarf-5 even without -Wa,--gdwarf-5 results in
> > > considerably smaller debug info. gcc does not seem to generate the .file 0
> > > directive that causes older GNU as to barf.
> > >
> > > Should the assembler support check be restricted to CC_IS_CLANG?
> >
> > No, because if LLVM_IAS=1 then the assembler support need not be checked.
> 
> Also, if your version of GCC supports DWARF Version 5, but your
> version of GAS does not, then I'm more inclined to not allow
> CONFIG_DEBUG_INFO_DWARF5 to be selectable, rather than mix and match
> or partially support this for one but not the other.  Either all tools
> used support DWARF 5, or you don't get to use DWARF 5.
> 

Why? Does this actually cause any problems?

It seems like the options for gcc can actually be very straightforward:
you just need a cc-option check, and then add -gdwarf-N to both CFLAGS
and AFLAGS and you're done.  Adding the -Wa flag is superfluous and
carries the risk of interfering with what the compiler driver does. Just
let the gcc driver handle the details.

Clang/IAS is almost as straightforward, with the only additional edge
case being that for assembler files, DWARF 2 doesn't work, so the CFLAGS
is the same -gdwarf-N, but AFLAGS gets -gdwarf-N only if N > 2.

The messy case is only Clang/IAS=0, which needs to check the support
from the external assembler, and needs CFLAGS of -gdwarf-N and AFLAGS of
-Wa,--gdwarf-N, because Clang doesn't pass that option on to an external
assembler. This is why I was asking if the assembler support check can
be restricted to CC_IS_CLANG: nothing but Clang/IAS=0 actually requires
that check.
