Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DB12A5AF3
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbgKDASb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbgKDARG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:17:06 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8063AC0613D1;
        Tue,  3 Nov 2020 16:17:06 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id a65so15005702qkg.13;
        Tue, 03 Nov 2020 16:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o7VW5Grk+dEY5JWkUUhDhbgHVtmwCHyugEP4jZ8aPsI=;
        b=LmBQY7CZqa1Au8AieLs3s89z+TAZTWFu47IyTFakjM14mtGBE0bIvq09IxUR/j+lGt
         jO2oFrnBfi6hhUoVlAdRtHXd+feaAlnZQr+9acvskwJFyP9euRoCyubnsP4LUYVTPpjW
         xD0WBBdEYKtHlh3zK9FCyH++TA8G+OswbpSEKDY/jVrRunpJ3A/4QOBbm+MhwnsO5TdV
         yqwwzbScJDd43N/mRTutzDVsjMQJPyWDc/EF++mSvkFmBuchKgHPYawKPBWHsTnoNCvx
         ly80xsFLIWLwxfJ3OXFIhDDhUB7tnL1rCq1ouhjTkQz1f8mqr3yewDFm0xEymE5CD4Ji
         l7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=o7VW5Grk+dEY5JWkUUhDhbgHVtmwCHyugEP4jZ8aPsI=;
        b=ZH8YcFK5T+S6O+gx2iaZqc+1sTEUQYoZbFSxLASNAowxIZW9jl7CEWRKXMWsjssA6t
         37u2PwcOSkoeRHBXA72muYTaykAEErLPpdSsaFDubbuz1/6RwjDHId2oAPi1R66FaYNB
         jIessFa1WlzHFTx4Os+Tq1WnmTaMtO1AlH4ksWmtNXt/EOFd9L5o8175SiGX5bogYdrm
         Ha1ui0xs6kOfR14nQmGxXa9d/7Z/X1D5Ku0yBtk0M54SKZJnUDOKhMrmbaJDNWElI2O1
         vEAVFykRL7kTuFZXOAVhS9JHn4O+HNQYRt2hdG3CSireWmcJK5bMGH7mKV/01eRpYLx3
         ksGw==
X-Gm-Message-State: AOAM530jIYMi4rEpAPu013o8d95R01xdlBDY5DZQ7dPqNtxkExvJvMIq
        vfmTd/X3yestdJeD1QZP8Sk=
X-Google-Smtp-Source: ABdhPJxDxDTkiIxlaL7Qz6PndmDqbwNkUczXPhVDYLRk2J3zyu+p4VzbqK8EJ4e/Ty4zD1S2IOxfeA==
X-Received: by 2002:ae9:e210:: with SMTP id c16mr21871175qkc.314.1604449025589;
        Tue, 03 Nov 2020 16:17:05 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id y68sm655321qkb.38.2020.11.03.16.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 16:17:05 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 3 Nov 2020 19:17:03 -0500
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
Message-ID: <20201104001703.GA2407187@rani.riverdale.lan>
References: <20201022012106.1875129-1-ndesaulniers@google.com>
 <20201104000016.GA2399651@rani.riverdale.lan>
 <CAKwvOdnFstgMa3c+=Vo=QtFYsABDekVeddcPmP=8Pn2bqWfxpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdnFstgMa3c+=Vo=QtFYsABDekVeddcPmP=8Pn2bqWfxpg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 03, 2020 at 04:05:36PM -0800, Nick Desaulniers wrote:
> On Tue, Nov 3, 2020 at 4:00 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > On Wed, Oct 21, 2020 at 06:21:06PM -0700, Nick Desaulniers wrote:
> > > Further -gdwarf-X where X is an unsupported value doesn't
> > > produce an error in $(CC).
> >
> > Do you have more details here? On godbolt.org, gcc does report an error
> > for unsupported dwarf versions.
> >
> > https://godbolt.org/z/G35798
> >
> > gcc does not seem to pass the -gdwarf-* options to the assembler when
> > compiling C source. For assembler, gcc will pass an appropriate option
> > depending on the version of binutils it was configured with: if the
> > assembler doesn't support dwarf-5 it can call it with --gdwarf2 for eg.
> >
> > If the user is using a properly configured toolchain it doesn't look
> > like it should be an issue to just use cc-option?
> 
> I wrote the base patch back in May, and didn't revisit until recently.
> I could have sworn the cc-option silently failed for the check
> cc-option does, which is /dev/null input.  I need to recheck that, but
> it doesn't hurt to simply include it for now, which I've done in a v2
> I'm about to send.
> -- 
> Thanks,
> ~Nick Desaulniers

This is giving me deja vu about the -gz=zlib option.

Didn't Masahiro fix the cc-option issue with
  4d0831e8a029 ("kconfig: unify cc-option and as-option")

The existing -Wa,-gdwarf-2 in the Makefile seems bogus, btw. GCC 4.9.0
at least appears to pass on --gdwarf2 automatically.
